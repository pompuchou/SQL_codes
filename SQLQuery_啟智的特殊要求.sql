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
where	A.SDATE='2019-12-05' and VIST='�W��' and RMNO=1 and rid in ('00238C', '00109C', '00184C','00158C')

-- 00184C �믫�C��, 00158C �a��C��, 21�H
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
where	A.SDATE='2019-12-05' and VIST='�W��' and RMNO=1 and rid in ('00158C', '00184C') and (D.stay is NULL and backdate>'2020-1-29')
/*
�j��f	2019-12-05	�j��f	NULL	2019-01-24 00:00:00.000	2019-01-30 00:00:00.000
���l��	2019-12-05	���l��	NULL	2019-01-24 00:00:00.000	2020-01-30 00:00:00.000
���@�y	2019-12-05	���@�y	NULL	2020-01-23 00:00:00.000	2020-02-04 00:00:00.000
����	2019-12-05	����	NULL	2020-01-18 00:00:00.000	2020-02-29 00:00:00.000
������	2019-12-05	������	NULL	2020-01-23 00:00:00.000	2020-02-04 00:00:00.000
������	2019-12-05	������	NULL	2020-01-22 00:00:00.000	2020-02-05 00:00:00.000
*/

-- 00109C �a��@��, 00238C �믫�@��, 31�H
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
where	A.SDATE='2020-01-02' and VIST='�W��' and RMNO=1 and rid in ('00109C', '00238C') and (D.stay is NULL and backdate>'2020-1-29')

/*
���¨}	2020-01-02	���¨}	NULL	2020-01-23 00:00:00.000	2020-02-29 00:00:00.000
�U�M�p	2020-01-02	�U�M�p	NULL	2020-01-22 00:00:00.000	2020-02-02 00:00:00.000
���Ŷ�	2020-01-02	���Ŷ�	NULL	2020-01-22 00:00:00.000	2020-02-04 00:00:00.000
���յX	2020-01-02	���յX	NULL	2020-01-19 00:00:00.000	2020-02-01 00:00:00.000
�U����	2020-01-02	�U����	NULL	2020-01-11 00:00:00.000	2020-02-04 00:00:00.000
�ť���	2020-01-02	�ť���	NULL	2019-01-22 00:00:00.000	2019-02-04 00:00:00.000
�i���]	2020-01-02	�i���]	NULL	2019-01-28 00:00:00.000	2019-01-30 00:00:00.000
*/