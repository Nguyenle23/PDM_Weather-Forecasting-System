USE [Weather]
GO
/****** Object:  Table [dbo].[login]    Script Date: 5/14/2021 8:31:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[username] [varchar](20) NOT NULL,
	[upassword] [varchar](20) NOT NULL,
	[role] [varchar](10) NULL,
	[Email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[weatherData]    Script Date: 5/14/2021 8:31:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weatherData](
	[wCity] [varchar](20) NOT NULL,
	[wDate] [date] NOT NULL,
	[MaxTemp] [varchar](10) NULL,
	[MinTemp] [varchar](10) NULL,
	[Weather] [varchar](30) NULL,
	[FeelsLike] [varchar](10) NULL,
	[Wind] [varchar](10) NULL,
	[Humidity] [varchar](10) NULL,
	[RainChance] [varchar](10) NULL,
	[RainAmount] [varchar](10) NULL,
	[UV] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[wCity] ASC,
	[wDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[weatherSaved]    Script Date: 5/14/2021 8:31:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weatherSaved](
	[savedID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[savedDate] [datetime] NULL,
	[wCity] [varchar](20) NULL,
	[wDate] [date] NULL,
	[MaxTemp] [varchar](20) NULL,
	[MinTemp] [varchar](20) NULL,
	[Weather] [varchar](30) NULL,
	[FeelsLike] [varchar](20) NULL,
	[Wind] [varchar](20) NULL,
	[Humidity] [varchar](20) NULL,
	[RainChance] [varchar](20) NULL,
	[RainAmount] [varchar](20) NULL,
	[UV] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[savedID] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[weatherSaved] ADD  CONSTRAINT [DF_weatherSaved_savedDate]  DEFAULT (getdate()) FOR [savedDate]
GO
ALTER TABLE [dbo].[weatherSaved]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[login] ([username])
GO
