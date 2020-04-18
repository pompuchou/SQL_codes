--20200418 created
--當杏翔系統改動處方時, 處方順序會變動OD_idx, 此時就會對不上檢驗結果
--因此要將tbl_lab_record的CASENO, OD_idx歸為NULL, 再重新配對
declare @u nvarchar(10)
declare @d date
declare @c nvarchar(50)
declare @i tinyint
declare @t table (lid nvarchar(50), d int)
declare @l nvarchar(50)
-- @u身分證字號
set @u='C220136168'
-- @d日期
set @d='2020/4/17'

SELECT @c=[CASENO], @i=[OD_idx]
  FROM [al].[dbo].[tbl_opd_order]
where [uid]=@u and [SDATE]=@d and [CLASS]='檢驗'
order by [CASENO]

insert into @t
select A.lid, abs(datediff(d, @d, l05)) as d
from [al].[dbo].[tbl_lab_record] as A
where A.CASENO in (select B.[CASENO] from [al].[dbo].[tbl_lab_record] as B where B.[uid]=@u group by B.[CASENO] having count(B.[lid])>1)
order by A.[l05]

select	 @l=lid
from	@t
where	d=(select min(d) from @t)

select	*
from	[al].[dbo].[tbl_lab_record]
where lid=@l


--update	[al].[dbo].[tbl_lab_record]
--set	[CASENO]=NULL, [OD_idx]=NULL
--where lid=@l
