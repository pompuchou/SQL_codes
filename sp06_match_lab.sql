﻿USE [AL]
GO
/****** Object:  StoredProcedure [dbo].[sp_match_lab]    Script Date: 2019/6/15 下午 05:32:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_match_lab]
	@f int, @t int
as
declare @t_lab table (uid nvarchar(50), lid nvarchar(50), l05 date, iid nvarchar(50), nhi_code nvarchar(50))
declare @t_order table (CASENO nvarchar(50), uid nvarchar(50), SDATE date, OD_idx tinyint, rid nvarchar(50))
declare @t_result table (lid nvarchar(50), iid nvarchar(50), CASENO nvarchar(50), OD_idx tinyint)

insert into @t_lab 
SELECT A.[uid]
      ,A.[lid]
      ,A.[l05]
      ,A.[iid]
	  ,B.[nhi_code]
  FROM [AL].[dbo].[tbl_lab_record] as A
  left outer join
	[AL].[dbo].[p_lab] as B
	on A.iid=B.iid
where A.CASENO is null and A.iid not in ('A','CBC-DC','P1','P1-B','URT')

insert into @t_order
SELECT A.[CASENO]
      ,A.[uid]
      ,A.[SDATE]
      ,A.[OD_idx]
      ,A.[rid]
  FROM [AL].[dbo].[tbl_opd_order] as A
  where A.CLASS='檢驗'

insert into	@t_result
select	A.lid
		,A.iid
		,B.CASENO
		,B.OD_idx
from	@t_lab as A
left outer join
		@t_order as B
		on A.uid=B.uid and datediff(d,B.SDATE,A.l05) between @f and @t and A.nhi_code=B.rid
where	B.CASENO is not null

update	al.dbo.tbl_lab_record
set	CASENO=B.CASENO, OD_idx=B.OD_idx
from	al.dbo.tbl_lab_record as A
left outer join
	@t_result as B
on A.lid=B.lid and A.iid=B.iid
where	B.CASENO is not null

select	@@ROWCOUNT rows_affected
