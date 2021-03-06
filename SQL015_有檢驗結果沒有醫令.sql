﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT A.[lid]
      ,A.[uid]
	  ,C.cname
      ,A.[l05]
      ,A.[iid]
	  ,B.nhi_code
      ,A.[l07]
      ,A.[l09]
	  ,B.l08
FROM [AL].[dbo].[tbl_lab_record] as A
	left outer join
	al.dbo.p_lab as B
	on A.iid=B.iid
	left outer join
	[AL].[dbo].[tbl_patients] as C
	on A.uid=C.uid
where	A.CASENO is null and A.iid not in ('CBC-DC','URT','A','P1','P1-B')
  order by	A.l05, A.uid, A.iid

/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
/*
--20190605修改一下,這樣是不行的
SELECT A.[CASENO]
      ,A.[uid]
      ,A.[SDATE]
      ,A.[OD_idx]
      ,A.[rid]
	  ,C.cname
FROM [AL].[dbo].[tbl_opd_order] as A
	left outer join
	[AL].[dbo].[tbl_lab_record] as B
	on A.[CASENO]=B.[CASENO]
	left outer join
	[AL].[dbo].[tbl_patients] as C
	on A.uid=C.uid
where	A.[CLASS]='檢驗' and B.[CASENO] is Null --and A.SDATE between '20171005' and '20190522'
order by A.SDATE, A.uid
--要改成除了對上CASENO外,還有rid=nhi_code
*/
SELECT A.[CASENO]
      ,A.[uid]
	  ,C.cname
      ,A.[SDATE]
      ,A.[OD_idx]
      ,A.[rid]
	  ,D.l08
FROM [AL].[dbo].[tbl_opd_order] as A
	left outer join
	 [AL].[dbo].[tbl_lab_record] as B
	on A.[CASENO]=B.[CASENO] and A.[OD_idx]=B.[OD_idx]
	left outer join
	[AL].[dbo].[tbl_patients] as C
	on A.uid=C.uid
	left outer join
	[al].[dbo].[p_lab] as D
	on A.rid=D.rid
where	A.[CLASS]='檢驗' and A.rid not in ('L-Cho', 'L-VAL','L-Li','L-Carb','L-P100') and B.[CASENO] is Null --and A.SDATE between '20171005' and '20190522'
order by A.SDATE, A.uid


/*
--奇怪的身分證錯誤, H120869772 應該是
H120869772	01060627000094	2017-06-27	027	14.0	↓	Valproic Acid;Depakene	10510C	葉治栲
H120869772	01060627000094	2017-06-27	101	31		G.O.T	09025C	葉治栲
H120869772	01060627000094	2017-06-27	102	48	↑	G.P.T	09026C	葉治栲
AC170627101001	G120008189	2017-06-27	6	10510C	胡明德
AC170627101001	G120008189	2017-06-27	7	09025C	胡明德
AC170627101001	G120008189	2017-06-27	8	09026C	胡明德

H120869772	01070517000051	2018-05-17	027	41.3	↓	Valproic Acid;Depakene	10510C	葉治栲
H120869772	01070517000051	2018-05-17	101	72	↑	G.O.T	09025C	葉治栲
H120869772	01070517000051	2018-05-17	102	94	↑	G.P.T	09026C	葉治栲
AC180502301001	G120008189	2018-05-02	6	10510C	胡明德
AC180502301001	G120008189	2018-05-02	7	09025C	胡明德
AC180502301001	G120008189	2018-05-02	8	09026C	胡明德
--結果發現是我自己清單上把身分證字號弄錯了,怪不得人
*/
--這部分已經完成, 讚!

