﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT [病歷號]
      ,[身分證號]
      ,[患者姓名]
      ,[性別]
      ,[生日]
	  ,left([說明],2) as inst
	  , min([看診日期]) as first_visit
	  , max([看診日期]) as last_visit
	  , count([項次]) as N
  FROM [AL].[dbo].[D]
  group by [病歷號]
      ,[身分證號]
      ,[患者姓名]
      ,[性別]
      ,[生日]
	  ,left([說明],2)
order by max([看診日期]) desc, count([項次]) desc

/*
delete
  FROM [AL].[dbo].[J]
  where len([收據說明])<>0
*/



