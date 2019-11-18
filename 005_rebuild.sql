select	rid,
	count(*) as N
from	al.dbo.tbl_pijia
group by rid
order by  count(SDATE) desc, rid


--�O�_�b�M�פ��H�Ī���O��@�����O
--�w�]�b�M�פ�
-- ('�t�R','�t�R���u','�Ҵ�','�Ҵ����u','�Ѯ�','���','�����u','����','����','������u','�[��','�[�����u','���','�����u','�۫H','���|','�K�u','�K�u���u','�@��')
--�w�]���b�M�פ�
--�۶O�N�����b�d��
--('�a�H')

--tbl_pijia �[�@���G

--CASENO�w�L����
select	*
from	al.dbo.tbl_pijia
where CASENO in
(select	CASENO
from	al.dbo.tbl_pijia
group by CASENO
having  count(SDATE)>1)
order by CASENO

select	*
from	al.dbo.tbl_pijia as A


--�p��s��

select	A.caseno,
	Avg(C.G) as G
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
		on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_group as C
		on B.rid=C.rid
where	A.CASENO is not null and CLASS='�ī~'
group by A.caseno


--�g�Jpijia
update al.dbo.tbl_pijia
set		G=Y.Gt
from	al.dbo.tbl_pijia as X
left outer join
(select A.caseno, 
		Avg(C.G) as Gt
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
		on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_group as C
		on B.rid=C.rid
where	A.CASENO is not null and CLASS='�ī~'
group by A.caseno) as Y
on X.caseno=Y.caseno

select	G, count(caseno) as N
from	al.dbo.tbl_pijia
group by G

/*
0		8030
0.2		1
0.25	4
0.33	2
0.4		1
0.5		3
0.66	2
0.8		9
0.83	24
0.85	5
0.87	2
0.88	3
NULL	1101
0.54	1
1		16949
*/

--0.2 1
select *
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
		on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_group as C
		on B.rid=C.rid
where	A.CASENO is not null and CLASS='�ī~' and A.G=0.2
--AC180917302007 ���ӬO��J���~, �ݩ�0 �E�Һ�
--update al.dbo.tbl_pijia
set	G=0
where	CASENO='AC180917302007'

--0.25 4
select *
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
		on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_group as C
		on B.rid=C.rid
where	A.CASENO is not null and CLASS='�ī~' and A.G=0.25
--���O��J���~
--AC180521502005
--AC180622502002
--AC170612102002
--AC171118102001
--update al.dbo.tbl_pijia
set	G=0
where	CASENO='AC171118102001'

--0.333333333333333 2
select *
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
		on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_group as C
		on B.rid=C.rid
where	A.CASENO is not null and CLASS='�ī~' and A.G between 0.33 and 0.34
--AC190225102017
--AC171118102011
--update al.dbo.tbl_pijia
set	G=0
where	CASENO='AC171118102011'

--NULL 1101
select *
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
		on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_group as C
		on B.rid=C.rid
where	A.CASENO is not null and A.G is null and B.CLASS='�ī~'
--�ݩ�M��
--AC170309102016
--AC170406101016
--AC170727101017
--AC170921103005
--update al.dbo.tbl_pijia
set	G=1
where	CASENO in ('AC170309102016','AC170406101016','AC170727101017','AC170921103005')
--�ݩ�E��
--�]�����ǽX�w�g���A�ϥΤF
--update al.dbo.tbl_pijia
set	G=0
where	CASENO in ('AC170306502005','AC170321502001','AC170331502006','AC170418302006','AC170516302001','AC170613502005','AC170630502008','AC170811302007')

--�~��

--649 ���۶O
--update	al.dbo.tbl_pijia
set G=0
where	G is null and POSINAME='�۶O'

-- 20 cases
--OFERRCHEW, OGEOD, OMERONOD, 
--�]�����ǽX�w�g���A�ϥΤF
--update al.dbo.tbl_pijia
set	G=1
where	CASENO in ('AC170816301031','AC170705301011','AC170510301025','AC170510301012','AC170510301015','AC170405101005','AC170329301036','AC170208101042','AC170301301038','AC170315101017','AC170315301014','AC170208101041','AC170104101017','AC170329101017','AC170426101017','AC170524101015','AC170719101010','AC170913101001','AC180103101030','AC171108101001')

select *
from	al.dbo.tbl_pijia as A
/*	left outer join
		al.dbo.tbl_opd_order as B
		on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_group as C
		on B.rid=C.rid */
where	A.CASENO is not null and A.G is null and len(A.remark)=0
order by B.rid
--276�� ���c,�S�B���Ī���
--166�� �E��,�S�B���Ī���
--�M�w,������{�E�Ҫ�

--update al.dbo.tbl_pijia
set	G=0
where	G is null

--0.4 1
select *
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
		on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_group as C
		on B.rid=C.rid
where	A.CASENO is not null and CLASS='�ī~' and A.G=0.4
--update al.dbo.tbl_pijia
set	G=0
where	CASENO='AC180724502005'

--0.5 3
select *
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
		on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_group as C
		on B.rid=C.rid
where	A.CASENO is not null and CLASS='�ī~' and A.G=0.5
--update al.dbo.tbl_pijia
set	G=0
where	CASENO='AC190225102018'

--update al.dbo.tbl_pijia
set	G=1
where	CASENO in ('AC181219101023','AC171226302009')

--0.54 3
select *
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
		on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_group as C
		on B.rid=C.rid
where	A.CASENO is not null and CLASS='�ī~' and A.G between 0.51 and 0.59
--update al.dbo.tbl_pijia
set	G=0
where	CASENO='AC190225102018'

--update al.dbo.tbl_pijia
set	G=1
where	CASENO in ('AC170425102010')

--0.54 3
select *
from	al.dbo.tbl_pijia as A
/*	left outer join
		al.dbo.tbl_opd_order as B
		on A.CASENO=B.CASENO
	left outer join
		al.dbo.p_group as C
		on B.rid=C.rid */
where	A.CASENO is not null and A.G between 0.6 and 0.9
order by A.CASENO
--update al.dbo.tbl_pijia
set	G=0
where	CASENO='AC190225102018'

--update al.dbo.tbl_pijia
set	G=1
where	G between 0.6 and 0.9

--
select	G, count(caseno) as N
from	al.dbo.tbl_pijia
group by G
--�ש���n�F,�M��17021��, �E��9116��


--�ˬd���S��������
--���c�b�E��
select	*
from	al.dbo.tbl_pijia
where	G=0 and remark in ('�t�R','�t�R���u','�Ҵ�','�Ҵ����u','�Ѯ�','���','�����u','����','����','������u','�[��','�[�����u','���','�����u','�۫H','���|','�K�u','�K�u���u','�@��')

--�E�Ҧb���c
select	*
from	al.dbo.tbl_pijia
where	G=1 and remark not in ('�t�R','�t�R���u','�Ҵ�','�Ҵ����u','�Ѯ�','���','�����u','����','����','������u','�[��','�[�����u','���','�����u','�۫H','���|','�K�u','�K�u���u','�@��')




