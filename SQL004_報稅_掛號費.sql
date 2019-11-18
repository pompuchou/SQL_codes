--掛號費 106年
/*
select	sum(convert(float,RegFee))
from	al.dbo.tbl_pijia
where	SDATE between '20170101' and '20171231'
		and RegFee not in (0, 950)
		and POSINAME not in ('自費')
*/

--掛號費 107年 

select	sum(convert(float,RegFee))
from	al.dbo.tbl_pijia
where	SDATE between '20180101' and '20181231'
		and RegFee not in (0, 950)
		and POSINAME not in ('自費')

--印花稅
--1,2	178705
--3,4	201499
--5,6	209993
--7,8	225106
--9,10	210724
--11,12	207855
--total	1233882
