﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
--檢查醫令中誰還沒配對好
SELECT A.[CASENO]
      ,A.[uid]
      ,A.[SDATE]
      ,A.[OD_idx]
      ,A.[rid]
	  ,B.*
  FROM [AL].[dbo].[tbl_opd_order] as A
	left outer join
		[AL].[dbo].[tbl_lab_record] as B
	on A.[CASENO]=B.[CASENO] and A.[OD_idx]=B.[OD_idx]
  where A.[CLASS]='檢驗' and B.lid is null and A.rid not in ('L-VAL','L-Li','L-Carb','L-P100', 'L-Cho') and SDATE not in ('20190522','20190508') and SDATE >'20171004'
  order by A.SDATE, A.CASENO

--14030C 是什麼? 14032C, 所以是報錯了 5/17 林文生, 改過
--5/2 J122143567 漏掉了 5/12抽血, 刪除
--4/10
--4/24 有兩人漏了H222851029, H121664100, 已申報無法修改
--K120469603 張文君 2018/2/8, 2018/3/9 沒輸帳
--應該先處理尿液問題,重複的部分x3, 3IN1, 2IN1
--A123993198	01070414000006	2018-04-14	031	(-)		AC180414102006	6, 原本應該開mor, 結果開成安非他命, 不過驗的是對的,開錯單了

--檢查tbl_lab_record
--同人同天同iid不該有重複的CASENO, OD_idx
--還好沒有重複
/*
SELECT [uid]
      ,[iid]
      ,[CASENO]
      ,[OD_idx]
	  ,count(iid) as N
FROM [AL].[dbo].[tbl_lab_record]
where	[CASENO] is not null
group by	[uid]
      ,[iid]
      ,[CASENO]
      ,[OD_idx]
having	count(iid)>1
*/