/*
created on 20200405
aim: find out those who should see doctor on the specified date and compare those who actually visit on the specified date
*/
declare @t1 table (uid varchar(10), SDATE date, rid varchar(50), TIMES_DAY varchar(10), METHOD varchar(10), TIME_QTY1 float, DAYS tinyint)
declare @t2 table (uid varchar(10), SDATE date, rid varchar(50), TIMES_DAY varchar(10), METHOD varchar(10), TIME_QTY1 float, DAYS tinyint)
declare @t3 table (uid varchar(10), SDATE date, rid varchar(50), TIMES_DAY varchar(10), METHOD varchar(10), TIME_QTY1 float, DAYS tinyint)
declare @i1 table (uid varchar(10), SDATE date, rid varchar(50), TIMES_DAY varchar(10), METHOD varchar(10), TIME_QTY1 float, DAYS tinyint)
declare @i2 table (uid varchar(10), SDATE date, rid varchar(50), TIMES_DAY varchar(10), METHOD varchar(10), TIME_QTY1 float, DAYS tinyint)
declare @o table (uid varchar(10), rid varchar(50), TIMES_DAY varchar(10), METHOD varchar(10), TIME_QTY1 float, COMMENT nvarchar(50))
--看診日期
declare @d date
declare @VIST nvarchar(20)
set @d='20200409'
set @VIST='上午'

--看診單位
declare @i nvarchar(10)
set @i='啟智'

--找出之前三個月內看診的天數
--定義Cursor並打開
DECLARE MyCursor Cursor FOR --宣告，名稱為MyCursor
-- 此區段就可以撰寫你的資料集，如找出名稱為John的資料
select	SDATE, VIST
from	al.dbo.tbl_schedule
where	sname=@i and datediff(d,SDATE,@d) between 1 and 100

Open MyCursor 

--print @@CURSOR_rows --查看總筆數

--定義變數
declare @SDATE date
declare @VIST1 nvarchar(20)

--開始迴圈跑Cursor Start
Fetch NEXT FROM MyCursor INTO @SDATE, @VIST1
While (@@FETCH_STATUS <> -1)
BEGIN

--此區塊就可以處理商業邏輯，譬如利用tableA的ID將資料塞入tableB
INSERT INTO @t1
SELECT B.[uid]
      ,B.[SDATE]
      ,B.[rid]
      ,B.[TIMES_DAY]
      ,B.[METHOD]
      ,B.[TIME_QTY1]
      ,CASE WHEN (B.[DAYS]>30 OR B.[CHRONIC]='') THEN B.[DAYS] ELSE CONVERT(TINYINT, B.[DAYS])*CONVERT(TINYINT,B.[CHRONIC]) END
  FROM [al].[dbo].[tbl_opd] as A
  LEFT OUTER JOIN [al].[dbo].[tbl_opd_order] as B
  ON A.[CASENO]=B.[CASENO]
  WHERE A.[SDATE]=@SDATE and A.[VIST]=@VIST1 and A.[RMNO] in (1,3) and B.[CLASS]='藥品' and B.[DAYS] between 28 and 30
Fetch NEXT FROM MyCursor INTO @SDATE, @VIST1
END
--開始迴圈跑Cursor End

--關閉&釋放cursor
CLOSE MyCursor
DEALLOCATE MyCursor

--篩選到期前6天內的處方
--@t2是預計看診的
insert into @t2
SELECT [uid]
      ,[SDATE]
      ,[rid]
      ,[TIMES_DAY]
      ,[METHOD]
      ,[TIME_QTY1]
	  ,[DAYS]
from	@t1
where	datediff(d, @d, (dateadd(d, DAYS, SDATE))) between -6 and 6

--三個條件,處方日期, 處方天數, 慢箋,又FUZZY?
--@t3 是實際上看診的
INSERT INTO @t3
SELECT B.[uid]
      ,B.[SDATE]
      ,B.[rid]
      ,B.[TIMES_DAY]
      ,B.[METHOD]
      ,B.[TIME_QTY1]
      ,CASE WHEN (B.[DAYS]>30 OR B.[CHRONIC]='') THEN B.[DAYS] ELSE CONVERT(TINYINT, B.[DAYS])*CONVERT(TINYINT,B.[CHRONIC]) END
  FROM [al].[dbo].[tbl_opd] as A
  LEFT OUTER JOIN [al].[dbo].[tbl_opd_order] as B
  ON A.[CASENO]=B.[CASENO]
  WHERE A.[SDATE]=@d and A.[VIST]=@VIST and A.[RMNO] in (1,3) and B.[CLASS]='藥品' and B.[DAYS] between 28 and 30

  --@t2 expected visits
  --@t3 actual visits

  --@i1 expected exists, but actual absent
INSERT INTO @i1
SELECT A.[uid]
      ,A.[SDATE]
      ,A.[rid]
      ,A.[TIMES_DAY]
      ,A.[METHOD]
      ,A.[TIME_QTY1]
	  ,A.[DAYS]
FROM	@t2 AS A
		LEFT OUTER JOIN
		@t3 AS B
		ON A.[uid]=B.[uid] and A.[rid]=B.[rid] and A.[TIMES_DAY]=B.[TIMES_DAY] and A.[TIME_QTY1]=B.[TIME_QTY1]
WHERE B.[uid] IS NULL
ORDER BY A.[uid]

  --@i1 expected absent, but actual exists
INSERT INTO @i2
SELECT B.[uid]
      ,B.[SDATE]
      ,B.[rid]
      ,B.[TIMES_DAY]
      ,B.[METHOD]
      ,B.[TIME_QTY1]
	  ,B.[DAYS]
FROM	@t2 AS A
		RIGHT OUTER JOIN
		@t3 AS B
		ON A.[uid]=B.[uid] and A.[rid]=B.[rid] and A.[TIMES_DAY]=B.[TIMES_DAY] and A.[TIME_QTY1]=B.[TIME_QTY1]
WHERE A.[uid] IS NULL AND B.[TIMES_DAY] not in ('PRN')
ORDER BY B.[uid]

INSERT INTO @o
SELECT distinct A.[uid]
      ,NULL
      ,NULL
      ,NULL
      ,NULL
      ,'改'+convert(varchar(10),A.[DAYS])+'天為'+convert(varchar(10),B.[DAYS])+'天'
FROM	@t2 AS A
		INNER JOIN
		@t3 AS B
		ON A.[uid]=B.[uid] and A.[rid]=B.[rid] and A.[TIMES_DAY]=B.[TIMES_DAY] and A.[TIME_QTY1]=B.[TIME_QTY1]
WHERE B.[TIMES_DAY] not in ('PRN') AND A.[DAYS] <> B.[DAYS]

INSERT INTO @o
select	B.[uid]
       ,B.[rid]
       ,B.[TIMES_DAY]
       ,B.[METHOD]
       ,B.[TIME_QTY1]
	   ,'改藥: 原'+CONVERT(varchar(10),A.TIME_QTY1)+'# '+A.TIMES_DAY+' => '+CONVERT(varchar(10),B.TIME_QTY1)+'# '+B.TIMES_DAY
FROM	@i1 AS A
		INNER JOIN
		@i2 AS B
		ON A.[uid]=B.[uid] and A.[rid]=B.[rid]
ORDER BY A.[uid], B.[uid]

INSERT INTO @o
SELECT	DISTINCT A.[uid]
	   ,NULL
	   ,NULL
	   ,NULL
	   ,NULL
	   ,'此次未開藥'
FROM	@i1 AS A
		LEFT OUTER JOIN
		@i2 AS B
		ON A.[uid]=B.[uid] and A.[rid]=B.[rid]
WHERE B.[uid] IS NULL and A.[uid] NOT in (SELECT DISTINCT [uid] FROM @t3)

INSERT INTO @o
select	A.[uid]
       ,A.[rid]
       ,A.[TIMES_DAY]
       ,A.[METHOD]
       ,A.[TIME_QTY1]
	   ,'停藥'
FROM	@i1 AS A
		LEFT OUTER JOIN
		@i2 AS B
		ON A.[uid]=B.[uid] and A.[rid]=B.[rid]
WHERE B.[uid] IS NULL and A.[uid] in (SELECT DISTINCT [uid] FROM @t3)
ORDER BY A.[uid], B.[uid]

INSERT INTO @o
SELECT	DISTINCT B.[uid]
	   ,NULL
	   ,NULL
	   ,NULL
	   ,NULL
	   ,'新增個案'
FROM	@i1 AS A
		RIGHT OUTER JOIN
		@i2 AS B
		ON A.[uid]=B.[uid] and A.[rid]=B.[rid]
WHERE A.[uid] IS NULL and B.[uid] NOT in (SELECT DISTINCT [uid] FROM @t2)

INSERT INTO @o
select	B.[uid]
       ,B.[rid]
       ,B.[TIMES_DAY]
       ,B.[METHOD]
       ,B.[TIME_QTY1]
	   ,'加藥'
FROM	@i1 AS A
		RIGHT OUTER JOIN
		@i2 AS B
		ON A.[uid]=B.[uid] and A.[rid]=B.[rid]
WHERE A.[uid] is NULL and B.[uid] in (SELECT DISTINCT [uid] FROM @t2)

ORDER BY A.[uid], B.[uid]

SELECT	DENSE_RANK() OVER (ORDER BY A.uid, A.COMMENT)
	   ,A.[uid]
	   ,B.[cname]
	   ,C.[r06]
	   ,A.[TIME_QTY1]
	   ,A.[TIMES_DAY]
	   ,A.[METHOD]
	   ,A.[COMMENT]
FROM	@o as A
	LEFT OUTER JOIN
		[al].[dbo].[tbl_patients] as B
		ON A.[uid]=B.[uid]
	LEFT OUTER JOIN
		[al].[dbo].[p_order] as C
		ON A.[rid]=C.[rid]
ORDER BY	A.uid, A.COMMENT