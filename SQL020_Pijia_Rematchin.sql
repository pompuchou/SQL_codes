--20190612 created
--�e�X�ѭ��s�s�@�Ftbl_pijia

/****** SSMS �� SelectTopNRows �R�O�����O�X  ******/
--����SDATE, uid, bid, HEATH_CARD 29144��
--����SDATE, uid, bid 29145��
--�t�b����?
SELECT A.[bid]
      ,A.[SDATE]
      ,A.[uid]
	  ,A.[HEATH_CARD]
  FROM [AL].[dbo].[tbl_pijia] as A
	left outer join
		[BL].[dbo].[tbl_pijia] as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.bid=B.rid
where A.[STATUS]<>'�@�o' and len(A.[bremark])=0
order by A.SDATE, A.bid

SELECT A.[bid]
      ,A.[SDATE]
      ,A.[uid]
	  ,A.[HEATH_CARD]
  FROM [AL].[dbo].[tbl_pijia] as A
	left outer join
		[BL].[dbo].[tbl_pijia] as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.bid=B.rid and A.HEATH_CARD=B.HEATH_CARD
where A.[STATUS]<>'�@�o' and len(A.[bremark])=0
order by A.SDATE, A.bid

select	*
from	al.dbo.tbl_pijia
where	ym='10803' and sdate='20190226' and bid='0301217'

select	*
from	bl.dbo.tbl_pijia
where	sdate='20190226' and rid='0301217'

select	*
from	al.dbo.tbl_pijia
where	len(SDATE)=0

select	distinct *
from	bl.dbo.tbl_pijia
where	rid='0300230' and left(sdate,6)='201902'




select	rid, left(SDATE,6) as YM, count(rid) as N
from	bl.dbo.tbl_pijia
group by rid, left(SDATE,6)
having count(rid)>1
order by left(SDATE,6), rid

/*
0400717	201701	A226015960	2
0900220	201808	H224960469	2
0300230	201902	F224800386	3
0300233	201902	S220448095	3
0300235	201902	Q121179933	3
0300237	201902	T201661640	3
0301217	201902	H223955946	2

0100001	201701	15
0400717	201701	2
0300001	201703	2
0400001	201704	8
0700001	201707	3
0800001	201708	2
1100001	201711	2
1200001	201712	3
0200001	201802	2
0300001	201803	2
0500001	201805	2
0600001	201806	2
0900220	201808	2
1100001	201811	2
1200001	201812	2
0100001	201901	2
0200001	201902	2
0300230	201902	3
0300233	201902	3
0300235	201902	3
0300237	201902	3
0301217	201902	2
0400001	201904	3
*/
--���ݬݦ��������|���ť�
/*
/****** SSMS �� SelectTopNRows �R�O�����O�X  ******/
[VDATE]
[DOCTNAME]
[HEATH_CARD]
[Youmian]
[PAYNO]
[bremark]
[remark]
[CASENO]
[G]
*/
--�Ϊŭ�,0�Ө��NNULL���G����o��
--���U�ӧ�KEY��,�w����YM, bid�O������,���X�إi��
--YM+bid+uid
--YM+bid+uid+sdate
--YM+bid+sdate

--YM+bid+uid �ˬd��o�ӲզX�O�i�H��!!!!
select	rid, left(SDATE,6) as YM, uid, count(rid) as N
from	bl.dbo.tbl_pijia
group by rid, left(SDATE,6), uid
having count(rid)>1
order by left(SDATE,6), rid

select	distinct A.[rid]
      ,A.[op]
      ,A.[SDATE]
      ,A.[VIST]
      ,A.[RMNO]
      ,A.[DEPTNAME]
      ,A.[DOCTNAME]
      ,A.[POSINAME]
      ,A.[HEATH_CARD]
      ,A.[Youmian]
      ,A.[PAYNO]
      ,A.[uid]
      ,A.[cname]
      ,A.[MedFee]
      ,A.[RegFee]
      ,A.[Copay]
      ,A.[Deposit]
      ,A.[SelfPay]
      ,A.[PharmW]
      ,A.[Arrears]
      ,A.[Discount]
      ,A.[AMTreceivable]
      ,A.[AMTreceived]
--      ,A.[remark]
      ,A.[CASENO]
--      ,A.[G]
from	bl.dbo.tbl_pijia as A
left outer join
(select	rid, left(SDATE,6) as YM, uid, count(rid) as N
from	bl.dbo.tbl_pijia
group by rid, left(SDATE,6), uid
having count(rid)>1) as B
on A.rid=B.rid and left(A.SDATE,6)=B.YM and A.uid=B.uid
where	B.rid is not null
order by left(A.SDATE,6), A.rid

select	*
from	al.dbo.tbl_pijia
where	bid='0900220' and ym='10709'

--YM+bid+uid+sdate, ���G�t���h,�S������n
select	rid, left(SDATE,6) as YM, uid, count(rid) as N
from	bl.dbo.tbl_pijia
group by rid, left(SDATE,6), uid
having count(rid)>1
order by left(SDATE,6), rid

select	distinct A.[rid]
      ,A.[op]
      ,A.[SDATE]
      ,A.[VIST]
      ,A.[RMNO]
      ,A.[DEPTNAME]
      ,A.[DOCTNAME]
      ,A.[POSINAME]
      ,A.[HEATH_CARD]
      ,A.[Youmian]
      ,A.[PAYNO]
      ,A.[uid]
      ,A.[cname]
      ,A.[MedFee]
      ,A.[RegFee]
      ,A.[Copay]
      ,A.[Deposit]
      ,A.[SelfPay]
      ,A.[PharmW]
      ,A.[Arrears]
      ,A.[Discount]
      ,A.[AMTreceivable]
      ,A.[AMTreceived]
--      ,A.[remark]
      ,A.[CASENO]
--      ,A.[G]
from	bl.dbo.tbl_pijia as A
left outer join
(select	rid, left(SDATE,6) as YM, uid, sdate, count(rid) as N
from	bl.dbo.tbl_pijia
group by rid, left(SDATE,6), uid, sdate
having count(rid)>1) as B
on A.rid=B.rid and left(A.SDATE,6)=B.YM and A.uid=B.uid and A.sdate=B.sdate
where	B.rid is not null
order by left(A.SDATE,6), A.rid

--YM+bid+sdate, it makes no sense, ��ݴN���D���O�P�@��
select	distinct A.[rid]
      ,A.[op]
      ,A.[SDATE]
      ,A.[VIST]
      ,A.[RMNO]
      ,A.[DEPTNAME]
      ,A.[DOCTNAME]
      ,A.[POSINAME]
      ,A.[HEATH_CARD]
      ,A.[Youmian]
      ,A.[PAYNO]
      ,A.[uid]
      ,A.[cname]
      ,A.[MedFee]
      ,A.[RegFee]
      ,A.[Copay]
      ,A.[Deposit]
      ,A.[SelfPay]
      ,A.[PharmW]
      ,A.[Arrears]
      ,A.[Discount]
      ,A.[AMTreceivable]
      ,A.[AMTreceived]
--      ,A.[remark]
      ,A.[CASENO]
--      ,A.[G]
from	bl.dbo.tbl_pijia as A
left outer join
(select	rid, left(SDATE,6) as YM, sdate, count(rid) as N
from	bl.dbo.tbl_pijia
group by rid, left(SDATE,6), sdate
having count(rid)>1) as B
on A.rid=B.rid and left(A.SDATE,6)=B.YM and A.sdate=B.sdate
where	B.rid is not null
order by left(A.SDATE,6), A.rid
