/*分組基本上部影響藥物
select	*
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	G=0 and len(remark)>0 and POSINAME<>'自費' and remark <>'家人'
*/
--constructing
--先算當月
declare	@t1 table (rid nvarchar(50), BILL_QTY float)
declare	@t2 table (rid nvarchar(50), BILL_QTY float)
declare	@t3 table (rid nvarchar(50), BILL_QTY float)
declare	@tt table (rid nvarchar(50), BILL_QTY float)
declare @u table (rid nvarchar(50), r04 nvarchar(50), r06 nvarchar(100), BILL_QTY float, r09 float)

insert into @t1
select	B.rid, 
		sum(convert(float, BILL_QTY)) as BILL_QTY
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20181001' and '20181031' and A.G=1 and CLASS='藥品' and A.remark <> '世美'
group by	B.rid

insert into @t2
select	B.rid, 
		sum(convert(float, BILL_QTY)) as BILL_QTY
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180901' and '20180930' and A.G=1 and CLASS='藥品' and CHRONIC=2 and A.remark <> '世美'
group by	B.rid


insert into @t3
select	B.rid, 
		sum(convert(float, BILL_QTY)) as BILL_QTY
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180801' and '20180831' and A.G=1 and CLASS='藥品' and CHRONIC=3 and A.remark <> '世美'
group by	B.rid

--以t1為主
insert into @tt
select	A.rid, A.BILL_QTY+ISNULL(B.BILL_QTY,0)+ISNULL(C.BILL_QTY,0)
from	@t1 as A
	left outer join
		@t2 as B
	on A.rid=B.rid
	left outer join
		@t3 as C
	on A.rid=C.rid

insert into @tt
select	A.rid, A.BILL_QTY+ISNULL(B.BILL_QTY,0)+ISNULL(C.BILL_QTY,0)
from	@t2 as A
	left outer join
		@t1 as B
	on A.rid=B.rid
	left outer join
		@t3 as C
	on A.rid=C.rid
where	A.rid not in (select rid from @tt)

insert into @tt
select	A.rid, A.BILL_QTY+ISNULL(B.BILL_QTY,0)+ISNULL(C.BILL_QTY,0)
from	@t3 as A
	left outer join
		@t2 as B
	on A.rid=B.rid
	left outer join
		@t1 as C
	on A.rid=C.rid
where	A.rid not in (select rid from @tt)

insert into @u
select	A.rid
		, B.r04
		, B.r06
		, A.BILL_QTY
		, B.r09
from	@tt as A
	left outer join
		al.dbo.p_order as B
	on A.rid=B.rid
order by B.r04

--全部
select	*
from	@u as A
	left outer join
		[10710] as B
	on A.r04=B.r04
order by A.r04

--一致的 360
select	*
from	@u as A
	left outer join
		[10710] as B
	on A.r04=B.r04
where	B.r04 is not null and A.BILL_QTY=B.[ N ]
order by A.r04

--不一致的 36
select	*
from	@u as A
	left outer join
		[10710] as B
	on A.r04=B.r04
where	B.r04 is null or A.BILL_QTY<>B.[ N ]
order by A.r04

/*
--發現
AC26976100	DOGMATYL FILM COATED TABLETS 200MG (SULPIRIDE)	30
AC28078100	SULPIN F.C. TABLETS 200MG "S.T." (SULPIRIDE)	722
=>AC28078100	Sulpin FC Tab 200mg舒復寧(信東	752
AC41280100	KINXETIN CAPSULES 20MG "KINGDOM"(FLUOXETINE)	300
AC41338100	JUXAC CAP.20MG	980
=>AC41338100	Juxac Cap 20mg 解鬱(健喬信元)	1280
AB47553100	DEPATEC 500 MG FILM.COATED.TABLETS"PURZER"	140
BC22008100	DEPAKINE CHRONO 500MG FILM COATED TABLETS	3100
=>BC22008100	Depakine Chrono 500mg FC Tab	3240
AC44631100	FELOPINE- S.R TABLETS 5MG	30
=>AC49876100	Winlopine ER Tab 5mg允降(永信)	30
BC23711100	DOXABEN XL TABLETS 4MG	56
=>AA49920100	Xadosin SRFC Tab 4mg薩多心(中	56
BC18952100	PK-MERZ FILM-COATED TABLETS	60
=>AC39431100	Dopadine FC Tab 100mg多巴定(瑞	60

另外要合併
AC453421G0	CLONOPAM TABLETS 0.5MG "KINGDOM"(CLONAZEPAM)(鋁箔/膠箔)	1950
AC453421G0	克癲平錠0.5毫克	28

AC09299100	LIGILIN CAPSULES	1294
AC09299100	鋰齊寧膠囊	56

AC49373100	PEDEN RETARD TABLETS 4 MG	804
AC49373100	帕登長效錠 4 毫克	56

CONCERTA很可能是診所開的
這樣就都沒有消失的藥物了




*/

select	*
from	[10710]
where	r04 not in (select r04 from @u)

