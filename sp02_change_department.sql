USE [AL]
GO
/****** Object:  StoredProcedure [dbo].[sp_get_hdata]    Script Date: 2019/6/7 下午 08:53:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_change_dep]
	@YM char(5)
as
declare @output table (o varchar(16))
declare	@begin_date date
declare @end_date date

set @begin_date=convert(char(4), convert(int,left (@ym,3))+1911)+right(@ym,2)+'01'
set @end_date=dateadd(d,-1,dateadd(m, 1, @begin_date))


--should be in Family Doctor
insert into @output
select	'20'+right([CASENO],12)+'01' as output
from	[AL].[dbo].[tbl_opd]
where	SDATE between @begin_date and @end_date
	and [DEPTNAME]='精神科' and [POSINAME] <> '自費' and [ICDCODE1] not in (select icd9_code from al.dbo.p_icd9 where psy=1)


--should be in psychiatry
insert into @output
select	'20'+right(A.[CASENO],12)+'13' as output
from	[AL].[dbo].[tbl_opd] as A
	left outer join
		[AL].[dbo].[tbl_opd_order] as B
		on A.[CASENO]=B.[CASENO]
where	A.SDATE between @begin_date and @end_date
	and A.[DEPTNAME]<>'精神科' and A.[POSINAME] <> '自費' and B.[rid] in ('45046','45087','45102','45010')

--should be in psychiatry
insert into @output
select	'20'+right([CASENO],12)+'13' as output
from	[AL].[dbo].[tbl_opd]
where	SDATE between @begin_date and @end_date
	and [DEPTNAME]<>'精神科' and [POSINAME] <> '自費' and [ICDCODE1] in (select icd9_code from al.dbo.p_icd9 where psy=1)

select	*
from	@output