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
where	A.SDATE between '20180901' and '20180930' and A.G=1 and CLASS='藥品'
group by	B.rid

insert into @t2
select	B.rid, 
		sum(convert(float, BILL_QTY)) as BILL_QTY
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180801' and '20180831' and A.G=1 and CLASS='藥品' and CHRONIC=2
group by	B.rid


insert into @t3
select	B.rid, 
		sum(convert(float, BILL_QTY)) as BILL_QTY
from	al.dbo.tbl_pijia as A
	left outer join
		al.dbo.tbl_opd_order as B
	on A.CASENO=B.CASENO
where	A.SDATE between '20180701' and '20180731' and A.G=1 and CLASS='藥品' and CHRONIC=3
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
/*
--全部
select	*
from	@u as A
	left outer join
		[10709] as B
	on A.r04=B.r04
order by A.r04
*/

select	*
from	[10709]
where	r04 not in (select r04 from @u)


--一致的
select	*
from	@u as A
	left outer join
		[10709] as B
	on A.r04=B.r04
where	B.r04 is not null and A.BILL_QTY=B.[ N ]
order by A.r04

--不一致的 
select	*
from	@u as A
	left outer join
		[10709] as B
	on A.r04=B.r04
where	B.r04 is null or A.BILL_QTY<>B.[ N ]
order by A.r04

/*
AC41280100	KINXETIN CAPSULES 20MG "KINGDOM"(FLUOXETINE)	280			
AC41338100	JUXAC CAP.20MG	842	
=>AC41338100	Juxac Cap 20mg 解鬱(健喬信元)	1122

BC23695421	ALPHAGAN P OPHTHALMIC SOLUTION 0.15%	1 沒開
BC23337421	COSOPT OPHTHALMIC SOLUTION	1 刪一瓶

BC18952100	PK-MERZ FILM-COATED TABLETS	56
=>AC39431100	Dopadine FC Tab 100mg多巴定(瑞	56








*/


