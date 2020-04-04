--created on 20200404
--比較兩份名單異同
--指出不一樣的部分
--舉例 香園 20200331 與 20200303
--這是比較簡單的,都是一個月

--取出名單
/*
declare @t1 table (uid varchar(10), PAYNO varchar(3))
declare @t2 table (uid varchar(10), PAYNO varchar(3))

insert into @t1
SELECT [uid]
      ,[PAYNO]
  FROM [al].[dbo].[tbl_opd]
  where	SDATE='20200116' and VIST ='上午' and RMNO=1

insert into @t2
SELECT [uid]
      ,[PAYNO]
  FROM [al].[dbo].[tbl_opd]
  where	SDATE='20200312' and VIST ='上午' and RMNO=1

select	*
from	@t1 as A
		left outer join
		@t2 as B
		on A.uid=B.uid
where	B.uid is null

select	*
from	@t1 as A
		right outer join
		@t2 as B
		on A.uid=B.uid
where	A.uid is null
*/

--所有會在今天看診的是處方今天到期的,也就是一個月前開一個月處方者, 以及兩個月前開兩個月的