declare @t table(uid varchar(10))

insert into @t
select	distinct uid
from	al.dbo.tbl_pijia
where	left(remark,2)='景仁'

insert into @t
SELECT distinct [uid]
  FROM [BL].[dbo].[tbl_upload]

/*
select	*
into	CL.dbo.xml_ddata2
from	al.dbo.xml_ddata
where	d3 in (select uid from @t) and (d4 is null or d4<>'E2') 
*/
insert into	CL.dbo.xml_pdata2
select	distinct B.t3
		,B.d1
		,B.d2
		,B.p1
		,B.p2
		,B.p3
		,B.p4
		,B.p5
		,B.p6
		,B.p7
		,B.p8
		,B.p9
		,B.p10
      ,C.r09 as p11
      ,round(B.p10*convert(float,C.r09),0) as [p12]
	  ,B.p13
	  ,B.p14
	  ,B.p15
	  ,B.p16
	  ,B.p17
	  ,B.p20
--into	CL.dbo.xml_pdata2
from	CL.dbo.xml_ddata2 as A
		left outer join
		AL.dbo.xml_pdata as B
		on A.t3=B.t3 and A.d1=B.d1 and A.d2=B.d2
		left outer join
		CL.dbo.p10804 as C
		on B.p4=C.r04
where	len(p4)=10 and A.t3 between '10804' and '10805'

