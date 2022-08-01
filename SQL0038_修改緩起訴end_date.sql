/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
-- 找出多次治療者

SELECT	*
FROM	[BL].[dbo].[end_date_20210504]
where [uid] in (
SELECT [uid]
  FROM [CL].[dbo].[tbl_dp_sessions]
  where tick>1)

-- 發現只有陳忠發
-- T122298618
-- end_date
-- 2021-08-16

SELECT [uid]
		,[firstvisit_date]
		,[end_date]
into	[BL].[dbo].[end_date_20210504_before_insertion]
FROM [CL].[dbo].[tbl_dp_sessions]
WHERE sid <> 113 and [uid] in (SELECT [uid] FROM [BL].[dbo].[end_date_20210504])

SELECT A.[uid]
		,A.[firstvisit_date]
		,A.[end_date]
		,B.[end_date] as end_date_new
into	[BL].[dbo].[end_date_20210504_comparison]
FROM [CL].[dbo].[tbl_dp_sessions] AS A
	 LEFT OUTER JOIN
	 [BL].[dbo].[end_date_20210504] AS B
	 ON A.[UID]=B.[UID]
WHERE A.[sid] <> 113 AND B.[UID] is not null

UPDATE [CL].[dbo].[tbl_dp_sessions]
SET [end_date]=B.[end_date]
FROM [CL].[dbo].[tbl_dp_sessions] AS A
	 LEFT OUTER JOIN
	 [BL].[dbo].[end_date_20210504] AS B
	 ON A.[UID]=B.[UID]
WHERE A.[sid] <> 113 AND B.[UID] is not null


