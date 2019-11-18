declare	@u nvarchar(10)
set	@u='H123338087'

select	*
from	al.dbo.tbl_opd_order
where	uid=@u and CLASS='檢驗'

select	*
from	al.dbo.tbl_lab_record 
where	uid=@u

/*
update	al.dbo.tbl_lab_record
set		CASENO='AC190903502002', OD_idx=1
where	lid='01080907000089'

delete
from	al.dbo.tbl_lab_record
where	lid='01080821000122'

delete
from	al.dbo.tbl_lab
where	lid='01080821000122'

*/

