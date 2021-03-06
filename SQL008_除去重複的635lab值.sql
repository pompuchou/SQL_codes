﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
-- 2019/05/28 finding duplicates in lab data, totally 635
--這是因為使用excel檔和文字檔的差別,她們的檢驗工號差了兩位數
/*
SELECT      len([lid]) as xlength,
			count(lid) as N
  FROM [AL].[dbo].[tbl_lab]
  group by len(lid)
*/
declare	@t1 table(uid nvarchar(10), lid nvarchar(20), cname nvarchar(50), bd date, mf nvarchar(2), cid nvarchar(10), l01 date, l02 date, l03 nvarchar(50), l04 date, l05 date, l06 nvarchar(50))
declare	@t2 table(uid nvarchar(10), lid nvarchar(20), cname nvarchar(50), bd date, mf nvarchar(2), cid nvarchar(10), l01 date, l02 date, l03 nvarchar(50), l04 date, l05 date, l06 nvarchar(50))
declare @t3 table(lid nvarchar(20))

insert into @t1
select	uid,
		lid,
		cname,
		bd,
		mf,
		cid,
		l01,
		l02,
		l03,
		l04,
		l05,
		l06
  FROM [AL].[dbo].[tbl_lab]
  where len(lid) = 12

insert into @t2
select	uid,
		lid,
		cname,
		bd,
		mf,
		cid,
		l01,
		l02,
		l03,
		l04,
		l05,
		l06
  FROM [AL].[dbo].[tbl_lab]
  where len(lid) = 14

insert into @t3
select	A.lid
from	@t1 as A
	left outer join
		@t2 as B
	on (left(A.lid,8)+'00'+right(A.lid,4))=B.lid
where	B.uid is not null

--delete
select	*
from	al.dbo.tbl_lab
where	lid in (select lid from @t3)

select	*
from	al.dbo.tbl_lab_record
where	lid in (select lid from @t3)

/*
select	*
from	al.dbo.tbl_lab as A
		left outer join
		al.dbo.tbl_lab_record as B
		on A.lid=B.lid
where	B.lid is null
*/

/*
--來自txt檔的
select	*
from	al.dbo.tbl_lab
where	len(lid)=12

select	*
from	al.dbo.tbl_lab_record
where	len(lid)=12


--delete
from	al.dbo.tbl_lab
where lid in ('010601250073','010601250074','010602040036','010602080301','010602080302','010602080303','010602080304','010602080305','010602080306','010602080308','010602080309','010602080310','010602080311','010602080313','010602080314','010602080315','010602080316','010602080317','010602080318','010602080319','010602080320','010602080321','010602080322','010602080323','010602080324','010602080325','010602080326','010602080327')

--delete
from	al.dbo.tbl_lab
where lid in ('010602220201','010602220202','010602220203','010602220204','010602220206','010602220207','010602220208','010602220209','010602220210','010602220211','010602220212','010602220213','010602220214','010602220215','010602220216','010602220217','010602220218','010602220219','010602220220','010602220221','010602220222','010602220223','010602220224','010602220225','010602220226','010602220227','010602220228','010602220229','010602220230','010602220231','010602220232','010602220233','010602220234','010602240117','010602240118','010603110029','010603130125','010603160093')
*/