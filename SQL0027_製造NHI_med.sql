USE [BL]
GO

/****** Object:  Table [dbo].[Products]    Script Date: 2020/5/25 上午 10:19:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NHI_med](
	[NewMark] [varchar](2) NULL,
	[OralMed] [varchar](10) NULL,
	[Complex] [varchar](2) NULL,
	[NHI_code] [varchar](10) NOT NULL,
	[NHI_price] [varchar](9) NULL,
	[begin_date] [varchar](7) NOT NULL,
	[end_date] [varchar](7) NULL,
	[ename] [varchar](120) NULL,
	[spec_dose] [varchar](7) NULL,
	[spec_unit] [varchar](52) NULL,
	[comp_name] [varchar](56) NULL,
	[comp_dose] [varchar](12) NULL,
	[comp_unit] [varchar](51) NULL,
	[prep] [varchar](86) NULL,
	[vendor] [varchar](20) NULL,
	[clas] [varchar](1) NULL,
	[quality] [varchar](1) NULL,
	[cname] [varchar](128) NULL,
	[group_name] [varchar](300) NULL,
	[comp1] [varchar](56) NULL,
	[comp1_dose] [varchar](11) NULL,
	[comp1_unit] [varchar](51) NULL,
	[comp2] [varchar](56) NULL,
	[comp2_dose] [varchar](11) NULL,
	[comp2_unit] [varchar](51) NULL,
	[comp3] [varchar](56) NULL,
	[comp3_dose] [varchar](11) NULL,
	[comp3_unit] [varchar](51) NULL,
	[comp4] [varchar](56) NULL,
	[comp4_dose] [varchar](11) NULL,
	[comp4_unit] [varchar](51) NULL,
	[comp5] [varchar](56) NULL,
	[comp5_dose] [varchar](11) NULL,
	[comp5_unit] [varchar](51) NULL,
	[manufacturer] [varchar](42) NULL,
	[ATC_code] [varchar](8) NULL,
	[NoProduce] [varchar](1) NULL,
	[QDATE] [datetime] NOT NULL,
 CONSTRAINT [PK_NHI_med] PRIMARY KEY CLUSTERED 
(
	[NHI_code], [begin_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/*
序號 欄位中文名稱 屬 性 長度
1 New_mark c [NewMark] [varchar](2) NULL,
2 口服錠註記 c [OralMed] [varchar](10) NULL,
3 單/複方註記 c [Complex] [varchar](2) NULL,
4 藥品代碼 c [NHI_code] [varchar](10) NULL,
5 藥價參考金額 N [NHI_price] [varchar](9) NULL,
6 藥價參考日期 D [begin_date] [varchar](7) NULL,
7 藥價參考截止日期 D [end_date] [varchar](7) NULL,
8 藥品英文名稱 c [ename] [varchar](120) NULL,
9 藥品規格量 N [spec_dose] [varchar](7) NULL,
10 藥品規格單位 c [spec_unit] [varchar](52) NULL,
11 成份名稱 c [comp_name] [varchar](56) NULL,
12 成份含量 N [comp_dose] [varchar](12) NULL,
13 成份含量單位 c [comp_unit] [varchar](51) NULL,
14 藥品劑型 c [prep] [varchar](86) NULL,
16 藥商名稱 c [vendor] [varchar](20) NULL,
18 藥品分類 c [clas] [varchar](1) NULL,
19 品質分類碼 c [quality] [varchar](1) NULL,
20 藥品中文名稱 c [cname] [varchar](128) NULL,
21 分類分組名稱 c [group_name] [varchar](300) NULL,
22 （複方一）成份名稱 c [comp1] [varchar](56) NULL,
23 （複方一）藥品成份含量 N [comp1_dose] [varchar](11) NULL,
24 （複方一）藥品成份含量單位 c [comp1_unit] [varchar](51) NULL,
25 （複方二）成份名稱 c [comp2] [varchar](56) NULL,
26 （複方二）藥品成份含量 N [comp2_dose] [varchar](11) NULL,
27 （複方二）藥品成份含量單位 c [comp2_unit] [varchar](51) NULL,
28 （複方三）成份名稱 c [comp3] [varchar](56) NULL,
29 （複方三）藥品成份含量 N [comp3_dose] [varchar](11) NULL,
30 （複方三）藥品成份含量單位 c [comp3_unit] [varchar](51) NULL,
31 （複方四）成份名稱 c [comp4] [varchar](56) NULL,
32 （複方四）藥品成份含量 N [comp4_dose] [varchar](11) NULL,
33 （複方四）藥品成份含量單位 c [comp4_unit] [varchar](51) NULL,
34 （複方五）成份名稱 c [comp5] [varchar](56) NULL,
35 （複方五）藥品成份含量 N [comp5_dose] [varchar](11) NULL,
36 （複方五）藥品成份含量單位 c [comp5_unit] [varchar](51) NULL,
37 製造廠名稱 c [manufacturer] [varchar](42) NULL,
38 ATC CODE c [ATC_code] [varchar](8) NULL,
39 未生產或未輸入達五年 c [NoProduce] [varchar](1) NULL

序號 欄位中文名稱 屬 性 長度
1 New_mark c 2
2 口服錠註記 c 10
3 單/複方註記 c 2
4 藥品代碼 c 10
5 藥價參考金額 N 9,2
6 藥價參考日期 D 7
7 藥價參考截止日期 D 7
8 藥品英文名稱 c 120
9 藥品規格量 N 7,2
10 藥品規格單位 c 52
11 成份名稱 c 56
12 成份含量 N 12,3
13 成份含量單位 c 51
14 藥品劑型 c 86
15 空白 c 158
16 藥商名稱 c 20
17 空白 c 141
18 藥品分類 c 1
19 品質分類碼 c 1
20 藥品中文名稱 c 128
21 分類分組名稱 c 300
22 （複方一）成份名稱 c 56
23 （複方一）藥品成份含量 N 11,3
24 （複方一）藥品成份含量單位 c 51
25 （複方二）成份名稱 c 56
26 （複方二）藥品成份含量 N 11,3
27 （複方二）藥品成份含量單位 c 51
28 （複方三）成份名稱 c 56
29 （複方三）藥品成份含量 N 11,3
30 （複方三）藥品成份含量單位 c 51
31 （複方四）成份名稱 c 56
32 （複方四）藥品成份含量 N 11,3
33 （複方四）藥品成份含量單位 c 51
34 （複方五）成份名稱 c 56
35 （複方五）藥品成份含量 N 11,3
36 （複方五）藥品成份含量單位 c 51
37 製造廠名稱 c 42
38 ATC CODE c 8
39 未生產或未輸入達五年 c 1



*/