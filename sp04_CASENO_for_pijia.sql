﻿USE [AL]
GO
/****** Object:  StoredProcedure [dbo].[sp_CASENO_for_pijia]    Script Date: 2019/6/14 下午 12:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_CASENO_for_pijia]
as
--第一步,將Pijia配上CASENO,這一步驟Pijia必可配上一個CASENO,但可能多個PIJIA對一個CASENO
update	al.dbo.tbl_pijia
set	CASENO=B.CASENO, G=CASE WHEN LEFT(A.remark,2) in ('方舟','由根','春暉','香園','啟智','祥育','景仁','聖愛','桃園','誠信', '觀音') THEN 1 END
from	al.dbo.tbl_pijia as A
		left outer join
		al.dbo.tbl_opd as B
		on A.SDATE=B.SDATE and A.uid=B.uid and A.VIST=B.VIST and A.RMNO=B.RMNO and A.POSINAME=B.POSINAME and A.HEATH_CARD=B.HEATH_CARD
where A.CASENO is null and A.STATUS not in ('作廢','退沖') and len(A.bremark)=0

select @@rowcount rows_affected