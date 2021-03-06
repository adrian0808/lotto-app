USE [Lotto]
GO
/****** Object:  Table [dbo].[Losowania]    Script Date: 31.07.2020 16:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Losowania](
	[idlosowania] [int] IDENTITY(1,1) NOT NULL,
	[L_1] [int] NULL,
	[L_2] [int] NULL,
	[L_3] [int] NULL,
	[L_4] [int] NULL,
	[L_5] [int] NULL,
	[L_6] [int] NULL,
	[data_losowania] [date] NULL,
	[czy_odbylo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idlosowania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
