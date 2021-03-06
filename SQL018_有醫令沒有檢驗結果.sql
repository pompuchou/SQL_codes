﻿--2019/6/2 建立
--20190605修改一下,只有對CASENO這樣是不行的,要同時對CASENO與OD_idx都符合才行,改正了一個重要錯誤*****,又發現了許多有醫令沒結果的
--要有一個核對的畫面,以減少錯誤
/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/


/*
SELECT A.[CASENO]
      ,A.[uid]
      ,A.[SDATE]
      ,A.[OD_idx]
      ,A.[rid]
	  ,D.[l08]
	  ,C.[cname]
from	[AL].[dbo].[tbl_opd_order] as A
	left outer join
	[AL].[dbo].[tbl_patients] as C
	on A.uid=C.uid
	left outer join
	[AL].[dbo].[p_lab] as D
	on A.rid=D.rid
where	A.CASENO in (SELECT A.[CASENO]
FROM [AL].[dbo].[tbl_opd_order] as A
	left outer join
	[AL].[dbo].[tbl_lab_record] as B
	on A.[CASENO]=B.[CASENO]
where	A.[CLASS]='檢驗' and B.[CASENO] is Null
group by A.CASENO
having count(A.uid)=1) and A.rid='09005C'



declare	@t table(CASENO nvarchar(20), uid nvarchar(10), SDATE date, cname nvarchar(20))

insert into @t
SELECT A.[CASENO]
      ,A.[uid]
      ,A.[SDATE]
	  ,C.[cname]
FROM [AL].[dbo].[tbl_opd_order] as A
	left outer join
	[AL].[dbo].[tbl_lab_record] as B
	on A.[CASENO]=B.[CASENO]
	left outer join
	[AL].[dbo].[tbl_patients] as C
	on A.uid=C.uid
	left outer join
	[AL].[dbo].[p_lab] as D
	on A.rid=D.rid
where	A.[CLASS]='檢驗' and B.[CASENO] is Null and A.SDATE < '20190522'
group by A.CASENO, A.uid, A.SDATE, C.cname
order by A.SDATE, A.uid

select	'***' as A
		, A.uid
		, A.cname
		, B.bd
		, B.mf
		, '' as B
		, A.SDATE as d1
		, right(convert(varchar,YEAR(A.SDATE)-1911+10000),4)+right(convert(varchar, A.SDATE, 112),4)+'000X' as lid
		, A.SDATE as d2
		, right(convert(varchar,getdate(),120),8) as t1
		, A.SDATE as d3
		, A.SDATE as d4
		, left(right(convert(varchar,getdate(),120),8),5) as t2
from	@t as A
		left outer join
		al.dbo.tbl_patients as B
		on A.uid=B.uid
*/
SELECT A.[CASENO]
      ,A.[uid]
      ,A.[SDATE]
      ,A.[OD_idx]
      ,A.[rid]
	  ,D.[l08]
	  ,C.[cname]
FROM [AL].[dbo].[tbl_opd_order] as A
	left outer join
	[AL].[dbo].[tbl_lab_record] as B
	on A.[CASENO]=B.[CASENO] and A.[OD_idx]=B.[OD_idx]
	left outer join
	[AL].[dbo].[tbl_patients] as C
	on A.uid=C.uid
	left outer join
	[AL].[dbo].[p_lab] as D
	on A.rid=D.rid
where	A.[CLASS]='檢驗' and A.rid not in ('L-Cho', 'L-VAL','L-Li','L-Carb','L-P100')  and B.[CASENO] is Null --and A.SDATE < '20190522'
order by A.SDATE, A.uid
