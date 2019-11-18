/*分組基本上部影響藥物
select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	G=0 and len(remark)>0 and POSINAME<>'自費' and remark <>'家人'
*/
--constructing
--先算當月
declare	@t1 table (rid nvarchar(50), BILL_QTY float)
declare	@t2 table (rid nvarchar(50), BILL_QTY float)
declare	@t3 table (rid nvarchar(50), BILL_QTY float)
declare	@tt table (rid nvarchar(50), BILL_QTY float)


--august
select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180801' and '20180831' and A.G=1 and CLASS='藥品' and B.rid='OSABRIL'

select	* 
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180701' and '20180731' and A.G=1 and CLASS='藥品' and CHRONIC=2 and B.rid='OSABRIL'


select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180601' and '20180630' and A.G=1 and CLASS='藥品' and CHRONIC=3 and B.rid='OSABRIL'




--september
select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180901' and '20180930' and A.G=1 and CLASS='藥品' and B.rid='OSABRIL'

select	* 
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180801' and '20180831' and A.G=1 and CLASS='藥品' and CHRONIC=2 and B.rid='OSABRIL'


select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180701' and '20180731' and A.G=1 and CLASS='藥品' and CHRONIC=3 and B.rid='OSABRIL'


--october
select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20181001' and '20181031' and A.G=1 and CLASS='藥品' and B.rid='OSABRIL'

select	* 
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180901' and '20180930' and A.G=1 and CLASS='藥品' and CHRONIC=2 and B.rid='OSABRIL'

select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180801' and '20180831' and A.G=1 and CLASS='藥品' and CHRONIC=3 and B.rid='OSABRIL'

