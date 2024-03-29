USE [CPS_Solution]
GO
/****** Object:  Table [dbo].[LogFile]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogFile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Filename] [nvarchar](100) NOT NULL,
	[CreatedTime] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_LogFile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryDetail]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HistoryID] [int] NOT NULL,
	[ProductID1] [int] NULL,
	[ProductID2] [int] NULL,
	[ProductID3] [int] NULL,
 CONSTRAINT [PK_HistoryDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HistoryDetail] ON
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID1], [ProductID2], [ProductID3]) VALUES (1, 1, 1, 2, 3)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID1], [ProductID2], [ProductID3]) VALUES (2, 2, 2, 1, 8)
SET IDENTITY_INSERT [dbo].[HistoryDetail] OFF
/****** Object:  Table [dbo].[History]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[SearchTime] [datetime] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[History] ON
INSERT [dbo].[History] ([id], [Username], [SearchTime]) VALUES (1, N'member1', CAST(0x0000A34500000000 AS DateTime))
INSERT [dbo].[History] ([id], [Username], [SearchTime]) VALUES (2, N'member2', CAST(0x0000A3A100000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[History] OFF
/****** Object:  Table [dbo].[Codetype]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Codetype](
	[ID] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_codetype] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Codetype] ([ID], [Name]) VALUES (N'C', N'CPU')
INSERT [dbo].[Codetype] ([ID], [Name]) VALUES (N'D', N'Display')
INSERT [dbo].[Codetype] ([ID], [Name]) VALUES (N'H', N'HDD')
INSERT [dbo].[Codetype] ([ID], [Name]) VALUES (N'R', N'RAM')
INSERT [dbo].[Codetype] ([ID], [Name]) VALUES (N'V', N'VGA')
/****** Object:  Table [dbo].[AttributeDictionary]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeDictionary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Codetype] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[WeightCriteraPoint] [float] NOT NULL,
 CONSTRAINT [PK_AttributeDictionary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AttributeDictionary] ON
INSERT [dbo].[AttributeDictionary] ([ID], [Codetype], [Name], [WeightCriteraPoint]) VALUES (2, N'C', N'Core I3', 5)
INSERT [dbo].[AttributeDictionary] ([ID], [Codetype], [Name], [WeightCriteraPoint]) VALUES (3, N'C', N'Core I5', 7)
INSERT [dbo].[AttributeDictionary] ([ID], [Codetype], [Name], [WeightCriteraPoint]) VALUES (4, N'R', N'4GB ', 5)
INSERT [dbo].[AttributeDictionary] ([ID], [Codetype], [Name], [WeightCriteraPoint]) VALUES (5, N'R', N'2GB', 4)
INSERT [dbo].[AttributeDictionary] ([ID], [Codetype], [Name], [WeightCriteraPoint]) VALUES (6, N'R', N'6GB', 6)
INSERT [dbo].[AttributeDictionary] ([ID], [Codetype], [Name], [WeightCriteraPoint]) VALUES (7, N'H', N'320GB', 4)
INSERT [dbo].[AttributeDictionary] ([ID], [Codetype], [Name], [WeightCriteraPoint]) VALUES (8, N'H', N'500GB', 10)
INSERT [dbo].[AttributeDictionary] ([ID], [Codetype], [Name], [WeightCriteraPoint]) VALUES (9, N'H', N'1000GB', 15)
INSERT [dbo].[AttributeDictionary] ([ID], [Codetype], [Name], [WeightCriteraPoint]) VALUES (10, N'V', N'Gefore 210 1GB', 10)
INSERT [dbo].[AttributeDictionary] ([ID], [Codetype], [Name], [WeightCriteraPoint]) VALUES (11, N'V', N'Ati Radeon HD 5000 series', 10)
INSERT [dbo].[AttributeDictionary] ([ID], [Codetype], [Name], [WeightCriteraPoint]) VALUES (12, N'D', N'1024x768', 6)
SET IDENTITY_INSERT [dbo].[AttributeDictionary] OFF
/****** Object:  Table [dbo].[AttributeAlias]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeAlias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeDicID] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
 CONSTRAINT [PK_AttributeAlias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AttributeAlias] ON
INSERT [dbo].[AttributeAlias] ([ID], [AttributeDicID], [Name]) VALUES (1, 2, N'I3')
INSERT [dbo].[AttributeAlias] ([ID], [AttributeDicID], [Name]) VALUES (2, 3, N'I5')
INSERT [dbo].[AttributeAlias] ([ID], [AttributeDicID], [Name]) VALUES (3, 4, N'4GB DDR3')
INSERT [dbo].[AttributeAlias] ([ID], [AttributeDicID], [Name]) VALUES (4, 5, N'6GB DDR3')
INSERT [dbo].[AttributeAlias] ([ID], [AttributeDicID], [Name]) VALUES (5, 9, N'1TB')
INSERT [dbo].[AttributeAlias] ([ID], [AttributeDicID], [Name]) VALUES (6, 10, N'Gefore 210 ')
INSERT [dbo].[AttributeAlias] ([ID], [AttributeDicID], [Name]) VALUES (7, 11, N'Ati radeon 5000')
INSERT [dbo].[AttributeAlias] ([ID], [AttributeDicID], [Name]) VALUES (8, 12, N'1024*768')
SET IDENTITY_INSERT [dbo].[AttributeAlias] OFF
/****** Object:  Table [dbo].[Product]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nchar](2000) NULL,
	[URL] [nvarchar](200) NOT NULL,
	[Price] [float] NULL,
	[TotalPoint] [float] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ID], [Name], [Description], [URL], [Price], [TotalPoint], [IsActive]) VALUES (1, N'NB Dell 5437 (N5437A)', N'Laptop                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'http://phongvu.vn/may-tinh/may-tinh-xach-tay-laptop/dell/nb-dell-5437-n5437a-bac-8733.html', 12800000, 80, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [URL], [Price], [TotalPoint], [IsActive]) VALUES (2, N'NB Dell Vostro 5560 - V5560A', N'Laptop                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'http://phongvu.vn/may-tinh/may-tinh-xach-tay-laptop/dell/nb-dell-vostro-5560-v5560a.html', 14990000, 72, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [URL], [Price], [TotalPoint], [IsActive]) VALUES (3, N'NB Dell 7537 P02JD1 (I3-4010U) Bạc', N'Laptop                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'http://phongvu.vn/may-tinh/may-tinh-xach-tay-laptop/dell/nb-dell-7537-p02jd1-i34010u-bac.html', 13700000, 68, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [URL], [Price], [TotalPoint], [IsActive]) VALUES (4, N'NB Dell 7537 P02JD (I5-4200U) Bạc', N'Laptop                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'http://phongvu.vn/may-tinh/may-tinh-xach-tay-laptop/dell/nb-dell-7537-p02jd-i54200u-bac.html', 16300000, 90, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [URL], [Price], [TotalPoint], [IsActive]) VALUES (5, N'NB Dell 5537 - M5I52134 (Bạc)', N'Laptop                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'http://phongvu.vn/may-tinh/may-tinh-xach-tay-laptop/dell/nb-dell-5537-m5i52134-bac.html', 14400000, 77, 1)
INSERT [dbo].[Product] ([ID], [Name], [Description], [URL], [Price], [TotalPoint], [IsActive]) VALUES (8, N'NB Dell 5537 - 2NP1W1 (Bạc)', N'Laptop                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'http://phongvu.vn/may-tinh/may-tinh-xach-tay-laptop/dell/nb-dell-5537-2np1w1-bac.html', 14000000, 77, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[ParseInfo]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParseInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Parselink] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[CPUXPath] [nvarchar](200) NOT NULL,
	[RAMXPath] [nvarchar](200) NOT NULL,
	[VGAXPath] [nvarchar](200) NOT NULL,
	[HDDXPath] [nvarchar](200) NOT NULL,
	[DisplayXPath] [nvarchar](200) NOT NULL,
	[IsActive] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ParseInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Rolename] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT [dbo].[Role] ([ID], [Rolename]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([ID], [Rolename]) VALUES (2, N'staff')
INSERT [dbo].[Role] ([ID], [Rolename]) VALUES (3, N'member')
INSERT [dbo].[Role] ([ID], [Rolename]) VALUES (4, N'guest')
INSERT [dbo].[Role] ([ID], [Rolename]) VALUES (5, N'anonymous')
SET IDENTITY_INSERT [dbo].[Role] OFF
/****** Object:  Table [dbo].[RecommendProduct]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecommendProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Parselink] [nvarchar](200) NULL,
	[Name] [nvarchar](200) NULL,
	[RAM] [nvarchar](200) NULL,
	[HDD] [nvarchar](200) NULL,
	[VGA] [nvarchar](200) NULL,
	[Display] [nvarchar](200) NULL,
	[CPU] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
	[RecommendTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RecommendProduct] ON
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [RAM], [HDD], [VGA], [Display], [CPU], [IsActive], [RecommendTime]) VALUES (1, N'member1', N'http://hoanlong.com.vn/laptop-may-tinh-xach-tay/107-laptop-dell/26647-latitude-3540-l4i3h002.html', N'Latitude 3540 - L4I3H002', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [RAM], [HDD], [VGA], [Display], [CPU], [IsActive], [RecommendTime]) VALUES (2, N'member1', NULL, N'VOSTRO 5460 - VTI33004', N'2GB DDR3', N'500 GB', N'Share', N'14', N'Core i3', 1, NULL)
SET IDENTITY_INSERT [dbo].[RecommendProduct] OFF
/****** Object:  Table [dbo].[RatingProduct]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Point] [float] NOT NULL,
 CONSTRAINT [PK_a] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RatingProduct] ON
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (1, 1, N'member1', 5)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (2, 1, N'member2', 10)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (3, 1, N'guest', 9)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (5, 2, N'member1', 8)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (6, 3, N'member1', 7)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (7, 4, N'member1', 2)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (8, 5, N'member1', 6)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (9, 8, N'member1', 4)
SET IDENTITY_INSERT [dbo].[RatingProduct] OFF
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttribute](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CPU] [int] NOT NULL,
	[HDD] [int] NOT NULL,
	[VGA] [int] NOT NULL,
	[RAM] [int] NOT NULL,
	[Display] [int] NOT NULL,
 CONSTRAINT [PK_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProductAttribute] ON
INSERT [dbo].[ProductAttribute] ([ID], [CPU], [HDD], [VGA], [RAM], [Display]) VALUES (1, 2, 8, 10, 5, 12)
INSERT [dbo].[ProductAttribute] ([ID], [CPU], [HDD], [VGA], [RAM], [Display]) VALUES (2, 3, 7, 11, 6, 12)
SET IDENTITY_INSERT [dbo].[ProductAttribute] OFF
/****** Object:  Table [dbo].[ProductAlias]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAlias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ProductAlias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParseAttribute]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParseAttribute](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Codetype] [nvarchar](3) NOT NULL,
	[Parselink] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ParseAttribute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 06/09/2014 11:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[RoleID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'admin', N'123456', N'iv250509@gmail.com', 1, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'anonymous', N'123456', N'van_giau2411@yahoo.com', 5, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'guest', N'123456', N'sangphse60601@fpt.edu.vn', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'hanker12', N'hongsang', N'iv250509@gmail.com', 1, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'member1', N'123456', N'van_giau2411@yahoo.com', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'member2', N'123456', N'van_giau2411@yahoo.com', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'staff', N'123456', N'sangphse60601@fpt.edu.vn', 2, 1)
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 06/09/2014 11:43:27 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
/****** Object:  ForeignKey [FK_ParseAttribute_Codetype]    Script Date: 06/09/2014 11:43:27 ******/
ALTER TABLE [dbo].[ParseAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ParseAttribute_Codetype] FOREIGN KEY([Codetype])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[ParseAttribute] CHECK CONSTRAINT [FK_ParseAttribute_Codetype]
GO
/****** Object:  ForeignKey [FK_ProductAlias_Product]    Script Date: 06/09/2014 11:43:27 ******/
ALTER TABLE [dbo].[ProductAlias]  WITH CHECK ADD  CONSTRAINT [FK_ProductAlias_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductAlias] CHECK CONSTRAINT [FK_ProductAlias_Product]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Product]    Script Date: 06/09/2014 11:43:27 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([ID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
/****** Object:  ForeignKey [FK_RatingProduct_Product]    Script Date: 06/09/2014 11:43:27 ******/
ALTER TABLE [dbo].[RatingProduct]  WITH CHECK ADD  CONSTRAINT [FK_RatingProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[RatingProduct] CHECK CONSTRAINT [FK_RatingProduct_Product]
GO
