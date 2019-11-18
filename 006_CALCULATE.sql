--人數
select	left(CASENO,6) as YM,
		count(*) as N
from	al.dbo.tbl_pijia
where	G=1
group by left(CASENO,6)
order by left(CASENO,6)

--診察費
select	left(A.CASENO,6) as YM,
		count(A.CASENO) as N,
		sum(convert(float,B.AMT)) as AMT
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and B.rid in ('01031C','00184C','00109C','00158C','00110C','01031','01032C')
group by left(A.CASENO,6)
order by left(A.CASENO,6)

--修正一個問題 01031C在 201702及之前是318
--00184C 569

--有136
--update	tbl_opd_order
set	PRICE='318.0', AMT='318.0'
where	SDATE<'20170301' and rid='01031C' and AMT='338.0'

--有946筆
--update	tbl_opd_order
set	PRICE='338.0', AMT='338.0'
where	SDATE>'20170228' and rid='01031C' and AMT='318.0'


select	*
from	tbl_opd_order
where	SDATE>'20170228' and rid='01031C' and AMT='318.0'

select rid
from	tbl_opd_order
group by rid
order by rid

--45087, 45102
select	left(A.CASENO,6) as YM,
		sum(convert(float,B.AMT)) as AMT
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and B.rid in ('45046','45102')
group by left(A.CASENO,6)
order by left(A.CASENO,6)


--藥品
select	left(A.CASENO,6) as YM,
		sum(convert(float,B.AMT)) as AMT
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and B.CLASS='藥品' and B.CHRONIC=3
group by left(A.CASENO,6)
order by left(A.CASENO,6)

