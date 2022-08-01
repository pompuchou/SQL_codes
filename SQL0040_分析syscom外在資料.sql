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

--�@�ѥi��s�W200�ո��
select	[interfacedate]
        , count(*) as N
from	@t1
group by [interfacedate]
order by [interfacedate]

--�@�@���Q�Ӹ�ƨӷ�, �n�y10��tables
--�D�רt��(�w�@�R)	205	-done
--�D�רt��(�w�@��)	201	-done
--�۱��q���t��	28
--�O�@��T�t��-�[�`�H�B�J	2
--�O�@��T�t��-�Q�`�H�B�J(���H)	48
--�O�@��T�t��-�Q�`�H�B�J(���)	3
--�r�~���}�̳�@���f�A�Ȩt��	138
--���F�t��	191
--�믫���@��T�޲z�t��	6
--�������c���N�v���@�~�޲z�t��	114

select	[source]
        , count(*) as N
from	@t1
group by [source]
order by [source]
*/

select	*
from	@t1
where	[source]='�������c���N�v���@�~�޲z�t��'

--select	*
--from	@t1
--where	[source]='�D�רt��(�w�@��)'

