--��z���
declare @t table (SDATE datetime, VIST nvarchar(10), N int)

insert into @t
select	B.SDATE, B.VIST, count(B.CASENO) as N
from	[al].[dbo].[tbl_schedule] as A
		LEFT OUTER JOIN [al].[dbo].[tbl_opd] as B
		ON A.[SDATE]=B.[SDATE] and A.[VIST]=B.[VIST]
where	B.POSINAME='���O' and B.RMNO in (1, 3) 
group by B.SDATE, B.VIST

--�w�qCursor�å��}
DECLARE MyCursor Cursor FOR --�ŧi�A�W�٬�MyCursor
-- ���Ϭq�N�i�H���g�A����ƶ��A�p��X�W�٬�John�����
select	A.smid
		,A.sname
		,A.SDATE
		,A.VIST
		,A.N as o_N
		,B.N as t_N
from	al.dbo.tbl_schedule as A
		left outer join
		@t as B
		on A.SDATE=B.SDATE and A.VIST=B.VIST
where	A.N<>B.N or (A.N is null and B.N is not null)


Open MyCursor 

--print @@CURSOR_rows --�d���`����

--�w�q�ܼ�
declare @sname nvarchar(10)
declare	@smid int
declare @SDATE date
declare @VIST nvarchar(10)
declare @o_N tinyint
declare @t_N tinyint

--�}�l�j��]Cursor Start
Fetch NEXT FROM MyCursor INTO @smid, @sname, @SDATE, @VIST, @o_N, @t_N
While (@@FETCH_STATUS <> -1)
BEGIN

--���϶��N�i�H�B�z�ӷ~�޿�AĴ�p�Q��tableA��ID�N��ƶ�JtableB
/*
update [AL].[dbo].[tbl_schedule]
set [N]=@t_N
	where SDATE=@SDATE and VIST=@VIST
*/

--���Jlog_Adm�����
--insert into al.dbo.log_Adm
SELECT	getdate()
		,'check mission'
		,@@SERVERNAME
		,@@SERVICENAME
		,'Ford'
		,'tbl_schedule modification'
		,convert(varchar(10),@SDATE,111) + @VIST+' '+@sname+'��'+convert(varchar(10),@smid)+'�����E'+ (case when @o_N is null then 'New ' else convert(varchar(10),@o_N)+'->' end) + convert(varchar(10),@t_N)

Fetch NEXT FROM MyCursor INTO @smid, @sname, @SDATE, @VIST, @o_N, @t_N
END
--�}�l�j��]Cursor End

--����&����cursor
CLOSE MyCursor
DEALLOCATE MyCursor

