--首先下載日收入報表,各院區
--存成csv檔, 刪除電話地址國籍
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

--修剪
delete
FROM BL.DBO.TBL_SHOURU
WHERE 項次='合計：'

delete
FROM BL.DBO.TBL_SHOURU
WHERE 項次='項次'

delete
FROM BL.DBO.TBL_SHOURU
WHERE 狀態 is null



--匯入PIJIA
insert	[AL].[dbo].[tbl_pijia]
SELECT [收據號] as [rid]
      ,[批價人員] as [op]
      ,[看診日期] as [SDATE]
      ,[午別] as [VIST]
      ,[診別] as [RMNO]
      ,[科別] as [DEPTNAME]
      ,[醫師] as [DOCTNAME]
      ,[身分] as [POSINAME]
      ,[就醫序號] as [HEATH_CARD]
      ,[優免] as [Youmian]
      ,[部分負擔] as [PAYNO]
      ,[病歷號] as [cid]
      ,[身分證號] as [uid]
      ,[患者姓名] as [cname]
      ,[醫療費用] as [MedFee]
      ,[掛號費用] as [RegFee]
      ,[部分負擔2] as [Copay]
      ,[押金] as [Deposit]
      ,[自付金額] as [SelfPay]
      ,[藥費加重] as [PharmW]
      ,[欠收] as [Arrears]
      ,[折扣] as [Discount]
      ,[應收金額] as [AMTreceivable]
      ,[實收金額] as [AMTreceived]
      ,left([說明],2) as [remark]
    	,NULL as [CASENO]
		,NULL as G
  FROM [BL].[dbo].[tbl_shouru]
  where	[收據說明] is null and [收據號] not in (select rid from al.dbo.tbl_pijia where SDATE>'20190201') and [看診日期] > '20190401'


-- 就是要將tbl_opd 與批價檔配對
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

--反向Pijia檔也要match
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






