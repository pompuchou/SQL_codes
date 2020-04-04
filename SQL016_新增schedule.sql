/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT [mid]
      ,[smid]
      ,[iid]
      ,[sname]
      ,[SDATE]
      ,[VIST]
      ,[N]
      ,[remark]
  FROM [al].[dbo].[tbl_schedule] as A
  order by SDATE, VIST desc
/*
insert into [al].[dbo].[tbl_schedule] ([mid], [smid], [iid], [sname], [SDATE], [VIST], [N], [remark])
Values (NULL, 1, '7833011187','華光','2020/03/18','下午',NULL,NULL),
       (NULL, 2, '7833011187','華光','2020/04/14','上午',NULL,NULL),
       (NULL, 3, '7833011187','華光','2020/05/12','上午',NULL,NULL),
       (NULL, 4, '7833011187','華光','2020/06/09','上午',NULL,NULL),
       (NULL, 5, '7833011187','華光','2020/07/07','上午',NULL,NULL),
       (NULL, 6, '7833011187','華光','2020/08/04','上午',NULL,NULL),
       (NULL, 7, '7833011187','華光','2020/09/01','上午',NULL,NULL),
       (NULL, 8, '7833011187','華光','2020/09/30','下午',NULL,NULL),
       (NULL, 9, '7833011187','華光','2020/10/27','上午',NULL,NULL),
       (NULL, 10, '7833011187','華光','2020/11/24','上午',NULL,NULL),
       (NULL, 11, '7833011187','華光','2020/12/22','上午',NULL,NULL)

update [al].[dbo].[tbl_schedule]
set mid=mid+7
where mid between 519 and 528

update [al].[dbo].[tbl_schedule]
set sdate='2018/2/6'
where iid='9833060511' and smid=9

update [al].[dbo].[tbl_schedule]
set mid=443
where iid='7833011187' and smid=1

update [al].[dbo].[tbl_schedule]
set mid=527
where iid='7832041494' and smid=97

update [al].[dbo].[tbl_schedule]
set mid=529
where iid='9N32100034' and smid=46

update [al].[dbo].[tbl_schedule]
set mid=257
where iid='7832041494' and smid=48

update [al].[dbo].[tbl_schedule]
set mid=258
where iid='7831091294' and smid=13

*/