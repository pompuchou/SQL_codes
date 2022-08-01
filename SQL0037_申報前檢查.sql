--20210205 
declare @begin_date date
declare @end_date date
declare @YM nvarchar(10)
declare @t1 table (iid nvarchar(50), sname nvarchar(10), uid nvarchar(10), bd date, cname nvarchar(50))

--設定日期
set @YM='11001'
set @begin_date=convert(nvarchar(8),convert(int,left(@YM,3))+1911)+right(@YM,2)+'01'
set @end_date=dateadd(dd,-1,dateadd(mm,1,@begin_date))


/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
--不是周孫元
SELECT [CASENO]
      ,[SDATE]
      ,[VIST]
      ,[RMNO]
      ,[uid]
      ,[DEPTNAME]
      ,[DOCTNAME]
      ,[POSINAME]
      ,[PAYNO]
      ,[HEATH_CARD]
      ,[ICDCODE1]
      ,[ICDCODE2]
      ,[ICDCODE3]
      ,[INS_CODE]
      ,[STEXT]
      ,[OTEXT]
      ,[Pijia]
      ,[t3]
      ,[d1]
      ,[d2]
      ,[QDATE]
  FROM [al].[dbo].[tbl_opd]
WHERE ([SDATE] between @begin_date and @end_date) and [DOCTNAME] <> '周孫元'

/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
--精神科特殊
SELECT [CASENO]
      ,[uid]
      ,[SDATE]
      ,[OD_idx]
      ,[rid]
      ,[TIMES_DAY]
      ,[METHOD]
      ,[TIME_QTY1]
      ,[DAYS]
      ,[BILL_QTY]
      ,[HC]
      ,[PRICE]
      ,[AMT]
      ,[CLASS]
      ,[CHRONIC]
      ,[QDATE]
  FROM [al].[dbo].[tbl_opd_order]
  WHERE ([SDATE] between @begin_date and @end_date) and rid in ('45010', '45046', '45102') and convert(float,[BILL_QTY])>1.0

--重大傷病
SELECT [CASENO]
      ,[SDATE]
      ,[VIST]
      ,[RMNO]
      ,[uid]
      ,[DEPTNAME]
      ,[DOCTNAME]
      ,[POSINAME]
      ,[PAYNO]
      ,[HEATH_CARD]
      ,[ICDCODE1]
      ,[ICDCODE2]
      ,[ICDCODE3]
      ,[INS_CODE]
      ,[STEXT]
      ,[OTEXT]
      ,[Pijia]
      ,[t3]
      ,[d1]
      ,[d2]
      ,[QDATE]
  FROM [al].[dbo].[tbl_opd]
WHERE ([SDATE] between @begin_date and @end_date) AND PAYNO='001' AND LEFT([ICDCODE1], 3) not in ('295', '299', '296', '294')