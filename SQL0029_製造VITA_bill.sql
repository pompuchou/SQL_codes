USE [BL]
GO

/****** Object:  Table [dbo].[log_Adm]    Script Date: 2020/6/1 ¤U¤È 06:55:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VITA_bill](
	[bill_id] [bigint] IDENTITY(1,1) NOT NULL,
	[KaiDan] [datetime] NOT NULL,
	[CaiJian] [datetime] NOT NULL,
	[cname] [nvarchar](50) NULL,
	[cid] [varchar](10) NULL,
	[uid] [varchar](10) NOT NULL,
	[bd] [datetime] NULL,
	[items] [nvarchar](2000) NOT NULL,
	[bill] [int] NOT NULL,
	[QDATE] [datetime] NOT NULL,
 CONSTRAINT [PK_VITA_bill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


