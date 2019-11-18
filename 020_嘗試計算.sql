/*
select sum(d27)
from	cl.dbo.xml_ddata
where	t3 between '10607' and '10612'


select count(*)
from	CL.dbo.xml_ddata
where	t3 between '10601' and '10606' and d35 in ('00158C','00184C')

select distinct d35
from	[CL].[dbo].[xml_ddata]

--第一張處方箋數目
select	distinct t3, d1, d2
from	CL.dbo.xml_pdata
where	t3 between '10801' and '10806'

--第二張處方箋數目
select	distinct t3, d1, d2
from	CL.dbo.xml_pdata
where	t3 between '10707' and '10712' and p17='1'

--第一張處方箋給藥人日
declare @t table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata
where	t3 between '10601' and '10606'
group by t3,d1,d2

select	sum(total_days) as total_days
from @t

--第二張處方箋給藥人日
declare @t table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata
where	t3 between '10601' and '10606' and p17='1'
group by t3,d1,d2

select	sum(total_days) as total_days
from @t

--第一張處方箋藥費
select	sum(p12)
from	CL.dbo.xml_pdata
where	t3 between '10607' and '10612'

--第二張處方箋藥費
select	sum(p12)
from	CL.dbo.xml_pdata
where	t3 between '10601' and '10606' and p17='1'

select	sum(d39)
from	CL.dbo.xml_ddata
where	t3 between '10707' and '10712'
*/
declare	@t table (t3 char(5), d1 char(2), d2 int, i int, total_days int, amt float)
declare	@t1 table (t3 char(5), d1 char(2), d2 int, i int, total_days int, amt float, g int)

insert into @t
select	A.t3
	, A.d1
	, A.d2
	, 1
	, (select max(B.p1) from CL.dbo.xml_pdata3 as B where B.t3=A.t3 and B.d1=A.d1 and B.d2=A.d2) 
	, sum(A.p12) as amt
from	CL.dbo.xml_pdata3 as A
group by A.t3, A.d1, A.d2

--select	sum(p12)
--from	CL.dbo.xml_pdata
--15700843
--select	count(p12)
--from	CL.dbo.xml_pdata
--15700843

insert into @t
select	A.t3
	, A.d1
	, A.d2
	, 2
	, (select max(B.p1) from CL.dbo.xml_pdata3 as B where B.t3=A.t3 and B.d1=A.d1 and B.d2=A.d2) 
	, sum(A.p12) as amt
from	CL.dbo.xml_pdata3 as A
where	A.p17='1'
group by A.t3, A.d1, A.d2

insert into @t1
select	*, case when amt<=500 then 1 when amt between 501 and 1000 then 2 when amt between 1001 and 1500 then 3 when amt between 1501 and 2000 then 4 when amt between 2001 and 2500 then 5 when amt between 2501 and 3000 then 6 when amt>3000 then 7 end
from	@t

--第一張處方箋給藥人日
declare @u table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @u
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata3
group by t3,d1,d2

--第二張處方箋給藥人日
declare @v table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @v
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata3
group by t3,d1,d2

--select	g
--		, count(t3) as N
----		, sum(total_days) as total_days
--		, avg(amt) as average
----		, convert(float,sum(total_days))/547319 as Ntotal_days
--		, convert(float,count(t3))/23616 as Npercen
--		, sum(amt)/22779937 as AMTpercen
--from	@t1
--group by g

--找哪些人用最多錢

select	distinct uid
from	al.dbo.tbl_opd as A
right outer join
(select	t3, d1, d2
from	@t
where	amt>10000) as B
on A.t3=B.t3 and A.d1=B.d1 and A.d2=B.d2

--找哪些藥物最貴

--藥物原本就這樣開的,不是我開始的,我接的時候就這樣
--個案樣態描述
--常見的主訴唸一遍,特別的主訴唸一遍
--印象中五月送三個去住院