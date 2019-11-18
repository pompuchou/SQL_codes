/*
select	left(d19,3)+'.*' as diagnosis
		,count(*) as N
from	CL.dbo.xml_ddata
where	d27>=28
group by	left(d19,3)
order by	count(*) desc
*/
select	*
from	AL.dbo.p_ICD10
where	ICD10CM like 'E11%'
