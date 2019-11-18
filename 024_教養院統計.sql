-- sex
/*
select	distinct uid, substring(uid,2,1) as sex
from	BL.dbo.tbl_upload
order by substring(uid,2,1)
*/
/*
--age
declare @t table(uid varchar(10), bd date)

insert into @t
select	distinct uid
		, convert(date, convert(char(4),(convert(int,left(bd,3))+1911))+right(bd,4))
from	BL.dbo.tbl_upload

select	uid
		, convert(float, datediff(m, bd, getdate())/12.0) as age
from	@t
order by	uid
*/
--入住時間
declare @t table(uid varchar(10), insD date)

insert into @t
select	distinct uid
		, convert(date, convert(char(4),(convert(int,left(InsD ,3))+1911))+right(InsD ,4))
from	BL.dbo.tbl_upload

select	uid
		, convert(float, datediff(m, insD, getdate())/12.0) as duration
from	@t
order by	uid
/*
select	*
from	BL.dbo.tbl_upload
where	uid='F120860231'

update	BL.dbo.tbl_upload
set	bd='0611201'
where	uid='F120860231'
*/
