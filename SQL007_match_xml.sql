/*
--add t3
--20190528

update al.dbo.tbl_opd
set t3=convert(char(3),YEAR(SDATE)-1911)+right(convert(char(3),MONTH(SDATE)+100),2)
where POSINAME='���O'

update al.dbo.tbl_opd
set	d1=B.d1, d2=B.d2
FROM [AL].[dbo].[tbl_opd] as A
  left outer join
[AL].[dbo].[xml_ddata] as B
	on A.t3=B.t3 and convert(char(3),YEAR(A.SDATE)-1911)+right(convert(char(3),MONTH(A.SDATE)+100),2)+right(convert(char(3),DAY(A.SDATE)+100),2)=B.d9 and A.uid=B.d3 and A.HEATH_CARD=B.d29

update al.dbo.tbl_opd
set	d1=B.d1, d2=B.d2
 FROM [AL].[dbo].[tbl_opd] as A
  left outer join
[AL].[dbo].[xml_ddata] as B
	on A.t3=B.t3 and convert(char(3),YEAR(A.SDATE)-1911)+right(convert(char(3),MONTH(A.SDATE)+100),2)+right(convert(char(3),DAY(A.SDATE)+100),2)=B.d9 and A.uid=B.d3
	where	A.HEATH_CARD in ('IC1','IC2')

--�����E�b�o�S���ӳ��b��,201905�e��11��-1
SELECT [CASENO]
      ,[SDATE]
      ,[VIST]
      ,[RMNO]
      ,[uid]
      ,[DEPTNAME]
      ,[DOCTNAME]
      ,[POSINAME]
      ,[PAYNO]
      ,[HEATH_CARD]
      ,[ICDCODE1]
      ,[ICDCODE2]
      ,[ICDCODE3]
      ,[INS_CODE]
      ,[STEXT]
      ,[OTEXT]
      ,[Pijia]
      ,[t3]
      ,[d1]
      ,[d2]
  FROM [AL].[dbo].[tbl_opd]
  where	POSINAME='���O' and d1 is null and SDATE<'20190501'
*/
select	A.CASENO, B.t3, B.d1, B.d2
FROM [AL].[dbo].[tbl_opd] as A
  left outer join
[AL].[dbo].[xml_ddata] as B
	on convert(char(3),YEAR(A.SDATE)-1911)+right(convert(char(3),MONTH(A.SDATE)+100),2)+right(convert(char(3),DAY(A.SDATE)+100),2)=B.d9 and A.uid=B.d3 and (A.HEATH_CARD=B.d29 or A.HEATH_CARD in ('IC1', 'IC2'))
where	A.POSINAME='���O' and A.d1 is null and B.d1 is not null
order by A.CASENO

--���ӳ��b�o�S�����E�b��, ��21��-1

select	A.*, B.*
from	al.dbo.xml_ddata as A
left outer join
(select	t3, d1, d2
from	al.dbo.tbl_opd
where	d1 is not null) as B
on A.t3=B.t3 and A.d1=B.d1 and A.d2=B.d2
where	B.d1 is null

--��21��,���O�����b10602���e��,��ܸ�ƨS�˦n
--�S�O���O1070831, H224960469

update al.dbo.tbl_opd
set	HEATH_CARD='0025', d1='04', d2=891
where	CASENO='AC180831502005'