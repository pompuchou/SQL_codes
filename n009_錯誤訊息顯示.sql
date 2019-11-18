﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT TOP (1000) [error_id]
      ,[error_date]
      ,[application_name]
      ,[machine_name]
      ,[ip_address]
      ,[userid]
      ,[error_message]
  FROM [AL].[dbo].[log_Err]
  order by error_id desc