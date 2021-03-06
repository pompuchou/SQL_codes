﻿USE [AL]
GO
/****** Object:  StoredProcedure [dbo].[sp_match_xml]    Script Date: 2019/6/14 下午 12:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_match_xml]
as
declare @t table(CASENO nvarchar(50), t3 char(5), d1 char(2), d2 int)

insert into @t
select	A.CASENO, B.t3, B.d1, B.d2
FROM [AL].[dbo].[tbl_opd] as A
  left outer join
[AL].[dbo].[xml_ddata] as B
	on convert(char(3),YEAR(A.SDATE)-1911)+right(convert(char(3),MONTH(A.SDATE)+100),2)+right(convert(char(3),DAY(A.SDATE)+100),2)=B.d9 and A.uid=B.d3 and (A.HEATH_CARD=B.d29 or A.HEATH_CARD in ('IC1', 'IC2'))
where	A.POSINAME='健保' and A.d1 is null and B.d1 is not null
order by A.CASENO

update	[AL].[dbo].[tbl_opd]
set	t3=B.[t3], d1=B.[d1], d2=B.[d2]
from	[AL].[dbo].[tbl_opd] as A
		inner join
		@t as B
		on A.CASENO=B.CASENO

select @@rowcount rows_affected