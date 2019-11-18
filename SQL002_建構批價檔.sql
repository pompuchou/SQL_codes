--�����U���馬�J����,�U�|��
--�s��csv��, �R���q�ܦa�}���y
--ABCDEFGHIKLM
/*
bulk insert [BL].[dbo].tbl_shouru
from 'C:\G_10805.csv'
with
(
	firstrow=1,
	fieldterminator=',',
	rowterminator='\n',
	tablock
)

--A 1136
--B 200
--C 292
--D 124
--E 115
--F 92
--G 219
--H 48
--I 82
--K 29
--L 18
--M 60

--�װ�
delete
FROM BL.DBO.TBL_SHOURU
WHERE ����='�X�p�G'

delete
FROM BL.DBO.TBL_SHOURU
WHERE ����='����'

delete
FROM BL.DBO.TBL_SHOURU
WHERE ���A is null



--�פJPIJIA
insert	[AL].[dbo].[tbl_pijia]
SELECT [���ڸ�] as [rid]
      ,[����H��] as [op]
      ,[�ݶE���] as [SDATE]
      ,[�ȧO] as [VIST]
      ,[�E�O] as [RMNO]
      ,[��O] as [DEPTNAME]
      ,[��v] as [DOCTNAME]
      ,[����] as [POSINAME]
      ,[�N��Ǹ�] as [HEATH_CARD]
      ,[�u�K] as [Youmian]
      ,[�����t��] as [PAYNO]
      ,[�f����] as [cid]
      ,[�����Ҹ�] as [uid]
      ,[�w�̩m�W] as [cname]
      ,[�����O��] as [MedFee]
      ,[�����O��] as [RegFee]
      ,[�����t��2] as [Copay]
      ,[���] as [Deposit]
      ,[�ۥI���B] as [SelfPay]
      ,[�ĶO�[��] as [PharmW]
      ,[��] as [Arrears]
      ,[�馩] as [Discount]
      ,[�������B] as [AMTreceivable]
      ,[�ꦬ���B] as [AMTreceived]
      ,left([����],2) as [remark]
    	,NULL as [CASENO]
		,NULL as G
  FROM [BL].[dbo].[tbl_shouru]
  where	[���ڻ���] is null and [���ڸ�] not in (select rid from al.dbo.tbl_pijia where SDATE>'20190201') and [�ݶE���] > '20190401'


-- �N�O�n�Ntbl_opd �P����ɰt��
update	[AL].[dbo].[tbl_opd]
set		[Pijia]=B.rid
from	[AL].[dbo].[tbl_opd] as A
		left outer join
		[al].[dbo].[tbl_pijia] as B
		on A.[SDATE]=B.[SDATE] and A.[VIST]=B.[VIST] and A.RMNO=B.[RMNO] and A.uid=B.[uid] and A.POSINAME=B.[POSINAME]
where	B.rid is not null and Pijia is null
--2273
--5+3+1+1

select *
from [AL].[dbo].[tbl_opd]
where pijia is null and SDATE between '20170228' and '20190430'
*/

--�ϦVPijia�ɤ]�nmatch
select	*
from	al.dbo.tbl_pijia
where caseno is null
order by SDATE


update	[AL].[dbo].[tbl_pijia]
set		[CASENO]=B.CASENO
from	[AL].[dbo].[tbl_pijia] as A
		left outer join
		[al].[dbo].[tbl_opd] as B
		on A.[SDATE]=B.[SDATE] and A.[VIST]=B.[VIST] and A.RMNO=B.[RMNO] and A.uid=B.[uid] and A.POSINAME=B.POSINAME
where	B.CASENO is not null and A.CASENO is null






