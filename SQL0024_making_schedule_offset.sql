/*
20200409 created
aim: to make the offset of institution schedule, 教養院巡診淵遠流長, 但有可能因為國定假日而有挪移

*/
declare @i nvarchar(20)
set @i = '觀音'
declare @begin_date date
set @begin_date='20170309'

SELECT [mid]
      ,[smid]
      ,[iid]
      ,[sname]
      ,[SDATE]
      ,[VIST]
      ,[N]
      ,[remark]
      ,[offset]
	  ,dateadd(d, (smid-1)*28,@begin_date)
	  ,datediff(d, SDATE, dateadd(d, (smid-1)*28,@begin_date))
  FROM [al].[dbo].[tbl_schedule]
  WHERE [sname]=@i

/*
-----------------------------------------------------------------------------------------------------
declare @i nvarchar(20)
set @i = '華光'
declare @begin_date date
set @begin_date='20200317'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid-1)*28,@begin_date))
where	[sname]=@i
-----------------------------------------------------------------------------------------------------
declare @i nvarchar(20)
set @i = '世美'
declare @begin_date date
set @begin_date='20171229'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid-1)*28,@begin_date))
where	[sname]=@i
-----------------------------------------------------------------------------------------------------
declare @i nvarchar(20)
set @i = '香園'
declare @begin_date date
set @begin_date='20170627'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid-1)*28,@begin_date))
where	[sname]=@i and SDATE between '20170627' and '20180306'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid)*28,@begin_date))
where	[sname]=@i and SDATE between '20180502' and '20200107'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid+1)*28,@begin_date))
where	[sname]=@i and SDATE between '20200303' and '20201231'
-----------------------------------------------------------------------------------------------------
declare @i nvarchar(20)
set @i = '誠信'
declare @begin_date date
set @begin_date='20170420'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid-1)*28,@begin_date))
where	[sname]=@i and SDATE between '20170518' and '20180125'

update [al].[dbo].[tbl_schedule]
set offset=0
where	[sname]=@i and offset is null
-----------------------------------------------------------------------------------------------------
declare @i nvarchar(20)
set @i = '觀音'
declare @begin_date date
set @begin_date='20170309'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid-1)*28,@begin_date))
where	[sname]=@i and SDATE between '20170309' and '20180308'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid)*28,@begin_date))
where	[sname]=@i and SDATE between '20180503' and '20190110'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid+1)*28,@begin_date))
where	[sname]=@i and SDATE = '20190307'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid+2)*28,@begin_date))
where	[sname]=@i and SDATE between '20190502' and '20200305'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid+3)*28,@begin_date))
where	[sname]=@i and SDATE between '20200430' and '20201231'
-----------------------------------------------------------------------------------------------------
declare @i nvarchar(20)
set @i = '桃園'
declare @begin_date date
set @begin_date='20170301'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid-1)*28,@begin_date))
where	[sname]=@i and SDATE between '20170301' and '20180131'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid)*28,@begin_date))
where	[sname]=@i and SDATE between '20180328' and '20191225'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid+1)*28,@begin_date))
where	[sname]=@i and SDATE between '20200226' and '20201231'
-----------------------------------------------------------------------------------------------------
declare @i nvarchar(20)
set @i = '祥育'
declare @begin_date date
set @begin_date='20170217'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid-1)*56,@begin_date))
where	[sname]=@i and SDATE>'20170422'

update [al].[dbo].[tbl_schedule]
set offset=0
where	[sname]=@i and offset is null
-----------------------------------------------------------------------------------------------------
declare @i nvarchar(20)
set @i = '春暉'
declare @begin_date date
set @begin_date='20170118'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid-1)*56,@begin_date))
where	[sname]=@i and SDATE>'20170215'

update [al].[dbo].[tbl_schedule]
set offset=0
where	[sname]=@i and offset is null
-----------------------------------------------------------------------------------------------------
declare @i nvarchar(20)
set @i = '由根'
declare @begin_date date
set @begin_date='20170111'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid-1)*28,@begin_date))
where	[sname]=@i and SDATE between '20170111' and '20180307'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid)*28,@begin_date))
where	[sname]=@i and SDATE between '20180502' and '20190109'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid+1)*28,@begin_date))
where	[sname]=@i and SDATE between '20190306' and '20201231'
-----------------------------------------------------------------------------------------------------
declare @i nvarchar(20)
set @i = '方舟'
declare @begin_date date
set @begin_date='20161228'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, (smid-1)*28,@begin_date))
where	[sname]=@i and SDATE>'20170120'

update [al].[dbo].[tbl_schedule]
set offset=0
where	[sname]=@i and offset is null
-----------------------------------------------------------------------------------------------------
declare @i nvarchar(20)
set @i = '啟智'
declare @begin_date date
set @begin_date='20161222'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, smid*14,@begin_date))
where	[sname]=@i

-----------------------------------------------------------------------------------------------------
declare @i nvarchar(20)
set @i = '聖愛'
declare @begin_date date
set @begin_date='20170118'

update [al].[dbo].[tbl_schedule]
set	offset=datediff(d, SDATE, dateadd(d, smid*14,@begin_date))
where	[sname]=@i and SDATE>'20170202'

update [al].[dbo].[tbl_schedule]
set offset=0
where	[sname]=@i and offset is null
*/