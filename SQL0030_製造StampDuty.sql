USE [BL]
GO

/****** Object:  Table [dbo].[StampDuty]    Script Date: 2020/6/3 ¤U¤È 02:13:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StampDuty](
    [YM] [char](7) NOT NULL,
	[N] [int] NOT NULL,
	[ReceiptID] [char](7) NOT NULL,
	[SDATE] [datetime] NOT NULL,
	[BDATE] [datetime] NOT NULL,
	[dept] [nvarchar](6) NOT NULL,
	[cname] [nvarchar](255) NULL,
	[uid] [varchar](10) NOT NULL,
	[Bill] [int] NOT NULL,
	[Stamp] [int] NOT NULL,
	[Stat] [nvarchar](4) NOT NULL,
	[QDATE] [datetime] NOT NULL,
 CONSTRAINT [PK_StampDuty] PRIMARY KEY CLUSTERED 
(
	[YM] ASC,
	[N] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


