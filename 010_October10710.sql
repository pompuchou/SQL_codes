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
where	A.SDATE between '20181001' and '20181031' and A.G=1 and CLASS='藥品'
group by	B.rid

insert into @t2
select	B.rid, 
		sum(convert(float, BILL_QTY)) as BILL_QTY
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180901' and '20180930' and A.G=1 and CLASS='藥品' and CHRONIC=2
group by	B.rid


insert into @t3
select	B.rid, 
		sum(convert(float, BILL_QTY)) as BILL_QTY
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180801' and '20180831' and A.G=1 and CLASS='藥品' and CHRONIC=3
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

--一致的 352
select	*
from	@u as A
	left outer join
		[10710] as B
	on A.r04=B.r04
where	B.r04 is not null and A.BILL_QTY=B.[ N ]
order by A.r04

--不一致的 47
select	*
from	@u as A
	left outer join
		[10710] as B
	on A.r04=B.r04
where	B.r04 is null or A.BILL_QTY<>B.[ N ]
order by A.r04

/*
AC26976100	DOGMATYL FILM COATED TABLETS 200MG (SULPIRIDE)	30
AC28078100	SULPIN F.C. TABLETS 200MG "S.T." (SULPIRIDE)	736
=>AC28078100	Sulpin FC Tab 200mg舒復寧(信東	752
AC41280100	KINXETIN CAPSULES 20MG "KINGDOM"(FLUOXETINE)	300
AC41338100	JUXAC CAP.20MG	980
=>AC41338100	Juxac Cap 20mg 解鬱(健喬信元)	1280
AB47553100	DEPATEC 500 MG FILM.COATED.TABLETS"PURZER"	140
BC22008100	DEPAKINE CHRONO 500MG FILM COATED TABLETS	3506
=>BC22008100	Depakine Chrono 500mg FC Tab	3240
AC44631100	FELOPINE- S.R TABLETS 5MG	30
=>AC49876100	Winlopine ER Tab 5mg允降(永信)	30	2.57
BC23711100	DOXABEN XL TABLETS 4MG	56
=>AA49920100	Xadosin SRFC Tab 4mg薩多心(中	56
BC18952100	PK-MERZ FILM-COATED TABLETS	60
=>AC39431100	Dopadine FC Tab 100mg多巴定(瑞	60

AC453421G0	CLONOPAM TABLETS 0.5MG "KINGDOM"(CLONAZEPAM)(鋁箔/膠箔)	2034
AC453421G0	克癲平錠0.5毫克	28
=>AC453421G0	Clonopam 0.5mg<管>克癇平[景德]	1978

AC09299100	鋰齊寧膠囊	56
AC09299100	LIGILIN CAPSULES	1294
=>AC09299100	Ligilin Cap 300mg 鋰齊寧(瑞士)	1350

AC49373100	帕登長效錠 4 毫克	56
AC49373100	PEDEN RETARD TABLETS 4 MG	804
=>AC49373100	Peden Retard Tab 4mg帕登(五洲)	860

AC395971G0	瑞丹錠 刪除 56???

BC03078100	RIVOTRIL 2MG TABLET	2307
BC03078100	利福全錠	28
=>BC03078100	Rivotril Tab 2mg Tab<管>利福全	2335
concerta應該不是


*/

select	*
from	[10710]
where	r04 not in (select r04 from @u)

