--20190612 created
--除去沒有用的00001, 最好證明訊息沒有減少, 最好方法是簡單的
select	SDATE, uid, POSINAME, HEATH_CARD, count(bid) as N
from	al.dbo.tbl_pijia
where	STATUS not in ('作廢') and len(bremark)=0
group by	SDATE, uid, POSINAME, HEATH_CARD
having count(bid)>1

--SDATE, uid, POSINAME, HEATH_CARD可以唯一
--407 筆
select	A.CASENO 
		,A.Pijia
		,B.CASENO
		,B.bid
from	al.dbo.tbl_opd as A
		left outer join
		(select * from
		al.dbo.tbl_pijia
		where STATUS not in ('作廢') and len(bremark)=0
		) as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.POSINAME=B.POSINAME and A.HEATH_CARD=B.HEATH_CARD  
where	A.SDATE between '20170201' and '20170228' and B.bid is not null




select	A.*, B.CASENO, CASE WHEN LEFT(A.remark,2) in ('方舟','由根','春暉','香園','啟智','祥育','景仁','聖愛','桃園','誠信', '觀音') THEN 1 END
from	al.dbo.tbl_pijia as A
		left outer join
		al.dbo.tbl_opd as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.POSINAME=B.POSINAME and A.HEATH_CARD=B.HEATH_CARD
where A.CASENO is null and A.STATUS not in ('作廢','退沖') and len(A.bremark)=0

--第一步,將Pijia配上CASENO,這一步驟Pijia必可配上一個CASENO,但可能多個PIJIA對一個CASENO
update	al.dbo.tbl_pijia
set	CASENO=B.CASENO, G=CASE WHEN LEFT(A.remark,2) in ('方舟','由根','春暉','香園','啟智','祥育','景仁','聖愛','桃園','誠信', '觀音') THEN 1 END
from	al.dbo.tbl_pijia as A
		left outer join
		al.dbo.tbl_opd as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.VIST=B.VIST and A.RMNO=B.RMNO and A.POSINAME=B.POSINAME and A.HEATH_CARD=B.HEATH_CARD
where A.CASENO is null and A.STATUS not in ('作廢','退沖') and len(A.bremark)=0

--第二步之一,確認opd的CASENO是1to1配pijia,若是就完成配對,若不是就傳回錯誤訊息,有幾筆錯誤
--真沒想到一人一天來兩次
select	CASENO, bid, SDATE, VIST, RMNO, cname
from	al.dbo.tbl_pijia
where	CASENO in
(select	CASENO
from	al.dbo.tbl_pijia
where	CASENO is not null
group by CASENO
having count(bid)>1)

--第二步之二,將opd配上Pijia
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
where	A.STATUS <>'作廢' and len(A.bremark)=0 and A.SDATE between '20170101' and '20170131'




--第一步手動
--再來看怎麼自動化

/*
20170103	A121366540	健保	0001	3
20170104	A120111336	健保	0003	3
20170105	H120831303	健保	0002	3
20170118	H122263214	健保	0001	3
20170118	H224815601	健保	0003	3
20170118	N203485910	健保	0001	3
20170119	F222643856	健保	0004	2
*/
select	*
from	al.dbo.tbl_pijia
where	sdate='20170103' and uid='A121366540'