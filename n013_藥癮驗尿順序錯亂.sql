declare @u nvarchar(10)
declare @d date
declare @c nvarchar(50)
declare @i tinyint
declare @t table (lid nvarchar(50), d tinyint)
declare @l nvarchar(50)
-- @u身分證字號
set @u='T122705976'
-- @d日期
set @d='2020/2/3'

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


update [al].[dbo].[tbl_lab_record]
set	[CASENO]=@c, [OD_idx]=@i
where lid=@l
