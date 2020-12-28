/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
declare @t table (iid varchar(50), uid varchar(10))
declare @u table (Y int, uid varchar(10), H float)
declare @i varchar(10)
declare @i2 varchar(10)
set @i ='9N33010020'
set @i2 ='9N32040015'

insert into @t
SELECT 	[iid]
      ,[uid]
  FROM [BL].[dbo].[tbl_upload]
  where	[iid] in (@i)
  group by [iid], [uid]
  order by [iid], [uid]

insert into @u
SELECT datepart(yyyy,A.[SDATE]) as Y
	,A.[uid]
      ,max(convert(int,A.[HEATH_CARD])) as H
  FROM [al].[dbo].[tbl_opd] as A
  where ISNUMERIC(A.[HEATH_CARD])=1 and A.[uid] in (select [uid] from @t)
  group by datepart(yyyy,A.[SDATE]), A.[uid]

select	Y
		,avg(H) as average
from	@u
group by Y
order by Y

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

春暉
Y	average
2017	13.4310344827586
2018	10.7333333333333
2019	10.7027027027027

聖愛
Y	average
2017	20.3503184713376
2018	17.025641025641
2019	15.9430379746835

祥育
Y	average
2017	14.6842105263158
2018	14.7027027027027
2019	16.1818181818182

方舟
Y	average
2017	32.2592592592593
2018	26.4520547945205
2019	25.3066666666667

觀音
Y	average
2017	16.7380952380952
2018	13.6739130434783
2019	12.5744680851064

啟智
Y	average
2017	31.3428571428571
2018	32.8571428571429
2019	32.3300970873786

香園
Y	average
2017	19.9910714285714
2018	18.1071428571429
2019	17.0909090909091

世美
Y	average
2017	22.6774193548387
2018	23.4838709677419
2019	25.8666666666667

桃園
Y	average
2017	25.125
2018	29.1521739130435
2019	34.6037735849057

由根
Y	average
2017	17.8148148148148
2018	18.4047619047619
2019	17.75
*/