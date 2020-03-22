select	C.cname
		, A.*
		, B.*
from	tbl_opd as A
	left outer join
		tbl_opd_order as B
	on A.CASENO=B.CASENO
	left outer join
		tbl_patients as C
	on A.uid=C.uid
where	A.SDATE='2019-12-05' and VIST='上午' and RMNO=1 and rid in ('00238C', '00109C', '00184C','00158C')

-- 00184C 精神慢箋, 00158C 家醫慢箋, 21人
select	C.cname
		, A.SDATE
		, D.*
from	tbl_opd as A
	left outer join
		tbl_opd_order as B
	on A.CASENO=B.CASENO
	left outer join
		tbl_patients as C
	on A.uid=C.uid
	left outer join
		chizhi2020 as D
	on C.cname=D.cname
where	A.SDATE='2019-12-05' and VIST='上午' and RMNO=1 and rid in ('00158C', '00184C') and (D.stay is NULL and backdate>'2020-1-29')
/*
古文惠	2019-12-05	古文惠	NULL	2019-01-24 00:00:00.000	2019-01-30 00:00:00.000
邱子豪	2019-12-05	邱子豪	NULL	2019-01-24 00:00:00.000	2020-01-30 00:00:00.000
陳濃慶	2019-12-05	陳濃慶	NULL	2020-01-23 00:00:00.000	2020-02-04 00:00:00.000
楊毅	2019-12-05	楊毅	NULL	2020-01-18 00:00:00.000	2020-02-29 00:00:00.000
蔡明興	2019-12-05	蔡明興	NULL	2020-01-23 00:00:00.000	2020-02-04 00:00:00.000
蔡培森	2019-12-05	蔡培森	NULL	2020-01-22 00:00:00.000	2020-02-05 00:00:00.000
*/

-- 00109C 家醫一月, 00238C 精神一月, 31人
select	C.cname
		, A.SDATE
		, D.*
from	tbl_opd as A
	left outer join
		tbl_opd_order as B
	on A.CASENO=B.CASENO
	left outer join
		tbl_patients as C
	on A.uid=C.uid
	left outer join
		chizhi2020 as D
	on C.cname=D.cname
where	A.SDATE='2020-01-02' and VIST='上午' and RMNO=1 and rid in ('00109C', '00238C') and (D.stay is NULL and backdate>'2020-1-29')

/*
陳威良	2020-01-02	陳威良	NULL	2020-01-23 00:00:00.000	2020-02-29 00:00:00.000
萬清峰	2020-01-02	萬清峰	NULL	2020-01-22 00:00:00.000	2020-02-02 00:00:00.000
廖嘉隆	2020-01-02	廖嘉隆	NULL	2020-01-22 00:00:00.000	2020-02-04 00:00:00.000
趙盈琪	2020-01-02	趙盈琪	NULL	2020-01-19 00:00:00.000	2020-02-01 00:00:00.000
顧執美	2020-01-02	顧執美	NULL	2020-01-11 00:00:00.000	2020-02-04 00:00:00.000
傅正中	2020-01-02	傅正中	NULL	2019-01-22 00:00:00.000	2019-02-04 00:00:00.000
張兆財	2020-01-02	張兆財	NULL	2019-01-28 00:00:00.000	2019-01-30 00:00:00.000
*/