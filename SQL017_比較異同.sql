--created on 20200404
--�������W�沧�P
--���X���@�˪�����
--�|�� ���� 20200331 �P 20200303
--�o�O���²�檺,���O�@�Ӥ�

--���X�W��
/*
declare @t1 table (uid varchar(10), PAYNO varchar(3))
declare @t2 table (uid varchar(10), PAYNO varchar(3))

insert into @t1
SELECT [uid]
      ,[PAYNO]
  FROM [al].[dbo].[tbl_opd]
  where	SDATE='20200116' and VIST ='�W��' and RMNO=1

insert into @t2
SELECT [uid]
      ,[PAYNO]
  FROM [al].[dbo].[tbl_opd]
  where	SDATE='20200312' and VIST ='�W��' and RMNO=1

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

--�Ҧ��|�b���ѬݶE���O�B�褵�Ѩ����,�]�N�O�@�Ӥ�e�}�@�Ӥ�B���, �H�Ψ�Ӥ�e�}��Ӥ몺