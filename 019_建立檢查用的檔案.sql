﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
--4523 筆
SELECT distinct B.[t3]
      ,B.[d1]
      ,B.[d2]
      ,[p1]
      ,[p2]
      ,[p3]
      ,[p4]
      ,[p5]
      ,[p6]
      ,[p7]
      ,[p8]
      ,[p9]
      ,[p10]
      ,C.r09 as p11
      ,round(B.p10*C.r09,0) as [p12]
      ,[p13]
      ,[p14]
      ,[p15]
      ,[p16]
      ,[p17]
      ,[p20]
into cl.dbo.xml_pdata
  FROM al.dbo.xml_ddata as A
	left outer join
	[AL].[dbo].[xml_pdata] as B
	on A.t3=B.t3 and A.d1=B.d1 and A.d2=B.d2
	left outer join
	cl.dbo.p10504 as C
	on B.p4=C.r04
where A.d4='E2' and A.t3 between '10601' and '10603' and len(B.p4)=10

/*
select	*
into	cl.dbo.xml_ddata
from al.dbo.xml_ddata as A
where	A.d4='E2'
*/
--28079
insert into cl.dbo.xml_pdata
SELECT distinct B.[t3]
      ,B.[d1]
      ,B.[d2]
      ,[p1]
      ,[p2]
      ,[p3]
      ,[p4]
      ,[p5]
      ,[p6]
      ,[p7]
      ,[p8]
      ,[p9]
      ,[p10]
      ,C.r09 as p11
      ,round(B.p10*C.r09,0) as [p12]
      ,[p13]
      ,[p14]
      ,[p15]
      ,[p16]
      ,[p17]
      ,[p20]
  FROM al.dbo.xml_ddata as A
	left outer join
	[AL].[dbo].[xml_pdata] as B
	on A.t3=B.t3 and A.d1=B.d1 and A.d2=B.d2
	left outer join
	cl.dbo.p10604 as C
	on B.p4=C.r04
where A.d4='E2' and A.t3 between '10604' and '10704' and len(B.p4)=10

--24070
insert into cl.dbo.xml_pdata
SELECT distinct B.[t3]
      ,B.[d1]
      ,B.[d2]
      ,[p1]
      ,[p2]
      ,[p3]
      ,[p4]
      ,[p5]
      ,[p6]
      ,[p7]
      ,[p8]
      ,[p9]
      ,[p10]
      ,C.r09 as p11
      ,round(B.p10*C.r09,0) as [p12]
      ,[p13]
      ,[p14]
      ,[p15]
      ,[p16]
      ,[p17]
      ,[p20]
  FROM al.dbo.xml_ddata as A
	left outer join
	[AL].[dbo].[xml_pdata] as B
	on A.t3=B.t3 and A.d1=B.d1 and A.d2=B.d2
	left outer join
	cl.dbo.p10704 as C
	on B.p4=C.r04
where A.d4='E2' and A.t3 between '10705' and '10803' and len(B.p4)=10

--4825
insert into cl.dbo.xml_pdata
SELECT distinct B.[t3]
      ,B.[d1]
      ,B.[d2]
      ,[p1]
      ,[p2]
      ,[p3]
      ,[p4]
      ,[p5]
      ,[p6]
      ,[p7]
      ,[p8]
      ,[p9]
      ,[p10]
      ,C.r09 as p11
      ,round(B.p10*convert(float,C.r09),0) as [p12]
      ,[p13]
      ,[p14]
      ,[p15]
      ,[p16]
      ,[p17]
      ,[p20]
  FROM al.dbo.xml_ddata as A
	left outer join
	[AL].[dbo].[xml_pdata] as B
	on A.t3=B.t3 and A.d1=B.d1 and A.d2=B.d2
	left outer join
	cl.dbo.p10804 as C
	on B.p4=C.r04
where A.d4='E2' and A.t3 between '10804' and '10805' and len(B.p4)=10

select	*
from	cl.dbo.xml_pdata 
where p11 is null

--給藥天數d27
