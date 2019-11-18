--20190602 
declare @begin_date date
declare @end_date date
declare @YM nvarchar(10)
declare @t1 table (iid nvarchar(50), sname nvarchar(10), uid nvarchar(10), bd date, cname nvarchar(50))

--設定日期
set @YM='10810'
set @begin_date=convert(nvarchar(8),convert(int,left(@YM,3))+1911)+right(@YM,2)+'01'
set @end_date=dateadd(dd,-1,dateadd(mm,1,@begin_date))

--select	@begin_date

--select	@end_date

insert into @t1
SELECT distinct B.[iid]
	  ,B.[sname]
      ,A.[uid]
	  ,C.[bd]
	  ,C.[cname]
  FROM [AL].[dbo].[tbl_opd] as A
  left outer join
	[AL].[dbo].[tbl_schedule] as B
  on A.SDATE=B.SDATE and A.VIST=B.VIST
  left outer join
    [AL].[dbo].[tbl_patients] as C
  on A.uid=C.uid
where (A.SDATE between @begin_date and @end_date) and RMNO in (1,3) and POSINAME='健保' and B.iid is not null


--201901
select	*
from @t1 as A
	left outer join
	[BL].[dbo].[tbl_upload] as B
	on A.iid=B.iid and A.uid=B.uid and B.YM=@YM
where	B.YM is null
order by A.iid
