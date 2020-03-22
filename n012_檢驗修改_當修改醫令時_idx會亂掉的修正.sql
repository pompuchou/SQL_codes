declare @u nvarchar(10)
declare @d date
declare @c nvarchar(50)
-- @u身分證字號
set @u='A203905265'
--@d 日期, SDATE
set @d='2019/10/14'

set @c=
(SELECT distinct [CASENO]
  FROM [al].[dbo].[tbl_opd_order]
where [uid]=@u and [SDATE]=@d and [CLASS]='檢驗')

SELECT TOP (1000) [uid]
      ,[lid]
      ,[l05]
      ,[iid]
      ,[l07]
      ,[l09]
      ,[CASENO]
      ,[OD_idx]
  FROM [al].[dbo].[tbl_lab_record]
  where [CASENO]=@c

--/*
update [al].[dbo].[tbl_lab_record]
set CASENO=NULL, OD_idx=NULL
  where [CASENO]=@c
--*/