
select	left(A.CASENO, 6) as YM
		,sum(convert(float,B.AMT)) as AMT
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and CLASS='ÃÄ«~' and remark = '¥@¬ü'
group by left(A.CASENO, 6)

select	left(A.CASENO, 6) as YM
		,sum(convert(float,B.AMT)) as AMT
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and CLASS='ÃÄ«~' and remark = '¥@¬ü' and CHRONIC=2
group by left(A.CASENO, 6)


select	A.SDATE as YM
		,sum(convert(float,B.AMT)) as AMT
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and CLASS='ÃÄ«~' and remark = '¥@¬ü'
group by A.SDATE

select	A.SDATE as YM
		,sum(convert(float,B.AMT)) as AMT
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and CLASS='ÃÄ«~' and remark = '¥@¬ü' and CHRONIC=2
group by A.SDATE
