declare @t table (mid int, smid int, iid varchar(50), sname varchar(50), sdate datetime, vist varchar(10), sec int)

insert into @t
SELECT [mid]
      ,[smid]
      ,[iid]
      ,[sname]
	  ,[SDATE]
	  ,[VIST]
	  ,(select count(*) from [al].[dbo].[tbl_schedule] as B where B.SDATE<=A.SDATE)
  FROM [al].[dbo].[tbl_schedule] as A
  order by SDATE, VIST desc

update @t
set sec=sec-1
where vist='上午' and sdate in
(select SDATE
from	@t
where	vist='下午')

--select	*
--from	@t
--order by	sdate, vist desc

select	*
from	[al].[dbo].[tbl_schedule] as A
		left outer join
		@t as B
		on A.iid=B.iid and A.smid=B.smid
where A.mid <> B.sec

/*
update	[al].[dbo].[tbl_schedule]
set		mid=B.sec
from	[al].[dbo].[tbl_schedule] as A
		left outer join
		@t as B
		on A.iid=B.iid and A.smid=B.smid
where A.mid <> B.sec
*/