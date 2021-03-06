﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
/*
SELECT [rid]
      ,[r01]
      ,[r02]
      ,[r03]
      ,[r04]
      ,[r06]
      ,[r08]
      ,[r09]
      ,[r10]
      ,[r30]
into CL.dbo.p10804
  FROM [AL].[dbo].[p_order]
  where r08='1'

select *
from cl.dbo.p10804
*/
/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
/*
SELECT TOP (1000) [rid]
      ,[r01]
      ,[r02]
      ,[r03]
      ,[r04]
      ,[r06]
      ,[r08]
      ,[r09]
      ,[r10]
      ,[r30]
  FROM [CL].[dbo].[p10804]

--delete
select	*
from	cl.dbo.change_2016
where r04 not in (select r04 from cl.dbo.p10804)

SELECT  A.[rid]
      ,A.[r01]
      ,A.[r02]
      ,A.[r03]
      ,A.[r04]
      ,A.[r06]
      ,A.[r08]
	  ,isnull(B.oldP, A.r09) as r09
      ,A.[r10]
      ,A.[r30]
	  into cl.dbo.p10504
  FROM [CL].[dbo].[p10604] as A
	left outer join
		cl.dbo.change_2017 as B
	on A.r04=B.r04
*/
--p10504  10509, 10510, 10511, 10512, 10601, 10602, 10603
--p10604  10604, 10605, 10606, 10607, 10608, 10609, 10610, 10611, 10612, 10701, 10702, 10703, 10704
--p10704  10705, 10706, 10707, 10708, 10709, 10710, 10711, 10712, 10801, 10802, 10803
--p10804  10804, 10805, 10806

--檢查是否全部處方都有了?

select	A.t3
		,A.d1
		,A.d2
		,A.p1
		,A.p2
		,A.p3
		,A.p4
		,A.p5
		,A.p7
		,A.p9
		,A.p10
		,A.p13
		,A.p17
		,A.p20
--		,B.r09
from	al.dbo.xml_pdata as A
		--left outer join
		--cl.dbo.p10504 as B
		--on A.p4=B.r04
where	len(A.p4)=10 and A.t3 between '10601' and '10603'
order by	t3,d1,d2,p13


select	distinct A.p4
from	al.dbo.xml_pdata as A
		left outer join
		cl.dbo.p10504 as B
		on A.p4=B.r04
where	len(A.p4)=10 and A.t3 between '10601' and '10603' and B.r01 is null

insert into [CL].[dbo].[p10504]
SELECT 'OCARVE625' as [rid]
      ,'CARVEDILOL HEXAL TABLETS 6.25MG' as [r01]
      ,'20160401' as [r02]
      ,'20170331' as [r03]
      ,'BC25674100' as [r04]
      ,'CARVEDILOL HEXAL TABLETS 6.25MG' as [r06]
      ,1 as [r08]
      ,3.91 as [r09]
      ,'' as [r10]
      ,'CARVEDILOL HEXAL TABLETS 6.25MG' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'BC25145100' as [rid]
      ,'TOPIRAMATE SANDOZ FC TABLETS 50MG' as [r01]
      ,'20190401' as [r02]
      ,'20200331' as [r03]
      ,'BC25145100' as [r04]
      ,'TOPIRAMATE SANDOZ FC TABLETS 50MG' as [r06]
      ,1 as [r08]
      ,14.20 as [r09]
      ,'' as [r10]
      ,'TOPIRAMATE SANDOZ FC TABLETS 50MG' as [r30]

insert into [CL].[dbo].[p10504]
SELECT 'BC24947100' as [rid]
      ,'OTSUKA ABILIFY DISCMELT 10MG ORALLY DISINTEGRATING TABLETS' as [r01]
      ,'20160401' as [r02]
      ,'20170331' as [r03]
      ,'BC24947100' as [r04]
      ,'OTSUKA ABILIFY DISCMELT 10MG ORALLY DISINTEGRATING TABLETS' as [r06]
      ,1 as [r08]
      ,80.00 as [r09]
      ,'' as [r10]
      ,'OTSUKA ABILIFY DISCMELT 10MG ORALLY DISINTEGRATING TABLETS' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'BC24480100' as [rid]
      ,'Fosamax Plus Tablets' as [r01]
      ,'20190401' as [r02]
      ,'20200331' as [r03]
      ,'BC24480100' as [r04]
      ,'Fosamax Plus Tablets' as [r06]
      ,1 as [r08]
      ,174.00 as [r09]
      ,'' as [r10]
      ,'Fosamax Plus Tablets' as [r30]

insert into [CL].[dbo].[p10604]
SELECT 'BC23688435' as [rid]
      ,'QUINAX STERILE OPHTHALMIC SOLUTION' as [r01]
      ,'20170401' as [r02]
      ,'20171031' as [r03]
      ,'BC23688435' as [r04]
      ,'QUINAX STERILE OPHTHALMIC SOLUTION' as [r06]
      ,1 as [r08]
      ,139.00 as [r09]
      ,'' as [r10]
      ,'QUINAX STERILE OPHTHALMIC SOLUTION' as [r30]

insert into [CL].[dbo].[p10504]
SELECT 'BC03077100' as [rid]
      ,'RIVOTRIL 0.5MG TABLET' as [r01]
      ,'20190401' as [r02]
      ,'20200331' as [r03]
      ,'BC03077100' as [r04]
      ,'RIVOTRIL 0.5MG TABLET' as [r06]
      ,1 as [r08]
      ,1.50 as [r09]
      ,'' as [r10]
      ,'RIVOTRIL 0.5MG TABLET' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'ORIPAM2' as [rid]
      ,'RIPAM TABLETS 2MG' as [r01]
      ,'20190401' as [r02]
      ,'20200331' as [r03]
      ,'AC58135100' as [r04]
      ,'RIPAM TABLETS 2MG' as [r06]
      ,1 as [r08]
      ,2.07 as [r09]
      ,'' as [r10]
      ,'RIPAM TABLETS 2MG' as [r30]

insert into [CL].[dbo].[p10504]
SELECT 'ORIPAM5' as [rid]
      ,'RIPAM TABLETS 0.5MG(鋁箔/膠箔)' as [r01]
      ,'20161001' as [r02]
      ,'29101231' as [r03]
      ,'AC580171G0' as [r04]
      ,'RIPAM TABLETS 0.5MG(鋁箔/膠箔)' as [r06]
      ,1 as [r08]
      ,2.00 as [r09]
      ,'' as [r10]
      ,'RIPAM TABLETS 0.5MG(鋁箔/膠箔)' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'AC577911G0' as [rid]
      ,'FAMOTIDINE F.C. TABLETS 20MG "CYH"(鋁箔/膠箔)' as [r01]
      ,'20161001' as [r02]
      ,'29101231' as [r03]
      ,'AC577911G0' as [r04]
      ,'FAMOTIDINE F.C. TABLETS 20MG "CYH"(鋁箔/膠箔)' as [r06]
      ,1 as [r08]
      ,2.00 as [r09]
      ,'' as [r10]
      ,'FAMOTIDINE F.C. TABLETS 20MG "CYH"(鋁箔/膠箔)' as [r30]

insert into [CL].[dbo].[p10504]
SELECT 'OSPITE2' as [rid]
      ,'SPITERIN F.C. TABLETS 2MG "KINGDOM" (RISPERIDONE)' as [r01]
      ,'20160401' as [r02]
      ,'20170331' as [r03]
      ,'AC47290100' as [r04]
      ,'SPITERIN F.C. TABLETS 2MG "KINGDOM" (RISPERIDONE)' as [r06]
      ,1 as [r08]
      ,17.20 as [r09]
      ,'' as [r10]
      ,'SPITERIN F.C. TABLETS 2MG "KINGDOM" (RISPERIDONE)' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'AC46166100' as [rid]
      ,'TEDALIN CHEWABLE TABLETS "Y.C"' as [r01]
      ,'20190401' as [r02]
      ,'20200331' as [r03]
      ,'AC46166100' as [r04]
      ,'TEDALIN CHEWABLE TABLETS "Y.C"' as [r06]
      ,1 as [r08]
      ,3.25 as [r09]
      ,'' as [r10]
      ,'TEDALIN CHEWABLE TABLETS "Y.C"' as [r30]

insert into [CL].[dbo].[p10504]
SELECT 'OSILY' as [rid]
      ,'SILYGEN-H CAPSULE 150MG "H.C." (SILYMARIN)' as [r01]
      ,'20160401' as [r02]
      ,'20170331' as [r03]
      ,'AC38840100' as [r04]
      ,'SILYGEN-H CAPSULE 150MG "H.C." (SILYMARIN)' as [r06]
      ,1 as [r08]
      ,1.62 as [r09]
      ,'' as [r10]
      ,'SILYGEN-H CAPSULE 150MG "H.C." (SILYMARIN)' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'AC368201G0' as [rid]
      ,'METFORMIN TABLETS 500MG "C.H."(鋁箔/膠箔)' as [r01]
      ,'20190401' as [r02]
      ,'29100331' as [r03]
      ,'AC368201G0' as [r04]
      ,'METFORMIN TABLETS 500MG "C.H."(鋁箔/膠箔)' as [r06]
      ,1 as [r08]
      ,2.00 as [r09]
      ,'' as [r10]
      ,'METFORMIN TABLETS 500MG "C.H."(鋁箔/膠箔)' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'AC36020100' as [rid]
      ,'TEGRETOL TABLETS 200MG (CARBAMAZEPINE)' as [r01]
      ,'20190401' as [r02]
      ,'29100331' as [r03]
      ,'AC36020100' as [r04]
      ,'TEGRETOL TABLETS 200MG (CARBAMAZEPINE)' as [r06]
      ,1 as [r08]
      ,2.33 as [r09]
      ,'' as [r10]
      ,'TEGRETOL TABLETS 200MG (CARBAMAZEPINE)' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'AC31476100' as [rid]
      ,'ETUMINE TABLETS 40MG (CLOTIAPINE)' as [r01]
      ,'20190401' as [r02]
      ,'20200331' as [r03]
      ,'AC31476100' as [r04]
      ,'ETUMINE TABLETS 40MG (CLOTIAPINE)' as [r06]
      ,1 as [r08]
      ,6.40 as [r09]
      ,'' as [r10]
      ,'ETUMINE TABLETS 40MG (CLOTIAPINE)' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'AC29739338' as [rid]
      ,'TOPSYM LOTION (FLUOCINONIDE)' as [r01]
      ,'20161230' as [r02]
      ,'29101231' as [r03]
      ,'AC29739338' as [r04]
      ,'TOPSYM LOTION (FLUOCINONIDE)' as [r06]
      ,1 as [r08]
      ,149.00 as [r09]
      ,'' as [r10]
      ,'TOPSYM LOTION (FLUOCINONIDE)' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'OBISA' as [rid]
      ,'Bisadyl ECTab 5mg 秘瀉樂(明德)' as [r01]
      ,'20161230' as [r02]
      ,'29101231' as [r03]
      ,'AC09619100' as [r04]
      ,'Bisadyl ECTab 5mg 秘瀉樂(明德)' as [r06]
      ,1 as [r08]
      ,1.50 as [r09]
      ,'' as [r10]
      ,'Bisadyl ECTab 5mg 秘瀉樂(明德)' as [r30]

insert into [CL].[dbo].[p10604]
SELECT 'AB50083100' as [rid]
      ,'CALM-EZ F.C. TABLETS 25MG' as [r01]
      ,'20170401' as [r02]
      ,'20170831' as [r03]
      ,'AB50083100' as [r04]
      ,'CALM-EZ F.C. TABLETS 25MG' as [r06]
      ,1 as [r08]
      ,12.20 as [r09]
      ,'' as [r10]
      ,'CALM-EZ F.C. TABLETS 25MG' as [r30]

insert into [CL].[dbo].[p10604]
SELECT 'OVALN2' as [rid]
      ,'Valnon EC Tab 200mg 癲免(十全)' as [r01]
      ,'20161230' as [r02]
      ,'99991231' as [r03]
      ,'AB45668100  ' as [r04]
      ,'Valnon EC Tab 200mg 癲免(十全)' as [r06]
      ,1 as [r08]
      ,5.70 as [r09]
      ,'' as [r10]
      ,'Valnon EC Tab 200mg 癲免(十全)' as [r30]

insert into [CL].[dbo].[p10604]
SELECT 'AB44371100' as [rid]
      ,'AMOPINE TABLETS 5MG "S.T"' as [r01]
      ,'20170401' as [r02]
      ,'20171031' as [r03]
      ,'AB44371100' as [r04]
      ,'AMOPINE TABLETS 5MG "S.T"' as [r06]
      ,1 as [r08]
      ,5.70 as [r09]
      ,'' as [r10]
      ,'AMOPINE TABLETS 5MG "S.T"' as [r30]

insert into [CL].[dbo].[p10504]
SELECT 'AB211991G0' as [rid]
      ,'SULPIRIDE CAPSULES "JOHNSON"(鋁箔/膠箔)' as [r01]
      ,'20160701' as [r02]
      ,'29101231' as [r03]
      ,'AB211991G0' as [r04]
      ,'SULPIRIDE CAPSULES "JOHNSON"(鋁箔/膠箔)' as [r06]
      ,1 as [r08]
      ,2.0 as [r09]
      ,'' as [r10]
      ,'SULPIRIDE CAPSULES "JOHNSON"(鋁箔/膠箔)' as [r30]

insert into [CL].[dbo].[p10504]
SELECT 'A003442100' as [rid]
      ,'CHLORPHENIRAMINE MALEATE TABLETS "VPP"' as [r01]
      ,'20160701' as [r02]
      ,'29101231' as [r03]
      ,'A003442100' as [r04]
      ,'CHLORPHENIRAMINE MALEATE TABLETS "VPP"' as [r06]
      ,1 as [r08]
      ,0.0 as [r09]
      ,'' as [r10]
      ,'CHLORPHENIRAMINE MALEATE TABLETS "VPP"' as [r30]

select	distinct A.p4
from	al.dbo.xml_pdata as A
		left outer join
		cl.dbo.p10604 as B
		on A.p4=B.r04
where	len(A.p4)=10 and A.t3 between '10604' and '10704' and B.r01 is null

insert into [CL].[dbo].[p10804]
SELECT 'BC16904100' as [rid]
      ,'CONVULEX 150 SOFT CAPSULES' as [r01]
      ,'20190401' as [r02]
      ,'2020331' as [r03]
      ,'BC16904100' as [r04]
      ,'CONVULEX 150 SOFT CAPSULES' as [r06]
      ,1 as [r08]
      ,2.84 as [r09]
      ,'' as [r10]
      ,'CONVULEX 150 SOFT CAPSULES' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'AC49653100' as [rid]
      ,'CALM-EZ F.C. TABLETS 100MG' as [r01]
      ,'20190401' as [r02]
      ,'20200331' as [r03]
      ,'AC49653100' as [r04]
      ,'CALM-EZ F.C. TABLETS 100MG' as [r06]
      ,1 as [r08]
      ,16.40 as [r09]
      ,'' as [r10]
      ,'CALM-EZ F.C. TABLETS 100MG' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'AC24888100' as [rid]
      ,'CEFLEXIN CAPSULES 500MG "VPP" (CEPHALEXIN)' as [r01]
      ,'20180501' as [r02]
      ,'29101231' as [r03]
      ,'AC24888100' as [r04]
      ,'CEFLEXIN CAPSULES 500MG "VPP" (CEPHALEXIN)' as [r06]
      ,1 as [r08]
      ,1.78 as [r09]
      ,'' as [r10]
      ,'CEFLEXIN CAPSULES 500MG "VPP" (CEPHALEXIN)' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'OBONAS' as [rid]
      ,'Bonas ES Tab 100mg百炎施(健喬' as [r01]
      ,'20141201' as [r02]
      ,'29101231' as [r03]
      ,'AC19246100' as [r04]
      ,'Bonas ES Tab 100mg百炎施(健喬' as [r06]
      ,1 as [r08]
      ,1.5 as [r09]
      ,'' as [r10]
      ,'Bonas ES Tab 100mg百炎施(健喬' as [r30]

insert into [CL].[dbo].[p10604]
SELECT 'AB57267100' as [rid]
      ,'ATOTIN F.C. TABLETS 10MG' as [r01]
      ,'20170401' as [r02]
      ,'20171031' as [r03]
      ,'AB57267100' as [r04]
      ,'ATOTIN F.C. TABLETS 10MG' as [r06]
      ,1 as [r08]
      ,15.7 as [r09]
      ,'' as [r10]
      ,'ATOTIN F.C. TABLETS 10MG' as [r30]

insert into [CL].[dbo].[p10504]
SELECT 'AB43706100' as [rid]
      ,'LODITON F. C. TAB. 500MG "STANDARD"' as [r01]
      ,'20140801' as [r02]
      ,'20171031' as [r03]
      ,'AB43706100' as [r04]
      ,'LODITON F. C. TAB. 500MG "STANDARD"' as [r06]
      ,1 as [r08]
      ,1.5 as [r09]
      ,'' as [r10]
      ,'LODITON F. C. TAB. 500MG "STANDARD"' as [r30]

insert into [CL].[dbo].[p10504]
SELECT 'AB229081G0' as [rid]
      ,'SPIRONOLACTONE TABLETS "S.C."(鋁箔/膠箔)' as [r01]
      ,'20140801' as [r02]
      ,'20171031' as [r03]
      ,'AB229081G0' as [r04]
      ,'SPIRONOLACTONE TABLETS "S.C."(鋁箔/膠箔)' as [r06]
      ,1 as [r08]
      ,2.0 as [r09]
      ,'' as [r10]
      ,'SPIRONOLACTONE TABLETS "S.C."(鋁箔/膠箔)' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'AB211991G0' as [rid]
      ,'SULPIRIDE CAPSULES "JOHNSON"(鋁箔/膠箔)' as [r01]
      ,'20160201' as [r02]
      ,'20180228' as [r03]
      ,'AB211991G0' as [r04]
      ,'SULPIRIDE CAPSULES "JOHNSON"(鋁箔/膠箔)' as [r06]
      ,1 as [r08]
      ,2.0 as [r09]
      ,'' as [r10]
      ,'SULPIRIDE CAPSULES "JOHNSON"(鋁箔/膠箔)' as [r30]

insert into [CL].[dbo].[p10704]
SELECT 'AB03976100' as [rid]
      ,'BISMUTH SUBCARBONATE TABLETS 324MG "VPP"' as [r01]
      ,'20160201' as [r02]
      ,'20180228' as [r03]
      ,'AB03976100' as [r04]
      ,'BISMUTH SUBCARBONATE TABLETS 324MG "VPP"' as [r06]
      ,1 as [r08]
      ,1.5 as [r09]
      ,'' as [r10]
      ,'BISMUTH SUBCARBONATE TABLETS 324MG "VPP"' as [r30]

insert into [CL].[dbo].[p10504]
SELECT 'AA51598100' as [rid]
      ,'ATOTY F.C. TABLETS 10 MG(30粒/鋁箔盒裝)' as [r01]
      ,'20160401' as [r02]
      ,'20170331' as [r03]
      ,'AA51598100' as [r04]
      ,'ATOTY F.C. TABLETS 10 MG(30粒/鋁箔盒裝)' as [r06]
      ,1 as [r08]
      ,18.0 as [r09]
      ,'' as [r10]
      ,'ATOTY F.C. TABLETS 10 MG(30粒/鋁箔盒裝)' as [r30]

select	distinct A.p4
from	al.dbo.xml_pdata as A
		left outer join
		cl.dbo.p10704 as B
		on A.p4=B.r04
where	len(A.p4)=10 and A.t3 between '10705' and '10803' and B.r01 is null

insert into [CL].[dbo].[p10704]
SELECT 'AB50083100' as [rid]
      ,'CALM-EZ F.C. TABLETS 25MG' as [r01]
      ,'20170831' as [r02]
      ,'29100331' as [r03]
      ,'AB50083100' as [r04]
      ,'CALM-EZ F.C. TABLETS 25MG' as [r06]
      ,1 as [r08]
      ,0.00 as [r09]
      ,'' as [r10]
      ,'CALM-EZ F.C. TABLETS 25MG' as [r30]

insert into [CL].[dbo].[p10804]
SELECT 'AB43706100' as [rid]
      ,'LODITON F. C. TAB. 500MG "STANDARD"' as [r01]
      ,'20140701' as [r02]
      ,'20200331' as [r03]
      ,'AB43706100' as [r04]
      ,'LODITON F. C. TAB. 500MG "STANDARD"' as [r06]
      ,1 as [r08]
      ,1.50 as [r09]
      ,'' as [r10]
      ,'LODITON F. C. TAB. 500MG "STANDARD"' as [r30]

select	distinct A.p4
from	al.dbo.xml_pdata as A
		left outer join
		cl.dbo.p10804 as B
		on A.p4=B.r04
where	len(A.p4)=10 and A.t3 between '10804' and '10805' and B.r01 is null

--建立計算用的pdata檔
