/* 就是要將tbl_opd 與批價檔配對

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
where	len(收據說明) <> 0

select	*
from	[al].[dbo].[f]

select	A.*, B.*
from	[AL].[dbo].[tbl_opd] as A
		left outer join
		[al].[dbo].[f] as B
		on A.[SDATE]=B.[看診日期] and A.[VIST]=B.午別 and A.RMNO=B.診別 and A.uid=B.身分證號

update	[AL].[dbo].[tbl_opd]
set		[Pijia]=B.收據號
from	[AL].[dbo].[tbl_opd] as A
		left outer join
		[al].[dbo].[O] as B
		on A.[SDATE]=B.[看診日期] and A.[VIST]=B.午別 and A.RMNO=B.診別 and A.uid=B.身分證號 and A.POSINAME=B.身分
where	B.收據號 is not null and Pijia is null
--全部26855筆
--a 6165, 6164 診所
--b 3647, 3645 2 聖愛
--c 3832, 3830 2 啟智
--d 1457, 1457 由根
--e 1470, 1468 2 方舟
--f 1487筆, 1486, 1 景仁
--g 1700, 1695, 5 香園
--h 631, 631 觀音
--i 1081, 1079 2 桃園
--j 642,642 誠信
--k 385, 378 祥育
--l 348,348 春暉
--m 475, 475 世美
--n 228, 226 機構員工
--judi 77, 77 司法
--selfpay 2413, 2405 8 自費
--family 114, 114 家人
--所以是因為三月資料還沒有匯入的關係

select	*
from	[AL].[dbo].[tbl_opd] as A
		left outer join
		[al].[dbo].[g] as B
		on A.[SDATE]=B.[看診日期] and A.[VIST]=B.午別 and A.RMNO=B.診別 and A.uid=B.身分證號
where	B.收據號 is not null
order by B.收據號

select	*
from f
where 收據號 not in (select Pijia from al.dbo.tbl_opd)

select	*
from	al.dbo.tbl_opd
where	Pijia='0300153'

select	*
from	al.dbo.tbl_opd
where	uid='H102297367'

select	*
from A_judi
where 收據號='0300153'

select	*
from f
where 收據號 in (select Pijia from al.dbo.tbl_opd)
order by	收據號

select	*
from	al.dbo.tbl_opd
where	Pijia in (select 收據號 from al.dbo.g)

select	*
from	al.dbo.tbl_opd
where	Pijia not in (select 收據號 from al.dbo.A_judi)




select	*
from	tbl_opd
where	sdate='20171205'


--反向Pijia檔也要match
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
where remark='桃園'
order by CASENO
order by SDATE, uid

select	*
from	tbl_pijia
where	CASENO is null

--是否在專案內以藥物醫令表作為分別
--預設在專案內
-- ('聖愛','聖愛員工','啟智','啟智員工','由根','方舟','方舟員工','景仁','香園','香園員工','觀音','觀音員工','桃園','桃園員工','誠信','祥育','春暉','春暉員工','世美')
--預設不在專案內
--自費就全不在範圍內
--('家人')


select	*
from	al.dbo.tbl_opd
where	CASENO in (select CASENO from tbl_pijia where remark='香園')
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
