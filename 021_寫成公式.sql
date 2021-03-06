﻿/*
declare @t table (b char(5), e char(5))
insert into @t
    values('10601','10606')
	,('10607','10612')
	,('10701','10706')
	,('10707','10712')
	,('10801','10805')
--第一張處方箋給藥人日
declare @t1 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t1
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata
group by t3,d1,d2
--第二張處方箋給藥人日
declare @t2 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t2
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata
where	p17='1'
group by t3,d1,d2
select	b+'~'+e as YM
		, (select count(distinct d3) from CL.dbo.xml_ddata where t3 between b and e) as NoP
		, (select count(*) from CL.dbo.xml_ddata where t3 between b and e) as NoC
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata where t3 between b and e) as No1stP
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata where t3 between b and e and p17='1') as No2ndP
		, (select sum(total_days) from @t1 where t3 between b and e) as No1stPD
		, (select sum(total_days) from @t2 where t3 between b and e) as No2ndPD
		, (select sum(p12) from CL.dbo.xml_pdata where t3 between b and e) as Amt1stP
		, (select sum(p12) from CL.dbo.xml_pdata where t3 between b and e and p17='1') as Amt2ndP
		, (select sum(d39) from CL.dbo.xml_ddata where t3 between b and e) as AmtND
from	@t
-----------------------------------------------
declare @t table (b char(5), e char(5))
insert into @t
    values('10601','10606')
	,('10607','10612')
	,('10701','10706')
	,('10707','10712')
	,('10801','10805')
--第一張處方箋給藥人日
declare @t1 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t1
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata3
group by t3,d1,d2
--第二張處方箋給藥人日
declare @t2 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t2
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata3
where	p17='1'
group by t3,d1,d2
select	b+'~'+e as YM
		, (select count(distinct d3) from CL.dbo.xml_ddata3 where t3 between b and e) as NoP
		, (select count(*) from CL.dbo.xml_ddata3 where t3 between b and e) as NoC
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata3 where t3 between b and e) as No1stP
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata3 where t3 between b and e and p17='1') as No2ndP
		, (select sum(total_days) from @t1 where t3 between b and e) as No1stPD
		, (select sum(total_days) from @t2 where t3 between b and e) as No2ndPD
		, (select sum(p12) from CL.dbo.xml_pdata3 where t3 between b and e) as Amt1stP
		, (select sum(p12) from CL.dbo.xml_pdata3 where t3 between b and e and p17='1') as Amt2ndP
		, (select sum(d39) from CL.dbo.xml_ddata3 where t3 between b and e) as AmtND
from	@t
-----------------------------------------------

declare @t table (b char(5), e char(5))
insert into @t
    values('10601','10603')
	,('10604','10606')
	,('10607','10609')
	,('10610','10612')
	,('10701','10703')
	,('10704','10706')
	,('10707','10709')
	,('10710','10712')
	,('10801','10803')
	,('10804','10805')
--第一張處方箋給藥人日
declare @t1 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t1
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata3
group by t3,d1,d2
--第二張處方箋給藥人日
declare @t2 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t2
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata3
where	p17='1'
group by t3,d1,d2
select	b+'~'+e as YM
		, (select count(distinct d3) from CL.dbo.xml_ddata3 where t3 between b and e) as NoP
		, (select count(*) from CL.dbo.xml_ddata3 where t3 between b and e) as NoC
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata3 where t3 between b and e) as No1stP
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata3 where t3 between b and e and p17='1') as No2ndP
		, (select sum(total_days) from @t1 where t3 between b and e) as No1stPD
		, (select sum(total_days) from @t2 where t3 between b and e) as No2ndPD
		, (select sum(p12) from CL.dbo.xml_pdata3 where t3 between b and e) as Amt1stP
		, (select sum(p12) from CL.dbo.xml_pdata3 where t3 between b and e and p17='1') as Amt2ndP
		, (select sum(d39) from CL.dbo.xml_ddata3 where t3 between b and e) as AmtND
from	@t
-------------------------------------------------

declare @t table (b char(5), e char(5))
insert into @t
    values('10601','10603')
	,('10604','10606')
	,('10607','10609')
	,('10610','10612')
	,('10701','10703')
	,('10704','10706')
	,('10707','10709')
	,('10710','10712')
	,('10801','10803')
	,('10804','10805')
--第一張處方箋給藥人日
declare @t1 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t1
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata4
group by t3,d1,d2
--第二張處方箋給藥人日
declare @t2 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t2
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata4
where	p17='1'
group by t3,d1,d2
select	b+'~'+e as YM
		, (select count(distinct d3) from CL.dbo.xml_ddata4 where t3 between b and e) as NoP
		, (select count(*) from CL.dbo.xml_ddata4 where t3 between b and e) as NoC
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata4 where t3 between b and e) as No1stP
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata4 where t3 between b and e and p17='1') as No2ndP
		, (select sum(total_days) from @t1 where t3 between b and e) as No1stPD
		, (select sum(total_days) from @t2 where t3 between b and e) as No2ndPD
		, (select sum(p12) from CL.dbo.xml_pdata4 where t3 between b and e) as Amt1stP
		, (select sum(p12) from CL.dbo.xml_pdata4 where t3 between b and e and p17='1') as Amt2ndP
		, (select sum(d39) from CL.dbo.xml_ddata4 where t3 between b and e) as AmtND
from	@t
-------------------------------------------------

declare @t table (b char(5), e char(5))
insert into @t
    values('10601','10601')
	,('10602','10602')
	,('10603','10603')
	,('10604','10604')
	,('10605','10605')
	,('10606','10606')
	,('10607','10607')
	,('10608','10608')
	,('10609','10609')
	,('10610','10610')
	,('10611','10611')
	,('10612','10612')
	,('10701','10701')
	,('10702','10702')
	,('10703','10703')
	,('10704','10704')
	,('10705','10705')
	,('10706','10706')
	,('10707','10707')
	,('10708','10708')
	,('10709','10709')
	,('10710','10710')
	,('10711','10711')
	,('10712','10712')
	,('10801','10801')
	,('10802','10802')
	,('10803','10803')
	,('10804','10804')
	,('10805','10805')
--第一張處方箋給藥人日
declare @t1 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t1
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata3
group by t3,d1,d2
--第二張處方箋給藥人日
declare @t2 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t2
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata3
where	p17='1'
group by t3,d1,d2
select	b+'~'+e as YM
		, (select count(distinct d3) from CL.dbo.xml_ddata3 where t3 between b and e) as NoP
		, (select count(*) from CL.dbo.xml_ddata3 where t3 between b and e) as NoC
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata3 where t3 between b and e) as No1stP
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata3 where t3 between b and e and p17='1') as No2ndP
		, (select sum(total_days) from @t1 where t3 between b and e) as No1stPD
		, (select sum(total_days) from @t2 where t3 between b and e) as No2ndPD
		, (select sum(p12) from CL.dbo.xml_pdata3 where t3 between b and e) as Amt1stP
		, (select sum(p12) from CL.dbo.xml_pdata3 where t3 between b and e and p17='1') as Amt2ndP
		, (select sum(d39) from CL.dbo.xml_ddata3 where t3 between b and e) as AmtND
from	@t
-------------------------------------------------

declare @t table (b char(5), e char(5))
insert into @t
    values('10601','10612')
	,('10701','10712')
	,('10801','10805')
--第一張處方箋給藥人日
declare @t1 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t1
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata3
group by t3,d1,d2
--第二張處方箋給藥人日
declare @t2 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t2
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata3
where	p17='1'
group by t3,d1,d2
select	b+'~'+e as YM
		, (select count(distinct d3) from CL.dbo.xml_ddata3 where t3 between b and e) as NoP
		, (select count(*) from CL.dbo.xml_ddata3 where t3 between b and e) as NoC
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata3 where t3 between b and e) as No1stP
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata3 where t3 between b and e and p17='1') as No2ndP
		, (select sum(total_days) from @t1 where t3 between b and e) as No1stPD
		, (select sum(total_days) from @t2 where t3 between b and e) as No2ndPD
		, (select sum(p12) from CL.dbo.xml_pdata3 where t3 between b and e) as Amt1stP
		, (select sum(p12) from CL.dbo.xml_pdata3 where t3 between b and e and p17='1') as Amt2ndP
		, (select sum(d39) from CL.dbo.xml_ddata3 where t3 between b and e) as AmtND
from	@t
-------------------------------------------------
    values('10601','10612')
	,('10701','10712')
	,('10801','10805')
    values('10601','10606')
	,('10607','10612')
	,('10701','10706')
	,('10707','10712')
	,('10801','10805')
    values('10601','10603')
	,('10604','10606')
	,('10607','10609')
	,('10610','10612')
	,('10701','10703')
	,('10704','10706')
	,('10707','10709')
	,('10710','10712')
	,('10801','10803')
	,('10804','10805')

*/
declare @t table (b char(5), e char(5))
insert into @t
    values('10601','10612')
	,('10701','10712')
	,('10801','10805')
--第一張處方箋給藥人日
declare @t1 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t1
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata
group by t3,d1,d2
--第二張處方箋給藥人日
declare @t2 table (t3 char(5), d1 char(2), d2 int, total_days int)
insert into @t2
select	t3, d1, d2, max(p1)
from	CL.dbo.xml_pdata
where	p17='1'
group by t3,d1,d2
select	b+'~'+e as YM
		, (select count(distinct d3) from CL.dbo.xml_ddata where t3 between b and e) as NoP
		, (select count(*) from CL.dbo.xml_ddata where t3 between b and e) as NoC
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata where t3 between b and e) as No1stP
		, (select count(distinct t3+d1+convert(nchar(9),d2)) from CL.dbo.xml_pdata where t3 between b and e and p17='1') as No2ndP
		, (select sum(total_days) from @t1 where t3 between b and e) as No1stPD
		, (select sum(total_days) from @t2 where t3 between b and e) as No2ndPD
		, (select sum(p12) from CL.dbo.xml_pdata where t3 between b and e) as Amt1stP
		, (select sum(p12) from CL.dbo.xml_pdata where t3 between b and e and p17='1') as Amt2ndP
		, (select sum(d39) from CL.dbo.xml_ddata where t3 between b and e) as AmtND
from	@t
-------------------------------------------------





