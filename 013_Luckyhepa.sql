select	distinct remark
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and CLASS='ÃÄ«~' and B.rid in ('EMYCO','OLUCKY','OMETHY500','SCHLO','OALDA','OTELIN','OFERI','OFEXO','IFLUANX','OACCU','OSERO100','OLYRICA') and A.SDATE between '20180901' and '20180930'

select	distinct remark
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and CLASS='ÃÄ«~' and B.rid in ('EMYCO','SCHLO','OSERO100') and A.SDATE between '20181001' and '20181031'


--luckyhepa¥u¦³¦b¥@¬ü

select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and CLASS='ÃÄ«~' and B.rid in ('EMYCO','OLUCKY','OMETHY500','SCHLO','OALDA','OTELIN','OFERI','OFEXO','IFLUANX','OACCU','OSERO100','OLYRICA') and A.SDATE between '20180901' and '20180930'
order by A.SDATE


select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and CLASS='ÃÄ«~' and B.rid in ('EMYCO','SCHLO','OSERO100') and A.SDATE between '20181001' and '20181031'
order by A.SDATE


select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and CLASS='ÃÄ«~' and B.rid in ('ODEPATEC5','ODOGM200','OAMARM','OPKMERZ','SALPHA','ODOXA4') and A.SDATE between '20180901' and '20180930'
order by A.SDATE

select	*
from	al.dbo.tbl_pijia as A
where	A.G=1 and A.uid in ('H221599637','O200262284','H222937668','A126249982','S102187962','Q122164936') and A.SDATE between '20180901' and '20180930'

select	*
from	al.dbo.tbl_pijia as A
where	A.G=1 and A.CASENO in ('AC180918101028','AC180918101039','AC180927101043','AC180927101026','AC180927101011','AC180927101027') and A.SDATE between '20180901' and '20180930'

select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and CLASS='ÃÄ«~' and A.CASENO in ('AC180918101028','AC180918101039','AC180927101043','AC180927101026','AC180927101011','AC180927101027') and A.SDATE between '20180901' and '20180930'


