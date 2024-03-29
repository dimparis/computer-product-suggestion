USE [CPS_Solution]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06/30/2014 09:59:14 ******/
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
INSERT [dbo].[Role] ([ID], [Rolename]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([ID], [Rolename]) VALUES (2, N'Staff')
INSERT [dbo].[Role] ([ID], [Rolename]) VALUES (3, N'Member')
INSERT [dbo].[Role] ([ID], [Rolename]) VALUES (4, N'Guest')
INSERT [dbo].[Role] ([ID], [Rolename]) VALUES (5, N'Anonymous')
SET IDENTITY_INSERT [dbo].[Role] OFF
/****** Object:  Table [dbo].[Codetype]    Script Date: 06/30/2014 09:59:14 ******/
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
INSERT [dbo].[Codetype] ([ID], [Name]) VALUES (N'D', N'DISPLAY')
INSERT [dbo].[Codetype] ([ID], [Name]) VALUES (N'H', N'HDD')
INSERT [dbo].[Codetype] ([ID], [Name]) VALUES (N'R', N'RAM')
INSERT [dbo].[Codetype] ([ID], [Name]) VALUES (N'V', N'VGA')
/****** Object:  Table [dbo].[LogFile]    Script Date: 06/30/2014 09:59:14 ******/
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
SET IDENTITY_INSERT [dbo].[LogFile] ON
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (1, N'3bqc35lt.diz.txt', CAST(0x0000A34C01171E2F AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (2, N'crlbeugi.dmq.txt', CAST(0x0000A34D009FC75D AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (3, N'mvyoqdbg.y3l.txt', CAST(0x0000A356003797ED AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (4, N'jzeslb11.q4r.txt', CAST(0x0000A3560039DA8F AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (5, N'tr05i5f1.vnh.txt', CAST(0x0000A356003EDB57 AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (6, N'qkc5ccbh.ckq.txt', CAST(0x0000A35600400E8F AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (7, N'psf2izy3.bkz.txt', CAST(0x0000A35600445B97 AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (8, N'ijvtxejz.ls4.txt', CAST(0x0000A35600452E38 AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (9, N'fma3fmej.nde.txt', CAST(0x0000A3560046C2AA AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (10, N'hszj4da4.lc4.txt', CAST(0x0000A356004A6759 AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (11, N'0dnqwafr.g4a.txt', CAST(0x0000A356004AF325 AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (12, N'pwuqazuz.qo4.txt', CAST(0x0000A356004F290B AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (13, N'c5jehrfh.r0z.txt', CAST(0x0000A3560050157A AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (14, N'qt2upqlh.pmy.txt', CAST(0x0000A357010513F6 AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (15, N'pe3ogjkk.fby.txt', CAST(0x0000A35701065A76 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[LogFile] OFF
/****** Object:  Table [dbo].[Product]    Script Date: 06/30/2014 09:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](2000) NULL,
	[URL] [nvarchar](200) NULL,
	[ImageURL] [nvarchar](200) NULL,
	[Price] [float] NULL,
	[TotalWeightPoint] [float] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ID], [Description], [URL], [ImageURL], [Price], [TotalWeightPoint], [IsActive]) VALUES (1, N'asdfghjkl;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'sdfsd', NULL, 12312, 70, 0)
INSERT [dbo].[Product] ([ID], [Description], [URL], [ImageURL], [Price], [TotalWeightPoint], [IsActive]) VALUES (2, N'dgd                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'gdf', NULL, 111, 50, 1)
INSERT [dbo].[Product] ([ID], [Description], [URL], [ImageURL], [Price], [TotalWeightPoint], [IsActive]) VALUES (3, NULL, N'kj', NULL, 1, 83, 1)
INSERT [dbo].[Product] ([ID], [Description], [URL], [ImageURL], [Price], [TotalWeightPoint], [IsActive]) VALUES (4, N'sdfsdfsd                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'erter', NULL, 1, 117, 1)
INSERT [dbo].[Product] ([ID], [Description], [URL], [ImageURL], [Price], [TotalWeightPoint], [IsActive]) VALUES (5, N'sdfsdfsd                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'dfsdf', NULL, 1, 97, 1)
INSERT [dbo].[Product] ([ID], [Description], [URL], [ImageURL], [Price], [TotalWeightPoint], [IsActive]) VALUES (6, N'wqewrtertu                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'a', NULL, 1, 97, 1)
INSERT [dbo].[Product] ([ID], [Description], [URL], [ImageURL], [Price], [TotalWeightPoint], [IsActive]) VALUES (7, N'sdfsdf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'sdfsd', NULL, 23312, 97, 1)
INSERT [dbo].[Product] ([ID], [Description], [URL], [ImageURL], [Price], [TotalWeightPoint], [IsActive]) VALUES (8, N'12312                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'sdfsd', NULL, 2131, 97, 1)
INSERT [dbo].[Product] ([ID], [Description], [URL], [ImageURL], [Price], [TotalWeightPoint], [IsActive]) VALUES (9, N'ewrwerw                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'dsfs', NULL, 1111, 72, 1)
INSERT [dbo].[Product] ([ID], [Description], [URL], [ImageURL], [Price], [TotalWeightPoint], [IsActive]) VALUES (10, N'21312                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'v', NULL, 23, 79, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[ParseInfo]    Script Date: 06/30/2014 09:59:14 ******/
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
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ParseInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ParseInfo] ON
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (1, N'http://www.thegioididong.com/laptop/acer-aspire-e1-410-001', N'//*[@id=''wrapper-detail-page'']/div[1]/span[1]/h1/b', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[1]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[2]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[6]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[3]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[4]/td[2]', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (4, N'http://www.thegioididong.com/laptop/acer-aspire-e1-470-33212g50dn', N'//*[@id=''wrapper-detail-page'']/div[1]/span[1]/h1/b', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[1]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[2]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[6]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[3]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[4]/td[2]', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (5, N'http://www.thegioididong.com/laptop/acer-aspire-e1-410-001', N'//*[@id=''wrapper-detail-page'']/div[1]/span[1]/h1/b', N'//*[@id=''wrapper-detail-page'']/div[1]/span[1]/h1/b', N'//*[@id=''wrapper-detail-page'']/div[1]/span[2]', N'//*[@id=''wrapper-detail-page'']/div[1]/span[1]/h1/b', N'//*[@id=''wrapper-detail-page'']/div[1]/span[2]', N'//*[@id=''wrapper-detail-page'']/div[1]/span[2]', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (6, N'http://www.thegioididong.com/laptop/acer-aspire-e1-410-001', N'//*[@id=''wrapper-detail-page'']/div[1]/span[1]/h1/b', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[1]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[2]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[6]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[3]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[4]/td[2]', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (7, N'http://www.thegioididong.com/laptop/acer-aspire-e1-410-001', N'//*[@id=''wrapper-detail-page'']/div[1]/span[1]/h1/b', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[1]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[2]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[6]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[3]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[4]/td[2]', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (8, N'http://www.thegioididong.com/laptop/acer-aspire-e1-410-001', N'//*[@id=''wrapper-detail-page'']/div[1]/span[1]/h1/b', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[1]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[2]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[6]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[3]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[4]/td[2]', 1)
SET IDENTITY_INSERT [dbo].[ParseInfo] OFF
/****** Object:  Table [dbo].[ParseAttribute]    Script Date: 06/30/2014 09:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParseAttribute](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodetypeID] [nvarchar](3) NOT NULL,
	[ParseAttributelink] [nvarchar](200) NOT NULL,
	[NameXPath] [nvarchar](200) NOT NULL,
	[PointXPath] [nvarchar](200) NOT NULL,
	[PagingXPath] [nvarchar](200) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ParseAttribute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ParseAttribute] ON
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PointXPath], [PagingXPath], [IsActive]) VALUES (1, N'C', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', N'//*[@id=''productTable'']/tr[i]/td[6]/span[1]', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PointXPath], [PagingXPath], [IsActive]) VALUES (2, N'C', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', N'//*[@id=''productTable'']/tr[i]/td[6]/span[1]', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PointXPath], [PagingXPath], [IsActive]) VALUES (3, N'C', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', N'//*[@id=''productTable'']/tr[i]/td[6]/span[1]', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PointXPath], [PagingXPath], [IsActive]) VALUES (4, N'V', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', N'//*[@id=''productTable'']/tr[i]/td[6]/span[1]', NULL, 1)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PointXPath], [PagingXPath], [IsActive]) VALUES (5, N'C', N'http://www.futuremark.com/hardware/cpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', N'//*[@id=''productTable'']/tr[i]/td[6]/span[1]', NULL, 1)
SET IDENTITY_INSERT [dbo].[ParseAttribute] OFF
/****** Object:  Table [dbo].[AttributeDictionary]    Script Date: 06/30/2014 09:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeDictionary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodetypeID] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[WeightCriteraPoint] [float] NOT NULL,
 CONSTRAINT [PK_AttributeDictionary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AttributeDictionary] ON
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (437, N'H', N'HDD 500GB', 50)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (438, N'H', N'HDD 320GB', 32)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (440, N'H', N'HDD 1TB', 80)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (441, N'H', N'HDD 720GB', 70)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (442, N'R', N'Ram 8GB', 5)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (443, N'R', N'Ram 4GB', 4)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (444, N'R', N'Ram 2GB', 2)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (445, N'R', N'Ram 1GB', 1)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (446, N'D', N'1366X768', 10)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (447, N'D', N'1366X1024', 5)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (448, N'D', N'1024X768', 8)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (449, N'V', N'AMD Radeon HD 7990', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (450, N'V', N'NVIDIA GeForce GTX 690', 13)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (451, N'V', N'AMD Radeon R9 290X', 36)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (452, N'V', N'AMD Radeon HD 8860', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (453, N'V', N'AMD Radeon HD 7870 XT', 22)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (454, N'V', N'ATI Radeon HD 5970', 11)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (455, N'V', N'AMD Radeon HD 8970M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (456, N'V', N'AMD Radeon HD 7850', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (457, N'V', N'NVIDIA GeForce GTX 560 Ti 448', 20)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (458, N'V', N'NVIDIA GeForce GTX 650 Ti Boost', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (459, N'V', N'AMD Radeon R7 260X', 44)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (460, N'V', N'AMD Radeon HD 6930', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (461, N'V', N'Intel HD Graphics 4600', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (462, N'V', N'AMD FirePro W5000', 9)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (463, N'V', N'AMD Radeon HD 7770', 36)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (464, N'V', N'ATI Radeon HD 5850', 12)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (465, N'V', N'AMD Radeon HD 6970M / 6990M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (466, N'V', N'AMD Radeon HD 7660D', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (467, N'V', N'NVIDIA GeForce GT 750M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (468, N'V', N'AMD Radeon HD 7640G', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (469, N'V', N'ATI Mobility Radeon HD 5870', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (470, N'V', N'AMD Radeon HD 6550D', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (471, N'V', N'NVIDIA GeForce GT 640 (GK208)', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (472, N'V', N'NVIDIA GeForce GT 640 (GDDR5)', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (473, N'V', N'NVIDIA GeForce GT 745M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (474, N'V', N'AMD Radeon HD 8750M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (475, N'V', N'AMD Radeon HD 7730M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (476, N'V', N'AMD Radeon HD 8670D', 13)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (477, N'V', N'NVIDIA NVS 5400M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (478, N'V', N'Intel HD Graphics 4200 Mobile', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (479, N'V', N'ATI Mobility Radeon HD 5650/5750', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (480, N'V', N'AMD Radeon HD 7540D', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (481, N'C', N'Intel Core i7-4960X', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (482, N'C', N'Intel Core i7-4930K', 22)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (483, N'C', N'Intel Core i7-3970X Extreme Edition ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (484, N'C', N'Intel Core i7-4820K', 36)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (485, N'C', N'Intel Core i7-4790 ', 30)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (486, N'C', N'Intel Core i7-990X ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (487, N'C', N'Intel Core i7-970  ', 13)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (488, N'C', N'Intel Core i7-3770K ', 27)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (489, N'C', N'Intel Core i7-2700K ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (490, N'C', N'AMD FX-9590', 24)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (491, N'C', N'AMD FX-9370', 32)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (492, N'C', N'Intel Core i7-4900MQ', 13)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (493, N'C', N'AMD FX-4350', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (494, N'C', N'Intel Core i5-4690 ', 32)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (495, N'C', N'AMD FX-8350', 38)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (496, N'C', N'Intel Core i7-4700HQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (497, N'C', N'AMD FX-6350', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (498, N'C', N'Intel Core i7-4712MQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (499, N'C', N'AMD FX-4300', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (500, N'C', N'Intel Core i7-3840QM', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (501, N'C', N'AMD FX-4170', 27)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (502, N'C', N'Intel Core i5-3570K ', 31)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (503, N'C', N'Intel Core i5-4440', 35)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (504, N'C', N'Intel Core i5-2550K ', 21)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (505, N'C', N'AMD FX-6300', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (506, N'C', N'AMD FX-8320', 41)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (507, N'C', N'Intel Core i7-875K  ', 17)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (508, N'C', N'Intel Core i7-3720QM ', 12)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (509, N'C', N'AMD FX-6200', 41)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (510, N'C', N'AMD FX-4130', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (511, N'C', N'Intel Core i5-2400 ', 28)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (512, N'C', N'Intel Core i5-3450 ', 28)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (513, N'C', N'AMD FX-8300', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (514, N'C', N'Intel Core i5-2320 ', 29)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (515, N'C', N'Intel Core i7-860 ', 17)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (516, N'C', N'AMD FX-8150', 19)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (517, N'C', N'AMD FX-4100', 9)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (518, N'C', N'Intel Core i7-3630QM ', 18)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (519, N'C', N'Intel Core i7-3940XM', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (520, N'C', N'Intel Core i7-4600U ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (521, N'C', N'Intel Core i7-3615QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (522, N'C', N'AMD FX-6100', 36)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (523, N'C', N'AMD FX-8120', 18)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (524, N'C', N'AMD Phenom II X6 1100T', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (525, N'C', N'Intel Core i7-2760QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (526, N'C', N'Intel Core i7-2820QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (527, N'C', N'AMD Phenom II X6 1605T', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (528, N'C', N'Intel Core i5-760 ', 20)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (529, N'C', N'Intel Core i7-2670QM ', 20)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (530, N'C', N'Intel Core i5  I5-750', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (531, N'C', N'AMD Phenom II X6 1045T ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (532, N'C', N'Intel Core 2 Extreme  QX9650', 6)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (533, N'C', N'Intel Core i3-3240', 34)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (534, N'C', N'AMD Phenom II X4 965', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (535, N'C', N'Intel Core i5-3330', 22)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (536, N'C', N'AMD A10-6800K', 30)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (537, N'C', N'Intel Core i3-2120 ', 33)
GO
print 'Processed 100 total records'
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (538, N'C', N'Intel Core i5-4570S', 21)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (539, N'C', N'Intel Core 2 Quad  Q9650', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (540, N'C', N'AMD A10-6790K', 29)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (541, N'C', N'AMD A8-6600K', 41)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (542, N'C', N'AMD Athlon X4 760K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (543, N'C', N'AMD A10-5800K', 33)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (544, N'C', N'AMD A10-6700', 24)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (545, N'C', N'Intel Core i5-4200H', 5)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (546, N'C', N'AMD A4-3870K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (547, N'C', N'AMD A8-3850', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (548, N'C', N'AMD A8-5600K', 38)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (549, N'C', N'AMD A6-5400K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (550, N'C', N'Intel Pentium G3420', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (551, N'C', N'AMD A4-3670K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (552, N'C', N'Intel Core 2 Quad  Q8400', 31)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (553, N'C', N'AMD Athlon II X4 641', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (554, N'C', N'Intel Core 2 Quad  Q6700', 31)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (555, N'C', N'AMD Athlon X4 740', 42)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (556, N'C', N'Intel Core i5-3210M ', 22)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (557, N'C', N'Intel Core 2 Quad  Q9300', 39)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (558, N'C', N'AMD A8-5500', 32)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (559, N'C', N'Intel Core i3-540 ', 17)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (560, N'C', N'Intel Core i3-3110M', 34)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (561, N'C', N'Intel Pentium  G2030', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (562, N'C', N'AMD Athlon II X4 Quad-Core  630', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (563, N'C', N'AMD Phenom II X3 720', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (564, N'C', N'AMD Phenom X4  9850', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (565, N'C', N'Intel Core 2 Duo  E8600', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (566, N'C', N'AMD A10-5750M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (567, N'C', N'AMD Athlon II X3 455', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (568, N'C', N'Intel Core 2 Duo  E7500', 10)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (569, N'C', N'AMD A10-4600M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (570, N'C', N'AMD A4-5000', 10)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (571, N'C', N'AMD Phenom II X2 555 BE', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (572, N'C', N'AMD Athlon II X2 270', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (573, N'C', N'Intel Pentium Dual-Core E5200', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (574, N'C', N'AMD Athlon 64 X2  5200+', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (575, N'C', N'Intel, Celeron, N2920, 1.86 GHz', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (576, N'R', N'DDR3L (2 khe RAM), 2 GB', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (577, N'H', N'HDD, 500 GB', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (578, N'V', N'Intel® HD Graphics, 32 MB Share 966 MB', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (579, N'D', N'14 inch, HD (1366 x 768 pixels)', 0)
SET IDENTITY_INSERT [dbo].[AttributeDictionary] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 06/30/2014 09:59:14 ******/
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
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'hanker12', N'123456', N'iv250509@gmail.com', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'member1', N'123456', N'iv250509@gmail.com', 3, 1)
/****** Object:  Table [dbo].[ProductAlias]    Script Date: 06/30/2014 09:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAlias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IsMain] [bit] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProductAlias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProductAlias] ON
INSERT [dbo].[ProductAlias] ([ID], [ProductID], [Name], [IsMain], [IsActive]) VALUES (1, 1, N'SangPH', 1, 1)
INSERT [dbo].[ProductAlias] ([ID], [ProductID], [Name], [IsMain], [IsActive]) VALUES (2, 1, N'SangPH1', 0, 1)
INSERT [dbo].[ProductAlias] ([ID], [ProductID], [Name], [IsMain], [IsActive]) VALUES (3, 1, N'SangPH2', 0, 1)
INSERT [dbo].[ProductAlias] ([ID], [ProductID], [Name], [IsMain], [IsActive]) VALUES (4, 1, N'K45', 0, 1)
INSERT [dbo].[ProductAlias] ([ID], [ProductID], [Name], [IsMain], [IsActive]) VALUES (5, 4, N'Hong Sang', 1, 0)
INSERT [dbo].[ProductAlias] ([ID], [ProductID], [Name], [IsMain], [IsActive]) VALUES (6, 5, N'TEST', 1, 0)
INSERT [dbo].[ProductAlias] ([ID], [ProductID], [Name], [IsMain], [IsActive]) VALUES (7, 6, N'zzz', 1, 0)
INSERT [dbo].[ProductAlias] ([ID], [ProductID], [Name], [IsMain], [IsActive]) VALUES (8, 7, N'sefsd', 1, 0)
INSERT [dbo].[ProductAlias] ([ID], [ProductID], [Name], [IsMain], [IsActive]) VALUES (9, 8, N'we', 1, 0)
INSERT [dbo].[ProductAlias] ([ID], [ProductID], [Name], [IsMain], [IsActive]) VALUES (10, 9, N'rrrr', 1, 0)
INSERT [dbo].[ProductAlias] ([ID], [ProductID], [Name], [IsMain], [IsActive]) VALUES (11, 10, N'vvv', 1, 0)
SET IDENTITY_INSERT [dbo].[ProductAlias] OFF
/****** Object:  Table [dbo].[RatingProduct]    Script Date: 06/30/2014 09:59:14 ******/
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
/****** Object:  Table [dbo].[RecommendProduct]    Script Date: 06/30/2014 09:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecommendProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Parselink] [nvarchar](200) NULL,
	[Name] [nvarchar](200) NULL,
	[RecommendTime] [datetime] NULL,
	[IsApprove] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RecommendProduct] ON
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [RecommendTime], [IsApprove]) VALUES (1, N'hanker12', N'http://www.thegioididong.com/laptop/acer-aspire-e1-410-001', N'K45', CAST(0x0000A34200000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [RecommendTime], [IsApprove]) VALUES (2, N'member1', N'http://www.thegioididong.com/laptop/acer-aspire-e1-410-001', N'DGDF', CAST(0x0000A34200000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [RecommendTime], [IsApprove]) VALUES (7, N'member1', N'http://www.thegioididong.com/laptop/acer-aspire-e1-410-001', N'DFGDF', CAST(0x0000A34200000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [RecommendTime], [IsApprove]) VALUES (8, N'member1', N'http://www.thegioididong.com/laptop/acer-aspire-e1-410-001', N'dfgd', CAST(0x0000A34200000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [RecommendTime], [IsApprove]) VALUES (9, N'member1', N'http://www.thegioididong.com/laptop/acer-aspire-e1-470-33212g50dn', N'dfd', CAST(0x0000A34200000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[RecommendProduct] OFF
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 06/30/2014 09:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttribute](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[AttributeID] [int] NOT NULL,
 CONSTRAINT [PK_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProductAttribute] ON
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (1, 3, 544)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (2, 3, 443)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (3, 3, 437)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (4, 3, 447)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (5, 3, 470)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (6, 4, 543)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (7, 4, 443)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (8, 4, 441)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (9, 4, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (10, 4, 480)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (11, 5, 569)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (12, 5, 576)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (13, 5, 440)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (14, 5, 448)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (15, 5, 462)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (16, 6, 569)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (17, 6, 576)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (18, 6, 440)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (19, 6, 448)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (20, 6, 462)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (21, 7, 569)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (22, 7, 576)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (23, 7, 440)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (24, 7, 448)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (25, 7, 462)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (26, 8, 569)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (27, 8, 576)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (28, 8, 440)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (29, 8, 448)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (30, 8, 462)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (31, 9, 551)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (32, 9, 444)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (33, 9, 441)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (34, 9, 579)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (35, 9, 465)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (36, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (37, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (38, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (39, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (40, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (41, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (42, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (43, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (44, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (45, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (46, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (47, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (48, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (49, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (50, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (51, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (52, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (53, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (54, 10, 446)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID]) VALUES (55, 10, 446)
SET IDENTITY_INSERT [dbo].[ProductAttribute] OFF
/****** Object:  Table [dbo].[AttributeMapping]    Script Date: 06/30/2014 09:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeDicID] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_AttributeMapping] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AttributeMapping] ON
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (377, 449, N'AMD Radeon HD 7990', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (378, 450, N'NVIDIA GeForce GTX 690', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (379, 451, N'AMD Radeon R9 290X', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (380, 452, N'AMD Radeon HD 8860', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (381, 453, N'AMD Radeon HD 7870 XT', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (382, 454, N'ATI Radeon HD 5970', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (383, 455, N'AMD Radeon HD 8970M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (384, 456, N'AMD Radeon HD 7850', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (385, 457, N'NVIDIA GeForce GTX 560 Ti 448', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (386, 458, N'NVIDIA GeForce GTX 650 Ti Boost', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (387, 459, N'AMD Radeon R7 260X', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (388, 460, N'AMD Radeon HD 6930', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (389, 461, N'Intel HD Graphics 4600', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (390, 462, N'AMD FirePro W5000', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (391, 463, N'AMD Radeon HD 7770', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (392, 464, N'ATI Radeon HD 5850', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (393, 465, N'AMD Radeon HD 6970M / 6990M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (394, 466, N'AMD Radeon HD 7660D', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (395, 467, N'NVIDIA GeForce GT 750M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (396, 468, N'AMD Radeon HD 7640G', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (397, 469, N'ATI Mobility Radeon HD 5870', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (398, 470, N'AMD Radeon HD 6550D', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (399, 471, N'NVIDIA GeForce GT 640 (GK208)', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (400, 472, N'NVIDIA GeForce GT 640 (GDDR5)', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (401, 473, N'NVIDIA GeForce GT 745M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (402, 474, N'AMD Radeon HD 8750M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (403, 475, N'AMD Radeon HD 7730M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (404, 476, N'AMD Radeon HD 8670D', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (405, 477, N'NVIDIA NVS 5400M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (406, 478, N'Intel HD Graphics 4200 Mobile', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (407, 479, N'ATI Mobility Radeon HD 5650/5750', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (408, 480, N'AMD Radeon HD 7540D', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (409, 481, N'Intel Core i7-4960X', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (410, 482, N'Intel Core i7-4930K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (411, 483, N'Intel Core i7-3970X Extreme Edition ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (412, 484, N'Intel Core i7-4820K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (413, 485, N'Intel Core i7-4790 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (414, 486, N'Intel Core i7-990X ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (415, 487, N'Intel Core i7-970  ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (416, 488, N'Intel Core i7-3770K ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (417, 489, N'Intel Core i7-2700K ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (418, 490, N'AMD FX-9590', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (419, 491, N'AMD FX-9370', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (420, 492, N'Intel Core i7-4900MQ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (421, 493, N'AMD FX-4350', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (422, 494, N'Intel Core i5-4690 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (423, 495, N'AMD FX-8350', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (424, 496, N'Intel Core i7-4700HQ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (425, 497, N'AMD FX-6350', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (426, 498, N'Intel Core i7-4712MQ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (427, 499, N'AMD FX-4300', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (428, 500, N'Intel Core i7-3840QM', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (429, 501, N'AMD FX-4170', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (430, 502, N'Intel Core i5-3570K ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (431, 503, N'Intel Core i5-4440', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (432, 504, N'Intel Core i5-2550K ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (433, 505, N'AMD FX-6300', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (434, 506, N'AMD FX-8320', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (435, 507, N'Intel Core i7-875K  ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (436, 508, N'Intel Core i7-3720QM ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (437, 509, N'AMD FX-6200', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (438, 510, N'AMD FX-4130', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (439, 511, N'Intel Core i5-2400 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (440, 512, N'Intel Core i5-3450 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (441, 513, N'AMD FX-8300', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (442, 514, N'Intel Core i5-2320 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (443, 515, N'Intel Core i7-860 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (444, 516, N'AMD FX-8150', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (445, 517, N'AMD FX-4100', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (446, 518, N'Intel Core i7-3630QM ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (447, 519, N'Intel Core i7-3940XM', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (448, 520, N'Intel Core i7-4600U ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (449, 521, N'Intel Core i7-3615QM ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (450, 522, N'AMD FX-6100', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (451, 523, N'AMD FX-8120', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (452, 524, N'AMD Phenom II X6 1100T', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (453, 525, N'Intel Core i7-2760QM ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (454, 526, N'Intel Core i7-2820QM ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (455, 527, N'AMD Phenom II X6 1605T', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (456, 528, N'Intel Core i5-760 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (457, 529, N'Intel Core i7-2670QM ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (458, 530, N'Intel Core i5  I5-750', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (459, 531, N'AMD Phenom II X6 1045T ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (460, 532, N'Intel Core 2 Extreme  QX9650', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (461, 533, N'Intel Core i3-3240', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (462, 534, N'AMD Phenom II X4 965', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (463, 535, N'Intel Core i5-3330', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (464, 536, N'AMD A10-6800K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (465, 537, N'Intel Core i3-2120 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (466, 538, N'Intel Core i5-4570S', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (467, 539, N'Intel Core 2 Quad  Q9650', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (468, 540, N'AMD A10-6790K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (469, 541, N'AMD A8-6600K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (470, 542, N'AMD Athlon X4 760K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (471, 543, N'AMD A10-5800K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (472, 544, N'AMD A10-6700', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (473, 545, N'Intel Core i5-4200H', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (474, 546, N'AMD A4-3870K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (475, 547, N'AMD A8-3850', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (476, 548, N'AMD A8-5600K', 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (477, 549, N'AMD A6-5400K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (478, 550, N'Intel Pentium G3420', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (479, 551, N'AMD A4-3670K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (480, 552, N'Intel Core 2 Quad  Q8400', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (481, 553, N'AMD Athlon II X4 641', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (482, 554, N'Intel Core 2 Quad  Q6700', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (483, 555, N'AMD Athlon X4 740', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (484, 556, N'Intel Core i5-3210M ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (485, 557, N'Intel Core 2 Quad  Q9300', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (486, 558, N'AMD A8-5500', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (487, 559, N'Intel Core i3-540 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (488, 560, N'Intel Core i3-3110M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (489, 561, N'Intel Pentium  G2030', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (490, 562, N'AMD Athlon II X4 Quad-Core  630', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (491, 563, N'AMD Phenom II X3 720', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (492, 564, N'AMD Phenom X4  9850', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (493, 565, N'Intel Core 2 Duo  E8600', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (494, 566, N'AMD A10-5750M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (495, 567, N'AMD Athlon II X3 455', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (496, 568, N'Intel Core 2 Duo  E7500', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (497, 569, N'AMD A10-4600M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (498, 570, N'AMD A4-5000', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (499, 571, N'AMD Phenom II X2 555 BE', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (500, 572, N'AMD Athlon II X2 270', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (501, 573, N'Intel Pentium Dual-Core E5200', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (502, 574, N'AMD Athlon 64 X2  5200+', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (503, 575, N'Intel, Celeron, N2920, 1.86 GHz', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (504, 576, N'DDR3L (2 khe RAM), 2 GB', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (505, 577, N'HDD, 500 GB', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (506, 578, N'Intel® HD Graphics, 32 MB Share 966 MB', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (507, 579, N'14 inch, HD (1366 x 768 pixels)', 1)
SET IDENTITY_INSERT [dbo].[AttributeMapping] OFF
/****** Object:  Table [dbo].[History]    Script Date: 06/30/2014 09:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[CompareTime] [datetime] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryDetail]    Script Date: 06/30/2014 09:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HistoryID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_HistoryDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_ProductAlias_IsMain]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[ProductAlias] ADD  CONSTRAINT [DF_ProductAlias_IsMain]  DEFAULT ((0)) FOR [IsMain]
GO
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
/****** Object:  ForeignKey [FK_AttributeDictionary_Codetype]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[AttributeDictionary]  WITH CHECK ADD  CONSTRAINT [FK_AttributeDictionary_Codetype] FOREIGN KEY([CodetypeID])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[AttributeDictionary] CHECK CONSTRAINT [FK_AttributeDictionary_Codetype]
GO
/****** Object:  ForeignKey [FK_AttributeMapping_AttributeDictionary]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[AttributeMapping]  WITH CHECK ADD  CONSTRAINT [FK_AttributeMapping_AttributeDictionary] FOREIGN KEY([AttributeDicID])
REFERENCES [dbo].[AttributeDictionary] ([ID])
GO
ALTER TABLE [dbo].[AttributeMapping] CHECK CONSTRAINT [FK_AttributeMapping_AttributeDictionary]
GO
/****** Object:  ForeignKey [FK_History_Account]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Account]
GO
/****** Object:  ForeignKey [FK_HistoryDetail_History]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_History] FOREIGN KEY([HistoryID])
REFERENCES [dbo].[History] ([ID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_History]
GO
/****** Object:  ForeignKey [FK_HistoryDetail_Product]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_Product]
GO
/****** Object:  ForeignKey [FK_ParseAttribute_Codetype]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[ParseAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ParseAttribute_Codetype] FOREIGN KEY([CodetypeID])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[ParseAttribute] CHECK CONSTRAINT [FK_ParseAttribute_Codetype]
GO
/****** Object:  ForeignKey [FK_ProductAlias_Product]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[ProductAlias]  WITH CHECK ADD  CONSTRAINT [FK_ProductAlias_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductAlias] CHECK CONSTRAINT [FK_ProductAlias_Product]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_AttributeDictionary]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_AttributeDictionary] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[AttributeDictionary] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_AttributeDictionary]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Product]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
/****** Object:  ForeignKey [FK_RatingProduct_Product]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[RatingProduct]  WITH CHECK ADD  CONSTRAINT [FK_RatingProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[RatingProduct] CHECK CONSTRAINT [FK_RatingProduct_Product]
GO
/****** Object:  ForeignKey [FK_RecommendProduct_Account]    Script Date: 06/30/2014 09:59:14 ******/
ALTER TABLE [dbo].[RecommendProduct]  WITH CHECK ADD  CONSTRAINT [FK_RecommendProduct_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RecommendProduct] CHECK CONSTRAINT [FK_RecommendProduct_Account]
GO
