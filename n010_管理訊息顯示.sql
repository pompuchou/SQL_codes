﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT TOP (1000) [access_id]
      ,[regdate]
      ,[application_name]
      ,[machine_name]
      ,[ip_address]
      ,[userid]
      ,[operation_name]
      ,[description]
  FROM [AL].[dbo].[log_Adm]
  order by access_id desc