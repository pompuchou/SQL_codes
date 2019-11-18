--檢查三種錯誤情形
--1. 同一醫令被重複叫用
/*
SELECT [uid]
      ,[iid]
      ,[CASENO]
      ,[OD_idx]
	  ,count(iid) as N
FROM [AL].[dbo].[tbl_lab_record]
where	[CASENO] is not null
group by	[uid]
      ,[iid]
      ,[CASENO]
      ,[OD_idx]
having	count(iid)>1
*/
--2. 日期與CASE不一致
/*
select	*
from	al.dbo.tbl_opd_order
where	SDATE<>'20'+substring(CASENO,3,6)
*/
--3. 同一lid應該都是同一CASENO
/*
select	A.lid, count(A.CASENO) as N
from (select	lid, CASENO
from	al.dbo.tbl_lab_record
where	CASENO is not null
group by	lid, CASENO
) as A
group by A.lid
having count(A.CASENO)>1
*/
/*
01070118000148
01070129000022
01070608000019
01070608000022
01070608000031
01070608000036
01070623000118
01070628000124
01070702000066
01070913000051
01080420000102
01080508000224
*/
/*
select	*
from al.dbo.tbl_lab_record
where lid in ('01070628000124') and iid not in ('CBC-DC')
*/
--update al.dbo.tbl_lab_record
--set	CASENO=NULL, OD_idx=NULL
--where lid in ('01070129000022','01070608000019','01070608000022','01070608000031','01070608000036','01070623000118','01070628000124','01070702000066','01070913000051','01080508000224')

--update al.dbo.tbl_lab_record
--set	CASENO=NULL, OD_idx=NULL
--where lid in ('01070608000022')
/*
--這些確認真的是同一張檢驗工單來自不同處方,原因是聖愛教養院2018/6/6的個案不同天(2018/5/9)處方,有時甚至跨月,但檢體是同一天送的,賽亞不知道所以就合併一張工單了
select	*
from al.dbo.tbl_lab_record
where lid in ('01070118000148','01070608000019','01070608000022','01070608000031','01070608000036','01080508000224','01070628000124')
*/
/*
--這些確認真的是同一張檢驗工單來自不同處方,原因是同一天有自費,健保診分別開立處方,賽亞不知道所以就合併一張工單了
select	*
from al.dbo.tbl_lab_record
where lid in ('01070129000022','01070702000066','01070913000051','01080420000102','01070623000118')
*/
--第四種錯誤,由於更動了資料庫,OD_idx可能會改變
--最後再一起看
/*
declare @t_lab table(lid nvarchar(50), caseno nvarchar(50), od_idx nvarchar(50), nhi_code nvarchar(50))
declare @t_ord table(lid nvarchar(50), caseno nvarchar(50), od_idx nvarchar(50), rid nvarchar(50))

insert into @t_lab 
select	A.lid
		,A.CASENO
		,A.OD_idx
		,B.nhi_code  
from	al.dbo.tbl_lab_record as A
		left outer join
		al.dbo.p_lab as B
		on A.iid=B.iid
where	A.CASENO is not null
group by A.lid, A.CASENO, A.OD_idx, B.nhi_code 

insert into	@t_ord
select	B.lid, A.CASENO, A.OD_idx, A.rid 
from	al.dbo.tbl_opd_order as A
left outer join
		al.dbo.tbl_lab_record as B
		on A.CASENO=B.CASENO and A.OD_idx=B.OD_idx
where	B.lid is not null
group by B.lid, A.CASENO, A.OD_idx, A.rid

--在lab,不在order
select	A.*, B.*
from	@t_lab as A
	left outer join
		@t_ord as B
	on A.lid=B.lid and A.od_idx=B.od_idx and A.caseno=B.caseno
where	A.nhi_code<>B.rid
order by A.lid, A.od_idx 

select	distinct A.lid
from	@t_lab as A
	left outer join
		@t_ord as B
	on A.lid=B.lid and A.od_idx=B.od_idx and A.caseno=B.caseno
where	A.nhi_code<>B.rid
order by A.lid 
*/
/*
select *
from	al.dbo.tbl_lab_record 
where	lid in
('010602040036','010602080311','010602220201','010602220220','010603130125','01060315000028','01060315000032','01060315000036',
'01060315000038','01060329000025','01060329000026','01060329000027','01060329000028','01060329000029','01060329000030','01060329000032',
'01060329000033','01060329000034','01060329000035','01060329000036','01060329000037','01060329000038','01060329000039','01060329000040',
'01060329000041','01060329000042','01060329000043','01060329000044','01060329000045','01060329000046','01060329000047','01060329000049',
'01060330000078','01070129000022','01070414000006','01070608000016','01070608000019','01070608000022','01070608000031','01070608000046',
'01070609000065','01070623000118','01070628000124','01070630000120','01070702000066','01070814000150','01070814000153','01070913000051',
'01071108000083','01071108000091','01071122000093','01071122000105','01071130000131','01071130000132','01071130000133','01071130000134',
'01071130000136','01071130000137','01080117000131','01080215000049','01080226000167','01080226000168','01080226000174','01080226000176',
'01080226000181','01080226000183','01080417000213','01080417000229','01080425000024','01080508000224','01080508000246','01080514000136')
and CASENO is null and iid not in ('CBC-DC','URT','P1-B') 

select	*
from	al.dbo.tbl_lab_record
where	lid in('01070129000022','01070608000019','01070608000022','01070608000031','01070623000118','01070628000124','01070702000066','01070913000051','01080508000224')
and CASENO is null and iid not in ('CBC-DC','URT','P1-B') 

select	A.*, B.l08, B.nhi_code
from al.dbo.tbl_lab_record as A
	left outer join
		al.dbo.p_lab as B
		on A.iid=B.iid
where A.lid in
('01060422000035','01060426000090','01060426000098','01060426000100','01060426000129','01060426000134','01060511000075','01060524000037',
'01060524000038','01060524000039','01060524000047','01060524000048','01060524000049','01060524000050','01060524000067','01060524000068',
'01060524000069','01060524000070','01060601000141','01060601000142','01060622000052','01060622000053','01060622000055','01060627000085',
'01060627000116','01060704000117','01060710000017','01060711000121','01060711000122','01060714000093','01060804000086','01060815000113',
'01060815000136','01060815000138','01060817000123','01060817000128','01060920000102','01060920000113','01060920000136','01060930000020',
'01061017000124','01061109000227','01061109000228','01061109000229','01061205000010','01070126000134','01070126000135','01070126000137',
'01070126000138','01070126000139','01070126000141','01070126000142','01070309000239','01070309000246','01070309000250','01070410000161',
'01070413000023','01070420000127','01070420000130','01070420000133','01070420000136','01070420000137','01070428000044','01070526000062')
and A.CASENO is NULL and A.od_idx is null and A.iid not in ('CBC-DC','URT','P1-B', 'P1','A')

update	al.dbo.tbl_lab_record
set	CASENO=NULL, od_idx=NULL 
where lid in ('01060414000X01')
where lid in ('01070126000142','01070309000239')

select	A.*, B.l08, B.nhi_code
from al.dbo.tbl_lab_record as A
	left outer join
		al.dbo.p_lab as B
		on A.iid=B.iid
where A.lid in
('01070126000142','01070309000239')
and A.CASENO is NULL and A.od_idx is null and A.iid not in ('CBC-DC','URT','P1-B', 'P1','A')

update	al.dbo.tbl_lab_record
set	CASENO=NULL, od_idx=NULL 
where lid in ('01061012000231','01061012000252','01061024000161','01070124000136','01070124000138','01070224000056','01070413000034','01070413000040','01070425000018','01070428000026')

select	A.*, B.l08, B.nhi_code
from al.dbo.tbl_lab_record as A
	left outer join
		al.dbo.p_lab as B
		on A.iid=B.iid
where lid in ('01061012000231','01061012000252','01061024000161','01070124000136','01070124000138','01070224000056','01070413000034','01070413000040','01070425000018','01070428000026')
and A.CASENO is NULL and A.od_idx is null and A.iid not in ('CBC-DC','URT','P1-B', 'P1','A')

update	al.dbo.tbl_lab_record
set	CASENO=NULL, od_idx=NULL 
where lid in ('01060913000X02','01080514000135','01080514000141','01080514000142','01080514000151','01080514000152','01080514000154')

select	A.*, B.l08, B.nhi_code
from al.dbo.tbl_lab_record as A
	left outer join
		al.dbo.p_lab as B
		on A.iid=B.iid
where lid in ('01060913000X02','01080514000135','01080514000141','01080514000142','01080514000151','01080514000152','01080514000154')
and A.CASENO is NULL and A.od_idx is null and A.iid not in ('CBC-DC','URT','P1-B', 'P1','A')


*/

--select	*
--from	al.dbo.tbl_opd_order
--where	caseno='AC180309302006'

--第五種錯誤, 檢查al.dbo.tbl_opd_order, 因為有手動插入,日期已經檢查過了, 身分證字號還沒檢查

select	A.caseno, count(A.uid) as N
from
(select	caseno, uid
from	al.dbo.tbl_opd_order
group by caseno, uid) as A
group by A.caseno
having count(A.uid)>1

--完成,沒問題!!!