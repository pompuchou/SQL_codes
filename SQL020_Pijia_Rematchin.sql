--20190612 created
--前幾天重新製作了tbl_pijia

/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
--條件SDATE, uid, bid, HEATH_CARD 29144筆
--條件SDATE, uid, bid 29145筆
--差在哪裡?
SELECT A.[bid]
      ,A.[SDATE]
      ,A.[uid]
	  ,A.[HEATH_CARD]
  FROM [AL].[dbo].[tbl_pijia] as A
	left outer join
		[BL].[dbo].[tbl_pijia] as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.bid=B.rid
where A.[STATUS]<>'作廢' and len(A.[bremark])=0
order by A.SDATE, A.bid

SELECT A.[bid]
      ,A.[SDATE]
      ,A.[uid]
	  ,A.[HEATH_CARD]
  FROM [AL].[dbo].[tbl_pijia] as A
	left outer join
		[BL].[dbo].[tbl_pijia] as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.bid=B.rid and A.HEATH_CARD=B.HEATH_CARD
where A.[STATUS]<>'作廢' and len(A.[bremark])=0
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
--先看看有哪些欄位會有空白
/*
/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
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
--用空值,0來取代NULL似乎比較聰明
--接下來找KEY值,已知僅YM, bid是不夠的,有幾種可能
--YM+bid+uid
--YM+bid+uid+sdate
--YM+bid+sdate

--YM+bid+uid 檢查後這個組合是可以的!!!!
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

--YM+bid+uid+sdate, 結果差不多,沒有比較好
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

--YM+bid+sdate, it makes no sense, 醫看就知道不是同一筆
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
