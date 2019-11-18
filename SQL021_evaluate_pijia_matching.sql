--���լO�_�ߤ@
--�u���ݭn�[�JHEATH_CARD, ���H�P��P�E�P���O, ���ⵧ�b, �@�밷�O�P�w���w
declare @t table (CASENO varchar(14), YM char(5), bid char(7), uid varchar(10))

insert into @t
select	A.CASENO, B.YM, B.bid, B.uid
from	[AL].[dbo].[tbl_opd] as A
		left outer join
		[al].[dbo].[tbl_pijia] as B
		on A.[SDATE]=B.[SDATE] and A.[VIST]=B.[VIST] and A.RMNO=B.[RMNO] and A.uid=B.uid and A.POSINAME=B.POSINAME and A.HEATH_CARD=B.HEATH_CARD 
where	B.bid is not null and B.STATUS not in ('�@�o','�h�R') and len(B.bremark)=0

select	CASENO, count(bid) as N
from @t
group by CASENO
having count(bid)>1

select	*
from @t
where	CASENO='AC171006302001'

select	*
from	al.dbo.tbl_pijia
where	CASENO='AC171006302072'



/*
select	*
from @t
where	CASENO='AC170119101088'

select	CASENO, count(bid) as N
from @t
group by CASENO
having count(bid)>1

AC170412302001	2
AC170609101017	2
AC171006302001	2
AC171006302067	2
AC171006302069	2
AC171006302072	2
AC171007102007	2
AC171007102016	2
AC171014102011	2
AC171014102012	2
AC171019302003	2
AC171019302008	2
AC171023102001	2
AC171023102004	2
AC171023102005	2
AC171023302001	2
AC171023302013	2
AC171028102002	2
AC171028102004	2
AC171028102006	2
AC171028102012	2
AC171028102016	2
AC171028102017	2
AC171028102022	2
AC171028102024	2
AC171030302001	2
AC171030302002	2
AC171030502003	2
AC171030502004	2
AC171031502007	2
AC171031502008	2
AC171103302013	2
AC171103302018	2
AC171103502007	2
AC171103502009	2
AC171110302004	2
AC171110302005	2
AC180529101074	2
AC180621502004	2
AC181026302003	2
AC181026302006	2
AC181101302012	2
AC181101302013	2
AC181110102005	2
AC181110102006	2
AC181110102020	2
AC181110102021	2
AC181124102002	2
AC181124102019	2
AC181130302015	2
AC181130302018	2
AC181201102006	2
AC181201102007	2
AC181203302005	2
AC181203302006	2
AC181211302007	2
AC181211302009	2

select	CASENO, count(bid) as N
from @t
group by CASENO
having count(bid)>1

���M���o��h���ƪ���
AC170412302001	3
AC170609101017	2
AC171006302001	2
AC171006302067	2
AC171006302069	2
AC171006302072	2
AC171007102007	2
AC171007102016	2
AC171014102011	2
AC171014102012	2
AC171019302003	2
AC171019302008	2
AC171023102001	2
AC171023102004	3
AC171023102005	2
AC171023302001	2
AC171023302013	2
AC171028102002	2
AC171028102004	2
AC171028102006	2
AC171028102012	2
AC171028102016	2
AC171028102017	2
AC171028102022	2
AC171028102024	2
AC171030302001	2
AC171030302002	2
AC171030502003	2
AC171030502004	2
AC171031502007	2
AC171031502008	2
AC171103302013	2
AC171103302018	2
AC171103502007	2
AC171103502009	2
AC171110302004	2
AC171110302005	2
AC180529101074	2
AC180621502004	2
AC181026302003	2
AC181026302006	2
AC181101302012	2
AC181101302013	2
AC181110102005	2
AC181110102006	2
AC181110102020	2
AC181110102021	2
AC181124102002	2
AC181124102019	2
AC181130302015	2
AC181130302018	2
AC181201102006	2
AC181201102007	2
AC181203302005	2
AC181203302006	2
AC181211302007	2
AC181211302009	2
*/
select	*
from	al.dbo.tbl_opd
where	caseno='AC170119101088'

select	*
from	al.dbo.tbl_pijia
where	YM='10601' and bid='0100001' and uid='F222643856'

select	*
from	al.dbo.tbl_pijia
where	YM='10601' and bid='0100588'


select	right(rid,5) as num, count(rid) as N
from	bl.dbo.tbl_pijia
group by right(rid,5)
order by right(rid,5)

select	right(bid,5) as num, count(bid) as N
from	al.dbo.tbl_pijia
where	STATUS not in ('�@�o','�h�R') and len(bremark)=0
group by right(bid,5)
order by right(bid,5)

select	*
from al.dbo.tbl_pijia
where uid in
(select	uid
from	al.dbo.tbl_pijia
where	right(bid,5)='00001')
order by uid, bid

select	*
from al.dbo.tbl_pijia
order by SDATE,bid

select	*
from	al.dbo.tbl_pijia
where	YM='10606' and bid='0600435'

select	*
from	al.dbo.tbl_pijia
where	YM='10703' and bid='0301017'

--20190612 ����delete���F
--33473 rows

--�ˬd�@�o�Φ�bremark�����S��CASENO?
select	*, CASENO
from	al.dbo.tbl_pijia
where	CASENO is not null and (len(bremark)<>0 or STATUS in ('�@�o', '��R'))

--�ˬd�S���@�o�B�S��bremark��,�O�_�@�w��CASENO
select	*, CASENO
from	al.dbo.tbl_pijia
where	CASENO is null and (len(bremark)=0 and STATUS not in ('�@�o', '��R'))

--�ˬdtbl_pijia����caseNO�O�_�ߤ@
select caseno, count(bid) as n
from al.dbo.tbl_pijia
group by caseno
having count(bid)>1

--�q�L����

select	*
from	al.dbo.tbl_pijia 
where	right(bid,5)='00001' and len(bremark)=0 and STATUS not in ('�@�o', '��R')
order by YM, SDATE

select	*
from	al.dbo.tbl_pijia
where uid='N123064406'


