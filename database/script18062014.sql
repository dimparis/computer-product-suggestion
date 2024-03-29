USE [CPS_Solution]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06/18/2014 12:02:10 ******/
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
/****** Object:  Table [dbo].[Codetype]    Script Date: 06/18/2014 12:02:10 ******/
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
/****** Object:  Table [dbo].[LogFile]    Script Date: 06/18/2014 12:02:10 ******/
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
SET IDENTITY_INSERT [dbo].[LogFile] OFF
/****** Object:  Table [dbo].[Product]    Script Date: 06/18/2014 12:02:10 ******/
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
	[TotalWeightPoint] [float] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParseInfo]    Script Date: 06/18/2014 12:02:10 ******/
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
/****** Object:  Table [dbo].[ParseAttribute]    Script Date: 06/18/2014 12:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParseAttribute](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodetypeID] [nvarchar](3) NOT NULL,
	[ParseAttributelink] [nvarchar](200) NOT NULL,
	[NameXPath] [nvarchar](200) NOT NULL,
	[PagingXPath] [nvarchar](200) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ParseAttribute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ParseAttribute] ON
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (1, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (2, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (3, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (4, N'C', N'http://www.vatgia.com/8882/thuc-pham-tuoi-song.html', N'//div[@class=''fl''][i]/div/div/div[1]/div/div[2]/a', N'//*[@id=''container_content_center_left'']/div/div[5]/div[3]/a', 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (5, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (6, N'C', N'http://www.vatgia.com/8882/thuc-pham-tuoi-song.html', N'//*[@id=''category_listing_2'']/div/div[2]/a', N'//*[@id=''category_listing_2'']/div/div[2]/a', 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (7, N'C', N'http://www.vatgia.com/8882/thuc-pham-tuoi-song.html', N'//div[@class=''block''][i]/div/div/div[9]/div/div[2]/a', N'//*[@id=''container_content_center_left'']/div/div[5]/div[3]/a', 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (8, N'C', N'http://vietbao.vn/vn/gia-ca-thi-truong/tphcm/', N'//*[@id=''inner-leftor'']/div[2]/table/tr[i]/td[2]', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (9, N'C', N'http://www.vatgia.com/8882/thuc-pham-tuoi-song.html', N'//div[@class=''block''][i]/div[2]/a', N'//*[@id=''container_content_center_left'']/div/div[5]/div[3]/a', 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (10, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (11, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (12, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (13, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (14, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (15, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (16, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (17, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (18, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (19, N'C', N'http://www.chobinhtay.gov.vn/PriceBoard.aspx', N'//*[@id=''ctl00_Mnt_Cnt_Gr_List'']/tr[i]/td[1]/span', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (20, N'C', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (21, N'C', N'http://www.futuremark.com/hardware/cpu', N'//*[@id=''searchbutton'']', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (22, N'C', N'http://www.futuremark.com/hardware/cpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (23, N'V', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (24, N'C', N'http://vietbao.vn/vn/gia-ca-thi-truong/tphcm/', N'//*[@id=''inner-leftor'']/div[2]/table/tr[i]/td[2]/strong', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (25, N'C', N'http://www.futuremark.com/hardware/cpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (26, N'C', N'http://www.futuremark.com/hardware/cpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', NULL, 1)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (27, N'V', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', NULL, 1)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (28, N'V', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PagingXPath], [IsActive]) VALUES (29, N'C', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', NULL, 1)
SET IDENTITY_INSERT [dbo].[ParseAttribute] OFF
/****** Object:  Table [dbo].[AttributeDictionary]    Script Date: 06/18/2014 12:02:10 ******/
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
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (1, N'C', N'Intel Core i7-4960X', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (2, N'C', N'Intel Core i7-4930K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (3, N'C', N'Intel Core i7-3970X Extreme Edition ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (4, N'C', N'Intel Core i7-4820K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (5, N'C', N'Intel Core i7-3960X Extreme Edition ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (6, N'C', N'Intel Core i7-3930K ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (7, N'C', N'Intel Core i7-3820 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (8, N'C', N'Intel Core i7-4790 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (9, N'C', N'Intel Core i7-4770K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (10, N'C', N'Intel Core i7-4771', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (11, N'C', N'Intel Core i7-990X ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (12, N'C', N'Intel Core i7-4770', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (13, N'C', N'Intel Core i7-980X ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (14, N'C', N'Intel Core i7-980 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (15, N'C', N'Intel Core i7-970  ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (16, N'C', N'Intel Core i7-4770S', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (17, N'C', N'Intel Core i7-3770K ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (18, N'C', N'Intel Core i7-2700K ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (19, N'C', N'Intel Core i7-3770 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (20, N'C', N'AMD FX-9590', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (21, N'C', N'Intel Core i7-2600 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (22, N'C', N'Intel Core i7-2600K ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (23, N'C', N'AMD FX-9370', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (24, N'C', N'Intel Core i7-4930MX', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (25, N'C', N'Intel Core i7-4900MQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (26, N'C', N'Intel Core i7-4800MQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (27, N'C', N'Intel Core i5-4690 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (28, N'C', N'Intel Core i7-975  Extreme Edition', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (29, N'C', N'AMD FX-8350', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (30, N'C', N'Intel Core i5-4670K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (31, N'C', N'Intel Core i5-4670', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (32, N'C', N'Intel Core i7-4700MQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (33, N'C', N'Intel Core i7-4700HQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (34, N'C', N'AMD FX-6350', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (35, N'C', N'Intel Core i7-4712MQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (36, N'C', N'Intel Core i7-4850HQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (37, N'C', N'Intel Core i7-4702MQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (38, N'C', N'Intel Core i7-4702HQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (39, N'C', N'Intel Core i7-960 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (40, N'C', N'Intel Core i7-3920XM  Extreme Edition', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (41, N'C', N'AMD FX-4300', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (42, N'C', N'AMD FX-4170', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (43, N'C', N'Intel Core i5-3570K ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (44, N'C', N'Intel Core i5-3570', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (45, N'C', N'Intel Core i5-4440', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (46, N'C', N'Intel Core i7-950 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (47, N'C', N'Intel Core i5-2550K ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (48, N'C', N'Intel Core i7-3820QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (49, N'C', N'Intel Core i7-3740QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (50, N'C', N'Intel Core i5-3550 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (51, N'C', N'Intel Core i5-4430', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (52, N'C', N'Intel Core i5-2500 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (53, N'C', N'Intel Core i5-2500K ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (54, N'C', N'AMD FX-6300', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (55, N'C', N'AMD FX-8320', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (56, N'C', N'Intel Core i7-875K  ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (57, N'C', N'Intel Core i7-940 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (58, N'C', N'Intel Core i7-870 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (59, N'C', N'Intel Core i7-3720QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (60, N'C', N'Intel Core i5-3470 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (61, N'C', N'AMD FX-4130', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (62, N'C', N'AMD FX-6200', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (63, N'C', N'Intel Core i5-2400 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (64, N'C', N'Intel Core i5-3450 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (65, N'C', N'AMD FX-8300', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (66, N'C', N'Intel Core i5-2320 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (67, N'C', N'Intel Core i7-860 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (68, N'C', N'Intel Core i7-930 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (69, N'C', N'AMD FX-4100', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (70, N'C', N'AMD FX-8150', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (71, N'C', N'Intel Core i7-3635QM', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (72, N'C', N'Intel Core i7-3630QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (73, N'C', N'Intel Core i7-3940XM', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (74, N'C', N'Intel Core i7-4600U ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (75, N'C', N'Intel Core i5-2310 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (76, N'C', N'Intel Core i5-2300 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (77, N'C', N'Intel Core i7-920 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (78, N'C', N'Intel Core i7-2960XM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (79, N'C', N'Intel Core i7-3610QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (80, N'C', N'Intel Core i7-4500U', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (81, N'C', N'AMD FX-6100', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (82, N'C', N'Intel Core i7-3632QM', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (83, N'C', N'Intel Core i7-2860QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (84, N'C', N'Intel Core i7-3612QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (85, N'C', N'AMD FX-8120', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (86, N'C', N'AMD Phenom II X6 1100T', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (87, N'C', N'AMD Phenom II X6 1090T', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (88, N'C', N'Intel Core i7-3537U', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (89, N'C', N'Intel Core i7-2760QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (90, N'C', N'Intel Core i7-3517U ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (91, N'C', N'Intel Core i7-2820QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (92, N'C', N'AMD Phenom II X6 1075T ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (93, N'C', N'Intel Core i5-760 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (94, N'C', N'Intel Core i7-2670QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (95, N'C', N'Intel Core i7-2720QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (96, N'C', N'AMD Phenom II X6 1055T', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (97, N'C', N'Intel Core i5  I5-750', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (98, N'C', N'AMD Phenom II X6 1045T ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (99, N'C', N'Intel Core i7-2630QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (100, N'C', N'Intel Core i5-4570', 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (101, N'C', N'Intel Core 2 Extreme  QX9650', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (102, N'C', N'Intel Core i3-3240', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (103, N'C', N'AMD Phenom II X4 975', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (104, N'C', N'Intel Core i5-3350P', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (105, N'C', N'AMD Phenom II X4 965', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (106, N'C', N'Intel Core i3-3220', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (107, N'C', N'AMD Phenom II X4 970', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (108, N'C', N'Intel Core i5-3330', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (109, N'C', N'AMD Phenom II X4 955', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (110, N'C', N'AMD Phenom II X4 B55', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (111, N'C', N'AMD A10-6800K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (112, N'C', N'Intel Core i3-2120 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (113, N'C', N'Intel Core i5-4570S', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (114, N'C', N'Intel Core 2 Quad  Q9650', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (115, N'C', N'AMD Phenom II X4 B50', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (116, N'C', N'AMD A6-6400K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (117, N'C', N'AMD A8-6600K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (118, N'C', N'AMD Phenom II X4 940', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (119, N'C', N'AMD Phenom II X4  945', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (120, N'C', N'Intel Core i3-2100 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (121, N'C', N'AMD Athlon X4 760K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (122, N'C', N'AMD A10-5800K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (123, N'C', N'AMD Phenom II X4 840', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (124, N'C', N'Intel Core 2 Quad  Q9550', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (125, N'C', N'AMD A10-6700', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (126, N'C', N'Intel Core i5-4200H', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (127, N'C', N'AMD A4-3870K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (128, N'C', N'AMD Phenom II X4 925', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (129, N'C', N'AMD A8-3850', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (130, N'C', N'Intel Core i7-740QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (131, N'C', N'AMD A8-5600K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (132, N'C', N'AMD A6-5400K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (133, N'C', N'Intel Pentium G3420', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (134, N'C', N'Intel Core i7-720QM  ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (135, N'C', N'Intel Core 2 Quad  Q8400', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (136, N'C', N'Intel Core 2 Quad  Q9450', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (137, N'C', N'Intel Core 2 Quad  Q9400', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (138, N'C', N'AMD Phenom II X4 960T', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (139, N'C', N'AMD Athlon X4 750K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (140, N'C', N'Intel Core i5-4200M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (141, N'C', N'AMD Athlon II X4 641', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (142, N'C', N'Intel Core i5-3230M ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (143, N'C', N'Intel Core 2 Quad  Q6700', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (144, N'C', N'AMD Athlon X4 740', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (145, N'C', N'Intel Pentium G3220', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (146, N'C', N'Intel Core i5-3210M ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (147, N'C', N'Intel Core i3-3120M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (148, N'C', N'Intel Core 2 Quad  Q8300', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (149, N'C', N'Intel Core 2 Quad  Q9300', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (150, N'C', N'AMD A8-5500', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (151, N'C', N'Intel Core i5  i5-650', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (152, N'C', N'Intel Core i3-540 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (153, N'C', N'Intel Core i3-3110M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (154, N'C', N'AMD Athlon II X4 645', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (155, N'C', N'Intel Pentium  G2030', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (156, N'C', N'Intel Core i3-530 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (157, N'C', N'Intel Core 2 Quad  Q6600', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (158, N'C', N'AMD Athlon II X4 640', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (159, N'C', N'AMD Athlon II X4 635', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (160, N'C', N'Intel Core 2 Quad  Q8200', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (161, N'C', N'AMD Athlon II X4 Quad-Core  630', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (162, N'C', N'Intel Core i5-2450M ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (163, N'C', N'AMD Athlon II X4 631', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (164, N'C', N'Intel Core i5-2430M ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (165, N'C', N'Intel Core i3-3217U ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (166, N'C', N'AMD A10-5750M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (167, N'C', N'Intel Core i5-2410M ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (168, N'C', N'Intel Core i5-3317U ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (169, N'C', N'Intel Core i5-4200U', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (170, N'C', N'Intel Pentium G620 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (171, N'C', N'Intel Core 2 Duo  E8500', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (172, N'C', N'AMD Athlon II X3 455', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (173, N'C', N'AMD Athlon II X3 450', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (174, N'C', N'Intel Core 2 Duo  E8400', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (175, N'C', N'Intel Core 2 Duo  E7500', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (176, N'C', N'AMD A10-4600M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (177, N'C', N'AMD A4-5000', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (178, N'C', N'Intel Celeron  G530', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (179, N'C', N'Intel Core 2 Duo  E7400', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (180, N'C', N'AMD A8-4500M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (181, N'C', N'Intel Core i5-3337U ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (182, N'C', N'Intel Core 2 Duo  E6750', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (183, N'C', N'AMD Athlon II X2 250', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (184, N'C', N'AMD Athlon II X2 245', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (185, N'C', N'Intel Core 2 Duo  E6600', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (186, N'C', N'AMD Athlon 64 X2  5200+', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (187, N'C', N'Intel Core i7-4960X', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (188, N'C', N'Intel Core i7-3970X Extreme Edition ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (189, N'C', N'Intel Core i7-3930K ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (190, N'C', N'Intel Core i7-980 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (191, N'C', N'AMD FX-9590', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (192, N'C', N'AMD FX-9370', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (193, N'C', N'Intel Core i5-4690 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (194, N'C', N'AMD FX-8350', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (195, N'C', N'Intel Core i7-4700MQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (196, N'C', N'Intel Core i7-4850HQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (197, N'C', N'AMD FX-4300', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (198, N'C', N'AMD FX-4170', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (199, N'C', N'Intel Core i5-3570K ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (200, N'C', N'Intel Core i7-3820QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (201, N'C', N'Intel Core i5-2500 ', 0)
GO
print 'Processed 200 total records'
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (202, N'C', N'AMD FX-6200', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (203, N'C', N'AMD FX-8120', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (204, N'C', N'AMD Phenom II X6 1100T', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (205, N'C', N'Intel Core 2 Extreme  QX9650', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (206, N'C', N'Intel Core i3-3240', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (207, N'C', N'AMD Phenom II X4 975', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (208, N'C', N'AMD A10-6800K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (209, N'C', N'Intel Core i3-2120 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (210, N'C', N'Intel Core 2 Quad  Q9650', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (211, N'C', N'AMD A6-6400K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (212, N'C', N'AMD A8-6600K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (213, N'C', N'AMD Athlon X4 760K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (214, N'C', N'AMD A4-3870K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (215, N'C', N'AMD A8-3850', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (216, N'C', N'Intel Pentium G3420', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (217, N'C', N'AMD A8-5500', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (218, N'C', N'AMD Athlon II X4 Quad-Core  630', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (219, N'C', N'AMD A10-5750M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (220, N'C', N'Intel Core 2 Duo  E8500', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (221, N'C', N'AMD Athlon II X3 455', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (222, N'C', N'AMD A10-4600M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (223, N'C', N'AMD A4-5000', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (224, N'C', N'Intel Celeron  G530', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (225, N'C', N'AMD A8-4500M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (226, N'C', N'AMD Athlon 64 X2  5200+', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (227, N'C', N'Intel Core i7-4820K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (228, N'C', N'Intel Core i7-4790 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (229, N'C', N'Intel Core i7-990X ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (230, N'C', N'Intel Core i7-3770K ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (231, N'C', N'Intel Core i7-2700K ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (232, N'C', N'Intel Core i7-4930MX', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (233, N'C', N'AMD FX-6350', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (234, N'C', N'Intel Core i7-4712MQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (235, N'C', N'Intel Core i7-4702HQ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (236, N'C', N'Intel Core i5-4440', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (237, N'C', N'Intel Core i7-3740QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (238, N'C', N'AMD FX-6300', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (239, N'C', N'AMD FX-8320', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (240, N'C', N'Intel Core i7-875K  ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (241, N'C', N'AMD FX-4130', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (242, N'C', N'Intel Core i5-3450 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (243, N'C', N'AMD FX-8300', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (244, N'C', N'Intel Core i5-2320 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (245, N'C', N'Intel Core i7-860 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (246, N'C', N'AMD FX-4100', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (247, N'C', N'AMD FX-8150', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (248, N'C', N'Intel Core i7-3635QM', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (249, N'C', N'Intel Core i7-3940XM', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (250, N'C', N'Intel Core i7-4600U ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (251, N'C', N'Intel Core i7-3610QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (252, N'C', N'AMD FX-6100', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (253, N'C', N'Intel Core i7-3537U', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (254, N'C', N'Intel Core i7-2760QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (255, N'C', N'AMD Phenom II X6 1075T ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (256, N'C', N'Intel Core i5-760 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (257, N'C', N'Intel Core i7-2670QM ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (258, N'C', N'Intel Core i5  I5-750', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (259, N'C', N'Intel Core i5-3330', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (260, N'C', N'Intel Core i5-4570S', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (261, N'C', N'AMD A10-5800K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (262, N'C', N'AMD A10-6700', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (263, N'C', N'Intel Core i5-4200H', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (264, N'C', N'AMD A8-5600K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (265, N'C', N'AMD A6-5400K', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (266, N'C', N'Intel Core 2 Quad  Q8400', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (267, N'C', N'AMD Phenom II X4 960T', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (268, N'C', N'AMD Athlon II X4 641', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (269, N'C', N'Intel Core 2 Quad  Q6700', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (270, N'C', N'AMD Athlon X4 740', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (271, N'C', N'Intel Core i5-3210M ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (272, N'C', N'Intel Core 2 Quad  Q9300', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (273, N'C', N'Intel Core i3-540 ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (274, N'C', N'Intel Core i3-3110M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (275, N'C', N'Intel Pentium  G2030', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (276, N'C', N'Intel Core i5-2430M ', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (277, N'C', N'Intel Core 2 Duo  E7400', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (278, N'C', N'Intel Core 2 Duo  E6750', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (279, N'C', N'AMD Athlon II X2 250', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (280, N'C', N'Intel Core 2 Duo  E6600', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (281, N'V', N'AMD Radeon HD 7990', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (282, N'V', N'NVIDIA GeForce GTX 690', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (283, N'V', N'AMD Radeon R9 290X', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (284, N'V', N'AMD Radeon HD 7870 XT', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (285, N'V', N'ATI Radeon HD 5970', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (286, N'V', N'AMD Radeon HD 8970M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (287, N'V', N'AMD Radeon HD 7850', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (288, N'V', N'NVIDIA GeForce GTX 560 Ti 448', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (289, N'V', N'NVIDIA GeForce GTX 650 Ti Boost', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (290, N'V', N'AMD Radeon R7 260X', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (291, N'V', N'Intel HD Graphics 4600', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (292, N'V', N'AMD FirePro W5000', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (293, N'V', N'AMD Radeon HD 7770', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (294, N'V', N'ATI Radeon HD 5850', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (295, N'V', N'AMD Radeon HD 6970M / 6990M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (296, N'V', N'AMD Radeon HD 7660D', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (297, N'V', N'NVIDIA GeForce GT 750M', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (298, N'V', N'AMD Radeon HD 7640G', 0)
INSERT [dbo].[AttributeDictionary] ([ID], [CodetypeID], [Name], [WeightCriteraPoint]) VALUES (299, N'V', N'ATI Mobility Radeon HD 5870', 0)
SET IDENTITY_INSERT [dbo].[AttributeDictionary] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 06/18/2014 12:02:10 ******/
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
/****** Object:  Table [dbo].[ProductAlias]    Script Date: 06/18/2014 12:02:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAlias](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProductAlias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RatingProduct]    Script Date: 06/18/2014 12:02:10 ******/
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
/****** Object:  Table [dbo].[RecommendProduct]    Script Date: 06/18/2014 12:02:10 ******/
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
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 06/18/2014 12:02:10 ******/
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
/****** Object:  Table [dbo].[AttributeMapping]    Script Date: 06/18/2014 12:02:10 ******/
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
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (187, 187, N'Intel Core i7-4960X', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (188, 188, N'Intel Core i7-3970X Extreme Edition ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (189, 189, N'Intel Core i7-3930K ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (190, 190, N'Intel Core i7-980 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (191, 191, N'AMD FX-9590', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (192, 192, N'AMD FX-9370', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (193, 193, N'Intel Core i5-4690 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (194, 194, N'AMD FX-8350', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (195, 195, N'Intel Core i7-4700MQ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (196, 196, N'Intel Core i7-4850HQ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (197, 197, N'AMD FX-4300', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (198, 198, N'AMD FX-4170', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (199, 199, N'Intel Core i5-3570K ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (200, 200, N'Intel Core i7-3820QM ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (201, 201, N'Intel Core i5-2500 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (202, 202, N'AMD FX-6200', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (203, 203, N'AMD FX-8120', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (204, 204, N'AMD Phenom II X6 1100T', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (205, 205, N'Intel Core 2 Extreme  QX9650', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (206, 206, N'Intel Core i3-3240', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (207, 207, N'AMD Phenom II X4 975', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (208, 208, N'AMD A10-6800K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (209, 209, N'Intel Core i3-2120 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (210, 210, N'Intel Core 2 Quad  Q9650', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (211, 211, N'AMD A6-6400K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (212, 212, N'AMD A8-6600K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (213, 213, N'AMD Athlon X4 760K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (214, 214, N'AMD A4-3870K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (215, 215, N'AMD A8-3850', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (216, 216, N'Intel Pentium G3420', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (217, 217, N'AMD A8-5500', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (218, 218, N'AMD Athlon II X4 Quad-Core  630', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (219, 219, N'AMD A10-5750M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (220, 220, N'Intel Core 2 Duo  E8500', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (221, 221, N'AMD Athlon II X3 455', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (222, 222, N'AMD A10-4600M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (223, 223, N'AMD A4-5000', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (224, 224, N'Intel Celeron  G530', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (225, 225, N'AMD A8-4500M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (226, 226, N'AMD Athlon 64 X2  5200+', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (227, 227, N'Intel Core i7-4820K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (228, 228, N'Intel Core i7-4790 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (229, 229, N'Intel Core i7-990X ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (230, 230, N'Intel Core i7-3770K ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (231, 231, N'Intel Core i7-2700K ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (232, 232, N'Intel Core i7-4930MX', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (233, 233, N'AMD FX-6350', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (234, 234, N'Intel Core i7-4712MQ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (235, 235, N'Intel Core i7-4702HQ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (236, 236, N'Intel Core i5-4440', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (237, 237, N'Intel Core i7-3740QM ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (238, 238, N'AMD FX-6300', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (239, 239, N'AMD FX-8320', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (240, 240, N'Intel Core i7-875K  ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (241, 241, N'AMD FX-4130', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (242, 242, N'Intel Core i5-3450 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (243, 243, N'AMD FX-8300', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (244, 244, N'Intel Core i5-2320 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (245, 245, N'Intel Core i7-860 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (246, 246, N'AMD FX-4100', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (247, 247, N'AMD FX-8150', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (248, 248, N'Intel Core i7-3635QM', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (249, 249, N'Intel Core i7-3940XM', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (250, 250, N'Intel Core i7-4600U ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (251, 251, N'Intel Core i7-3610QM ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (252, 252, N'AMD FX-6100', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (253, 253, N'Intel Core i7-3537U', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (254, 254, N'Intel Core i7-2760QM ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (255, 255, N'AMD Phenom II X6 1075T ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (256, 256, N'Intel Core i5-760 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (257, 257, N'Intel Core i7-2670QM ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (258, 258, N'Intel Core i5  I5-750', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (259, 259, N'Intel Core i5-3330', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (260, 260, N'Intel Core i5-4570S', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (261, 261, N'AMD A10-5800K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (262, 262, N'AMD A10-6700', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (263, 263, N'Intel Core i5-4200H', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (264, 264, N'AMD A8-5600K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (265, 265, N'AMD A6-5400K', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (266, 266, N'Intel Core 2 Quad  Q8400', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (267, 267, N'AMD Phenom II X4 960T', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (268, 268, N'AMD Athlon II X4 641', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (269, 269, N'Intel Core 2 Quad  Q6700', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (270, 270, N'AMD Athlon X4 740', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (271, 271, N'Intel Core i5-3210M ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (272, 272, N'Intel Core 2 Quad  Q9300', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (273, 273, N'Intel Core i3-540 ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (274, 274, N'Intel Core i3-3110M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (275, 275, N'Intel Pentium  G2030', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (276, 276, N'Intel Core i5-2430M ', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (277, 277, N'Intel Core 2 Duo  E7400', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (278, 278, N'Intel Core 2 Duo  E6750', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (279, 279, N'AMD Athlon II X2 250', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (280, 280, N'Intel Core 2 Duo  E6600', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (281, 281, N'AMD Radeon HD 7990', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (282, 282, N'NVIDIA GeForce GTX 690', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (283, 283, N'AMD Radeon R9 290X', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (284, 284, N'AMD Radeon HD 7870 XT', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (285, 285, N'ATI Radeon HD 5970', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (286, 286, N'AMD Radeon HD 8970M', 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (287, 287, N'AMD Radeon HD 7850', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (288, 288, N'NVIDIA GeForce GTX 560 Ti 448', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (289, 289, N'NVIDIA GeForce GTX 650 Ti Boost', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (290, 290, N'AMD Radeon R7 260X', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (291, 291, N'Intel HD Graphics 4600', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (292, 292, N'AMD FirePro W5000', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (293, 293, N'AMD Radeon HD 7770', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (294, 294, N'ATI Radeon HD 5850', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (295, 295, N'AMD Radeon HD 6970M / 6990M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (296, 296, N'AMD Radeon HD 7660D', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (297, 297, N'NVIDIA GeForce GT 750M', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (298, 298, N'AMD Radeon HD 7640G', 1)
INSERT [dbo].[AttributeMapping] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (299, 299, N'ATI Mobility Radeon HD 5870', 1)
SET IDENTITY_INSERT [dbo].[AttributeMapping] OFF
/****** Object:  Table [dbo].[History]    Script Date: 06/18/2014 12:02:10 ******/
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
/****** Object:  Table [dbo].[HistoryDetail]    Script Date: 06/18/2014 12:02:10 ******/
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
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 06/18/2014 12:02:10 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
/****** Object:  ForeignKey [FK_AttributeDictionary_Codetype]    Script Date: 06/18/2014 12:02:10 ******/
ALTER TABLE [dbo].[AttributeDictionary]  WITH CHECK ADD  CONSTRAINT [FK_AttributeDictionary_Codetype] FOREIGN KEY([CodetypeID])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[AttributeDictionary] CHECK CONSTRAINT [FK_AttributeDictionary_Codetype]
GO
/****** Object:  ForeignKey [FK_AttributeMapping_AttributeDictionary]    Script Date: 06/18/2014 12:02:10 ******/
ALTER TABLE [dbo].[AttributeMapping]  WITH CHECK ADD  CONSTRAINT [FK_AttributeMapping_AttributeDictionary] FOREIGN KEY([AttributeDicID])
REFERENCES [dbo].[AttributeDictionary] ([ID])
GO
ALTER TABLE [dbo].[AttributeMapping] CHECK CONSTRAINT [FK_AttributeMapping_AttributeDictionary]
GO
/****** Object:  ForeignKey [FK_History_Account]    Script Date: 06/18/2014 12:02:10 ******/
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Account]
GO
/****** Object:  ForeignKey [FK_HistoryDetail_History]    Script Date: 06/18/2014 12:02:10 ******/
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_History] FOREIGN KEY([HistoryID])
REFERENCES [dbo].[History] ([ID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_History]
GO
/****** Object:  ForeignKey [FK_HistoryDetail_Product]    Script Date: 06/18/2014 12:02:10 ******/
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_Product]
GO
/****** Object:  ForeignKey [FK_ParseAttribute_Codetype]    Script Date: 06/18/2014 12:02:10 ******/
ALTER TABLE [dbo].[ParseAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ParseAttribute_Codetype] FOREIGN KEY([CodetypeID])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[ParseAttribute] CHECK CONSTRAINT [FK_ParseAttribute_Codetype]
GO
/****** Object:  ForeignKey [FK_ProductAlias_Product]    Script Date: 06/18/2014 12:02:10 ******/
ALTER TABLE [dbo].[ProductAlias]  WITH CHECK ADD  CONSTRAINT [FK_ProductAlias_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductAlias] CHECK CONSTRAINT [FK_ProductAlias_Product]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_AttributeDictionary]    Script Date: 06/18/2014 12:02:10 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_AttributeDictionary] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[AttributeDictionary] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_AttributeDictionary]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Product]    Script Date: 06/18/2014 12:02:10 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
/****** Object:  ForeignKey [FK_RatingProduct_Product]    Script Date: 06/18/2014 12:02:10 ******/
ALTER TABLE [dbo].[RatingProduct]  WITH CHECK ADD  CONSTRAINT [FK_RatingProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[RatingProduct] CHECK CONSTRAINT [FK_RatingProduct_Product]
GO
/****** Object:  ForeignKey [FK_RecommendProduct_Account]    Script Date: 06/18/2014 12:02:10 ******/
ALTER TABLE [dbo].[RecommendProduct]  WITH CHECK ADD  CONSTRAINT [FK_RecommendProduct_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RecommendProduct] CHECK CONSTRAINT [FK_RecommendProduct_Account]
GO
