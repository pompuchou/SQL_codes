﻿USE [AL]
GO
/****** Object:  StoredProcedure [dbo].[sp_PIJIA_for_opd]    Script Date: 2019/6/14 下午 12:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_PIJIA_for_opd]
as
declare @t table (CASENO nvarchar(50), bid nvarchar(50), SDATE nvarchar(50), VIST nvarchar(50), RMNO nvarchar(50), cname nvarchar(50))
declare @i integer
--第二步之一,確認opd的CASENO是1to1配pijia,若是就完成配對,若不是就傳回錯誤訊息,有幾筆錯誤
--真沒想到一人一天來兩次
insert into @t
select	CASENO, bid, SDATE, VIST, RMNO, cname
from	al.dbo.tbl_pijia
where	CASENO in
(select	CASENO
from	al.dbo.tbl_pijia
where	CASENO is not null
group by CASENO
having count(bid)>1)

select	@i=count(CASENO)
from	@t

--第二步之二,將opd配上Pijia
if @i=0
begin
update	al.dbo.tbl_opd
set	Pijia=B.bid
from	al.dbo.tbl_opd as A
		left outer join
		al.dbo.tbl_pijia as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.VIST=B.VIST and A.RMNO=B.RMNO and A.POSINAME=B.POSINAME and A.HEATH_CARD=B.HEATH_CARD
where	A.Pijia is null and B.bid is not null
end

select	*
from	@t