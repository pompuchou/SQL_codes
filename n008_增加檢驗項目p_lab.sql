﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
insert into al.dbo.p_lab
SELECT [iid]
      ,[l08]
      ,[l10]
      ,[l11]
	  ,29 as l11a
	  ,130 as l11b
	  ,'09027C'
	  ,'09027C'
	  ,'Alk-P'
	  ,'生'
	  ,NULL
  FROM [AL].[dbo].[p_lab_temp]
  where	iid='103'

/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT TOP (1000) [iid]
      ,[l08]
      ,[l10]
      ,[l11]
      ,[l11a]
      ,[l11b]
      ,[rid]
      ,[nhi_code]
      ,[abb]
      ,[tub]
      ,[npo]
  FROM [AL].[dbo].[p_lab]