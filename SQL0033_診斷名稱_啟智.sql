declare	@t table (uid varchar(10), ICD1 varchar(5), ICD2 varchar(5), ICD3 varchar(5))

--第一步找出最近兩個月啟智的個案
insert into @t
select	distinct [uid]
		,[ICDCODE1]
		,[ICDCODE2]
		,[ICDCODE3]
from	[al].[dbo].[tbl_opd]
where	([SDATE]='20200910' and [VIST]='上午')
		or ([SDATE]='20200924' and [VIST]='上午')
		or ([SDATE]='20201008' and [VIST]='上午')
		or ([SDATE]='20201022' and [VIST]='上午')

select	A.[uid]
		, B.[cname]
		, B.[bd]
		, A.[ICD1]
		, C.[ICD9CM_cname] as ICD_name1
		, A.[ICD2]
		, D.[ICD9CM_cname] as ICD_name2
		, A.[ICD3]
		, E.[ICD9CM_cname] as ICD_name3
from	@t as A
		left outer join
		[al].[dbo].[tbl_patients] as B
		on A.[uid] = B.[uid]
		left outer join
		[al].[dbo].[p_ICD9] as C
		on A.[ICD1] = C.[ICD9_code]
		left outer join
		[al].[dbo].[p_ICD9] as D
		on A.[ICD2] = D.[ICD9_code]
		left outer join
		[al].[dbo].[p_ICD9] as E
		on A.[ICD3] = E.[ICD9_code]
order by	B.[cname]