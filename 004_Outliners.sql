--outliner
--沒分到批價單的 15筆(20170301~20190228)
select	*
from	[AL].[dbo].[tbl_opd]
where [Pijia] is NULL and SDATE>'20170228'
order by SDATE

--update al.dbo.tbl_opd
set posiname='健保'
where caseno='AC180831502005'


--20170705 鄭健中 未批價
--20170713 陳信文 未批價
--20170713 陳范春美 未批價
--solution

--CASENO有重複者188件
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

--CASENO有重複者188件
--排除忘了區別身分的剩12筆,5人
select	*
from	al.dbo.tbl_pijia
where CASENO in
(select	CASENO
from	al.dbo.tbl_pijia
group by CASENO
having  count(SDATE)>1)
order by CASENO

--1 吳嘉惠 刪掉一筆
select	*
--delete
from	al.dbo.tbl_pijia
where rid='0100001' and CASENO='AC170119101088'

--2 劉樹誠 刪掉一筆
--delete
from	al.dbo.tbl_pijia
where rid='0300741' and CASENO='AC170322101037'

--3 謝春蘭 刪除兩筆
--delete
from	al.dbo.tbl_pijia
where rid='0301017' and CASENO='AC170412302001'
--delete
from	al.dbo.tbl_pijia
where rid='0500614' and CASENO='AC170412302001'

--4 廖契發 修改 然後刪除兩筆
--update	al.dbo.tbl_pijia
set	AMTreceived=910
where rid='1000954' and CASENO='AC171023102004'
--delete
from	al.dbo.tbl_pijia
where rid='1100786' and CASENO='AC171023102004'
--delete
from	al.dbo.tbl_pijia
where rid='1001327' and CASENO='AC171023102004'

--5 張杰 修改然後刪除一筆
--update	al.dbo.tbl_pijia
set	AMTreceived=110
where rid='0600967' and CASENO='AC180621502004'

--delete
from	al.dbo.tbl_pijia
where rid='0700021' and CASENO='AC180621502004'

--20190317 手動調整後沒有重複的了

