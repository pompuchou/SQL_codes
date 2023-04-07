declare	@t1 table (cname nvarchar(10), mf nvarchar(2), bd date, uid nvarchar(10), abb nvarchar(50), tub nvarchar(10), npo nvarchar(10))
declare	@t2 table (cname nvarchar(10), mf nvarchar(2), bd date, uid nvarchar(10), abb nvarchar(300), tub nvarchar(100), npo nvarchar(100))
declare @d date	--日期
declare @v nvarchar(5) --午別
declare @r nvarchar(5) --診別

set	@d='20230308'
set @v='上午'
set @r='3'

insert into @t1
select	C.cname,
		C.mf,
		C.bd,
		C.uid,
		D.abb,
		D.tub,
		D.npo
from	[AL].dbo.tbl_opd as A
	left outer join
		[AL].dbo.tbl_opd_order as B
		on B.CASENO=A.CASENO
	left outer join
		[AL].dbo.tbl_patients as C
		on A.uid=C.uid
	left outer join
		[AL].dbo.p_lab as D
		on B.rid=D.rid
where	A.POSINAME in ('健保','健保欠卡') and A.SDATE=@d and A.VIST=@v and A.RMNO=@r and B.[CLASS]='檢驗'
order by	A.CASENO, B.OD_idx

/*
insert into @t1
select	C.cname,
		C.mf,
		C.bd,
		C.uid,
		(select '; ' + B.rid
		from [AL].dbo.tbl_opd_order as B
		where B.CASENO=A.CASENO and B.[CLASS]='檢驗'
		for xml path('')) rid
from	[AL].dbo.tbl_opd as A
	left outer join
		[AL].dbo.tbl_patients as C
		on A.uid=C.uid
where	A.POSINAME='健保' and A.SDATE=@d and A.VIST=@v and A.RMNO=@r
*/

insert into @t2
select	A.cname,
		A.mf,
		A.bd,
		A.uid,
		(select '; ' + B.abb
		from @t1 as B
		where B.uid=A.uid
		for xml path('')) rid,
		(select '; ' + B.tub
		from @t1 as B
		where B.uid=A.uid
		group by B.tub
		for xml path('')) tub,
		(select '; ' + B.npo
		from @t1 as B
		where B.uid=A.uid
		group by B.npo
		for xml path('')) npo
from	@t1 as A
group by	A.cname, A.mf, A.bd, A.uid

select	cname,
		mf,
		bd,
		uid,
		stuff(abb, 1, 2, '') rid,
		stuff(tub, 1, 2, '') tub,
		isnull(stuff(npo, 1, 2, ''),'') npo
from @t2