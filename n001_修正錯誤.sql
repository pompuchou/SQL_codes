﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT [access_id]
      ,[regdate]
      ,[application_name]
      ,[machine_name]
      ,[ip_address]
      ,[userid]
      ,[operation_name]
      ,[description]
  FROM [AL].[dbo].[log_Adm]
  where access_id>31619
  where	description like 'AC%' and operation_name='Change patient data'
--  where access_id >18531
--where operation_name='Change patient data' and description not like '%改科別:%' and description not like '%改主訴:%' and description not like '%改客訴:%' and description not like '%改提醒:%' 

--update [AL].[dbo].[log_Adm]
--set operation_name='update opd order'
  set operation_name='update opd'
  where	description like 'AC%' and operation_name='Change patient data'
where	description like 'AC%' and operation_name='update opd'

/*
輸出格式：2008-02-27 00:25:13

SELECT CONVERT(char(19), getdate(), 120)

輸出格式：2008-02-27

SELECT CONVERT(char(10), getdate(), 20)

輸出格式：2008/02/27

SELECT CONVERT(char(10), getdate(), 111)

輸出格式：20080227

SELECT CONVERT(char(8), getdate(), 112)
*/

select	convert(nvarchar(50),regdate,112) as D,
		count(*) as N
from	AL.dbo.log_Adm
where	operation_name='Add a new patient'
group by	convert(nvarchar(50),regdate,112)


