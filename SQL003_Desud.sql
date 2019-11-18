--區分診所,專案
declare	@t1 table(YM date, N int, amt float) 
declare	@t2 table(YM date, N int, amt float) 
declare	@t3 table(YM date, amt float) 
declare	@t4 table(YM date, amt float) 
declare	@t5 table(YM date, amt float) 
declare	@t6 table(YM date, amt float) 
declare	@t7 table(YM date, N int, amt float) 
declare	@t8 table(YM date, amt float) 
declare	@t9 table(YM date, N int, amt float) 
declare	@t10 table(YM date, amt float) 

--診察費
--@t1 專案診察費
insert into @t1
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		,count(A.CASENO) as N
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_pijia] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.rid in ('00109C','00110C','00158C','00182C','00184C','01031','01031C','01032C')
		and B.[Youmian] in ('機構','機重','機榮','機福')
		and A.SDATE between '20170301' and '20190430'
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)

insert into @t2
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		,count(A.CASENO) as N
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_pijia] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.rid in ('00109C','00110C','00158C','00182C','00184C','01031','01031C','01032C')
		and B.[Youmian] not in ('機構','機重','機榮','機福')
		and A.SDATE between '20170101' and '20190430'
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)

--診療費
insert into @t3
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_pijia] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.rid in ('45046','45102','45010','45087')
		and A.SDATE between '20170301' and '20190430'
		and B.[Youmian] in ('機構','機重','機榮','機福')
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)

insert into @t4
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_pijia] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.rid in ('45046','45102','45010','45087')
		and A.SDATE between '20170301' and '20190430'
		and B.[Youmian] not in ('機構','機重','機榮','機福')
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)

--檢驗費
insert into @t5
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_pijia] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.CLASS = '檢驗'
		and A.SDATE between '20170301' and '20190430'
		and B.[Youmian] in ('機構','機重','機榮','機福')
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)

insert into @t6
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_pijia] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.CLASS = '檢驗'
		and A.SDATE between '20170301' and '20190430'
		and B.[Youmian] not in ('機構','機重','機榮','機福')
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)


--舌下錠
insert into @t7
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, SDATE), 0) AS [YM]
		,count(CASENO) as N
		, sum(convert(float,SelfPay)) as AMT
from al.dbo.tbl_pijia
where	CASENO in
(select	distinct CASENO
from	al.dbo.tbl_opd_order
where	rid in ('DES01','SUB0'))
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, SDATE), 0)

--掛號費
insert into @t8
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, SDATE), 0) AS [YM]
		, sum(convert(float,RegFee)) as AMT
from al.dbo.tbl_pijia
where	RegFee not in (47,48)
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, SDATE), 0)


--緩起訴
insert into @t9
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, SDATE), 0) AS [YM]
		, count(CASENO) as N
		, sum(convert(float,AMTreceived)) as AMT
from al.dbo.tbl_pijia
where	uid in
(select	distinct uid
from al.dbo.tbl_pijia
where	regfee in (47, 48))
		and CASENO not in
(select	distinct CASENO
from	al.dbo.tbl_opd_order
where	rid in ('DES01','SUB0'))
		and POSINAME='自費'
		and SDATE>'20171231'
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, SDATE), 0)

--司法鑑定
insert into @t10
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		, sum(convert(float,A.AMT)) as AMT
FROM [AL].[dbo].[tbl_opd_order] as A
where A.rid='CERTF'
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, SDATE), 0)

select	A.YM,
		A.N as JY_N,
		A.amt as JY_JenCha,
		C.amt as JY_JenLiao,
		E.amt as JY_Lab,
		B.N as Cl_N,
		H.amt as RegFee,
		B.amt as Cl_JenCha,
		D.amt as Cl_JenLiao,
		F.amt as Cl_Lab,
		G.N as DES_N,
		G.amt as DES_amt,
		I.N as Delayed_N,
		I.amt as Delayed,
		J.amt as forensic
from	@t1 as A
		left outer join
		@t2 as B
		on A.YM=B.YM
		left outer join
		@t3 as C
		on A.YM=C.YM
		left outer join
		@t4 as D
		on A.YM=D.YM
		left outer join
		@t5 as E
		on A.YM=E.YM
		left outer join
		@t6 as F
		on A.YM=F.YM
		left outer join
		@t7 as G
		on A.YM=G.YM
		left outer join
		@t8 as H
		on A.YM=H.YM
		left outer join
		@t9 as I
		on A.YM=I.YM
		left outer join
		@t10 as J
		on A.YM=J.YM
order by	A.YM





