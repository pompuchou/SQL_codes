--regfee method:
select	*
from al.dbo.tbl_pijia
where	regfee in (47, 48)

--uid state
select	*
from al.dbo.tbl_pijia
where	uid in
(select	distinct uid
from al.dbo.tbl_pijia
where	regfee in (47, 48))

--not in
select	*
from al.dbo.tbl_pijia
where	uid in
(select	distinct uid
from al.dbo.tbl_pijia
where	regfee in (47, 48))
		and CASENO not in
(select	distinct CASENO
from	al.dbo.tbl_opd_order
where	rid in ('DES01','SUB0'))

--NHI
select	*
from al.dbo.tbl_pijia
where	uid in
(select	distinct uid
from al.dbo.tbl_pijia
where	regfee in (47, 48))
		and CASENO not in
(select	distinct CASENO
from	al.dbo.tbl_opd_order
where	rid in ('DES01','SUB0'))
		and POSINAME='¦Û¶O'
		and SDATE>'20171231'
order by	SDATE
--regfee method: 307
--uid state: 906
--not in: 775
--NHI 604


