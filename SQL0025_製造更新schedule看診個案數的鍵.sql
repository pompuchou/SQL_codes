--整理資料
declare @t table (SDATE datetime, VIST nvarchar(10), N int)

insert into @t
select	B.SDATE, B.VIST, count(B.CASENO) as N
from	[al].[dbo].[tbl_schedule] as A
		LEFT OUTER JOIN [al].[dbo].[tbl_opd] as B
		ON A.[SDATE]=B.[SDATE] and A.[VIST]=B.[VIST]
where	B.POSINAME='健保' and B.RMNO in (1, 3) 
group by B.SDATE, B.VIST

--定義Cursor並打開
DECLARE MyCursor Cursor FOR --宣告，名稱為MyCursor
-- 此區段就可以撰寫你的資料集，如找出名稱為John的資料
select	A.smid
		,A.sname
		,A.SDATE
		,A.VIST
		,A.N as o_N
		,B.N as t_N
from	al.dbo.tbl_schedule as A
		left outer join
		@t as B
		on A.SDATE=B.SDATE and A.VIST=B.VIST
where	A.N<>B.N or (A.N is null and B.N is not null)


Open MyCursor 

--print @@CURSOR_rows --查看總筆數

--定義變數
declare @sname nvarchar(10)
declare	@smid int
declare @SDATE date
declare @VIST nvarchar(10)
declare @o_N tinyint
declare @t_N tinyint

--開始迴圈跑Cursor Start
Fetch NEXT FROM MyCursor INTO @smid, @sname, @SDATE, @VIST, @o_N, @t_N
While (@@FETCH_STATUS <> -1)
BEGIN

--此區塊就可以處理商業邏輯，譬如利用tableA的ID將資料塞入tableB
/*
update [AL].[dbo].[tbl_schedule]
set [N]=@t_N
	where SDATE=@SDATE and VIST=@VIST
*/

--插入log_Adm的資料
--insert into al.dbo.log_Adm
SELECT	getdate()
		,'check mission'
		,@@SERVERNAME
		,@@SERVICENAME
		,'Ford'
		,'tbl_schedule modification'
		,convert(varchar(10),@SDATE,111) + @VIST+' '+@sname+'第'+convert(varchar(10),@smid)+'次巡診'+ (case when @o_N is null then 'New ' else convert(varchar(10),@o_N)+'->' end) + convert(varchar(10),@t_N)

Fetch NEXT FROM MyCursor INTO @smid, @sname, @SDATE, @VIST, @o_N, @t_N
END
--開始迴圈跑Cursor End

--關閉&釋放cursor
CLOSE MyCursor
DEALLOCATE MyCursor

