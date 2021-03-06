﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
declare @t table (SDATE datetime, VIST nvarchar(10), N int)

insert into @t
select	SDATE, VIST, count(CASENO) as N
from	al.dbo.tbl_opd
where	POSINAME='健保' and ((VIST='上午' and SDATE in (select SDATE from al.dbo.tbl_schedule where VIST='上午')) or (VIST='下午' and SDATE in (select SDATE from al.dbo.tbl_schedule where VIST='下午')))
--where	POSINAME='健保' and RMNO in (1, 3) and ((VIST='上午' and SDATE in (select SDATE from al.dbo.tbl_schedule where VIST='上午')) or (VIST='下午' and SDATE in (select SDATE from al.dbo.tbl_schedule where VIST='下午')))
group by SDATE, VIST
order by SDATE, VIST desc

/*
update [AL].[dbo].[tbl_schedule]
set [N]=B.[N]
  FROM [AL].[dbo].[tbl_schedule] as A
  left outer join
	@t as B
	on A.SDATE=B.SDATE and A.VIST=B.VIST
where A.N is NULL and A.SDATE<'20190301'
*/
SELECT A.[mid]
      ,A.[smid]
      ,A.[iid]
      ,A.[sname]
      ,A.[SDATE]
      ,A.[VIST]
      ,A.[N]
	  ,B.[N]
  FROM [AL].[dbo].[tbl_schedule] as A
  left outer join
	@t as B
	on A.SDATE=B.SDATE and A.VIST=B.VIST
where A.N is not NULL and A.SDATE<'20190301'

