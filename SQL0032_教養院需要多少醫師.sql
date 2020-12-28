/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
declare @t table (iid varchar(50), uid varchar(10))


insert into @t
SELECT 	[iid]
      ,[uid]
  FROM [BL].[dbo].[tbl_upload]
  group by [iid], [uid]
  order by [iid], [uid]

select	A.[iid]
		,B.[sname]
		,count(A.[uid]) as N
from	@t as A
		left outer join
		[AL].[dbo].[p_institute] as B
		on A.[iid]=B.[iid]
group by A.[iid], B.[sname]
order by A.[iid]

--問題一 需要多少醫師
/*
iid	sname	N	D
7831091294	春暉	209	5
7832041494	聖愛	186	4
7832081247	祥育	51	1
7832111268	方舟	99	2
7832121424	觀音	66	2
7833011187	華光	44	1
9832040533	啟智	269	6
9833060511	香園	182	4
9N01200072	世美	31	1
9N32100034	桃園	92	2
9N33010020	由根	177	4

*/