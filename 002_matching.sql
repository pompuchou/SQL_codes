/* �N�O�n�Ntbl_opd �P����ɰt��

select	*
delete
from	[AL].[dbo].[tbl_opd]
where	SDATE>'20190228' and [Pijia] is NULL
*/
select	*
from	[AL].[dbo].[tbl_opd]
where [Pijia] is NULL and SDATE>'20170228'

select	*
from	[AL].[dbo].[tbl_opd]
where [Pijia] is NOT NULL

select	*
from	j
where	len(���ڻ���) <> 0

select	*
from	[al].[dbo].[f]

select	A.*, B.*
from	[AL].[dbo].[tbl_opd] as A
		left outer join
		[al].[dbo].[f] as B
		on A.[SDATE]=B.[�ݶE���] and A.[VIST]=B.�ȧO and A.RMNO=B.�E�O and A.uid=B.�����Ҹ�

update	[AL].[dbo].[tbl_opd]
set		[Pijia]=B.���ڸ�
from	[AL].[dbo].[tbl_opd] as A
		left outer join
		[al].[dbo].[O] as B
		on A.[SDATE]=B.[�ݶE���] and A.[VIST]=B.�ȧO and A.RMNO=B.�E�O and A.uid=B.�����Ҹ� and A.POSINAME=B.����
where	B.���ڸ� is not null and Pijia is null
--����26855��
--a 6165, 6164 �E��
--b 3647, 3645 2 �t�R
--c 3832, 3830 2 �Ҵ�
--d 1457, 1457 �Ѯ�
--e 1470, 1468 2 ���
--f 1487��, 1486, 1 ����
--g 1700, 1695, 5 ����
--h 631, 631 �[��
--i 1081, 1079 2 ���
--j 642,642 �۫H
--k 385, 378 ���|
--l 348,348 �K�u
--m 475, 475 �@��
--n 228, 226 ���c���u
--judi 77, 77 �q�k
--selfpay 2413, 2405 8 �۶O
--family 114, 114 �a�H
--�ҥH�O�]���T�����٨S���פJ�����Y

select	*
from	[AL].[dbo].[tbl_opd] as A
		left outer join
		[al].[dbo].[g] as B
		on A.[SDATE]=B.[�ݶE���] and A.[VIST]=B.�ȧO and A.RMNO=B.�E�O and A.uid=B.�����Ҹ�
where	B.���ڸ� is not null
order by B.���ڸ�

select	*
from f
where ���ڸ� not in (select Pijia from al.dbo.tbl_opd)

select	*
from	al.dbo.tbl_opd
where	Pijia='0300153'

select	*
from	al.dbo.tbl_opd
where	uid='H102297367'

select	*
from A_judi
where ���ڸ�='0300153'

select	*
from f
where ���ڸ� in (select Pijia from al.dbo.tbl_opd)
order by	���ڸ�

select	*
from	al.dbo.tbl_opd
where	Pijia in (select ���ڸ� from al.dbo.g)

select	*
from	al.dbo.tbl_opd
where	Pijia not in (select ���ڸ� from al.dbo.A_judi)




select	*
from	tbl_opd
where	sdate='20171205'


--�ϦVPijia�ɤ]�nmatch
select	*
from	tbl_pijia
where caseno is null


update	[AL].[dbo].[tbl_pijia]
set		[CASENO]=B.CASENO
from	[AL].[dbo].[tbl_pijia] as A
		left outer join
		[al].[dbo].[tbl_opd] as B
		on A.[SDATE]=B.[SDATE] and A.[VIST]=B.[VIST] and A.RMNO=B.[RMNO] and A.uid=B.[uid] and A.POSINAME=B.POSINAME
where	B.CASENO is not null and A.CASENO is null

select	*
from	tbl_pijia
where remark='���'
order by CASENO
order by SDATE, uid

select	*
from	tbl_pijia
where	CASENO is null

--�O�_�b�M�פ��H�Ī���O��@�����O
--�w�]�b�M�פ�
-- ('�t�R','�t�R���u','�Ҵ�','�Ҵ����u','�Ѯ�','���','�����u','����','����','������u','�[��','�[�����u','���','�����u','�۫H','���|','�K�u','�K�u���u','�@��')
--�w�]���b�M�פ�
--�۶O�N�����b�d��
--('�a�H')


select	*
from	al.dbo.tbl_opd
where	CASENO in (select CASENO from tbl_pijia where remark='����')
order by CASENO

select	*
from	al.dbo.tbl_opd
where	SDATE in ('20190227', '20190130')

--delete
from al.dbo.tbl_pijia
where CASENO='AC180529101074' and rid='0500001'

/*
update al.dbo.tbl_pijia
set	rid='0'+A.rid
from al.dbo.tbl_pijia as A
where len(A.rid)=6
*/
select	*
from al.dbo.tbl_pijia
where len(rid)=8
