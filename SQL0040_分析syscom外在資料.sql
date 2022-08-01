/****** Script for SelectTopNRows command from SSMS  ******/
declare @t1 table (source nvarchar(50), informdate datetime, uid nvarchar(50), cname nvarchar(50), info nvarchar(500), interfacedate datetime, QDATE datetime)
declare @t2 table (source nvarchar(50), informdate datetime, uid nvarchar(50), cname nvarchar(50), info nvarchar(500), interfacedate datetime, QDATE datetime)

insert into @t1
SELECT [source]
      ,[informdate]
      ,[uid]
      ,[cname]
      ,[info]
      ,[interfacedate]
      ,[QDATE]
  FROM [CL].[dbo].[tbl_dp_syscom_external]
  WHERE [QDATE]='2021-09-12 06:21:23.093'

insert into @t2
SELECT [source]
      ,[informdate]
      ,[uid]
      ,[cname]
      ,[info]
      ,[interfacedate]
      ,[QDATE]
  FROM [CL].[dbo].[tbl_dp_syscom_external]
  WHERE [QDATE]='2021-09-12 07:14:34.847'

/*
select	*
from	@t1 as A
        left outer join
		@t2 as B
		on A.[source]=B.[source] and A.[informdate]=B.[informdate] and A.[uid]=B.[uid] and A.[info]=B.[info]
where	A.[uid] is null

select	*
from	@t1 as A
        left outer join
		@t2 as B
		on A.[source]=B.[source] and A.[informdate]=B.[informdate] and A.[uid]=B.[uid] and A.[info]=B.[info]
where	A.[uid] is not null

select	*
from	@t1 as A
        left outer join
		@t2 as B
		on A.[source]=B.[source] and A.[informdate]=B.[informdate] and A.[uid]=B.[uid] and A.[info]=B.[info]
where	B.[uid] is null

select	*
from	@t1 as A
        left outer join
		@t2 as B
		on A.[source]=B.[source] and A.[informdate]=B.[informdate] and A.[uid]=B.[uid] and A.[info]=B.[info]
where	B.[uid] is not null

--一天可能新增200調資料
select	[interfacedate]
        , count(*) as N
from	@t1
group by [interfacedate]
order by [interfacedate]

--一共有十個資料來源, 要造10個tables
--刑案系統(緩護命)	205	-done
--刑案系統(緩護療)	201	-done
--自殺通報系統	28
--保護資訊系統-加害人處遇	2
--保護資訊系統-被害人處遇(成人)	48
--保護資訊系統-被害人處遇(兒少)	3
--毒品成癮者單一窗口服務系統	138
--獄政系統	191
--精神照護資訊管理系統	6
--醫療機構替代治療作業管理系統	114

select	[source]
        , count(*) as N
from	@t1
group by [source]
order by [source]
*/

select	*
from	@t1
where	[source]='醫療機構替代治療作業管理系統'

--select	*
--from	@t1
--where	[source]='刑案系統(緩護療)'

