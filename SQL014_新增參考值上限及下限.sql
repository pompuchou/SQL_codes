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
  where	(l11a is null and l11b is null) or l10 is null

update [AL].[dbo].[p_lab]
set	l11a='0', l10='COI'
where	iid='U24'

insert [AL].[dbo].[p_lab] ([iid]
      ,[l08]
      ,[l10]
      ,[l11]
      ,[l11a]
      ,[l11b]
      ,[rid]
      ,[nhi_code]
      ,[abb]
      ,[tub]
      ,[npo])
VALUES ('043A', 'Morphine-定量', NULL,'negative',NULL,NULL,NULL,'L-mor','Morphine-定量','尿',NULL),
VALUES ('030A', 'Methamphetamin-定量', NULL,'negative',NULL,NULL,NULL,'L-amp','Methamphetamin-定量','尿',NULL),
       ('351', 'LDH', 'U/L', '<250', NULL, '250', '09033','09033','LDH','生', NULL )

--VALUES ('452', 'C-Reactive Protein', 'mg/dl','<0.5',NULL,'5','12015C','12015C','CRP','生',NULL),
--       ('351', 'LDH', 'U/L', '<250', NULL, '250', '09033','09033','LDH','生', NULL )
--VALUES ('024A', 'Phenobarbital,Luminal', 'ug/ml','15-40,Toxic >40','15','40','10525B','10525B','Phenobarbital','生',NULL),

delete from [AL].[dbo].[p_lab]
where iid='030A'
