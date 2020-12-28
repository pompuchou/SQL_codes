/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT	D.[cid] as 病歷號
		,D.[uid] as 身分證字號
		, D.[cname] as 姓名
		,(RANK() OVER (ORDER BY D.[uid], D.[SDATE])) - (RANK() OVER (ORDER BY D.[uid])) +1 as 次
	   ,D.SDATE as 日期
	   ,D.rid
	   ,D.p01 as 家中電話
	   ,D.p02 as 手機
FROM
(SELECT DISTINCT A.[uid]
      ,B.[cid]
      ,B.[cname]
	  ,B.[p01]
	  ,B.[p02]
      ,A.[SDATE]
      ,case A.[rid] when 'C-D01' then '初診' when 'C-D02' then '複' end as rid
  FROM [al].[dbo].[tbl_opd_order] as A
  left outer join
   [al].[dbo].[tbl_patients] as B
   on A.[uid]=B.[uid]
  where A.rid in ('C-D01', 'C-D02')) as D
  order by D.uid, D.SDATE