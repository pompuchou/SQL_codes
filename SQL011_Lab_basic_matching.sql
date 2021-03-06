﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
declare @t_lab table (uid nvarchar(50), lid nvarchar(50), l05 date, iid nvarchar(50), nhi_code nvarchar(50))
declare @t_order table (CASENO nvarchar(50), uid nvarchar(50), SDATE date, OD_idx tinyint, rid nvarchar(50))
declare @t_result table (lid nvarchar(50), iid nvarchar(50), CASENO nvarchar(50), OD_idx tinyint)

declare @i int

set @i=8
--total lab 19250, order 9332-341
--0 8702 (lab 10548, order 5525-341 left)
--1 3467 (lab 7081, order 3862-341 left)
--2 1429 (lab 5652, order 3149-341 left)
--3 1145 (lab 4507, order 2684-341 left)
--4 376 (lab 4131, order 2437-341 left)
--5 271 (lab 3860, order 2284-341 left)
--6 24 (lab 3836, order 1919 left)
--7 103 (lab 3732, order 1866 left)
--9 2
--10 78
--11 13
--12 256 (lab 3383, order 1725 left)
--13 3
--14 855 (lab 2525, order 1180 left)
--15 196 (lab 2229, order 1044 left)
--16 20
--17 8
--21 60
--25 33 (lab 2032, order left)
--28 72
--30 181
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
	and lid not in ('01071229000075','01071229000100','01080309000067','01080309000071','01080309000064','01080309000070','01080309000068','01080309000069','01080315000143','01080315000149','01080323000088','01080323000091','01080413000115','01080413000116','01080413000114','01080413000118')

/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
insert into @t_order
SELECT A.[CASENO]
      ,A.[uid]
      ,A.[SDATE]
      ,A.[OD_idx]
      ,A.[rid]
  FROM [AL].[dbo].[tbl_opd_order] as A
  where A.CLASS='檢驗' and A.CASENO not in ('AC190218102007','AC190304502018','AC190304102002','AC190304302010','AC190304302004','AC190304502013','AC190311102003')

insert into	@t_result
select	A.lid
		,A.iid
		,B.CASENO
		,B.OD_idx
from	@t_lab as A
left outer join
		@t_order as B
		on A.uid=B.uid and datediff(d,B.SDATE,A.l05) between 0 and @i and A.nhi_code=B.rid
where	B.CASENO is not null
order by A.l05

update	al.dbo.tbl_lab_record
set	CASENO=B.CASENO, OD_idx=B.OD_idx
from	al.dbo.tbl_lab_record as A
left outer join
	@t_result as B
on A.lid=B.lid and A.iid=B.iid
where	B.CASENO is not null

/*
update	al.dbo.tbl_lab_record
set CASENO= NULL, OD_idx=NULL


select	*
from	al.dbo.tbl_lab_record
where	l05 between '20190401' and '20190430' and CASENO is null and iid not in ('URT', 'CBC-DC')
*/

select	*
from	@t_result
