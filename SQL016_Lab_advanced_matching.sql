--這是個別的matching
--2019/5/31

/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
declare @t_lab table (uid nvarchar(50), lid nvarchar(50), l05 date, iid nvarchar(50), nhi_code nvarchar(50), CASENO nvarchar(50))
declare @t_order table (CASENO nvarchar(50), uid nvarchar(50), SDATE date, OD_idx tinyint, rid nvarchar(50))
declare @t_result table (lid nvarchar(50), iid nvarchar(50), CASENO nvarchar(50), OD_idx tinyint)

declare	@u nchar(10)

set	@u='G200560573'

insert into @t_lab 
SELECT A.[uid]
      ,A.[lid]
      ,A.[l05]
      ,A.[iid]
	  ,B.[nhi_code]
	  ,A.[CASENO]
  FROM [AL].[dbo].[tbl_lab_record] as A
  left outer join
	[AL].[dbo].[p_lab] as B
	on A.iid=B.iid
where A.iid not in ('A','CBC-DC','P1','P1-B','URT') and A.[uid]=@u and A.CASENO is null

/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
insert into @t_order
SELECT A.[CASENO]
      ,A.[uid]
      ,A.[SDATE]
      ,A.[OD_idx]
      ,A.[rid]
  FROM [AL].[dbo].[tbl_opd_order] as A
  left outer join
	[AL].[dbo].[tbl_lab_record] as B
	on A.[CASENO]=B.[CASENO] and A.[OD_idx]=B.[OD_idx]
  where A.CLASS='檢驗' and A.[uid]=@u and B.lid is null

insert into	@t_result
select	A.lid
		,A.iid
		,B.CASENO
		,B.OD_idx
from	@t_lab as A
left outer join
		@t_order as B
		on A.uid=B.uid and A.nhi_code=B.rid
where	B.CASENO is not null and datediff(d, B.SDATE, A.l05) between -2 and 2
order by A.l05
/*
update	al.dbo.tbl_lab_record
set	CASENO=B.CASENO, OD_idx=B.OD_idx
from	al.dbo.tbl_lab_record as A
left outer join
	@t_result as B
on A.lid=B.lid and A.iid=B.iid
where	B.CASENO is not null
*/
/*
update	al.dbo.tbl_lab_record
set CASENO= NULL, OD_idx=NULL


select	*
from	al.dbo.tbl_lab_record
where	l05 between '20190401' and '20190430' and CASENO is null and iid not in ('URT', 'CBC-DC')
*/
select	*
from	@t_lab

select	*
from	@t_order

select	*
from	@t_result
