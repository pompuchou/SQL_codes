/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT count([RegFee])
  FROM [al].[dbo].[tbl_pijia]
  where YM between '10712' and '10811' and [RegFee] in (0, 50, 100) and [POSINAME]='健保'