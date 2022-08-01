/****** Script for SelectTopNRows command from SSMS  ******/
SELECT A.[uid]
      ,A.[lid]
      ,A.[l05]
      ,A.[iid]
      ,A.[l07]
      ,A.[l09]
      ,A.[CASENO]
      ,A.[OD_idx]
  FROM [al].[dbo].[tbl_lab_record] as A
  LEFT OUTER JOIN
(SELECT [iid]
	  ,[CASENO]
      ,[OD_idx]
  FROM [al].[dbo].[tbl_lab_record]
  WHERE [iid] in ('030','030A','043','043A','044') AND [CASENO] is not null
  GROUP BY [iid], [CASENO], [OD_idx]
  HAVING COUNT([lid])>1) as B
  ON A.[iid]=B.[iid] AND A.[CASENO]=B.[CASENO] AND A.[OD_idx]=B.[OD_idx]
WHERE B.[CASENO] IS NOT NULL