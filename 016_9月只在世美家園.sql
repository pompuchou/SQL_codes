--�E��
--�@�@��12���Ī��u�}�b�@���a��,�����⤤���S���X�{
select	distinct remark
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and CLASS='�ī~' and B.rid in ('EMYCO','OLUCKY','OMETHY500','SCHLO','OALDA','OTELIN','OFERI','OFEXO','IFLUANX','OACCU','OSERO100','OLYRICA') and A.SDATE between '20180901' and '20180930'

select	*
from	al.dbo.p_order
where	rid in  ('EMYCO','OLUCKY','OMETHY500','SCHLO','OALDA','OTELIN','OFERI','OFEXO','IFLUANX','OACCU','OSERO100','OLYRICA') 

select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_order as C
	on B.rid=C.rid
where	A.G=1 and CLASS='�ī~' and B.rid in ('EMYCO','OLUCKY','OMETHY500','SCHLO','OALDA','OTELIN','OFERI','OFEXO','IFLUANX','OACCU','OSERO100','OLYRICA') and A.SDATE between '20180901' and '20180930'
order by A.SDATE

--�Q��
--�@�@��9���Ī��u�}�b�@���a��,�����⤤���S���X�{
select	distinct remark
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.G=1 and CLASS='�ī~' and B.rid in ('OLUCKY','OMETHY500','OALDA','OTELIN','OFERI','OFEXO','IFLUANX','OACCU','OLYRICA') and A.SDATE between '20181001' and '20181031'

select	*
from	al.dbo.p_order
where	rid in  ('EMYCO','OLUCKY','OMETHY500','SCHLO','OALDA','OTELIN','OFERI','OFEXO','IFLUANX','OACCU','OSERO100','OLYRICA') 

select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_order as C
	on B.rid=C.rid
where	A.G=1 and CLASS='�ī~' and B.rid in ('OLUCKY','OMETHY500','OALDA','OTELIN','OFERI','OFEXO','IFLUANX','OACCU','OLYRICA') and A.SDATE between '20181001' and '20181031'
order by A.SDATE

--�䥦�����Ī� �i�������p
--9�� 3�~
--('OAMARM')



--10�� 
--('ODEPATEC5',)