USE [BL]
GO

/****** Object:  Table [dbo].[NHI_hosp]    Script Date: 2020/6/1 ¤W¤È 10:06:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NHI_hosp](
	[Div] [char](1) NOT NULL,
	[NHI_code] [char](10) NOT NULL,
	[Nam] [nvarchar](50) NOT NULL,
	[Adr] [nvarchar](50) NULL,
	[Loc] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[Clas] [char](1) NOT NULL,
	[Form] [char](2) NOT NULL,
	[Typ] [char](1) NOT NULL,
	[end_date] [char](8) NULL,
	[Stat] [char](1) NULL,
	[QDATE] [datetime] NOT NULL,
 CONSTRAINT [PK_NHI_hosp] PRIMARY KEY CLUSTERED 
(
	[NHI_code] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


