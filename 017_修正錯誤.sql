﻿/*
另外要合併
AC453421G0	CLONOPAM TABLETS 0.5MG "KINGDOM"(CLONAZEPAM)(鋁箔/膠箔)	1950
AC453421G0	克癲平錠0.5毫克	28

AC09299100	LIGILIN CAPSULES	1294
AC09299100	鋰齊寧膠囊	56

AC49373100	PEDEN RETARD TABLETS 4 MG	804
AC49373100	帕登長效錠 4 毫克	56
*/

--看來p_order裡有重複值
select*
from	p_order
where r04 in ('AC453421G0','AC09299100','AC49373100')


--結論是我有key錯order