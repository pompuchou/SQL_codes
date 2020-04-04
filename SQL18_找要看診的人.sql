declare @t1 table (CASENO varchar(14), uid varchar(10), SDATE date, OD_idx tinyint, rid varchar(50), TIMES_DAY varchar(10), METHOD varchar(10), TIME_QTY1 float, DAYS tinyint, HC nvarchar(10), CHRONIC tinyint)
declare @t2 table (CASENO varchar(14), uid varchar(10), SDATE date, rid varchar(50), DAYS tinyint)
declare @t3 table (CASENO varchar(14), uid varchar(10), SDATE date, rid varchar(50), DAYS tinyint, DA_up date)
--看診日期
declare @d date
set @d='20200415'

--看診單位
declare @i nvarchar(10)
set @i='方舟'

--決定前三次日期
declare @smid int

select	@smid=smid
from	al.dbo.tbl_schedule
where	sname=@i and SDATE=@d

declare @d1 date, @d2 date, @d3 date
select	@d1=SDATE
from	al.dbo.tbl_schedule
where	sname=@i and smid=@smid-1

select	@d2=SDATE
from	al.dbo.tbl_schedule
where	sname=@i and smid=@smid-2

select	@d3=SDATE
from	al.dbo.tbl_schedule
where	sname=@i and smid=@smid-3

insert into @t1
SELECT [CASENO]
	  ,[uid]
      ,[SDATE]
      ,[OD_idx]
      ,[rid]
      ,[TIMES_DAY]
      ,[METHOD]
      ,[TIME_QTY1]
      ,[DAYS]
      ,[HC]
      ,case when [CHRONIC]='' then 1 else [CHRONIC] end
  FROM [al].[dbo].[tbl_opd_order]
  where datediff(d,[SDATE],getdate())<100 and [CLASS]='藥品' and [TIMES_DAY] not in ('PRN','BIDPRN','TIDPRN','QIDPRN') and DAYS between 28 and 30 and SDATE in (@d1, @d2, @d3)

insert into @t2
select	CASENO, uid, SDATE, rid, case when DAYS>30 then DAYS else DAYS*CHRONIC end
from	@t1

insert into @t3
select	CASENO, uid, SDATE, rid, DAYS, dateadd(d, DAYS, SDATE)
from	@t2

--三個條件,處方日期, 處方天數, 慢箋,又FUZZY?

select	*
from	@t3
where	datediff(d, @d, DA_up) between 0 and 6
order by CASENO