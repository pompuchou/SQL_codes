USE [BL]
GO

/****** Object:  Table [dbo].[Products]    Script Date: 2020/5/25 �W�� 10:19:22 ******/
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
�Ǹ� ��줤��W�� �� �� ����
1 New_mark c [NewMark] [varchar](2) NULL,
2 �f�A�����O c [OralMed] [varchar](10) NULL,
3 ��/�Ƥ���O c [Complex] [varchar](2) NULL,
4 �ī~�N�X c [NHI_code] [varchar](10) NULL,
5 �Ļ��ѦҪ��B N [NHI_price] [varchar](9) NULL,
6 �Ļ��ѦҤ�� D [begin_date] [varchar](7) NULL,
7 �Ļ��ѦҺI���� D [end_date] [varchar](7) NULL,
8 �ī~�^��W�� c [ename] [varchar](120) NULL,
9 �ī~�W��q N [spec_dose] [varchar](7) NULL,
10 �ī~�W���� c [spec_unit] [varchar](52) NULL,
11 �����W�� c [comp_name] [varchar](56) NULL,
12 �����t�q N [comp_dose] [varchar](12) NULL,
13 �����t�q��� c [comp_unit] [varchar](51) NULL,
14 �ī~���� c [prep] [varchar](86) NULL,
16 �İӦW�� c [vendor] [varchar](20) NULL,
18 �ī~���� c [clas] [varchar](1) NULL,
19 �~������X c [quality] [varchar](1) NULL,
20 �ī~����W�� c [cname] [varchar](128) NULL,
21 �������զW�� c [group_name] [varchar](300) NULL,
22 �]�Ƥ�@�^�����W�� c [comp1] [varchar](56) NULL,
23 �]�Ƥ�@�^�ī~�����t�q N [comp1_dose] [varchar](11) NULL,
24 �]�Ƥ�@�^�ī~�����t�q��� c [comp1_unit] [varchar](51) NULL,
25 �]�Ƥ�G�^�����W�� c [comp2] [varchar](56) NULL,
26 �]�Ƥ�G�^�ī~�����t�q N [comp2_dose] [varchar](11) NULL,
27 �]�Ƥ�G�^�ī~�����t�q��� c [comp2_unit] [varchar](51) NULL,
28 �]�Ƥ�T�^�����W�� c [comp3] [varchar](56) NULL,
29 �]�Ƥ�T�^�ī~�����t�q N [comp3_dose] [varchar](11) NULL,
30 �]�Ƥ�T�^�ī~�����t�q��� c [comp3_unit] [varchar](51) NULL,
31 �]�Ƥ�|�^�����W�� c [comp4] [varchar](56) NULL,
32 �]�Ƥ�|�^�ī~�����t�q N [comp4_dose] [varchar](11) NULL,
33 �]�Ƥ�|�^�ī~�����t�q��� c [comp4_unit] [varchar](51) NULL,
34 �]�Ƥ褭�^�����W�� c [comp5] [varchar](56) NULL,
35 �]�Ƥ褭�^�ī~�����t�q N [comp5_dose] [varchar](11) NULL,
36 �]�Ƥ褭�^�ī~�����t�q��� c [comp5_unit] [varchar](51) NULL,
37 �s�y�t�W�� c [manufacturer] [varchar](42) NULL,
38 ATC CODE c [ATC_code] [varchar](8) NULL,
39 ���Ͳ��Υ���J�F���~ c [NoProduce] [varchar](1) NULL

�Ǹ� ��줤��W�� �� �� ����
1 New_mark c 2
2 �f�A�����O c 10
3 ��/�Ƥ���O c 2
4 �ī~�N�X c 10
5 �Ļ��ѦҪ��B N 9,2
6 �Ļ��ѦҤ�� D 7
7 �Ļ��ѦҺI���� D 7
8 �ī~�^��W�� c 120
9 �ī~�W��q N 7,2
10 �ī~�W���� c 52
11 �����W�� c 56
12 �����t�q N 12,3
13 �����t�q��� c 51
14 �ī~���� c 86
15 �ť� c 158
16 �İӦW�� c 20
17 �ť� c 141
18 �ī~���� c 1
19 �~������X c 1
20 �ī~����W�� c 128
21 �������զW�� c 300
22 �]�Ƥ�@�^�����W�� c 56
23 �]�Ƥ�@�^�ī~�����t�q N 11,3
24 �]�Ƥ�@�^�ī~�����t�q��� c 51
25 �]�Ƥ�G�^�����W�� c 56
26 �]�Ƥ�G�^�ī~�����t�q N 11,3
27 �]�Ƥ�G�^�ī~�����t�q��� c 51
28 �]�Ƥ�T�^�����W�� c 56
29 �]�Ƥ�T�^�ī~�����t�q N 11,3
30 �]�Ƥ�T�^�ī~�����t�q��� c 51
31 �]�Ƥ�|�^�����W�� c 56
32 �]�Ƥ�|�^�ī~�����t�q N 11,3
33 �]�Ƥ�|�^�ī~�����t�q��� c 51
34 �]�Ƥ褭�^�����W�� c 56
35 �]�Ƥ褭�^�ī~�����t�q N 11,3
36 �]�Ƥ褭�^�ī~�����t�q��� c 51
37 �s�y�t�W�� c 42
38 ATC CODE c 8
39 ���Ͳ��Υ���J�F���~ c 1



*/