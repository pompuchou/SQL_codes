﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
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
  where	(l11a is null and l11b is null) or l10 is null

update [AL].[dbo].[p_lab]
set	l11a='0', l10='COI'
where	iid='U24'