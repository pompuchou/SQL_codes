﻿--檢查是否有重複,意思是同人同日,是否有重複檢察的情形

/*
select	uid, l05, iid, count(lid) as N
from	al.dbo.tbl_lab_record
group by uid, l05, iid
having count(lid) >1
order by	l05
*/
/*
uid	l05	iid	N
H123288662	2018-12-29	030	2	-DONE
H122181566	2019-03-09	030	2	-done
H123533804	2019-03-09	030	2	-done
H124440951	2019-03-09	030	2	-done
H120674602	2019-03-15	030	2	-done
H222106172	2019-03-23	030	2	-done
F123826240	2019-04-13	030	2	-done
F125023676	2019-04-13	030	2	-done

SELECT	*
FROM	AL.DBO.TBL_LAB_RECORD
WHERE UID='F125023676' and l05>'20190131'
ORDER BY L05

SELECT	*
FROM	AL.DBO.tbl_opd_order
WHERE UID='F125023676' AND CLASS='檢驗' and SDATE>'20190131'
ORDER BY SDATE

update al.dbo.tbl_lab_record
set	CASENO='AC190411302017', OD_idx=1
where lid='01080413000118'

select	*
from	al.dbo.tbl_lab_record
where	uid='H123288662' and l05='2018-12-29'

select	*
from	al.dbo.tbl_lab_record
where	uid='H122181566' and l05='2019-03-09'

select	*
from	al.dbo.tbl_lab_record
where	uid='H123533804' and l05='2019-03-09'

select	*
from	al.dbo.tbl_lab_record
where	uid='H124440951' and l05='2019-03-09'

select	*
from	al.dbo.tbl_lab_record
where	uid='H120674602' and l05='2019-03-15'

select	*
from	al.dbo.tbl_lab_record
where	uid='H222106172' and l05='2019-03-23'

select	*
from	al.dbo.tbl_lab_record
where	uid='F123826240' and l05='2019-04-13'

select	*
from	al.dbo.tbl_lab_record
where	uid='F125023676' and l05='2019-04-13'
*/
/*
--排除重複的名單
--特色都是尿液藥物檢驗
--每單都擔一結果
where lid in ('01071229000075','01071229000100','01080309000067','01080309000071','01080309000064','01080309000070','01080309000068','01080309000069','01080315000143','01080315000149','01080323000088','01080323000091','01080413000115','01080413000116','01080413000114','01080413000118')
*/
/*
--沒有排除重複時的錯誤情形
uid	lid	l05	iid	l07	l09	CASENO	OD_idx
F123826240	01080413000115	2019-04-13	030	(-)		AC190411502013	1
F123826240	01080413000116	2019-04-13	030	(-)		AC190411502013	1
uid	lid	l05	iid	l07	l09	CASENO	OD_idx
F125023676	01080413000114	2019-04-13	030	(-)		AC190411302017	1
F125023676	01080413000118	2019-04-13	030	(-)		AC190411302017	1
--有沒改?
*/
/*
--接下來是檢察醫令的部分
--檢查是否有重複,意思是同人同日,是否有重複檢察的情形
select	uid, SDATE, rid, count(CASENO) as N
from	al.dbo.tbl_opd_order
where	CLASS='檢驗'
group by uid, SDATE, rid
having count(CASENO)>1
order by	SDATE
*/
/*
uid	SDATE	rid	N
K120469603	2019-02-18	L-amp	3	-done
H122181566	2019-03-04	L-amp	3	-done
H122516238	2019-03-04	L-amp	3	-done
H123533804	2019-03-04	L-amp	3	-done
H124440951	2019-03-04	L-amp	3	-done
V121582837	2019-03-04	L-can	3	-done
H223761097	2019-03-11	L-amp	3	-done
*/
/*
SELECT	*
FROM	AL.DBO.TBL_LAB_RECORD
WHERE UID='H223761097' and l05>'20190131'
ORDER BY L05

SELECT	*
FROM	AL.DBO.tbl_opd_order
WHERE UID='H223761097' AND CLASS='檢驗' and SDATE>'20190131'
ORDER BY SDATE
*/
/*
update al.dbo.tbl_lab_record
set	CASENO='AC190311102003', OD_idx=1
where lid='01080311000074'


select	*
from	al.dbo.tbl_opd_order
where uid='K120469603' and SDATE='2019-02-18' and rid='L-amp'

select	*
from	al.dbo.tbl_opd_order
where uid='H122181566' and SDATE='2019-03-04' and rid='L-amp'

select	*
from	al.dbo.tbl_opd_order
where uid='H122516238' and SDATE='2019-03-04' and rid='L-amp'

select	*
from	al.dbo.tbl_opd_order
where uid='H123533804' and SDATE='2019-03-04' and rid='L-amp'

select	*
from	al.dbo.tbl_opd_order
where uid='H124440951' and SDATE='2019-03-04' and rid='L-amp'

select	*
from	al.dbo.tbl_opd_order
where uid='V121582837' and SDATE='2019-03-04' and rid='L-can'

select	*
from	al.dbo.tbl_opd_order
where uid='H223761097' and SDATE='2019-03-11' and rid='L-amp'
*/
/*
where CASENO not in ('AC190218102007','AC190304502018','AC190304102002','AC190304302010','AC190304302004','AC190304502013','AC190311102003')
*/
/*
--X3問題 轉變成同天三筆
select	CASENO, OD_idx, uid, SDATE, rid, BILL_QTY
from	al.dbo.tbl_opd_order
where	CLASS='檢驗' and BILL_QTY>1
/*
AC181213302005	A127379425	2018-12-13	L-amp	3	-done
AC181214302006	K122024228	2018-12-14	L-amp	3	-done
AC181220502007	H123288662	2018-12-20	L-amp	3	-done
AC181229102012	H123690153	2018-12-29	L-amp	3	-done
*/
select	*
from	al.dbo.tbl_lab_record
where	uid='H123288662'

SELECT	*
from al.dbo.tbl_lab_record 
where	CASENO='AC181220502007'

update al.dbo.tbl_lab_record
set	OD_idx=6
where	lid='01080107000119'

select *
from al.dbo.tbl_opd_order
where	CASENO='AC181229102012'

insert into al.dbo.tbl_opd_order
select	'AC181229102012'
		,'H123690153'
		,'20181229'
		,6
		,'L-amp'
		,''
		,''
		,1.0
		,1
		,1
		,'自費'
		,250.0
		,250.0
		,'檢驗'
		,''

update  al.dbo.tbl_opd_order
set DAYS=1, BILL_QTY=1, AMT=250.0
where	CASENO='AC181229102012' and OD_idx=3
*/
--期初亂項
/*
--有order沒結果
select	A.CASENO
		,A.uid
		,A.SDATE
		,A.OD_idx
		,A.rid
		,B.*
from	al.dbo.tbl_opd_order as A
		left outer join
		al.dbo.tbl_lab_record as B
		on A.CASENO=B.CASENO and A.OD_idx=B.OD_idx
where	A.CLASS='檢驗' and A.rid in ('L-amp', 'L-can','L-mor') and B.iid is null

SELECT	*
FROM	AL.DBO.TBL_LAB_RECORD
WHERE UID='F124326472'
ORDER BY L05

SELECT	*
FROM	AL.DBO.tbl_opd_order
WHERE UID='F124326472' AND CLASS='檢驗'
ORDER BY SDATE
*/
--有結果沒order
/*
select	uid
		,lid
		,l05
		,iid
		,l07
		,l09
		,CASENO
		,OD_idx
from	al.dbo.tbl_lab_record
where	CASENO is null and iid in ('030','031','043','044')
order by	l05
*/
/*
H122516238	01070309000291	2018-03-09	030	(-)		NULL	NULL
K122024228	01070314000006	2018-03-14	030	(-)		NULL	NULL
N223637161	01070314000008	2018-03-14	043	(-)		NULL	NULL
N123202193	01070420000118	2018-04-20	031	(+)		NULL	NULL
H120674602	01070523000007	2018-05-23	030	(-)		NULL	NULL
H123533804	01070526000060	2018-05-26	030	(+)	＊	NULL	NULL
*/
/*
P122218170	01060711000121	2017-07-11	030	(-)		NULL	NULL	-done 舌下錠收案, 廖契發	-x
P122218170	01060711000121	2017-07-11	031	(-)		NULL	NULL	-done 舌下錠收案, 廖契發	-x
F224650742	01060711000122	2017-07-11	030	(+)		NULL	NULL	-done 舌下錠收案, 劉玉惠	-x
F224650742	01060711000122	2017-07-11	031	(+)		NULL	NULL	-done 舌下錠收案, 劉玉惠	-x
A123993198	01060714000093	2017-07-14	030	(-)		NULL	NULL	-done 舌下錠收案, 吳坤燦	-x
A123993198	01060714000093	2017-07-14	031	(-)		NULL	NULL	-done 舌下錠收案, 吳坤燦	-x
J221417328	01060804000086	2017-08-04	030	(+)		NULL	NULL	-done 舌下錠收案, 黃湘芸	-x
J221417328	01060804000086	2017-08-04	031	(-)		NULL	NULL	-done 舌下錠收案, 黃湘芸	-x
P122218170	01061016000017	2017-10-16	031	(-)		NULL	NULL	-done	-x
A123993198	01061017000123	2017-10-17	031	(-)		NULL	NULL	-done	-x
F126038046	01061017000124	2017-10-17	030	(+)		NULL	NULL	-done 舌下錠收案, 沈詠峰	-x
F126038046	01061017000124	2017-10-17	031	(-)		NULL	NULL	-done 舌下錠收案, 沈詠峰	-x
J221417328	01061113000072	2017-11-13	031	(-)		NULL	NULL	-done	-x
H121142234	01061205000010	2017-12-05	030	(+)		NULL	NULL	-done 舌下錠收案, 黃正奇	-x
H121142234	01061205000010	2017-12-05	031	(+)		NULL	NULL	-done 舌下錠收案, 黃正奇	-x
H122516238	01070104000211	2018-01-04	030	(-)		NULL	NULL	-done	-x
P122721734	01070109000028	2018-01-09	030	(-)		NULL	NULL	-done	-x
H127226579	01070111000102	2018-01-11	030	(+)		NULL	NULL	-done	-x
P122218170	01070113000019	2018-01-13	031	(-)		NULL	NULL	-done	-x
A123993198	01070116000005	2018-01-16	031	(-)		NULL	NULL	-done	-x
A127379425	01070118000157	2018-01-18	030	(-)		NULL	NULL	-done	-x
V121582837	01070118000158	2018-01-18	044	(+)		NULL	NULL	-done	-x
H223761097	01070118000159	2018-01-18	030	(-)		NULL	NULL	-done	-x
F123388852	01070119000111	2018-01-19	030	(+)		NULL	NULL	-done	-x
L223208686	01070123000132	2018-01-23	030	(-)		NULL	NULL	-done	-x
B121741080	01070123000133	2018-01-23	030	(-)		NULL	NULL	-done	-x
H121196563	01070124000163	2018-01-24	030	(-)		NULL	NULL	-done	-x
H124344794	01070125000080	2018-01-26	044	(+)		NULL	NULL	-done	-x
H123288662	01070129000022	2018-01-29	030	(-)		NULL	NULL	-done	-x
K122024228	01070129000023	2018-01-29	030	(-)		NULL	NULL	-done	-x
A127379425	01070203000011	2018-02-03	030	(-)		NULL	NULL	-done	-x
K120469603	01070210000078	2018-02-10	030	(-)		NULL	NULL	-done	-x
H121196563	01070210000079	2018-02-10	030	(-)		NULL	NULL	-done	-x
C120007179	01070210000080	2018-02-10	030	(-)		NULL	NULL	-done	-x
H122516238	01070210000081	2018-02-10	030	(-)		NULL	NULL	-done	-x
H124751860	01070210000082	2018-02-10	030	(+)	＊	NULL	NULL	-done	-x
K122024228	01070214000006	2018-02-14	030	(-)		NULL	NULL	-done	-x
H123690153	01070214000007	2018-02-14	030	(-)		NULL	NULL	-done	-x
H122539491	01070214000008	2018-02-14	030	(+)	＊	NULL	NULL	-done	-x
J121594864	01070214000009	2018-02-14	030	(-)		NULL	NULL	-done	-x
H223761097	01070224000058	2018-02-24	030	(-)		NULL	NULL	-done	-x
H224903731	01070224000059	2018-02-24	030	(-)		NULL	NULL	-done	-x
H122179619	01070224000060	2018-02-24	030	(+)	＊	NULL	NULL	-done	-x
H127226579	01070224000061	2018-02-24	030	(-)		NULL	NULL	-done	-x
H123388014	01070224000062	2018-02-24	030	(-)		NULL	NULL	-done	-x
U121908456	01070224000063	2018-02-24	030	(+)	＊	NULL	NULL	-done	-x
H123288662	01070226000014	2018-02-26	030	(-)		NULL	NULL	-done	-x
L223208686	01070226000015	2018-02-26	030	(-)		NULL	NULL	-done	-x
P122721734	01070303000064	2018-03-03	030	(-)		NULL	NULL	-done	-x
A127379425	01070303000065	2018-03-03	030	(-)		NULL	NULL	-done	-x
H124440951	01070303000066	2018-03-03	030	(+)	＊	NULL	NULL	-done	-x
V121582837	01070303000067	2018-03-03	044	(-)		NULL	NULL	-done	-x
F123388852	01070303000068	2018-03-03	030	(-)		NULL	NULL	-done	-x
H124344794	01070303000069	2018-03-03	044	(+)		NULL	NULL	-done	-x
B121741080	01070303000070	2018-03-03	030	(-)		NULL	NULL	-done	-x
H123193953	01070303000071	2018-03-03	030	(+)	＊	NULL	NULL	-done	-x
H123193953	01070303000071	2018-03-03	031	(-)		NULL	NULL	-done	-x
H123690153	01070303000072	2018-03-03	030	(-)		NULL	NULL	-done	-x
H122516238	01070309000291	2018-03-09	030	(-)		NULL	NULL	-2018/3/5 沒輸帳	-done	-x
K120469603	01070310000024	2018-03-10	030	(-)		NULL	NULL	-done	-x
H124183666	01070310000025	2018-03-10	030	(+)	＊	NULL	NULL	-done	-x
H120630860	01070310000026	2018-03-10	030	(+)	＊	NULL	NULL	-done	-x
H120630860	01070310000026	2018-03-10	031	(+)		NULL	NULL	-done	-x
K122024228	01070314000006	2018-03-14	030	(-)		NULL	NULL	-缺2018/3/12看診紀錄, 沒輸帳	-done	-x
G121804685	01070314000007	2018-03-14	030	(-)		NULL	NULL	-done	-x
N223637161	01070314000008	2018-03-14	043	(-)		NULL	NULL	-舌下錠收案,沒輸帳 張文靜	-done	-x
H123533804	01070317000027	2018-03-17	030	(-)		NULL	NULL	-done	-x
J121594864	01070324000026	2018-03-24	030	(-)		NULL	NULL	-done	-x
N123202193	01070420000118	2018-04-20	031	(+)		NULL	NULL	-舌下錠收案,沒輸帳 張杰	-done	-x
H120674602	01070523000007	2018-05-23	030	(-)		NULL	NULL	-?林佳琪看診都沒有被列入2018/5/21	-done	-x
H123533804	01070526000060	2018-05-26	030	(+)	＊	NULL	NULL	-?林佳琪看診都沒有被列入2018/5/24	-done	-x
F124326472	01071017000144	2018-10-17	043	(-)		NULL	NULL	-done	-x

declare	@u char(10)
set	@u='H220368334'

declare	@l nchar(50)
set	@l='01070324000026'

SELECT	*
FROM	AL.DBO.TBL_LAB_RECORD
WHERE uid=@u
ORDER BY L05

SELECT	*
FROM	AL.DBO.tbl_opd_order
WHERE UID=@u
ORDER BY SDATE


insert into al.dbo.tbl_opd_order
select	'AC170815102016'
		,'H220368334'
		,'20170815'
		,14
		,'09020C'
		,''
		,''
		,1.0
		,1
		,1
		,'健保'
		,90.0
		,90.0
		,'檢驗'
		,''
*/

select	*
from	al.dbo.tbl_lab_record 
where uid in ('H122516238','K122024228','N223637161','N123202193','H120674602','H123533804') and CASENO is null
order by uid, l05