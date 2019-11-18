--�����ӬݶE��O,�E��O���Ӧ��|�Ӱ��O�X,'00182C','00184C' �믫��C��,'01031','01031C','01032C' �믫��@���,'00158C' �@���C��, '00109C','00110C' �@���@���
/*
select	rid,
		count(CASENO) as N
from	[al].[dbo].[tbl_opd_order]
group by	rid
order by	rid

select	*
from	[al].[dbo].[p_order]
	where	rid in ('00109C','00110C','00158C','00182C','00184C','01031','01031C','01032C')
*/
select	*
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_opd] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.rid in ('00109C','00110C','00158C','00182C','00184C','01031','01031C','01032C','45046','45102','45010','45087')
		and A.SDATE between '20170301' and '20190430'

--�E��O
select	sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_opd] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.rid in ('00109C','00110C','00158C','00182C','00184C','01031','01031C','01032C')
		and A.SDATE between '20170101' and '20190430'

--�E���O
select	sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_opd] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.rid in ('45046','45102','45010','45087')
		and A.SDATE between '20170301' and '20190430'

--����O
select	sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_opd] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.CLASS = '����'
		and A.SDATE between '20170301' and '20190430'

--YM
select	YEAR(SDATE), MONTH(SDATE)
from	[al].[dbo].[tbl_opd_order] as A

select	DATEADD(MONTH, DATEDIFF(MONTH, 0, SDATE), 0) AS [YM]
from	[al].[dbo].[tbl_opd_order] as A

--�E��O
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_opd] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.rid in ('00109C','00110C','00158C','00182C','00184C','01031','01031C','01032C')
		and A.SDATE between '20170301' and '20190430'
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)

--�E���O
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_opd] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.rid in ('45046','45102','45010','45087')
		and A.SDATE between '20170301' and '20190430'
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)

--����O
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_opd] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.CLASS = '����'
		and A.SDATE between '20170301' and '20190430'
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)

--�Ϥ��E��,�M��
declare	@t1 table(YM date, N int, amt float) 
declare	@t2 table(YM date, N int, amt float) 
declare	@t3 table(YM date, amt float) 
declare	@t4 table(YM date, amt float) 
declare	@t5 table(YM date, amt float) 
declare	@t6 table(YM date, amt float) 

--�E��O
--@t1 �M�׶E��O
insert into @t1
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		,count(A.CASENO) as N
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_pijia] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.rid in ('00109C','00110C','00158C','00182C','00184C','01031','01031C','01032C')
		and B.[Youmian] in ('���c','����','���a','����')
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
		and B.[Youmian] not in ('���c','����','���a','����')
		and A.SDATE between '20170101' and '20190430'
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)

--�E���O
insert into @t3
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_pijia] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.rid in ('45046','45102','45010','45087')
		and A.SDATE between '20170301' and '20190430'
		and B.[Youmian] in ('���c','����','���a','����')
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
		and B.[Youmian] not in ('���c','����','���a','����')
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)

--����O
insert into @t5
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_pijia] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.CLASS = '����'
		and A.SDATE between '20170301' and '20190430'
		and B.[Youmian] in ('���c','����','���a','����')
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)

insert into @t6
select	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0) AS [YM]
		, sum(convert(float,AMT)) as AMT
from	[al].[dbo].[tbl_opd_order] as A
	left outer join
		[al].[dbo].[tbl_pijia] as B
	on	A.[CASENO]=B.[CASENO]
	where	A.CLASS = '����'
		and A.SDATE between '20170301' and '20190430'
		and B.[Youmian] not in ('���c','����','���a','����')
group by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)
order by	DATEADD(MONTH, DATEDIFF(MONTH, 0, A.SDATE), 0)


select	A.YM,
		A.N as JY_N,
		A.amt as JY_JenCha,
		C.amt as JY_JenLiao,
		E.amt as JY_Lab,
		B.N as Cl_N,
		B.amt as Cl_JenCha,
		D.amt as Cl_JenLiao,
		F.amt as Cl_Lab
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
order by	A.YM





