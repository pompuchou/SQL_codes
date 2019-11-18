--20190612 created
--���h�S���Ϊ�00001, �̦n�ҩ��T���S�����, �̦n��k�O²�檺
select	SDATE, uid, POSINAME, HEATH_CARD, count(bid) as N
from	al.dbo.tbl_pijia
where	STATUS not in ('�@�o') and len(bremark)=0
group by	SDATE, uid, POSINAME, HEATH_CARD
having count(bid)>1

--SDATE, uid, POSINAME, HEATH_CARD�i�H�ߤ@
--407 ��
select	A.CASENO 
		,A.Pijia
		,B.CASENO
		,B.bid
from	al.dbo.tbl_opd as A
		left outer join
		(select * from
		al.dbo.tbl_pijia
		where STATUS not in ('�@�o') and len(bremark)=0
		) as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.POSINAME=B.POSINAME and A.HEATH_CARD=B.HEATH_CARD  
where	A.SDATE between '20170201' and '20170228' and B.bid is not null




select	A.*, B.CASENO, CASE WHEN LEFT(A.remark,2) in ('���','�Ѯ�','�K�u','����','�Ҵ�','���|','����','�t�R','���','�۫H', '�[��') THEN 1 END
from	al.dbo.tbl_pijia as A
		left outer join
		al.dbo.tbl_opd as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.POSINAME=B.POSINAME and A.HEATH_CARD=B.HEATH_CARD
where A.CASENO is null and A.STATUS not in ('�@�o','�h�R') and len(A.bremark)=0

--�Ĥ@�B,�NPijia�t�WCASENO,�o�@�B�JPijia���i�t�W�@��CASENO,���i��h��PIJIA��@��CASENO
update	al.dbo.tbl_pijia
set	CASENO=B.CASENO, G=CASE WHEN LEFT(A.remark,2) in ('���','�Ѯ�','�K�u','����','�Ҵ�','���|','����','�t�R','���','�۫H', '�[��') THEN 1 END
from	al.dbo.tbl_pijia as A
		left outer join
		al.dbo.tbl_opd as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.VIST=B.VIST and A.RMNO=B.RMNO and A.POSINAME=B.POSINAME and A.HEATH_CARD=B.HEATH_CARD
where A.CASENO is null and A.STATUS not in ('�@�o','�h�R') and len(A.bremark)=0

--�ĤG�B���@,�T�{opd��CASENO�O1to1�tpijia,�Y�O�N�����t��,�Y���O�N�Ǧ^���~�T��,���X�����~
--�u�S�Q��@�H�@�ѨӨ⦸
select	CASENO, bid, SDATE, VIST, RMNO, cname
from	al.dbo.tbl_pijia
where	CASENO in
(select	CASENO
from	al.dbo.tbl_pijia
where	CASENO is not null
group by CASENO
having count(bid)>1)

--�ĤG�B���G,�Nopd�t�WPijia
update	al.dbo.tbl_opd
set	Pijia=B.bid
from	al.dbo.tbl_opd as A
		left outer join
		al.dbo.tbl_pijia as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.VIST=B.VIST and A.RMNO=B.RMNO and A.POSINAME=B.POSINAME and A.HEATH_CARD=B.HEATH_CARD
where	A.Pijia is null and B.bid is not null

select	A.*, B.bid
from	al.dbo.tbl_opd as A
		left outer join
		al.dbo.tbl_pijia as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.POSINAME=B.POSINAME and A.HEATH_CARD=B.HEATH_CARD
where	A.Pijia is null and B.bid is not null


update al.dbo.tbl_pijia
set	CASENO=B.CASENO, G=B.G, remark=CASE WHEN left(A.remark,2)<>B.remark then B.remark else A.remark end
from	al.dbo.tbl_pijia as A
		left outer join
		bl.dbo.tbl_pijia as B
		on A.bid=B.rid and A.SDATE=B.SDATE and A.uid=B.uid and A.HEATH_CARD=B.HEATH_CARD 
where	A.STATUS <>'�@�o' and len(A.bremark)=0 and A.SDATE between '20170101' and '20170131'




--�Ĥ@�B���
--�A�Ӭݫ��۰ʤ�

/*
20170103	A121366540	���O	0001	3
20170104	A120111336	���O	0003	3
20170105	H120831303	���O	0002	3
20170118	H122263214	���O	0001	3
20170118	H224815601	���O	0003	3
20170118	N203485910	���O	0001	3
20170119	F222643856	���O	0004	2
*/
select	*
from	al.dbo.tbl_pijia
where	sdate='20170103' and uid='A121366540'