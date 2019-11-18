--outliner
--�S�������檺 15��(20170301~20190228)
select	*
from	[AL].[dbo].[tbl_opd]
where [Pijia] is NULL and SDATE>'20170228'
order by SDATE

--update al.dbo.tbl_opd
set posiname='���O'
where caseno='AC180831502005'


--20170705 �G���� �����
--20170713 ���H�� �����
--20170713 ���S�K�� �����
--solution

--CASENO�����ƪ�188��
select	*
from	al.dbo.tbl_pijia
where CASENO in
(select	CASENO
from	al.dbo.tbl_pijia
group by CASENO
having  count(SDATE)>1)
order by CASENO

update tbl_pijia
set CASENO=NULL
where CASENO in (select	CASENO
from	al.dbo.tbl_pijia
group by CASENO
having  count(SDATE)>1)

update	[AL].[dbo].[tbl_pijia]
set		[CASENO]=B.CASENO
from	[AL].[dbo].[tbl_pijia] as A
		left outer join
		[al].[dbo].[tbl_opd] as B
		on A.[SDATE]=B.[SDATE] and A.[VIST]=B.[VIST] and A.RMNO=B.[RMNO] and A.uid=B.[uid] and A.POSINAME=B.POSINAME
where	B.CASENO is not null and A.CASENO is null

--CASENO�����ƪ�188��
--�ư��ѤF�ϧO��������12��,5�H
select	*
from	al.dbo.tbl_pijia
where CASENO in
(select	CASENO
from	al.dbo.tbl_pijia
group by CASENO
having  count(SDATE)>1)
order by CASENO

--1 �d�Ŵf �R���@��
select	*
--delete
from	al.dbo.tbl_pijia
where rid='0100001' and CASENO='AC170119101088'

--2 �B��� �R���@��
--delete
from	al.dbo.tbl_pijia
where rid='0300741' and CASENO='AC170322101037'

--3 �¬K�� �R���ⵧ
--delete
from	al.dbo.tbl_pijia
where rid='0301017' and CASENO='AC170412302001'
--delete
from	al.dbo.tbl_pijia
where rid='0500614' and CASENO='AC170412302001'

--4 �����o �ק� �M��R���ⵧ
--update	al.dbo.tbl_pijia
set	AMTreceived=910
where rid='1000954' and CASENO='AC171023102004'
--delete
from	al.dbo.tbl_pijia
where rid='1100786' and CASENO='AC171023102004'
--delete
from	al.dbo.tbl_pijia
where rid='1001327' and CASENO='AC171023102004'

--5 �i�N �ק�M��R���@��
--update	al.dbo.tbl_pijia
set	AMTreceived=110
where rid='0600967' and CASENO='AC180621502004'

--delete
from	al.dbo.tbl_pijia
where rid='0700021' and CASENO='AC180621502004'

--20190317 ��ʽվ��S�����ƪ��F

