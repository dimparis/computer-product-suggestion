USE [CPS_Solution]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 07/19/2014 21:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](200) NULL,
	[StoreUrl] [nvarchar](200) NULL,
	[LogoImage] [nvarchar](200) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Store] ON
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (1, N'Chưa xác Định', N'#', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (2, N'LaZaDa', N'lazada.vn', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (3, N'Nguyễn Kim', N'nguyenkim.com', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (4, N'Điện Máy Thiên Hòa', N'dienmaythienhoa.vn', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (5, N'Điện Máy Chợ Lớn', N'dienmaycholon.vn', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (6, N'Laptop Gia Huy', N'laptopgiahuy.com', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (7, N'Viettel Store', N'viettelstore.vn', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (8, N'Thiết Bị Số', N'thietbiso.com', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (9, N'Thế giới Di Động', N'thegioididong.com', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (10, N'Viễn Thông A', N'vienthonga.vn', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (11, N'Chưa xác định', N'laptopno1.com', N'default', 0)
SET IDENTITY_INSERT [dbo].[Store] OFF
/****** Object:  Table [dbo].[Role]    Script Date: 07/19/2014 21:36:03 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 07/19/2014 21:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](2000) NULL,
	[ImageURL] [nvarchar](200) NULL,
	[TotalWeightPoint] [float] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (120, N'Fill me                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'images/I//20140714/Laptop20140714-151923.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (121, N'Fill me                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'E:\Capstone Project\code\CPS_Solution\CPS_Solution\images\I\default.jpg', 0, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (122, N'Fill me                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'E:\Capstone Project\code\CPS_Solution\CPS_Solution\images\I\default.jpg', 0, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (123, N'Fill me                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'E:\Capstone Project\code\CPS_Solution\CPS_Solution\images\I\default.jpg', 0, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (124, N'Fill me                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'images/I//20140714/Laptop20140714-151950.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (125, N'Fill me                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'images/I//20140714/Laptop20140714-152004.jpg', 0, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (126, NULL, N'http://laptopno1.com/images/products/129875295602206250.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (127, NULL, N'http://laptopno1.com/images/products/129875295602206250.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (128, NULL, N'http://laptopno1.com/images/products/129875295602206250.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (129, NULL, N'http://laptopno1.com/images/products/129875295602206250.jpg', 0, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[ParseInfo]    Script Date: 07/19/2014 21:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParseInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Parselink] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[PriceXPath] [nvarchar](200) NULL,
	[ImageXpath] [nvarchar](200) NULL,
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
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [PriceXPath], [ImageXpath], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (90, N'http://www.dienmaythienhoa.vn/may-tinh-xach-tay-asus-p550ca-xo998d-m.black.html', N'//*[@id=''content'']/div/div[2]/div/div[3]/div/div[1]/form/div/div[2]/h1', N'//*[@id=''sec_discounted_price_182004'']', N'//*[@id=''content_block_description'']/table/tr/td[2]/img', N'//*[@id=''content_block_106'']/table/tr[6]/td[2]', N'//*[@id=''content_block_106'']/table/tr[10]/td[3]', N'//*[@id=''content_block_106'']/table/tr[16]/td[3]', N'//*[@id=''content_block_106'']/table/tr[14]/td[2]', N'//*[@id=''content_block_106'']/table/tr[1]/td[3]', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [PriceXPath], [ImageXpath], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (94, N'http://laptopno1.com/chi-tiet-san-pham/1701/asus-p550ldv-xo517d-i5-haswell-4210u-4gb-1tb-vga-nvidia-geforce-gt-820m-2gb.htm', N'//*[@id=''aspnetForm'']/div[4]/h1', N'//*[@id=''aspnetForm'']/div[5]/div[1]/div[1]/div[2]/span[2]', N'//*[@id=''thumb1'']/img', N'//*[@id=''ctl00_ContentPlaceHolder1_pnchitietsp'']/li[1]', N'//*[@id=''ctl00_ContentPlaceHolder1_thongsokythuat'']/table/tr[2]/td[2]', N'//*[@id=''ctl00_ContentPlaceHolder1_thongsokythuat'']/table/tr[4]/td[2]', N'//*[@id=''ctl00_ContentPlaceHolder1_thongsokythuat'']/table/tr[3]/td[2]', N'//*[@id=''ctl00_ContentPlaceHolder1_thongsokythuat'']/table/tr[5]/td[2]', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [PriceXPath], [ImageXpath], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (95, N'http://www.thegioididong.com/laptop/asus-p550ld-xo216', N'//*[@id=''wrapper-detail-page'']/div[1]/span[1]/h1/b', N'//*[@id=''wrapper-detail-page'']/div[3]/div[1]/div/div[2]/span/span', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[1]/p[3]/a/img', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[1]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[2]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[6]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[3]/td[2]', N'//*[@id=''wrapper-detail-page'']/div[2]/div[1]/div[2]/div[2]/div/table/tr[4]/td[2]', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [PriceXPath], [ImageXpath], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (96, N'http://www.lazada.vn/lenovo-g4070-59414340-core-i3-17ghz-14-2gb-den-149555.html', N'//*[@id=''prod_title'']', N'//*[@id=''special_price_box'']', N'html/body/div[7]/div/div[2]/div/img', N'//*[@id=''prod_content_wrapper'']/div[3]/div/ul/li[1]/span', N'//*[@id=''prod_content_wrapper'']/div[3]/div/ul/li[3]/span', N'//*[@id=''prod_content_wrapper'']/div[3]/div/ul/li[4]/span', N'//*[@id=''prod_content_wrapper'']/div[3]/div/ul/li[3]/span', N'//*[@id=''prod_content_wrapper'']/div[3]/div/ul/li[2]/span', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [PriceXPath], [ImageXpath], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (97, N'http://thietbiso.com/san-pham/chi-tiet/6704/asus-p550ldv-xo517d-black.html', N'//*[@id=''topbar'']/h1', N'//*[@id=''product-form'']/div/div[2]/div[1]/div/span/span', N'//*[@id=''fullimg_preview'']', N'//*[@id=''product-form'']/div/div[2]/div[2]/div[2]/div[1]/p[2]/span', N'//*[@id=''product-form'']/div/div[2]/div[2]/div[2]/div[1]/p[3]/span', N'//*[@id=''product-form'']/div/div[2]/div[2]/div[2]/div[1]/p[5]/span', N'//*[@id=''product-form'']/div/div[2]/div[2]/div[2]/div[1]/p[4]/span', N'//*[@id=''product-form'']/div/div[2]/div[2]/div[2]/div[1]/p[6]/span[2]', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [PriceXPath], [ImageXpath], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (98, N'http://www.vienthonga.vn/laptop-asus-p550ld-xo216d-black.html', N'//*[@id=''content'']/div/div[2]/div/div[6]/form/div[2]/div[2]/h1', N'//*[@id=''sec_list_price_182271'']', N'//*[@id=''det_img_182271_16025'']', N'//*[@id=''content_block_features'']/div[5]/p', N'//*[@id=''content_block_features'']/div[6]/p', N'//*[@id=''content_block_features'']/div[17]', N'//*[@id=''content_block_features'']/div[14]/p', N'//*[@id=''content_block_features'']/div[4]/p', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [PriceXPath], [ImageXpath], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (99, N'http://www.nguyenkim.com/may-tinh-xach-tay-asus-p550ld-xo330d.html', N'//*[@id=''tygh_main_container'']/div[3]/div/div[2]/div/div[2]/div[1]/div[2]/form/div/div[1]/h1', N'//*[@id=''sec_discounted_price_20372'']', N'//*[@id=''fancybox-img'']', N'//*[@id=''content_description'']/table/tr[2]/td/table/tbody/tr[3]/td[2]/p/span', N'//*[@id=''content_description'']/table/tr[2]/td/table/tbody/tr[4]/td[2]/p/span', N'//*[@id=''content_description'']/table/tr[2]/td/table/tbody/tr[7]/td[2]/p/span', N'//*[@id=''content_description'']/table/tr[2]/td/table/tbody/tr[5]/td[2]/p/span', N'//*[@id=''content_description'']/table/tr[2]/td/table/tbody/tr[8]/td[2]/p/span', 1)
SET IDENTITY_INSERT [dbo].[ParseInfo] OFF
/****** Object:  Table [dbo].[LogFile]    Script Date: 07/19/2014 21:36:03 ******/
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
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (16, N'tacvaofo.we3.txt', CAST(0x0000A36D012EFA05 AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (17, N'pzu01psk.ggy.txt', CAST(0x0000A36D01465724 AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (18, N'tgg1crse.wla.txt', CAST(0x0000A36D015DDF83 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[LogFile] OFF
/****** Object:  Table [dbo].[Codetype]    Script Date: 07/19/2014 21:36:03 ******/
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
/****** Object:  Table [dbo].[AliasProduct]    Script Date: 07/19/2014 21:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AliasProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[URL] [nvarchar](200) NULL,
	[Price] [float] NULL,
	[StoreID] [int] NULL,
	[IsMain] [bit] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProductAlias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AliasProduct] ON
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (121, 122, N'Asus P550LDV-XO517D Black', N'http://thietbiso.com/san-pham/chi-tiet/6704/asus-p550ldv-xo517d-black.html', 12999000, 8, 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (122, 121, N'Máy Tính Xách Tay ASUS P550CA-XO998D (M.BLACK)', N'http://www.dienmaythienhoa.vn/may-tinh-xach-tay-asus-p550ca-xo998d-m.black.html', 9990000, 4, 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (123, 123, N'Lenovo G4070 59414340 – Core i3 1.7GHz / 14” / 2GB (Đen)', N'http://www.lazada.vn/lenovo-g4070-59414340-core-i3-17ghz-14-2gb-den-149555.html', 9290000, 2, 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (124, 121, N'MÁY TÍNH XÁCH TAY ASUS P550LD-XO330D', N'http://www.nguyenkim.com/may-tinh-xach-tay-asus-p550ld-xo330d.html', 13690000, 3, 0, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (125, 125, N'Asus P550LD 54204G50G', N'http://www.thegioididong.com/laptop/asus-p550ld-xo216', 13290000, 9, 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (126, 121, N'Laptop ASUS P550LD-XO216D Black', N'http://www.vienthonga.vn/laptop-asus-p550ld-xo216d-black.html', 12990000, 10, 0, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (127, 126, N'dddddddddddddddddd', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (128, 127, N'fhggggggggdsàdâff', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (129, 128, N'fdfsggfdsgsfdgffffffff', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (130, 129, N' Sony Vaio 5654645645', NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[AliasProduct] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 07/19/2014 21:36:03 ******/
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
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'staff', N'123456', N'iv250509@gmail.com', 2, 1)
/****** Object:  Table [dbo].[Hardware]    Script Date: 07/19/2014 21:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hardware](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodetypeID] [nvarchar](3) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[WeightCriteraPoint] [float] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_AttributeDictionary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Hardware] ON
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (984, N'V', N'AMD Radeon HD 7990', 18190, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (985, N'V', N'NVIDIA GeForce GTX 690', 9730, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (986, N'V', N'AMD Radeon R9 290X', 14570, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (987, N'V', N'AMD Radeon HD 7870 XT', 8090, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (988, N'V', N'ATI Radeon HD 5970', 7660, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (989, N'V', N'AMD Radeon HD 8970M', 6670, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (990, N'V', N'AMD Radeon HD 7850', 6630, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (991, N'V', N'NVIDIA GeForce GTX 560 Ti 448', 4730, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (992, N'V', N'NVIDIA GeForce GTX 650 Ti Boost', 5770, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (993, N'V', N'AMD Radeon R7 260X', 5280, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (994, N'V', N'AMD Radeon HD 6930', 4880, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (995, N'V', N'AMD Radeon HD 7770', 4000, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (996, N'V', N'ATI Radeon HD 5850', 3820, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (997, N'V', N'AMD Radeon HD 6970M / 6990M', 3120, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (998, N'V', N'AMD Radeon HD 7660D', 2740, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (999, N'V', N'NVIDIA GeForce GT 750M', 1040, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1000, N'V', N'ATI Mobility Radeon HD 5870', 2440, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1001, N'V', N'AMD Radeon HD 7640G', 2440, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1002, N'V', N'AMD Radeon HD 6550D', 2400, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1003, N'V', N'NVIDIA GeForce GT 640 (GK208)', 2400, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1004, N'V', N'NVIDIA GeForce GT 640 (GDDR5)', 2310, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1005, N'V', N'NVIDIA GeForce GT 745M', 1900, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1006, N'V', N'AMD Radeon HD 8750M', 1890, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1007, N'V', N'AMD FirePro V4900', 1640, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1008, N'V', N'AMD Radeon HD 8670D', 1580, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1009, N'V', N'ATI FirePro V4800', 1450, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1010, N'V', N'AMD Radeon HD 7690M', 1210, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1011, N'V', N'NVIDIA NVS 5400M', 1110, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1012, N'V', N'Intel Iris Graphics 5100 Mobile', 1070, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1013, N'V', N'Intel HD Graphics 5000', 330, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1014, N'V', N'Intel HD Graphics 4200 Mobile', 1050, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1015, N'V', N'ATI Mobility Radeon HD 5650/5750', 930, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1016, N'V', N'AMD Radeon HD 7540D', 860, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1017, N'V', N'AMD Radeon HD 7480D', 580, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1018, N'C', N'Intel Core i7-4960X', 13200, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1019, N'C', N'Intel Core i7-4930K', 12790, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1020, N'C', N'Intel Core i7-3970X Extreme Edition ', 11420, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1021, N'C', N'Intel Core i7-4820K', 11640, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1022, N'C', N'Intel Core i7-4790 ', 9340, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1023, N'C', N'Intel Core i7-990X ', 9050, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1024, N'C', N'Intel Core i7-970  ', 8530, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1025, N'C', N'Intel Core i7-3770K ', 7880, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1026, N'C', N'Intel Core i7-2700K ', 7880, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1027, N'C', N'AMD FX-9590', 7830, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1028, N'C', N'AMD FX-9370', 7420, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1029, N'C', N'Intel Core i7-4900MQ', 7160, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1030, N'C', N'AMD FX-4350', 7140, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1031, N'C', N'Intel Core i5-4690 ', 6970, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1032, N'C', N'AMD FX-8350', 6870, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1033, N'C', N'Intel Core i7-4700HQ', 6810, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1034, N'C', N'AMD FX-6350', 6730, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1035, N'C', N'Intel Core i7-4712MQ', 6730, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1036, N'C', N'AMD FX-4300', 6590, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1037, N'C', N'Intel Core i7-3840QM', 6440, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1038, N'C', N'AMD FX-4170', 6430, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1039, N'C', N'Intel Core i5-3570K ', 6420, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1040, N'C', N'Intel Core i5-4440', 6390, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1041, N'C', N'Intel Core i5-2550K ', 6220, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1042, N'C', N'AMD FX-8320', 6180, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1043, N'C', N'AMD FX-6300', 6180, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1044, N'C', N'Intel Core i7-875K  ', 6110, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1045, N'C', N'Intel Core i7-3720QM ', 6090, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1046, N'C', N'AMD FX-4130', 5990, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1047, N'C', N'AMD FX-6200', 5990, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1048, N'C', N'Intel Core i5-2400 ', 5970, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1049, N'C', N'Intel Core i5-3450 ', 5920, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1050, N'C', N'AMD FX-8300', 5900, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1051, N'C', N'Intel Core i5-2320 ', 5850, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1052, N'C', N'Intel Core i7-860 ', 5850, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1053, N'C', N'AMD FX-8150', 5770, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1054, N'C', N'AMD FX-4100', 5770, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1055, N'C', N'Intel Core i7-3630QM ', 5750, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1056, N'C', N'Intel Core i7-3940XM', 5750, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1057, N'C', N'Intel Core i7-4600U ', 5740, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1058, N'C', N'Intel Core i7-3615QM ', 5570, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1059, N'C', N'AMD FX-6100', 5440, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1060, N'C', N'AMD FX-8120', 5220, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1061, N'C', N'AMD Phenom II X6 1100T', 5200, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1062, N'C', N'Intel Core i7-2760QM ', 5060, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1063, N'C', N'AMD Phenom II X6 1075T ', 4870, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1064, N'C', N'Intel Core i5-760 ', 4760, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1065, N'C', N'Intel Core i7-2670QM ', 4710, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1066, N'C', N'Intel Core i5  I5-750', 4570, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1067, N'C', N'Intel Core 2 Extreme  QX9650', 4140, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1068, N'C', N'Intel Core i3-3240', 4130, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1069, N'C', N'AMD Phenom II X4 965', 4100, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1070, N'C', N'AMD Phenom(tm) II X4 B60', 4000, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1071, N'C', N'Intel Core i5-3330', 3950, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1072, N'C', N'AMD A10-6800K', 3880, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1073, N'C', N'Intel Core i3-2120 ', 3880, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1074, N'C', N'Intel Core 2 Quad  Q9650', 3830, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1075, N'C', N'AMD A10-6790K', 3800, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1076, N'C', N'AMD A6-6400K', 3710, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1077, N'C', N'AMD A8-6600K', 3710, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1078, N'C', N'AMD Athlon X4 760K', 3620, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1079, N'C', N'AMD A10-5800K', 3590, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1080, N'C', N'AMD A10-6700', 3540, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1081, N'C', N'Intel Core i5-4200H', 2450, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1082, N'C', N'AMD A4-3870K', 3510, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1083, N'C', N'AMD A8-3850', 3470, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1084, N'C', N'AMD A8-5600K', 3420, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1085, N'C', N'Intel Pentium G3420', 3420, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1086, N'C', N'AMD A8-6500', 3360, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1087, N'C', N'Intel Core 2 Quad  Q8400', 3330, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1088, N'C', N'AMD Athlon II X4 641', 3260, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1089, N'C', N'AMD A10-5700', 3250, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1090, N'C', N'Intel Core i3-550 ', 3180, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1091, N'C', N'Intel Core 2 Quad  Q6700', 3150, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1092, N'C', N'AMD Athlon X4 740', 3150, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1093, N'C', N'Intel Core i5-3210M ', 3130, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1094, N'C', N'Intel Core 2 Quad  Q9300', 3080, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1095, N'C', N'Intel Core i3-3110M', 3000, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1096, N'C', N'Intel Pentium  G2030', 2940, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1097, N'C', N'AMD Athlon II X4 Quad-Core  630', 2780, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1098, N'C', N'AMD Phenom II X3 720', 2770, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1099, N'C', N'Intel Core i5-4300U ', 2720, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1100, N'C', N'Intel Core i3-2350M ', 2600, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1101, N'C', N'Intel Core 2 Duo  E8600', 2570, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1102, N'C', N'AMD A10-5750M', 2510, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1103, N'C', N'AMD Athlon II X3 455', 2410, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1104, N'C', N'AMD A10-4600M', 2220, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1105, N'C', N'AMD Phenom II X2 555 BE', 2170, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1106, N'C', N'Intel Core 2 Duo  E7400', 2150, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1107, N'C', N'Intel Core 2 Duo  E6850', 2080, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1108, N'C', N'AMD Athlon II X2 270', 2040, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1109, N'C', N'Intel Pentium Dual-Core E5300', 1640, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1110, N'C', N'AMD Athlon 64 X2  6000+', 1370, NULL)
SET IDENTITY_INSERT [dbo].[Hardware] OFF
/****** Object:  Table [dbo].[ParseAttribute]    Script Date: 07/19/2014 21:36:03 ******/
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
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PointXPath], [PagingXPath], [IsActive]) VALUES (4, N'V', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', N'//*[@id=''productTable'']/tr[i]/td[5]/div/div/span', NULL, 1)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PointXPath], [PagingXPath], [IsActive]) VALUES (5, N'C', N'http://www.futuremark.com/hardware/cpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', N'//*[@id=''productTable'']/tr[i]/td[5]/div/div/span', NULL, 1)
SET IDENTITY_INSERT [dbo].[ParseAttribute] OFF
/****** Object:  Table [dbo].[RecommendProduct]    Script Date: 07/19/2014 21:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecommendProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Parselink] [nvarchar](200) NULL,
	[Name] [nvarchar](200) NULL,
	[IsApprove] [bit] NULL,
	[RecommendTime] [datetime] NULL,
	[IsSeen] [bit] NOT NULL,
 CONSTRAINT [PK__Recommen__3214EC275EBF139D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RecommendProduct] ON
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime], [IsSeen]) VALUES (23, N'member1', N'http://www.thegioididong.com/laptop/asus-p550ld-xo216', N'a', 1, CAST(0x0000A08700000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime], [IsSeen]) VALUES (26, N'member1', N'http://www.lazada.vn/lenovo-g4070-59414340-core-i3-17ghz-14-2gb-den-149555.html', N'a', 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime], [IsSeen]) VALUES (27, N'member1', N'http://thietbiso.com/san-pham/chi-tiet/6704/asus-p550ldv-xo517d-black.html', N'a', 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime], [IsSeen]) VALUES (28, N'member1', N'http://www.vienthonga.vn/laptop-asus-p550ld-xo216d-black.html', N'a', 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime], [IsSeen]) VALUES (31, N'member1', N'http://www.dienmaythienhoa.vn/may-tinh-xach-tay-asus-p550ca-xo998d-m.black.html', N'a', 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime], [IsSeen]) VALUES (32, N'member1', N'http://www.nguyenkim.com/may-tinh-xach-tay-asus-p550ld-xo330d.html', N'a', 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime], [IsSeen]) VALUES (35, N'member1', N'http://laptopno1.com/chi-tiet-san-pham/1701/asus-p550ldv-xo517d-i5-haswell-4210u-4gb-1tb-vga-nvidia-geforce-gt-820m-2gb.htm', N'a', 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime], [IsSeen]) VALUES (36, N'member1', N'http://www.thegioididong.com/laptop/acer-aspire-e1-432-29552g50dn', N'Acer Aspire E1 432 29552G50Dn', 1, CAST(0x0000A36D00CA84ED AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime], [IsSeen]) VALUES (37, N'member1', N'http://www.thegioididong.com/laptop/acer-aspire-e1-410-001', N'Acer aspire E1 410 Celeron ,HDD 500GB', 1, CAST(0x0000A36D012C258A AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[RecommendProduct] OFF
/****** Object:  Table [dbo].[RatingProduct]    Script Date: 07/19/2014 21:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Point] [float] NOT NULL,
 CONSTRAINT [PK_a] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 07/19/2014 21:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttribute](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[AttributeID] [int] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dictionary]    Script Date: 07/19/2014 21:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dictionary](
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
SET IDENTITY_INSERT [dbo].[Dictionary] ON
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (899, 984, N'AMD Radeon HD 7990', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (900, 985, N'NVIDIA GeForce GTX 690', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (901, 986, N'AMD Radeon R9 290X', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (902, 987, N'AMD Radeon HD 7870 XT', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (903, 988, N'ATI Radeon HD 5970', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (904, 989, N'AMD Radeon HD 8970M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (905, 990, N'AMD Radeon HD 7850', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (906, 991, N'NVIDIA GeForce GTX 560 Ti 448', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (907, 992, N'NVIDIA GeForce GTX 650 Ti Boost', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (908, 993, N'AMD Radeon R7 260X', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (909, 994, N'AMD Radeon HD 6930', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (910, 995, N'AMD Radeon HD 7770', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (911, 996, N'ATI Radeon HD 5850', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (912, 997, N'AMD Radeon HD 6970M / 6990M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (913, 998, N'AMD Radeon HD 7660D', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (914, 999, N'NVIDIA GeForce GT 750M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (915, 1000, N'ATI Mobility Radeon HD 5870', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (916, 1001, N'AMD Radeon HD 7640G', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (917, 1002, N'AMD Radeon HD 6550D', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (918, 1003, N'NVIDIA GeForce GT 640 (GK208)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (919, 1004, N'NVIDIA GeForce GT 640 (GDDR5)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (920, 1005, N'NVIDIA GeForce GT 745M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (921, 1006, N'AMD Radeon HD 8750M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (922, 1007, N'AMD FirePro V4900', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (923, 1008, N'AMD Radeon HD 8670D', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (924, 1009, N'ATI FirePro V4800', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (925, 1010, N'AMD Radeon HD 7690M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (926, 1011, N'NVIDIA NVS 5400M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (927, 1012, N'Intel Iris Graphics 5100 Mobile', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (928, 1013, N'Intel HD Graphics 5000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (929, 1014, N'Intel HD Graphics 4200 Mobile', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (930, 1015, N'ATI Mobility Radeon HD 5650/5750', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (931, 1016, N'AMD Radeon HD 7540D', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (932, 1017, N'AMD Radeon HD 7480D', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (933, 1018, N'Intel Core i7-4960X', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (934, 1019, N'Intel Core i7-4930K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (935, 1020, N'Intel Core i7-3970X Extreme Edition ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (936, 1021, N'Intel Core i7-4820K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (937, 1022, N'Intel Core i7-4790 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (938, 1023, N'Intel Core i7-990X ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (939, 1024, N'Intel Core i7-970  ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (940, 1025, N'Intel Core i7-3770K ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (941, 1026, N'Intel Core i7-2700K ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (942, 1027, N'AMD FX-9590', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (943, 1028, N'AMD FX-9370', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (944, 1029, N'Intel Core i7-4900MQ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (945, 1030, N'AMD FX-4350', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (946, 1031, N'Intel Core i5-4690 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (947, 1032, N'AMD FX-8350', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (948, 1033, N'Intel Core i7-4700HQ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (949, 1034, N'AMD FX-6350', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (950, 1035, N'Intel Core i7-4712MQ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (951, 1036, N'AMD FX-4300', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (952, 1037, N'Intel Core i7-3840QM', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (953, 1038, N'AMD FX-4170', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (954, 1039, N'Intel Core i5-3570K ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (955, 1040, N'Intel Core i5-4440', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (956, 1041, N'Intel Core i5-2550K ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (957, 1042, N'AMD FX-8320', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (958, 1043, N'AMD FX-6300', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (959, 1044, N'Intel Core i7-875K  ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (960, 1045, N'Intel Core i7-3720QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (961, 1046, N'AMD FX-4130', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (962, 1047, N'AMD FX-6200', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (963, 1048, N'Intel Core i5-2400 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (964, 1049, N'Intel Core i5-3450 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (965, 1050, N'AMD FX-8300', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (966, 1051, N'Intel Core i5-2320 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (967, 1052, N'Intel Core i7-860 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (968, 1053, N'AMD FX-8150', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (969, 1054, N'AMD FX-4100', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (970, 1055, N'Intel Core i7-3630QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (971, 1056, N'Intel Core i7-3940XM', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (972, 1057, N'Intel Core i7-4600U ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (973, 1058, N'Intel Core i7-3615QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (974, 1059, N'AMD FX-6100', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (975, 1060, N'AMD FX-8120', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (976, 1061, N'AMD Phenom II X6 1100T', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (977, 1062, N'Intel Core i7-2760QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (978, 1063, N'AMD Phenom II X6 1075T ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (979, 1064, N'Intel Core i5-760 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (980, 1065, N'Intel Core i7-2670QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (981, 1066, N'Intel Core i5  I5-750', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (982, 1067, N'Intel Core 2 Extreme  QX9650', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (983, 1068, N'Intel Core i3-3240', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (984, 1069, N'AMD Phenom II X4 965', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (985, 1070, N'AMD Phenom(tm) II X4 B60', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (986, 1071, N'Intel Core i5-3330', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (987, 1072, N'AMD A10-6800K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (988, 1073, N'Intel Core i3-2120 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (989, 1074, N'Intel Core 2 Quad  Q9650', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (990, 1075, N'AMD A10-6790K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (991, 1076, N'AMD A6-6400K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (992, 1077, N'AMD A8-6600K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (993, 1078, N'AMD Athlon X4 760K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (994, 1079, N'AMD A10-5800K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (995, 1080, N'AMD A10-6700', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (996, 1081, N'Intel Core i5-4200H', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (997, 1082, N'AMD A4-3870K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (998, 1083, N'AMD A8-3850', 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (999, 1084, N'AMD A8-5600K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1000, 1085, N'Intel Pentium G3420', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1001, 1086, N'AMD A8-6500', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1002, 1087, N'Intel Core 2 Quad  Q8400', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1003, 1088, N'AMD Athlon II X4 641', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1004, 1089, N'AMD A10-5700', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1005, 1090, N'Intel Core i3-550 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1006, 1091, N'Intel Core 2 Quad  Q6700', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1007, 1092, N'AMD Athlon X4 740', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1008, 1093, N'Intel Core i5-3210M ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1009, 1094, N'Intel Core 2 Quad  Q9300', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1010, 1095, N'Intel Core i3-3110M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1011, 1096, N'Intel Pentium  G2030', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1012, 1097, N'AMD Athlon II X4 Quad-Core  630', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1013, 1098, N'AMD Phenom II X3 720', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1014, 1099, N'Intel Core i5-4300U ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1015, 1100, N'Intel Core i3-2350M ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1016, 1101, N'Intel Core 2 Duo  E8600', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1017, 1102, N'AMD A10-5750M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1018, 1103, N'AMD Athlon II X3 455', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1019, 1104, N'AMD A10-4600M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1020, 1105, N'AMD Phenom II X2 555 BE', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1021, 1106, N'Intel Core 2 Duo  E7400', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1022, 1107, N'Intel Core 2 Duo  E6850', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1023, 1108, N'AMD Athlon II X2 270', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1024, 1109, N'Intel Pentium Dual-Core E5300', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1025, 1110, N'AMD Athlon 64 X2  6000+', 1)
SET IDENTITY_INSERT [dbo].[Dictionary] OFF
/****** Object:  Table [dbo].[History]    Script Date: 07/19/2014 21:36:03 ******/
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
SET IDENTITY_INSERT [dbo].[History] ON
INSERT [dbo].[History] ([ID], [Username], [CompareTime]) VALUES (2, N'member1', CAST(0x0000A36100000000 AS DateTime))
INSERT [dbo].[History] ([ID], [Username], [CompareTime]) VALUES (3, N'member1', CAST(0x0000A36000000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[History] OFF
/****** Object:  Table [dbo].[HistoryDetail]    Script Date: 07/19/2014 21:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HistoryID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[isWinner] [bit] NULL,
 CONSTRAINT [PK_HistoryDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HistoryDetail] ON
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (5, 2, 120, NULL)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (6, 2, 121, NULL)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (7, 3, 122, NULL)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (8, 3, 123, NULL)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (9, 3, 124, NULL)
SET IDENTITY_INSERT [dbo].[HistoryDetail] OFF
/****** Object:  Default [DF_ProductAlias_IsMain]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[AliasProduct] ADD  CONSTRAINT [DF_ProductAlias_IsMain]  DEFAULT ((0)) FOR [IsMain]
GO
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
/****** Object:  ForeignKey [FK_AliasProduct_Product]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[AliasProduct]  WITH CHECK ADD  CONSTRAINT [FK_AliasProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AliasProduct] CHECK CONSTRAINT [FK_AliasProduct_Product]
GO
/****** Object:  ForeignKey [FK_AliasProduct_Store]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[AliasProduct]  WITH CHECK ADD  CONSTRAINT [FK_AliasProduct_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[AliasProduct] CHECK CONSTRAINT [FK_AliasProduct_Store]
GO
/****** Object:  ForeignKey [FK_AttributeMapping_AttributeDictionary]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[Dictionary]  WITH CHECK ADD  CONSTRAINT [FK_AttributeMapping_AttributeDictionary] FOREIGN KEY([AttributeDicID])
REFERENCES [dbo].[Hardware] ([ID])
GO
ALTER TABLE [dbo].[Dictionary] CHECK CONSTRAINT [FK_AttributeMapping_AttributeDictionary]
GO
/****** Object:  ForeignKey [FK_Hardware_Codetype]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[Hardware]  WITH CHECK ADD  CONSTRAINT [FK_Hardware_Codetype] FOREIGN KEY([CodetypeID])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[Hardware] CHECK CONSTRAINT [FK_Hardware_Codetype]
GO
/****** Object:  ForeignKey [FK_History_Account]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Account]
GO
/****** Object:  ForeignKey [FK_HistoryDetail_History]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_History] FOREIGN KEY([HistoryID])
REFERENCES [dbo].[History] ([ID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_History]
GO
/****** Object:  ForeignKey [FK_HistoryDetail_Product]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_Product]
GO
/****** Object:  ForeignKey [FK_ParseAttribute_Codetype]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[ParseAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ParseAttribute_Codetype] FOREIGN KEY([CodetypeID])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[ParseAttribute] CHECK CONSTRAINT [FK_ParseAttribute_Codetype]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_AttributeDictionary]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_AttributeDictionary] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Hardware] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_AttributeDictionary]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Product]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
/****** Object:  ForeignKey [FK_RatingProduct_Account]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[RatingProduct]  WITH CHECK ADD  CONSTRAINT [FK_RatingProduct_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RatingProduct] CHECK CONSTRAINT [FK_RatingProduct_Account]
GO
/****** Object:  ForeignKey [FK_RatingProduct_Product]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[RatingProduct]  WITH CHECK ADD  CONSTRAINT [FK_RatingProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[RatingProduct] CHECK CONSTRAINT [FK_RatingProduct_Product]
GO
/****** Object:  ForeignKey [FK_RecommendProduct_Account]    Script Date: 07/19/2014 21:36:03 ******/
ALTER TABLE [dbo].[RecommendProduct]  WITH CHECK ADD  CONSTRAINT [FK_RecommendProduct_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RecommendProduct] CHECK CONSTRAINT [FK_RecommendProduct_Account]
GO
