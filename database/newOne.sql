USE [CPS_Solution]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 07/16/2014 15:14:12 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 07/16/2014 15:14:12 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 07/16/2014 15:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](2000) NULL,
	[ImageURL] [nvarchar](200) NULL,
	[TotalWeightPoint] [float] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (120, N'Fill me                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'images/I//20140714/Laptop20140714-151923.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (121, N'Fill me                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'E:\Capstone Project\code\CPS_Solution\CPS_Solution\images\I\default.jpg', 0, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (122, N'Fill me                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'E:\Capstone Project\code\CPS_Solution\CPS_Solution\images\I\default.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (123, N'Fill me                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'E:\Capstone Project\code\CPS_Solution\CPS_Solution\images\I\default.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (124, N'Fill me                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'images/I//20140714/Laptop20140714-151950.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (125, N'Fill me                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'images/I//20140714/Laptop20140714-152004.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (126, NULL, N'http://laptopno1.com/images/products/129875295602206250.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (127, NULL, N'http://laptopno1.com/images/products/129875295602206250.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (128, NULL, N'http://laptopno1.com/images/products/129875295602206250.jpg', 0, 0)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (129, NULL, N'http://laptopno1.com/images/products/129875295602206250.jpg', 0, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[ParseInfo]    Script Date: 07/16/2014 15:14:12 ******/
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
/****** Object:  Table [dbo].[LogFile]    Script Date: 07/16/2014 15:14:12 ******/
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
/****** Object:  Table [dbo].[Codetype]    Script Date: 07/16/2014 15:14:12 ******/
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
/****** Object:  Table [dbo].[AliasProduct]    Script Date: 07/16/2014 15:14:12 ******/
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
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (121, 121, N'Asus P550LDV-XO517D Black', N'http://thietbiso.com/san-pham/chi-tiet/6704/asus-p550ldv-xo517d-black.html', 12999000, 8, 0, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (122, 121, N'Máy Tính Xách Tay ASUS P550CA-XO998D (M.BLACK)', N'http://www.dienmaythienhoa.vn/may-tinh-xach-tay-asus-p550ca-xo998d-m.black.html', 9990000, 4, 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (123, 121, N'Lenovo G4070 59414340 – Core i3 1.7GHz / 14” / 2GB (Đen)', N'http://www.lazada.vn/lenovo-g4070-59414340-core-i3-17ghz-14-2gb-den-149555.html', 9290000, 2, 0, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (124, 121, N'MÁY TÍNH XÁCH TAY ASUS P550LD-XO330D', N'http://www.nguyenkim.com/may-tinh-xach-tay-asus-p550ld-xo330d.html', 13690000, 3, 0, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (125, 121, N'Asus P550LD 54204G50G', N'http://www.thegioididong.com/laptop/asus-p550ld-xo216', 13290000, 9, 0, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (126, 121, N'Laptop ASUS P550LD-XO216D Black', N'http://www.vienthonga.vn/laptop-asus-p550ld-xo216d-black.html', 12990000, 10, 0, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (127, 126, N'dddddddddddddddddd', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (128, 127, N'fhggggggggdsàdâff', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (129, 128, N'fdfsggfdsgsfdgffffffff', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [IsMain], [IsActive]) VALUES (130, 129, N' Sony Vaio 5654645645', NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[AliasProduct] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 07/16/2014 15:14:12 ******/
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
/****** Object:  Table [dbo].[Hardware]    Script Date: 07/16/2014 15:14:12 ******/
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
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (625, N'C', N'Intel, Celeron, N2920, 1.86 GHz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (626, N'R', N'DDR3L (2 khe RAM), 2 GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (627, N'H', N'HDD, 500 GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (628, N'V', N'Intel® HD Graphics, 32 MB Share 966 MB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (629, N'D', N'14 inch, HD (1366 x 768 pixels)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (630, N'C', N'Intel, Core i3 Haswell, 4010U, 1.70 GHz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (631, N'V', N'Intel HD Graphics 4400, Share 931MB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (632, N'H', N'HDD,300 GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (633, N'C', N'Intel, Celeron Haswell, N2805, 1.46 GHz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (634, N'R', N'DDR3L(On board), 2 GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (635, N'H', N'HDD, 320 GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (636, N'C', N' Core i5', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (637, N'R', N' 4 GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (638, N'H', N' 128 GB SSD', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (639, N'V', N' intel 5000', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (640, N'D', N' 13.3', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (641, N'C', N' Core i7', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (642, N'R', N' 8GB DDR3', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (643, N'H', N' 1 TB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (644, N'V', N' GF GTX860M', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (645, N'D', N' 17.3', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (646, N'C', N'Intel Core i5 3230M 2.6Ghz Max Turbo Frequency 3.2Ghz (3MB Cache L3)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (647, N'R', N'6GB DDR3 1600Mhz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (648, N'H', N'1TB 5400 rpm', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (649, N'V', N'Intel HD Graphics 4000', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (650, N'D', N'14.0 " LED backlit HD (1366 x 768)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (651, N'C', N'Intel® Core™ i7-4700MQ Processor (2.4GHz, 6M Cache,Max Turbo Frequency 3.4GHz) Ivy Bridge', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (652, N'R', N'Ram 8GB-DDR3', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (653, N'H', N'HDD 1000GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (654, N'V', N'VGA nVIDIA® GeForce® GT740M-2GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (655, N'D', N'Màn hình 15.6-inch diagonal HD BrightView LED-backlit Display (1600x900)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (656, N'C', N'CPU: Intel® Core™ i5-4200M, 2.5GHz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (657, N'R', N'4GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (658, N'H', N'500GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (659, N'D', N'14', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (660, N'C', N'Intel, Pentium, 3556U, 1.70 GHz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (661, N'C', N'Intel Celeron 1007U (2 core)-1.1GHz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (662, N'R', N'2GB DDR3', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (663, N'V', N'Integrated Intel® GMA HD4000', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (664, N'D', N'14" LED Backlight', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (665, N'C', N'Bộ xử lý Intel Core i3-4010U 1.7GHz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (666, N'R', N'RAM 2GB / HDD 500GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (667, N'D', N'Màn hình LED HD 14”', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (668, N'R', N'2GB ', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (669, N'C', N'Intel® Core™ i7-4500MQ Processor', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (670, N'R', N'8GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (671, N'D', N'1920 x 1080', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (672, N'C', N'Intel Core i5-4200U (1.6Ghz upto 2.6Ghz, 3MB Cache L3)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (673, N'R', N'4GB DDR3L/1600Mhz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (674, N'H', N'500GB (5400rpm)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (675, N'D', N'14.0"', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (676, N'C', N'Intel® Core™ i7-3537U Processor (2.0 GHz, 3M Cache, up to 3.10 GHz, rPGA) ', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (677, N'R', N'8 GB DDR3', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (678, N'H', N'1000 GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (679, N'D', N'15.6 Widescreen HD LED Backlit Display (1366 x 768)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (680, N'C', N'i5-4200M, 2.5GHz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (681, N'R', N'6GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (682, N'H', N'750GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (683, N'V', N'AMD Radeon HD 8670M', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (684, N'D', N'1366 x 768', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (685, N'C', N'Intel Core-i7 - 4500U - 1.80 GHz Up to 3.0 GHz with Turbo Boost (4MB L3 Cache)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (686, N'R', N'OnBoard Memory 4 GB , 1 x DIMM socket for expansion up to 8 GB SDRAM', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (687, N'H', N'Serial ATA (SATA) 500B - 5400 rpm', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (688, N'V', N'Intel HD Graphics 4400 / NVIDIA GeForce GT 820M with 2GB DDR3 VRAM', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (689, N'D', N'15.6" HD LED Backlit (1366x768)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (690, N'C', N'Intel Core-i5 - 4200U - 1.60 Up to 2.6GHz with Turbo Boost (3MB L3 Cache)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (691, N'C', N'MÁY TÍNH XÁCH TAY HP PAVILION 14-N231TU NB PC A/P G2G81PA#UUF', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (692, N'R', N'4 GB 1600 MHz DDR3L SDRAM (1 x 4 GB)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (693, N'D', N'14" diagonal HD BrightView LED-backlit 1366 x 768 pixels', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (694, N'C', N'Intel Ivy Haswell Core i5- 4200U 1.6GHz (3MB L3 cache, Max Turbo Frequency 2.6GHz) Thế hệ mới nhất', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (695, N'R', N'4GB DDR3 Bus 1600 Mhz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (696, N'H', N'500GB Hard Drive', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (697, N'V', N'NVIDIA Geforce 720M GT 1GB Vram ( Hỗ trợ tốt game & đồ họa)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (698, N'D', N'14.0-inch LED-backlit Display (1366 x 768) with touch screen ( màn hình cảm ứng )', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (699, N'C', N'Intel, Core i5 Haswell, 4200U, 1.60 GHz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (700, N'R', N'DDR3L(On board+1Khe), 4 GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (701, N'V', N'NVIDIA® GeForce® GT 820M, 2 GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (702, N'D', N'Display 15.6" LED HD(1366x768)/ Free Dos', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (703, N'C', N'Intel Core i5 - 4200U Processor 1.6Ghz&nbsp;', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (704, N'V', N'
				Đồ họa:

							
		NVIDIA® GeForce® GT 820M 
		', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (705, N'D', N'15.6 inch', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (706, N'C', N'4rd generation Haswell Intel(R) Core(TM) i5 - 4210U (1.7 GHz, 3MB L3 Cache) Turbo Boost up to 2.7GHz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (707, N'H', N'1TB Hard Drive', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (708, N'D', N'15.6" HD Slim (1366x768) Anti Glare', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (709, N'C', N'Core i3', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (710, N'C', N'Intel Core bbbbb', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (711, N'V', N'Intel 333333333333', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (712, N'H', N'789', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (713, N'D', N'8888 x 333', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (714, N'R', N'3', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (715, N'C', N'Intel Core aaaaaa', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (716, N'V', N'NVIDIA 44444444444444', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (717, N'H', N'999', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (718, N'D', N'7777 x 444', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (719, N'R', N'4', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (720, N'C', N'Intel Core cccccc', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (721, N'V', N'Intel 5555555555555', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (722, N'H', N'100', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (723, N'D', N'6666 x 555', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (724, N'R', N'5', 0, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (725, N'C', N'Intel Corddđ', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (726, N'V', N'Intel Core 6666668', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (727, N'H', N'500', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (728, N'D', N'1368 x 768', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (729, N'R', N'6', 0, 0)
SET IDENTITY_INSERT [dbo].[Hardware] OFF
/****** Object:  Table [dbo].[ParseAttribute]    Script Date: 07/16/2014 15:14:12 ******/
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
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PointXPath], [PagingXPath], [IsActive]) VALUES (2, N'C', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', N'//*[@id=''productTable'']/tr[i]/td[6]/span[1]', NULL, 1)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PointXPath], [PagingXPath], [IsActive]) VALUES (3, N'C', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', N'//*[@id=''productTable'']/tr[i]/td[6]/span[1]', NULL, 0)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PointXPath], [PagingXPath], [IsActive]) VALUES (4, N'V', N'http://www.futuremark.com/hardware/gpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', N'//*[@id=''productTable'']/tr[i]/td[6]/span[1]', NULL, 1)
INSERT [dbo].[ParseAttribute] ([ID], [CodetypeID], [ParseAttributelink], [NameXPath], [PointXPath], [PagingXPath], [IsActive]) VALUES (5, N'C', N'http://www.futuremark.com/hardware/cpu', N'//*[@id=''productTable'']/tr[i]/td[3]/a', N'//*[@id=''productTable'']/tr[i]/td[6]/span[1]', NULL, 1)
SET IDENTITY_INSERT [dbo].[ParseAttribute] OFF
/****** Object:  Table [dbo].[RecommendProduct]    Script Date: 07/16/2014 15:14:12 ******/
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
 CONSTRAINT [PK__Recommen__3214EC275EBF139D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RecommendProduct] ON
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime]) VALUES (23, N'member1', N'http://www.thegioididong.com/laptop/asus-p550ld-xo216', N'a', 1, CAST(0x0000A08700000000 AS DateTime))
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime]) VALUES (26, N'member1', N'http://www.lazada.vn/lenovo-g4070-59414340-core-i3-17ghz-14-2gb-den-149555.html', N'a', 1, CAST(0x0000A36100000000 AS DateTime))
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime]) VALUES (27, N'member1', N'http://thietbiso.com/san-pham/chi-tiet/6704/asus-p550ldv-xo517d-black.html', N'a', 1, CAST(0x0000A36100000000 AS DateTime))
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime]) VALUES (28, N'member1', N'http://www.vienthonga.vn/laptop-asus-p550ld-xo216d-black.html', N'a', 1, CAST(0x0000A36100000000 AS DateTime))
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime]) VALUES (31, N'member1', N'http://www.dienmaythienhoa.vn/may-tinh-xach-tay-asus-p550ca-xo998d-m.black.html', N'a', 1, CAST(0x0000A36100000000 AS DateTime))
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime]) VALUES (32, N'member1', N'http://www.nguyenkim.com/may-tinh-xach-tay-asus-p550ld-xo330d.html', N'a', 1, CAST(0x0000A36100000000 AS DateTime))
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [RecommendTime]) VALUES (35, N'member1', N'http://laptopno1.com/chi-tiet-san-pham/1701/asus-p550ldv-xo517d-i5-haswell-4210u-4gb-1tb-vga-nvidia-geforce-gt-820m-2gb.htm', N'a', 1, CAST(0x0000A36100000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[RecommendProduct] OFF
/****** Object:  Table [dbo].[RatingProduct]    Script Date: 07/16/2014 15:14:12 ******/
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
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 07/16/2014 15:14:12 ******/
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
SET IDENTITY_INSERT [dbo].[ProductAttribute] ON
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (697, 120, 702, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (698, 121, 709, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (699, 121, 668, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (700, 121, 658, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (701, 121, 649, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (702, 121, 705, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (703, 122, 665, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (704, 122, 668, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (705, 122, 658, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (706, 122, 667, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (707, 123, 690, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (708, 123, 686, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (709, 123, 688, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (710, 123, 689, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (711, 124, 699, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (712, 124, 700, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (713, 124, 627, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (714, 124, 701, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (715, 125, 703, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (716, 125, 674, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (717, 125, 704, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (718, 125, 705, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (719, 126, 710, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (720, 126, 714, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (721, 126, 712, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (722, 126, 713, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (723, 126, 711, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (724, 127, 715, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (725, 127, 719, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (726, 127, 717, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (727, 127, 718, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (728, 127, 716, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (729, 128, 720, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (730, 128, 724, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (731, 128, 722, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (732, 128, 723, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (733, 128, 721, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (734, 129, 725, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (735, 129, 729, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (736, 129, 727, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (737, 129, 728, NULL)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (738, 129, 726, NULL)
SET IDENTITY_INSERT [dbo].[ProductAttribute] OFF
/****** Object:  Table [dbo].[Dictionary]    Script Date: 07/16/2014 15:14:12 ******/
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
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (555, 625, N'Intel, Celeron, N2920, 1.86 GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (556, 626, N'DDR3L (2 khe RAM), 2 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (557, 627, N'HDD, 500 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (558, 628, N'Intel® HD Graphics, 32 MB Share 966 MB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (559, 629, N'14 inch, HD (1366 x 768 pixels)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (560, 630, N'Intel, Core i3 Haswell, 4010U, 1.70 GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (561, 631, N'Intel HD Graphics 4400, Share 931MB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (562, 632, N'HDD, 300 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (563, 633, N'Intel, Celeron Haswell, N2805, 1.46 GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (564, 634, N'DDR3L(On board), 2 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (565, 635, N'HDD, 320 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (566, 629, N'10.1 inch, HD (1366 x 768 pixels)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (567, 628, N'Intel® HD Graphics, Share', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (568, 635, N'HDD, 420 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (569, 630, N'Intel, Core i3 Haswell, 3010U, 1.70 GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (570, 625, N'Intel, Celeron, N2920, 1.76 GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (571, 636, N' Core i5', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (572, 637, N' 4 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (573, 638, N' 128 GB SSD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (574, 639, N' intel 5000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (575, 640, N' 13.3', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (576, 641, N' Core i7', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (577, 642, N' 8GB DDR3', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (578, 643, N' 1 TB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (579, 644, N' GF GTX860M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (580, 645, N' 17.3', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (581, 646, N'Intel Core i5 3230M 2.6Ghz Max Turbo Frequency 3.2Ghz (3MB Cache L3)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (582, 647, N'6GB DDR3 1600Mhz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (583, 648, N'1TB 5400 rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (584, 649, N'Intel HD Graphics 4000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (585, 650, N'14.0 " LED backlit HD (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (586, 651, N'Intel® Core™ i7-4700MQ Processor (2.4GHz, 6M Cache,Max Turbo Frequency 3.4GHz) Ivy Bridge', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (587, 652, N'Ram 8GB-DDR3', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (588, 653, N'HDD 1000GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (589, 654, N'VGA nVIDIA® GeForce® GT740M-2GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (590, 655, N'Màn hình 15.6-inch diagonal HD BrightView LED-backlit Display (1600x900)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (591, 656, N'CPU: Intel® Core™ i5-4200M, 2.5GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (592, 657, N'4GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (593, 658, N'500GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (594, 659, N'14', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (595, 660, N'Intel, Pentium, 3556U, 1.70 GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (596, 661, N'Intel Celeron 1007U (2 core)-1.1GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (597, 662, N'2GB DDR3', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (598, 663, N'Integrated Intel® GMA HD4000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (599, 664, N'14" LED Backlight', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (600, 665, N'Bộ xử lý Intel Core i3-4010U 1.7GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (601, 666, N'RAM 2GB / HDD 500GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (602, 667, N'Màn hình LED HD 14”', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (603, 668, N'2GB ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (604, 669, N'Intel® Core™ i7-4500MQ Processor', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (605, 670, N'8GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (606, 671, N'1920 x 1080', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (607, 672, N'Intel Core i5-4200U (1.6Ghz upto 2.6Ghz, 3MB Cache L3)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (608, 673, N'4GB DDR3L/1600Mhz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (609, 674, N'500GB (5400rpm)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (610, 675, N'14.0"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (611, 676, N'Intel® Core™ i7-3537U Processor (2.0 GHz, 3M Cache, up to 3.10 GHz, rPGA) ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (612, 677, N'8 GB DDR3', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (613, 678, N'1000 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (614, 679, N'15.6 Widescreen HD LED Backlit Display (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (615, 680, N'i5-4200M, 2.5GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (616, 681, N'6GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (617, 682, N'750GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (618, 683, N'AMD Radeon HD 8670M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (619, 684, N'1366 x 768', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (620, 685, N'Intel Core-i7 - 4500U - 1.80 GHz Up to 3.0 GHz with Turbo Boost (4MB L3 Cache)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (621, 686, N'OnBoard Memory 4 GB , 1 x DIMM socket for expansion up to 8 GB SDRAM', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (622, 687, N'Serial ATA (SATA) 500B - 5400 rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (623, 688, N'Intel HD Graphics 4400 / NVIDIA GeForce GT 820M with 2GB DDR3 VRAM', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (624, 689, N'15.6" HD LED Backlit (1366x768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (625, 690, N'Intel Core-i5 - 4200U - 1.60 Up to 2.6GHz with Turbo Boost (3MB L3 Cache)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (626, 691, N'MÁY TÍNH XÁCH TAY HP PAVILION 14-N231TU NB PC A/P G2G81PA#UUF', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (627, 692, N'4 GB 1600 MHz DDR3L SDRAM (1 x 4 GB)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (628, 693, N'14" diagonal HD BrightView LED-backlit 1366 x 768 pixels', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (629, 694, N'Intel Ivy Haswell Core i5- 4200U 1.6GHz (3MB L3 cache, Max Turbo Frequency 2.6GHz) Thế hệ mới nhất', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (630, 695, N'4GB DDR3 Bus 1600 Mhz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (631, 696, N'500GB Hard Drive', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (632, 697, N'NVIDIA Geforce 720M GT 1GB Vram ( Hỗ trợ tốt game & đồ họa)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (633, 698, N'14.0-inch LED-backlit Display (1366 x 768) with touch screen ( màn hình cảm ứng )', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (634, 699, N'Intel, Core i5 Haswell, 4200U, 1.60 GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (635, 700, N'DDR3L(On board+1Khe), 4 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (636, 701, N'NVIDIA® GeForce® GT 820M, 2 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (637, 702, N'Display 15.6" LED HD(1366x768)/ Free Dos', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (638, 703, N'Intel Core i5 - 4200U Processor 1.6Ghz&nbsp;', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (639, 704, N'
				Đồ họa:

							
		NVIDIA® GeForce® GT 820M 
		', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (640, 705, N'15.6 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (641, 706, N'4rd generation Haswell Intel(R) Core(TM) i5 - 4210U (1.7 GHz, 3MB L3 Cache) Turbo Boost up to 2.7GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (642, 707, N'1TB Hard Drive', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (643, 708, N'15.6" HD Slim (1366x768) Anti Glare', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (644, 709, N'Core i3', 1)
SET IDENTITY_INSERT [dbo].[Dictionary] OFF
/****** Object:  Table [dbo].[History]    Script Date: 07/16/2014 15:14:12 ******/
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
/****** Object:  Table [dbo].[HistoryDetail]    Script Date: 07/16/2014 15:14:12 ******/
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
/****** Object:  Default [DF_ProductAlias_IsMain]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[AliasProduct] ADD  CONSTRAINT [DF_ProductAlias_IsMain]  DEFAULT ((0)) FOR [IsMain]
GO
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
/****** Object:  ForeignKey [FK_AliasProduct_Product]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[AliasProduct]  WITH CHECK ADD  CONSTRAINT [FK_AliasProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AliasProduct] CHECK CONSTRAINT [FK_AliasProduct_Product]
GO
/****** Object:  ForeignKey [FK_AliasProduct_Store]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[AliasProduct]  WITH CHECK ADD  CONSTRAINT [FK_AliasProduct_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[AliasProduct] CHECK CONSTRAINT [FK_AliasProduct_Store]
GO
/****** Object:  ForeignKey [FK_AttributeMapping_AttributeDictionary]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[Dictionary]  WITH CHECK ADD  CONSTRAINT [FK_AttributeMapping_AttributeDictionary] FOREIGN KEY([AttributeDicID])
REFERENCES [dbo].[Hardware] ([ID])
GO
ALTER TABLE [dbo].[Dictionary] CHECK CONSTRAINT [FK_AttributeMapping_AttributeDictionary]
GO
/****** Object:  ForeignKey [FK_Hardware_Codetype]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[Hardware]  WITH CHECK ADD  CONSTRAINT [FK_Hardware_Codetype] FOREIGN KEY([CodetypeID])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[Hardware] CHECK CONSTRAINT [FK_Hardware_Codetype]
GO
/****** Object:  ForeignKey [FK_History_Account]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Account]
GO
/****** Object:  ForeignKey [FK_HistoryDetail_History]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_History] FOREIGN KEY([HistoryID])
REFERENCES [dbo].[History] ([ID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_History]
GO
/****** Object:  ForeignKey [FK_HistoryDetail_Product]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_Product]
GO
/****** Object:  ForeignKey [FK_ParseAttribute_Codetype]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[ParseAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ParseAttribute_Codetype] FOREIGN KEY([CodetypeID])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[ParseAttribute] CHECK CONSTRAINT [FK_ParseAttribute_Codetype]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_AttributeDictionary]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_AttributeDictionary] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Hardware] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_AttributeDictionary]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Product]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
/****** Object:  ForeignKey [FK_RatingProduct_Account]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[RatingProduct]  WITH CHECK ADD  CONSTRAINT [FK_RatingProduct_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RatingProduct] CHECK CONSTRAINT [FK_RatingProduct_Account]
GO
/****** Object:  ForeignKey [FK_RatingProduct_Product]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[RatingProduct]  WITH CHECK ADD  CONSTRAINT [FK_RatingProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[RatingProduct] CHECK CONSTRAINT [FK_RatingProduct_Product]
GO
/****** Object:  ForeignKey [FK_RecommendProduct_Account]    Script Date: 07/16/2014 15:14:12 ******/
ALTER TABLE [dbo].[RecommendProduct]  WITH CHECK ADD  CONSTRAINT [FK_RecommendProduct_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RecommendProduct] CHECK CONSTRAINT [FK_RecommendProduct_Account]
GO
