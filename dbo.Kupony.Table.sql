USE [Lotto]
GO
/****** Object:  Table [dbo].[Kupony]    Script Date: 31.07.2020 16:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kupony](
	[idkupon] [int] IDENTITY(1,1) NOT NULL,
	[idlosowania] [int] NULL,
	[L1] [int] NULL,
	[L2] [int] NULL,
	[L3] [int] NULL,
	[L4] [int] NULL,
	[L5] [int] NULL,
	[L6] [int] NULL,
	[liczba_trafien] [int] NULL,
	[data_kupna] [date] NULL,
	[wygrana] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[idkupon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kupony] ADD  DEFAULT ((-1)) FOR [liczba_trafien]
GO
ALTER TABLE [dbo].[Kupony] ADD  DEFAULT ((-1)) FOR [wygrana]
GO
ALTER TABLE [dbo].[Kupony]  WITH CHECK ADD FOREIGN KEY([idlosowania])
REFERENCES [dbo].[Losowania] ([idlosowania])
GO
ALTER TABLE [dbo].[Kupony]  WITH CHECK ADD CHECK  (([liczba_trafien]<=(6)))
GO
