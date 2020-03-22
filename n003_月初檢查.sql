--整理資料
declare @t table (SDATE datetime, VIST nvarchar(10), N int)
declare @begin_date date
declare @end_date date
declare @YM nvarchar(10)

--設定日期
set @YM='10902'
set @begin_date=convert(nvarchar(8),convert(int,left(@YM,3))+1911)+right(@YM,2)+'01'
set @end_date=dateadd(dd,-1,dateadd(mm,1,@begin_date))


insert into @t
select	SDATE, VIST, count(CASENO) as N
from	al.dbo.tbl_opd
--where	POSINAME='健保' and ((VIST='上午' and SDATE in (select SDATE from al.dbo.tbl_schedule where VIST='上午')) or (VIST='下午' and SDATE in (select SDATE from al.dbo.tbl_schedule where VIST='下午')))
where	POSINAME='健保' and RMNO in (1, 3) 
		and ((VIST='上午' and SDATE in (select SDATE from al.dbo.tbl_schedule where VIST='上午')) or (VIST='下午' and SDATE in (select SDATE from al.dbo.tbl_schedule where VIST='下午')))
		and SDATE between @begin_date and @end_date
group by SDATE, VIST
order by SDATE, VIST desc

update [AL].[dbo].[tbl_schedule]
set [N]=B.[N]
  FROM [AL].[dbo].[tbl_schedule] as A
  left outer join
	@t as B
	on A.SDATE=B.SDATE and A.VIST=B.VIST
	where A.SDATE between @begin_date and @end_date
/*
--where A.N is NULL and A.SDATE <'20190301'
--10803 414
--10804 414

--delete from bl.dbo.tbl_upload
where YM='10803'

select	*
from	[al].[dbo].[tbl_schedule]

--月心給的資料
--10803 1294
--10803 1257
--10804 1090
--10805 1261
--10806 1095
--10808 1313
--10809 1104
--10810 1313
--10811 1314
--10812 1273
--10901 1319
--10902 1277

bulk insert [BL].[dbo].tbl_upload
from 'C:\care_3532017578_10902.csv'
with
(
	firstrow=1,
	fieldterminator=',',
	rowterminator='\n',
	tablock
)

bulk insert [AL].[dbo].tbl_schedule
from 'C:\schedule2020.csv'
with
(
	firstrow=1,
	fieldterminator=',',
	rowterminator='\n',
	tablock
)

*/