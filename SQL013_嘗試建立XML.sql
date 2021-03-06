﻿alter procedure sp_get_hdata
	@ym nvarchar(5)
as
--創立於20190530
declare	@begindate date
declare @enddate date
declare	@h2 nchar(10)
declare	@h6 nchar(7)
declare @h19 nchar(13)
declare @t1 table (h7 char(2), h8 int, h9 char(10), h10 char(7), h11 char(7), h18 nvarchar(12), h22 nchar(11), h23 nchar(11), h26 char(4), r1 tinyint, r2 nvarchar(100), r4 nvarchar(4000), r5 nvarchar(50), [r6a] nvarchar(4000), [r6b] nvarchar(4000), r10 nchar(11))

set @begindate=convert(char(4), convert(int,left (@ym,3))+1911)+right(@ym,2)+'01'
set @enddate=dateadd(d,-1,dateadd(m, 1, @begindate))
set @h19=convert(varchar,YEAR(getdate())-1911)+right(replace(replace(replace(convert(varchar,getdate(),120),' ',''),'-',''),':',''),10)
--748 records

select	@h2=t2
		,@h6=t6
from	xml_tdata
where	t3=@YM

insert into @t1
SELECT	C.d1 as h7
		,C.d2 as h8
		,C.d3 as h9
		,C.d11 as h10
		,C.d9 as h11
		,case when len(A.rid)=5 then A.rid+'C' else A.rid end as h18
		,convert(varchar,YEAR(A.SDATE)-1911)+right(convert(varchar,A.SDATE,112),4)+'0000' as h22
		,convert(varchar,YEAR(D.l05)-1911)+right(convert(varchar,D.l05,112),4)+'0000' as h23
		,B.HEATH_CARD as h26
		,(select count(X.iid) from al.dbo.tbl_lab_record as X where X.CASENO=D.CASENO and X.OD_idx=D.OD_idx and X.iid<=D.iid) as r1
		,E.l08 as r2
		,D.l07 as r4
		,E.l10 as r5
		,E.l11a as [r6a]
		,E.l11b as [r6b]
		,convert(varchar,YEAR(D.l05)-1911)+right(convert(varchar,D.l05,112),4)+'0000' as r10
  FROM [AL].[dbo].[tbl_opd_order] as A
	left outer join
		[AL].[dbo].[tbl_opd] as B
	on A.[CASENO]=B.[CASENO]
	left outer join
		[AL].[dbo].[xml_ddata] as C
	on B.[t3]=C.[t3] and B.[d1]=C.[d1] and B.[d2]=C.[d2]
	left outer join
		[AL].[dbo].[tbl_lab_record] as D
	on A.[CASENO]=D.[CASENO] and A.[OD_idx]=D.[OD_idx]
	left outer join
		[AL].[dbo].[p_lab] as E
	on D.iid=E.iid
  WHERE	A.[SDATE] between	@begindate and @enddate and A.[CLASS]='檢驗' and A.[HC]='健保' and D.l07 is not null

select	'1' as h1
		,@h2 as h2
		,'11' as h3
		,@YM as h4
		,'1' as h5
		,@h6 as h6
		,A.h7
		,A.h8
		,A.h9
		,A.h10
		,A.h11
		,B.p13 as h17
		,A.h18
		,@h19 as h19
		,'A123871035' as h20
		,A.h22
		,A.h23
		,'＜NONE＞' as h25
		,A.h26
		,A.r1
		,A.r2
		,'＜NONE＞' as r3
		,A.r4
		,A.r5
		,A.[r6a]
		,A.[r6b]
		,'JY32010064' as r9
		,A.r10
from	@t1 as A
left outer join
		[AL].[dbo].[xml_pdata] as B
	on B.t3=@YM and A.h7=B.d1 and A.h8=B.d2 and A.h18=B.p4
order by A.h11, A.h9, A.h18, A.r1

go
