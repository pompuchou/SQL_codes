﻿/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
declare @a nvarchar(50)
declare @r nvarchar(50)

set @a='Marijuana'
set @r='L-can'

update [AL].[dbo].[p_lab]
set [abb]=@a
where rid=@r

/*
select	*
from  [AL].[dbo].[p_lab]
where	rid='09016C'

update  [AL].[dbo].[p_lab]
set	rid=''
where	iid='031'
where	iid in ('U01','U02','U03','U04','U06','U08','U09','U10','U11','U13','U14','U15','U17','U18','U20','U22','U24','U32','U38')

update  [AL].[dbo].[p_lab]
set	abb=l08
where	rid in ('09038','09039','14032C','14033C','14051C','14035C','14036C')

update  [AL].[dbo].[p_lab]
set	tub='生'
where	rid in ('10501C','10511C','10510C','09025C','09026C','09040','09038','09039','09029C','09030','09031','14032C','14033C','14051C','14035C','14036C','09002C','09015C','09013C','09001C','09004C','09043','09044','09017C','09064C','09020C','09035C','12116C','09021C','09022C','09023C','09011C','09012C','10520C','09117C','09010C','09112C','09106C','09120C','12007C','12081C')

update  [AL].[dbo].[p_lab]
set	tub='尿'
where	rid in ('L-amp','L-mor','L-can','12111C','09016C','06012C')

update  [AL].[dbo].[p_lab]
set	tub='灰'
where	rid in ('09005C')

update  [AL].[dbo].[p_lab]
set	tub='紫'
where	rid in ('09006C','08011C')

update  [AL].[dbo].[p_lab]
set	abb=NULL, rid=NULL
where	iid in ('385','306','255','218','107','031')

update  [AL].[dbo].[p_lab]
set	npo=null
where	rid not in ('09005C','09001C','09004C','09043','09044')

where	rid in ('385','306','255','218','107','031')

*/