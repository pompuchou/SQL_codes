﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
--insert into [AL].[dbo].[p_order]
values ('OJOHN'
		,'JOHNLAX ENTERIC COATED TABLETS "JOHNSON"(鋁箔/膠箔)'
		,'20111201'
		,'29101231'
		,'NC002611G0'
		,'JOHNLAX ENTERIC COATED TABLETS "JOHNSON"(鋁箔/膠箔)'
		,'BISACODYL'
		,'1'
		,'2.00'
		,''
		,''
		,'4'
		,'TAB'
		,'TAB'
		,''
		,'PO'
		,'Y'
		,'1'
		,'O'
		,''
		,''
		,''
		,''
		,'5.000'
		,'強生化學製藥廠股份有限公司'
		,''
		,'腸溶錠'
		,''
		,''
		,''
		,''
		,'pupu'
		,'20180920043434')

--insert into [AL].[dbo].[p_order]
values ('OVIMP'
		,'VIMPAT 100MG FILM-COATED TABLETS'
		,'20180501'
		,'29101231'
		,'BC26285100'
		,'VIMPAT 100MG FILM-COATED TABLETS'
		,'LACOSAMIDE'
		,'1'
		,'58.00'
		,''
		,''
		,'4'
		,'TAB'
		,'TAB'
		,''
		,'PO'
		,'Y'
		,'1'
		,'O'
		,''
		,''
		,''
		,''
		,'100.00'
		,'Aesica Pharmaceuticals GmbH'
		,''
		,'膜衣錠'
		,''
		,''
		,''
		,''
		,'pupu'
		,'20180920043718')

--update [AL].[dbo].[p_order]
set r04='AC49653100'
where rid='OCALM100'

--update [AL].[dbo].[p_order]
set r04='AC50083100'
where rid='OCALM25'


SELECT [rid]
      ,[r01]
      ,[r02]
      ,[r03]
      ,[r04]
      ,[r06]
      ,[r07]
      ,[r08]
      ,[r09]
      ,[r10]
      ,[r11]
      ,[r12]
      ,[r13]
      ,[r14]
      ,[r15]
      ,[r16]
      ,[r18]
      ,[r19]
      ,[r25]
      ,[r26]
      ,[r27]
      ,[r28]
      ,[r29]
      ,[r30]
      ,[r31]
      ,[r32]
      ,[r33]
      ,[r34]
      ,[r40]
      ,[r48]
      ,[r52]
      ,[r60]
      ,[r61]
  FROM [AL].[dbo].[p_order]
where rid='OJOHN'