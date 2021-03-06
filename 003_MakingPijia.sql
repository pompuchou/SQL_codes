﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
/*
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
  into	[AL].[dbo].[tbl_pijia]
  FROM [AL].[dbo].[F]

  
  select	收據號, count(*) as N
  from A_judi
  group by 收據號
  order by 收據號

  select	*
  from	F
  where	收據號='1200001'
  */
  --f 1459
  --j 629
--m 474
--judi 77 , 2639 totally so far
--l 348

--insert	[AL].[dbo].[tbl_pijia]
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
      ,[說明] as [remark]
--	,'司法鑑定' as [remark]
	,NULL as [CASENO]
  FROM [AL].[dbo].[O]


select	*
--delete
from	[AL].[dbo].[tbl_pijia]
where	remark='由根'

