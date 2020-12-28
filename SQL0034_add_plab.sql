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
  FROM [al].[dbo].[p_lab]

  insert into p_lab
  select	'V16'
			,'Occult Blood(化學法)'
			,''
			,'(-)'
			,'(-)'
			,NULL
			,'07001C'
			,'07001C'
			,'大便潛血'
			,'糞'
			,NULL

  insert into p_lab
  select	'557'
			,'β-HCG'
			,'mIU/ml'
			,'≦7.0'
			,NULL
			,'≦7.0'
			,'TM-BHCG'
			,'TM-BHCG'
			,'β-HCG'
			,'生'
			,NULL

  insert into p_lab
  select	'040'
			,'Pregnancy Test'
			,''
			,'(-)無懷孕,(+)有懷孕'
			,'(-)無懷孕'
			,'(+)有懷孕'
			,'06505C'
			,'06505C'
			,'Pregnancy Test'
			,'尿'
			,NULL

