declare @u nvarchar(10)='H122034677'

SELECT *
  FROM [al].[dbo].[tbl_opd_order]
  where uid=@u

SELECT TOP (1000) [uid]
      ,[lid]
      ,[l05]
      ,[iid]
      ,[l07]
      ,[l09]
      ,[CASENO]
      ,[OD_idx]
  FROM [al].[dbo].[tbl_lab_record]
    where uid=@u

/*
	update [al].[dbo].[tbl_lab_record]
	set CASENO='AC191031302009', OD_idx=3
    where lid='01081102000108'-- and iid='043'
*/
