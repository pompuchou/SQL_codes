--�ˬd�T�ؿ��~����
--1. �P�@��O�Q���ƥs��
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
--2. ����PCASE���@�P
/*
select	*
from	al.dbo.tbl_opd_order
where	SDATE<>'20'+substring(CASENO,3,6)
*/
--3. �P�@lid���ӳ��O�P�@CASENO
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
--�o�ǽT�{�u���O�P�@�i����u��Ӧۤ��P�B��,��]�O�t�R�оi�|2018/6/6���Ӯפ��P��(2018/5/9)�B��,���ɬƦܸ��,������O�P�@�Ѱe��,�ɨȤ����D�ҥH�N�X�֤@�i�u��F
select	*
from al.dbo.tbl_lab_record
where lid in ('01070118000148','01070608000019','01070608000022','01070608000031','01070608000036','01080508000224','01070628000124')
*/
/*
--�o�ǽT�{�u���O�P�@�i����u��Ӧۤ��P�B��,��]�O�P�@�Ѧ��۶O,���O�E���O�}�߳B��,�ɨȤ����D�ҥH�N�X�֤@�i�u��F
select	*
from al.dbo.tbl_lab_record
where lid in ('01070129000022','01070702000066','01070913000051','01080420000102','01070623000118')
*/
--�ĥ|�ؿ��~,�ѩ��ʤF��Ʈw,OD_idx�i��|����
--�̫�A�@�_��
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

--�blab,���border
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

--�Ĥ��ؿ��~, �ˬdal.dbo.tbl_opd_order, �]������ʴ��J,����w�g�ˬd�L�F, �����Ҧr���٨S�ˬd

select	A.caseno, count(A.uid) as N
from
(select	caseno, uid
from	al.dbo.tbl_opd_order
group by caseno, uid) as A
group by A.caseno
having count(A.uid)>1

--����,�S���D!!!