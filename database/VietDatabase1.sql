USE [CPS_Solution]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 07/25/2014 14:44:51 ******/
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
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (2, N'LaZaDa', N'lazada.vn', N'images/StoreLogo/lazada.jpg', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (3, N'Nguyễn Kim', N'nguyenkim.com', N'images/StoreLogo/nguyenkim.jpg', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (4, N'Điện Máy Thiên Hòa', N'dienmaythienhoa.vn', N'images/StoreLogo/thienhoa.jpg', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (5, N'Điện Máy Chợ Lớn', N'dienmaycholon.vn', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (6, N'Laptop Gia Huy', N'laptopgiahuy.com', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (7, N'Viettel Store', N'viettelstore.vn', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (8, N'Thiết Bị Số', N'thietbiso.com', N'default', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (9, N'Thế giới Di Động', N'thegioididong.com', N'images/StoreLogo/tgdd.jpg', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (10, N'Viễn Thông A', N'vienthonga.vn', N'images/StoreLogo/vienthonga.jpg', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (11, N'Chưa xác định', N'laptopno1.com', N'default', 0)
SET IDENTITY_INSERT [dbo].[Store] OFF
/****** Object:  Table [dbo].[Role]    Script Date: 07/25/2014 14:44:51 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 07/25/2014 14:44:51 ******/
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
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (140, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsa130484076610255395.jpeg.jpeg', 20998, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (141, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsalenovo-ideapad-s210.jpg.jpg', 5408, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (142, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsa5061.jpg.jpg', 5228, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (143, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsalenovo-laptop-g40-cover-zoom-8.jpg.jpg', 5228, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (144, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsa09051.jpg.jpg', 4878, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (145, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsa130300749977618625.jpg.jpg', 7608, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (146, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsag500s.jpg.jpg', 4123, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (147, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsag410.jpg.jpg', 14483, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (148, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsalenovo-ideapad-s211.jpg.jpg', 3253, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (149, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsak450cc-wx263d.jpg.jpg', 14743, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (150, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsaasus%20k550-bk0.jpg.jpg', 4353, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (151, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsak551lb3.jpg.jpg', 10213, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (152, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsak451%203.jpg.jpg', 7689, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (153, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsak551.jpg.jpg', 10597, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (154, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsak451.jpg.jpg', 12079, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (155, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsak450.jpg.jpg', 11359, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (156, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsa130190352397879888.jpg.jpg', 14218, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (157, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsa130483169488120976.jpg.jpg', 8920, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (158, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsa130162576845717155.jpg.jpg', 14945, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (159, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsa130114201292125443.jpg.jpg', 14345, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (160, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsa130114200998828668.jpg.jpg', 12855, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (161, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsa14n26.jpg.jpg', 10158, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (162, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsa130470259708149666.jpg.jpg', 21078, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (163, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsadell_3550.jpg.jpg', 15770, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (164, NULL, N'Images/I/httpbaalaptopno1.comaimagesaproductsadell_3548.jpg.jpg', 16397, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[ParseInfo]    Script Date: 07/25/2014 14:44:51 ******/
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
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [PriceXPath], [ImageXpath], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (96, N'http://www.lazada.vn/asus-taichi31-cx018h-core-i7-3517u-19ghz-133-4gb-bac-162931.html', N'//*[@id=''prod_title'']', N'//*[@id=''special_price_box'']', N'html/body/div[7]/div/div[2]/div/img', N'//*[@id=''prod_content_wrapper'']/div[3]/div/ul/li[1]/span', N'//*[@id=''prod_content_wrapper'']/div[3]/div/ul/li[3]/span', N'//*[@id=''prod_content_wrapper'']/div[3]/div/ul/li[4]/span', N'//*[@id=''prod_content_wrapper'']/div[3]/div/ul/li[3]/span', N'//*[@id=''prod_content_wrapper'']/div[3]/div/ul/li[2]/span', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [PriceXPath], [ImageXpath], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (97, N'http://thietbiso.com/san-pham/chi-tiet/6704/asus-p550ldv-xo517d-black.html', N'//*[@id=''topbar'']/h1', N'//*[@id=''product-form'']/div/div[2]/div[1]/div/span/span', N'//*[@id=''fullimg_preview'']', N'//*[@id=''product-form'']/div/div[2]/div[2]/div[2]/div[1]/p[2]/span', N'//*[@id=''product-form'']/div/div[2]/div[2]/div[2]/div[1]/p[3]/span', N'//*[@id=''product-form'']/div/div[2]/div[2]/div[2]/div[1]/p[5]/span', N'//*[@id=''product-form'']/div/div[2]/div[2]/div[2]/div[1]/p[4]/span', N'//*[@id=''product-form'']/div/div[2]/div[2]/div[2]/div[1]/p[6]/span[2]', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [PriceXPath], [ImageXpath], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (98, N'http://www.vienthonga.vn/laptop-asus-p550ld-xo216d-black.html', N'//*[@id=''content'']/div/div[2]/div/div[6]/form/div[2]/div[2]/h1', N'//*[@id=''sec_list_price_182271'']', N'//*[@id=''det_img_182271_16025'']', N'//*[@id=''content_block_features'']/div[5]/p', N'//*[@id=''content_block_features'']/div[6]/p', N'//*[@id=''content_block_features'']/div[17]', N'//*[@id=''content_block_features'']/div[14]/p', N'//*[@id=''content_block_features'']/div[4]/p', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [PriceXPath], [ImageXpath], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (99, N'http://www.nguyenkim.com/may-tinh-xach-tay-asus-p550ld-xo330d.html', N'//*[@id=''tygh_main_container'']/div[3]/div/div[2]/div/div[2]/div[1]/div[2]/form/div/div[1]/h1', N'//*[@id=''sec_discounted_price_20372'']', N'//*[@id=''fancybox-img'']', N'//*[@id=''content_description'']/table/tr[2]/td/table/tbody/tr[3]/td[2]/p/span', N'//*[@id=''content_description'']/table/tr[2]/td/table/tbody/tr[4]/td[2]/p/span', N'//*[@id=''content_description'']/table/tr[2]/td/table/tbody/tr[7]/td[2]/p/span', N'//*[@id=''content_description'']/table/tr[2]/td/table/tbody/tr[5]/td[2]/p/span', N'//*[@id=''content_description'']/table/tr[2]/td/table/tbody/tr[8]/td[2]/p/span', 1)
INSERT [dbo].[ParseInfo] ([ID], [Parselink], [Name], [PriceXPath], [ImageXpath], [CPUXPath], [RAMXPath], [VGAXPath], [HDDXPath], [DisplayXPath], [IsActive]) VALUES (100, N'http://trananh.vn/laptop-tablet/laptop/id174025/may-tinh-xach-tay-inspiron-7437-h4i52090--p174025c2/index.htm', N'//*[@id=''ctl00_ContentPlaceHolder1_ltlprice1'']', N'//*[@id=''col_right'']/div[1]/div[2]/div[1]/ul/li[2]/p[1]', N'//*[@id=''product_image'']/img', N'//*[@id=''ctl00_ContentPlaceHolder1_ltlkythuat'']/table/tr[5]/td[2]', N'//*[@id=''ctl00_ContentPlaceHolder1_ltlkythuat'']/table/tr[6]/td[2]', N'//*[@id=''ctl00_ContentPlaceHolder1_ltlkythuat'']/table/tr[8]/td[2]', N'//*[@id=''ctl00_ContentPlaceHolder1_ltlkythuat'']/table/tr[7]/td[2]', N'//*[@id=''ctl00_ContentPlaceHolder1_ltlkythuat'']/table/tr[9]/td[2]', 1)
SET IDENTITY_INSERT [dbo].[ParseInfo] OFF
/****** Object:  Table [dbo].[LogFile]    Script Date: 07/25/2014 14:44:51 ******/
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
/****** Object:  Table [dbo].[Codetype]    Script Date: 07/25/2014 14:44:51 ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 07/25/2014 14:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1, N'Asus')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (2, N'Acer')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (3, N'Apple')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (4, N'Dell')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (5, N'Toshiba')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (6, N'HP')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (7, N'SamSung')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (8, N'MSI')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (9, N'Lenovo')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (10, N'Sony')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (11, N'COMPAQ')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (12, N'MacBook ')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (13, N'Tat Ca')
SET IDENTITY_INSERT [dbo].[Brand] OFF
/****** Object:  Table [dbo].[AliasProduct]    Script Date: 07/25/2014 14:44:51 ******/
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
	[BrandID] [int] NULL,
	[UpdateTime] [datetime] NULL,
	[IsMain] [bit] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProductAlias] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AliasProduct] ON
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (146, 140, N'Sony Vaio SVT14127', N'http://laptopno1.com/chi-tiet-san-pham/1302/sony-vaio-svt14127-core-i7-3537u-4gb-500gb-24g-ssd-touch.htm', 13490000, 11, 10, CAST(0x0000A37200863940 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (147, 141, N'LENOVO IDEAPAD S210 (59389595)', N'http://laptopno1.com/', 11490000, 11, 9, CAST(0x0000A37200863B5E AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (148, 142, N'Lenovo IdeaPad G400 (59375061)', N'http://laptopno1.com/', 10490000, 11, 9, CAST(0x0000A37200863E1B AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (149, 143, N'Lenovo G40-70 (5941-4338)', N'http://laptopno1.com/', 12490000, 11, 9, CAST(0x0000A372008645FC AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (150, 144, N'Lenovo S410P ( 59409051)', N'http://laptopno1.com/', 16490000, 11, 9, CAST(0x0000A372008648C1 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (151, 145, N'LENOVO G400s ', N'http://laptopno1.com/', 11490000, 11, 9, CAST(0x0000A37200865709 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (152, 146, N'LENOVO G500S (59409052)', N'http://laptopno1.com/', 12490000, 11, 9, CAST(0x0000A37200865A2F AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (153, 147, N'LENOVO G410', N'http://laptopno1.com/', 13490000, 11, 9, CAST(0x0000A37200866013 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (154, 148, N'LENOVO IDEAPAD S210 (59402712)', N'http://laptopno1.com/', 13490000, 11, 9, CAST(0x0000A37200866223 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (155, 149, N'Asus K450LA - WX040D ', N'http://laptopno1.com/', 13490000, 11, 1, CAST(0x0000A37200866709 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (156, 150, N'Asus K550LAV - XX410D', N'http://laptopno1.com/', 13490000, 11, 1, CAST(0x0000A3720086848D AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (157, 151, N'ASUS K551LA XX216D', N'http://laptopno1.com/', 13490000, 11, 1, CAST(0x0000A372008686A0 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (158, 152, N'Asus K451LA - WX089D', N'http://laptopno1.com/', 13490000, 11, 1, CAST(0x0000A37200868FB3 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (159, 153, N'ASUS K551LB-XX276D', N'http://laptopno1.com/', 13490000, 11, 1, CAST(0x0000A37200869392 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (160, 154, N'ASUS K451LN-WX080D', N'http://laptopno1.com/', 13490000, 11, 1, CAST(0x0000A3720086958A AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (161, 155, N'ASUS K450CA-WX210', N'http://laptopno1.com/', 13490000, 11, 1, CAST(0x0000A3720086965D AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (162, 156, N'Dell Inspiron 15R N5537 (2NP1W2)', N'http://laptopno1.com/', 13490000, 11, 4, CAST(0x0000A372008699B4 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (163, 157, N'Dell Inspiron 7737 (MNWWF1)', N'http://laptopno1.com/', 13490000, 11, 4, CAST(0x0000A3720086A153 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (164, 158, N'MacBook Pro 17 A1297', N'http://laptopno1.com/', 13490000, 11, 12, CAST(0x0000A3720086A51F AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (165, 159, N'Acer Aspire E1-471G-3324G50Mnks', N'http://laptopno1.com/', 13490000, 11, 2, CAST(0x0000A3720086A895 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (166, 160, N'Acer Aspire V5-471 NX.m3ssv', N'http://laptopno1.com/', 13490000, 11, 2, CAST(0x0000A3720086ABCB AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (167, 161, N'Sony Vaio Multi Flip Fit 14A SVF14N26SGS1', N'http://laptopno1.com/', 15490000, 11, 10, CAST(0x0000A3720086ADF0 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (168, 162, N'Sony Vaio Multi Flip Fit 14A SVF14N16SGS', N'http://laptopno1.com/chi-tiet-san-pham/1653/sony-vaio-multi-flip-fit-14a-svf14n16sgs-i5-4200u-4gb-1tb-touch-win8-.htm', 12490000, 11, 10, CAST(0x0000A3720086C8FB AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (169, 163, N'DELL Inspiron N3542 (DND6X5)', N'http://laptopno1.com/', 13490000, 11, 4, CAST(0x0000A3720086CB9B AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (170, 164, N'DELL Inspiron N3542 (DND6X4)', N'http://laptopno1.com/', 13490000, 11, 4, CAST(0x0000A3720086CE2D AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (176, 140, N'Sony Vaio T SVT1427', N'http://www.thegioididong.com/laptop/sony-vaio-svt13126cv-53314g128w8', 14000000, 9, 10, CAST(0x0000A39100000000 AS DateTime), 0, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (177, 149, N'Asus K450LA', N'http://www.thegioididong.com/laptop/asus-k450la-54204g50', 15000000, 9, 1, CAST(0x0000A39100000000 AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[AliasProduct] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 07/25/2014 14:44:51 ******/
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
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'hanker12', N'123456', N'iv250509@gmail.com', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'member1', N'123456', N'iv250509@gmail.com', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'staff', N'123456', N'iv250509@gmail.com', 2, 1)
/****** Object:  Table [dbo].[Hardware]    Script Date: 07/25/2014 14:44:51 ******/
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
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (984, N'V', N'AMD Radeon HD 7990', 18190, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (985, N'V', N'NVIDIA GeForce GTX 690', 9730, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (986, N'V', N'AMD Radeon R9 290X', 14570, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (987, N'V', N'AMD Radeon HD 7870 XT', 8090, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (988, N'V', N'ATI Radeon HD 5970', 7660, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (989, N'V', N'AMD Radeon HD 8970M', 6670, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (990, N'V', N'AMD Radeon HD 7850', 6630, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (991, N'V', N'NVIDIA GeForce GTX 560 Ti 448', 4730, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (992, N'V', N'NVIDIA GeForce GTX 650 Ti Boost', 5770, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (993, N'V', N'AMD Radeon R7 260X', 5280, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (994, N'V', N'AMD Radeon HD 6930', 4880, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (995, N'V', N'AMD Radeon HD 7770', 4000, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (996, N'V', N'ATI Radeon HD 5850', 3820, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (997, N'V', N'AMD Radeon HD 6970M / 6990M', 3120, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (998, N'V', N'AMD Radeon HD 7660D', 2740, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (999, N'V', N'NVIDIA GeForce GT 750M', 1040, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1000, N'V', N'ATI Mobility Radeon HD 5870', 2440, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1001, N'V', N'AMD Radeon HD 7640G', 2440, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1002, N'V', N'AMD Radeon HD 6550D', 2400, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1003, N'V', N'NVIDIA GeForce GT 640 (GK208)', 2400, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1004, N'V', N'NVIDIA GeForce GT 640 (GDDR5)', 2310, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1005, N'V', N'NVIDIA GeForce GT 745M', 1900, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1006, N'V', N'AMD Radeon HD 8750M', 1890, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1007, N'V', N'AMD FirePro V4900', 1640, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1008, N'V', N'AMD Radeon HD 8670D', 1580, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1009, N'V', N'ATI FirePro V4800', 1450, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1010, N'V', N'AMD Radeon HD 7690M', 1210, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1011, N'V', N'NVIDIA NVS 5400M', 1110, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1012, N'V', N'Intel Iris Graphics 5100 Mobile', 1070, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1013, N'V', N'Intel HD Graphics 5000', 330, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1014, N'V', N'Intel HD Graphics 4200 Mobile', 1050, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1015, N'V', N'ATI Mobility Radeon HD 5650/5750', 930, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1016, N'V', N'AMD Radeon HD 7540D', 860, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1017, N'V', N'AMD Radeon HD 7480D', 580, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1018, N'C', N'Intel Core i7-4960X', 13200, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1019, N'C', N'Intel Core i7-4930K', 12790, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1020, N'C', N'Intel Core i7-3970X Extreme Edition ', 11420, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1021, N'C', N'Intel Core i7-4820K', 11640, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1022, N'C', N'Intel Core i7-4790 ', 9340, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1023, N'C', N'Intel Core i7-990X ', 9050, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1024, N'C', N'Intel Core i7-970  ', 8530, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1025, N'C', N'Intel Core i7-3770K ', 7880, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1026, N'C', N'Intel Core i7-2700K ', 7880, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1027, N'C', N'AMD FX-9590', 7830, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1028, N'C', N'AMD FX-9370', 7420, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1029, N'C', N'Intel Core i7-4900MQ', 7160, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1030, N'C', N'AMD FX-4350', 7140, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1031, N'C', N'Intel Core i5-4690 ', 6970, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1032, N'C', N'AMD FX-8350', 6870, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1033, N'C', N'Intel Core i7-4700HQ', 6810, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1034, N'C', N'AMD FX-6350', 6730, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1035, N'C', N'Intel Core i7-4712MQ', 6730, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1036, N'C', N'AMD FX-4300', 6590, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1037, N'C', N'Intel Core i7-3840QM', 6440, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1038, N'C', N'AMD FX-8350', 6430, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1039, N'C', N'Intel Core i5-3570K ', 6420, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1040, N'C', N'Intel Core i5-4440', 6390, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1041, N'C', N'Intel Core i5-2550K ', 6220, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1042, N'C', N'AMD FX-8320', 6180, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1043, N'C', N'AMD FX-6300', 6180, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1044, N'C', N'Intel Core i7-875K  ', 6110, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1045, N'C', N'Intel Core i7-3720QM ', 6090, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1046, N'C', N'AMD FX-4130', 5990, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1047, N'C', N'AMD FX-6200', 5990, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1048, N'C', N'Intel Core i5-2400 ', 5970, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1049, N'C', N'Intel Core i5-3450 ', 5920, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1050, N'C', N'AMD FX-8300', 5900, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1051, N'C', N'Intel Core i5-2320 ', 5850, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1052, N'C', N'Intel Core i7-860 ', 5850, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1053, N'C', N'AMD FX-8150', 5770, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1054, N'C', N'AMD FX-4100', 5770, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1055, N'C', N'Intel Core i7-3630QM ', 5750, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1056, N'C', N'Intel Core i7-3940XM', 5750, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1057, N'C', N'Intel Core i7-4600U ', 5740, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1058, N'C', N'Intel Core i7-3615QM ', 5570, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1059, N'C', N'AMD FX-6100', 5440, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1060, N'C', N'AMD FX-8120', 5220, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1061, N'C', N'AMD Phenom II X6 1100T', 5200, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1062, N'C', N'Intel Core i7-2760QM ', 5060, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1063, N'C', N'AMD Phenom II X6 1075T ', 4870, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1064, N'C', N'Intel Core i5-760 ', 4760, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1065, N'C', N'Intel Core i7-2670QM ', 4710, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1066, N'C', N'Intel Core i5  I5-750', 4570, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1067, N'C', N'Intel Core 2 Extreme  QX9650', 4140, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1068, N'C', N'Intel Core i3-3240', 4130, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1069, N'C', N'AMD Phenom II X4 965', 4100, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1070, N'C', N'AMD Phenom(tm) II X4 B60', 4000, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1071, N'C', N'Intel Core i5-3330', 3950, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1072, N'C', N'AMD A10-6800K', 3880, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1073, N'C', N'Intel Core i3-2120 ', 3880, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1074, N'C', N'Intel Core 2 Quad  Q9650', 3830, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1075, N'C', N'AMD A10-6790K', 3800, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1076, N'C', N'AMD A6-6400K', 3710, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1077, N'C', N'AMD A8-6600K', 3710, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1078, N'C', N'AMD Athlon X4 760K', 3620, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1079, N'C', N'AMD A10-5800K', 3590, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1080, N'C', N'AMD A10-6700', 3540, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1081, N'C', N'Intel Core i5-4200H', 2450, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1082, N'C', N'AMD A4-3870K', 3510, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1083, N'C', N'AMD A8-3850', 3470, 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1084, N'C', N'AMD A8-5600K', 3420, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1085, N'C', N'Intel Pentium G3420', 3420, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1086, N'C', N'AMD A8-6500', 3360, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1087, N'C', N'Intel Core 2 Quad  Q8400', 3330, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1088, N'C', N'AMD Athlon II X4 641', 3260, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1089, N'C', N'AMD A10-5700', 3250, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1090, N'C', N'Intel Core i3-550 ', 3180, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1091, N'C', N'Intel Core 2 Quad  Q6700', 3150, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1092, N'C', N'AMD Athlon X4 740', 3150, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1093, N'C', N'Intel Core i5-3210M ', 3130, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1094, N'C', N'Intel Core 2 Quad  Q9300', 3080, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1095, N'C', N'Intel Core i3-3110M', 3000, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1096, N'C', N'Intel Core i3-3240', 2940, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1097, N'C', N'AMD Athlon II X4 Quad-Core  630', 2780, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1098, N'C', N'AMD Phenom II X3 720', 2770, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1099, N'C', N'Intel Core i5-4300U ', 2720, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1100, N'C', N'Intel Core i3-2350M ', 2600, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1101, N'C', N'Intel Core 2 Duo  E8600', 2570, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1102, N'C', N'AMD A10-5750M', 2510, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1103, N'C', N'AMD Athlon II X3 455', 2410, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1104, N'C', N'AMD A10-4600M', 2220, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1105, N'C', N'AMD Phenom II X2 555 BE', 2170, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1106, N'C', N'Intel Core 2 Duo  E7400', 2150, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1107, N'C', N'Intel Core 2 Duo  E6850', 2080, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1108, N'C', N'AMD Athlon II X2 270', 2040, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1109, N'C', N'Intel Pentium Dual-Core E5300', 1640, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1110, N'C', N'AMD Athlon 64 X2  6000+', 1370, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1111, N'C', N'CPU:
                        4rd generation Haswell Intel(R) Core(TM) i5 - 4210U (1.7 GHz, 3MB L3 Cache) Turbo Boost up to 2.7GHz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1112, N'R', N'4GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1113, N'H', N'1TB Hard Drive', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1114, N'V', N'NVIDIA Geforce 820M GT 2GB Vram ( Hỗ trợ tốt game & đồ họa)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1115, N'D', N'15.6" HD Slim (1366x768) Anti Glare', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1116, N'C', N'Intel Core-i5 - 4200U - 1.60 GHz Up to 2.6 GHz with Turbo Boost (3MB L3 Cache)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1117, N'R', N'OnBoard Memory 4 GB , 1 x DIMM socket for expansion up to 8 GB SDRAM', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1118, N'H', N'Serial ATA (SATA) 1TB - 5400 rpm', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1119, N'V', N'Intel HD Graphics 4400 / NVIDIA GeForce GT 820M with 2GB DDR3 VRAM', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1120, N'D', N'15.6" HD LED Backlit (1366x768)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1121, N'C', N'Intel, Core i5 Haswell, 4200U, 1.60 GHz', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1122, N'R', N'DDR3L(On board+1Khe), 4 GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1123, N'H', N'HDD, 500 GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1124, N'V', N'NVIDIA® GeForce® 820M, 2 GB', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1125, N'D', N'15.6 inch, HD (1366 x 768 pixels)', 0, NULL)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1126, N'R', N'2GB', 4, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1127, N'R', N'4GB', 8, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1128, N'R', N'6GB', 12, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1129, N'R', N'8GB', 16, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1130, N'R', N'16GB', 32, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1131, N'H', N'256G', 25, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1132, N'H', N'320G', 32, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1133, N'H', N'500GB', 50, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1134, N'H', N'640GB', 64, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1135, N'H', N'750GB', 75, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1136, N'H', N'1TB', 100, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1137, N'H', N'1.5TB', 150, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1138, N'H', N'128GB SSD', 110, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1139, N'H', N'120 GB SSD', 105, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1140, N'D', N'10.1"', 10.1, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1141, N'D', N'11.6"', 11.6, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1142, N'D', N'12.1"', 12.1, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1143, N'D', N'13.3"', 13.3, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1144, N'D', N'15.6', 15.6, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1145, N'D', N'14.0''''', 14, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1146, N'D', N'17.3"', 17.3, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1147, N'C', N'Intel Core i7-875K ', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1148, N'C', N'Intel Core i3-3240 ', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1149, N'C', N'Intel(R) Pentium 3556U ', 0, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1150, N'C', N'Core(TM) i5 - 4210U', 0, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1151, N'C', N'Intel Core i5-3450', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1152, N'H', N'1TB ', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1153, N'H', N'500GB ', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1154, N'V', N'Intel Graphic HD4000 upto 1649MB', 0, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1155, N'H', N'500GB ', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1156, N'H', N'500GB ', 0, 0)
SET IDENTITY_INSERT [dbo].[Hardware] OFF
/****** Object:  Table [dbo].[ParseAttribute]    Script Date: 07/25/2014 14:44:51 ******/
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
/****** Object:  Table [dbo].[RecommendProduct]    Script Date: 07/25/2014 14:44:51 ******/
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
	[IsTrue] [bit] NULL,
	[RecommendTime] [datetime] NULL,
	[IsSeen] [bit] NOT NULL,
 CONSTRAINT [PK__Recommen__3214EC275EBF139D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RecommendProduct] ON
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (23, N'member1', N'http://www.thegioididong.com/laptop/asus-p550ld-xo216', N'a', 1, 1, CAST(0x0000A08700000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (26, N'member1', N'http://www.lazada.vn/lenovo-g4070-59414340-core-i3-17ghz-14-2gb-den-149555.html', N'a', 1, 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (27, N'member1', N'http://thietbiso.com/san-pham/chi-tiet/6704/asus-p550ldv-xo517d-black.html', N'a', 1, 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (28, N'member1', N'http://www.vienthonga.vn/laptop-asus-p550ld-xo216d-black.html', N'a', 1, 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (31, N'member1', N'http://www.dienmaythienhoa.vn/may-tinh-xach-tay-asus-p550ca-xo998d-m.black.html', N'a', 1, 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (32, N'member1', N'http://www.nguyenkim.com/may-tinh-xach-tay-asus-p550ld-xo330d.html', N'a', 0, 0, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (35, N'member1', N'http://laptopno1.com/chi-tiet-san-pham/1701/asus-p550ldv-xo517d-i5-haswell-4210u-4gb-1tb-vga-nvidia-geforce-gt-820m-2gb.htm', N'a', NULL, 0, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (36, N'member1', N'http://www.thegioididong.com/laptop/acer-aspire-e1-432-29552g50dn', N'Acer Aspire E1 432 29552G50Dn', NULL, 0, CAST(0x0000A36D00CA84ED AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (37, N'member1', N'http://www.thegioididong.com/laptop/acer-aspire-e1-410-001', N'Acer aspire E1 410 Celeron ,HDD 500GB', NULL, 0, CAST(0x0000A36D012C258A AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (38, N'member1', N'http://www.thegioididong.com/laptop/acer-aspire-e1-432-29552g50dn', N'Acer Aspire E1 432 29552G50Dn ', NULL, 0, CAST(0x0000A36E009F1412 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (39, N'member1', N'http://www.thegioididong.com/laptop/acer-aspire-e1-432-29552g50dn', N'Acer Aspire E1', NULL, 0, CAST(0x0000A36F0001E2DA AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (40, N'member1', N'http://www.lazada.vn/asus-taichi31-cx018h-core-i7-3517u-19ghz-133-4gb-bac-162931.html', N'ASUS TAICHI31-CX018H - Core i7-3517U 1.9GHz / 13.3” / 4GB (Bạc) | Lazada.vn', 1, 1, CAST(0x0000A37200B1CD85 AS DateTime), 0)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [Parselink], [Name], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (41, N'member1', N'http://trananh.vn/laptop-tablet/laptop/id174025/may-tinh-xach-tay-inspiron-7437-h4i52090--p174025c2/index.htm', N'	Máy tính xách tay Inspiron 7437 (H4I52090)', 1, 1, CAST(0x0000A37200B455B0 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[RecommendProduct] OFF
/****** Object:  Table [dbo].[RatingProduct]    Script Date: 07/25/2014 14:44:51 ******/
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
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 07/25/2014 14:44:51 ******/
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
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (769, 140, 1019, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (770, 140, 1126, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (771, 140, 1136, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (772, 140, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (773, 140, 987, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (774, 141, 1068, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (775, 141, 1126, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (776, 141, 1133, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (777, 141, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (778, 142, 1099, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (779, 142, 1126, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (780, 142, 1133, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (781, 142, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (782, 142, 1000, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (783, 143, 1099, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (784, 143, 1126, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (785, 143, 1133, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (786, 143, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (787, 143, 1001, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (788, 144, 1103, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (789, 144, 1126, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (790, 144, 1133, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (791, 144, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (792, 144, 1002, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (793, 145, 1050, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (794, 145, 1126, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (795, 145, 1133, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (796, 145, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (797, 145, 1007, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (798, 146, 1100, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (799, 146, 1127, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (800, 146, 1133, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (801, 146, 1144, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (802, 146, 1009, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (803, 147, 1127, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (804, 147, 1133, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (805, 147, 1144, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (806, 147, 1010, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (807, 148, 1100, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (808, 148, 1127, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (809, 148, 1133, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (810, 148, 1144, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (811, 149, 1127, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (812, 149, 1133, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (813, 149, 1144, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (814, 149, 1013, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (815, 150, 1084, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (816, 150, 1127, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (817, 150, 1133, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (818, 150, 1144, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (819, 150, 1016, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (820, 151, 1084, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (821, 151, 1127, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (822, 151, 1136, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (823, 151, 1144, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (824, 151, 989, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (825, 152, 1039, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (826, 152, 1128, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (827, 152, 1132, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (828, 152, 1144, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (829, 153, 1128, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (830, 153, 1132, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (831, 153, 1143, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (832, 153, 997, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (833, 154, 1128, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (834, 154, 1134, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (835, 154, 1143, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (836, 154, 992, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (837, 155, 1090, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (838, 155, 1128, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (839, 155, 1134, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (840, 155, 1143, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (841, 155, 987, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (842, 156, 1020, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (843, 156, 1128, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (844, 156, 1132, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (845, 156, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (846, 156, 1132, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (847, 157, 1040, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (848, 157, 1129, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (849, 157, 1136, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (850, 157, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (851, 157, 1002, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (852, 158, 1018, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (853, 158, 1129, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (854, 158, 1135, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (855, 158, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (856, 158, 1007, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (857, 159, 1019, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (858, 159, 1129, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (859, 159, 1135, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (860, 159, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (861, 159, 1009, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (862, 160, 1021, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (863, 160, 1129, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (864, 160, 1135, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (865, 160, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (866, 160, 1011, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (867, 161, 1041, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (868, 161, 1126, 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (869, 161, 1136, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (870, 161, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (871, 161, 996, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (872, 162, 1040, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (873, 162, 1126, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (874, 162, 1136, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (875, 162, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (876, 162, 986, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (877, 163, 1021, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (878, 163, 1129, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (879, 163, 1136, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (880, 163, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (881, 163, 995, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (882, 164, 1029, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (883, 164, 1128, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (884, 164, 1011, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (885, 164, 1145, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (886, 164, 987, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (889, 141, 1010, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (890, 147, 1018, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (891, 148, 1017, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (892, 149, 1022, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (893, 152, 1010, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (894, 153, 1028, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (895, 154, 1041, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (896, 156, 998, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (897, 164, 1131, 1)
SET IDENTITY_INSERT [dbo].[ProductAttribute] OFF
/****** Object:  Table [dbo].[Dictionary]    Script Date: 07/25/2014 14:44:51 ******/
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
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1026, 1111, N'CPU:
                        4rd generation Haswell Intel(R) Core(TM) i5 - 4210U (1.7 GHz, 3MB L3 Cache) Turbo Boost up to 2.7GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1027, 1112, N'4GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1028, 1113, N'1TB Hard Drive', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1029, 1114, N'NVIDIA Geforce 820M GT 2GB Vram ( Hỗ trợ tốt game & đồ họa)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1030, 1115, N'15.6" HD Slim (1366x768) Anti Glare', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1031, 1116, N'Intel Core-i5 - 4200U - 1.60 GHz Up to 2.6 GHz with Turbo Boost (3MB L3 Cache)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1032, 1117, N'OnBoard Memory 4 GB , 1 x DIMM socket for expansion up to 8 GB SDRAM', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1033, 1118, N'Serial ATA (SATA) 1TB - 5400 rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1034, 1119, N'Intel HD Graphics 4400 / NVIDIA GeForce GT 820M with 2GB DDR3 VRAM', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1035, 1120, N'15.6" HD LED Backlit (1366x768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1036, 1121, N'Intel, Core i5 Haswell, 4200U, 1.60 GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1037, 1122, N'DDR3L(On board+1Khe), 4 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1038, 1123, N'HDD, 500 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1039, 1124, N'NVIDIA® GeForce® 820M, 2 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1040, 1125, N'15.6 inch, HD (1366 x 768 pixels)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1041, 1126, N'2GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1042, 1126, N'2GB DDR3', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1043, 1126, N'2GB DDR3 1066Mhz (PC3-8500)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1044, 1126, N'2GB DDR3, 1333MHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1045, 1126, N'2 GB DDR3 Bus 1600Mhz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1046, 1126, N'DDR3L (2 khe RAM), 2 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1047, 1126, N'DDR3 (on board), 2 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1048, 1127, N'4GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1049, 1127, N'4GB DDR3 1333MHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1050, 1127, N'4GB DDR3 1600 MHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1051, 1127, N'4 GB DDR3L 1600 MHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1052, 1127, N'4GB DDR3 Bus 1600 Mhz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1053, 1127, N'4GB DDR3L - 1600MHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1054, 1127, N'4GB DDR3', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1055, 1127, N'DDR3L (2 khe RAM), 4 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1056, 1127, N'4GB DDR3L/1600Mhz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1057, 1128, N'6GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1058, 1129, N'8GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1059, 1129, N'8GB DDR3L Bus 1600 Mhz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1060, 1130, N'16GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1061, 1131, N'256GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1062, 1132, N'320GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1063, 1132, N'320GB 5400rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1064, 1133, N'500GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1065, 1133, N'500GB Sata', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1066, 1133, N'500GB Hard Drive', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1067, 1133, N' 500GB SATA 5400 rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1068, 1133, N'500GB (5400rpm)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1069, 1134, N'640GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1070, 1134, N'640GB SATA Hard Drive (5400RPM)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1071, 1134, N'640GB SATA (5400 rpm)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1072, 1135, N'750 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1073, 1135, N'Ổ cứng: 750 GB SATA', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1074, 1135, N'750 GB SATA', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1075, 1135, N'750GB Hybrid HDD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1076, 1136, N' 1TB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1077, 1136, N' 1TB HDD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1078, 1136, N'1TB ( 1000GB )', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1079, 1136, N'1000GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1080, 1137, N'1.5TB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1081, 1138, N'128GB SSD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1082, 1139, N'120 GB SSD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1083, 1140, N'10.1"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1084, 1140, N'10.1 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1085, 1141, N'11.6"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1086, 1141, N'11.6 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1087, 1142, N'12.1"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1088, 1142, N'12.1 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1089, 1143, N'13.3"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1090, 1143, N'13.3 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1091, 1143, N'13.3 inch (Full HD: 1920 x 1080)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1092, 1144, N'15.6"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1093, 1144, N'LED, 15.6"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1094, 1144, N'15.6 inch Full HD (1920 x 1080) Led', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1095, 1144, N'15.6 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1096, 1144, N'15.6" FHD LED-backlit ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1097, 1144, N'15.6 inches', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1098, 1145, N'14.0"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1099, 1145, N' LED, 14.0"', 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1100, 1145, N'14"LEDBacklight', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1101, 1145, N'14 " LED', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1102, 1145, N'14.0" HD LED GLARE HDMI', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1103, 1145, N'14 inch HD (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1104, 1145, N'14.0 HD 200 CSV LD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1105, 1145, N'14.0 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1106, 1145, N'14.0-inch LED-backlit Display (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1107, 1146, N'17.3"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1108, 1146, N'17.3" FHD LED-backlit TFT LCD Display (1920x1080 / 16:9) , AntiGlare', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1109, 1146, N'17.3" FHD LED-backlit ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1110, 1146, N'17.3 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1120, 1156, N'500GB ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1121, 1044, N'Intel Core i7-875K ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1122, 1136, N'1TB ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1123, 1133, N'500GB ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1124, 1133, N'500GB ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1125, 1133, N'500GB ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1126, 1031, N'Intel Core i5-3450', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1127, 1068, N'Intel Core i3-3240 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1128, 1013, N' Intel HD Graphics', 1)
SET IDENTITY_INSERT [dbo].[Dictionary] OFF
/****** Object:  Table [dbo].[History]    Script Date: 07/25/2014 14:44:51 ******/
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
/****** Object:  Table [dbo].[HistoryDetail]    Script Date: 07/25/2014 14:44:51 ******/
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
/****** Object:  Default [DF_ProductAlias_IsMain]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[AliasProduct] ADD  CONSTRAINT [DF_ProductAlias_IsMain]  DEFAULT ((0)) FOR [IsMain]
GO
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
/****** Object:  ForeignKey [FK_AliasProduct_Brand]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[AliasProduct]  WITH CHECK ADD  CONSTRAINT [FK_AliasProduct_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([ID])
GO
ALTER TABLE [dbo].[AliasProduct] CHECK CONSTRAINT [FK_AliasProduct_Brand]
GO
/****** Object:  ForeignKey [FK_AliasProduct_Product]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[AliasProduct]  WITH CHECK ADD  CONSTRAINT [FK_AliasProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AliasProduct] CHECK CONSTRAINT [FK_AliasProduct_Product]
GO
/****** Object:  ForeignKey [FK_AliasProduct_Store]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[AliasProduct]  WITH CHECK ADD  CONSTRAINT [FK_AliasProduct_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[AliasProduct] CHECK CONSTRAINT [FK_AliasProduct_Store]
GO
/****** Object:  ForeignKey [FK_AttributeMapping_AttributeDictionary]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[Dictionary]  WITH CHECK ADD  CONSTRAINT [FK_AttributeMapping_AttributeDictionary] FOREIGN KEY([AttributeDicID])
REFERENCES [dbo].[Hardware] ([ID])
GO
ALTER TABLE [dbo].[Dictionary] CHECK CONSTRAINT [FK_AttributeMapping_AttributeDictionary]
GO
/****** Object:  ForeignKey [FK_Hardware_Codetype]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[Hardware]  WITH CHECK ADD  CONSTRAINT [FK_Hardware_Codetype] FOREIGN KEY([CodetypeID])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[Hardware] CHECK CONSTRAINT [FK_Hardware_Codetype]
GO
/****** Object:  ForeignKey [FK_History_Account]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Account]
GO
/****** Object:  ForeignKey [FK_HistoryDetail_History]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_History] FOREIGN KEY([HistoryID])
REFERENCES [dbo].[History] ([ID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_History]
GO
/****** Object:  ForeignKey [FK_HistoryDetail_Product]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_Product]
GO
/****** Object:  ForeignKey [FK_ParseAttribute_Codetype]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[ParseAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ParseAttribute_Codetype] FOREIGN KEY([CodetypeID])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[ParseAttribute] CHECK CONSTRAINT [FK_ParseAttribute_Codetype]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_AttributeDictionary]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_AttributeDictionary] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Hardware] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_AttributeDictionary]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Product]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
/****** Object:  ForeignKey [FK_RatingProduct_Account]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[RatingProduct]  WITH CHECK ADD  CONSTRAINT [FK_RatingProduct_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RatingProduct] CHECK CONSTRAINT [FK_RatingProduct_Account]
GO
/****** Object:  ForeignKey [FK_RatingProduct_Product]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[RatingProduct]  WITH CHECK ADD  CONSTRAINT [FK_RatingProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[RatingProduct] CHECK CONSTRAINT [FK_RatingProduct_Product]
GO
/****** Object:  ForeignKey [FK_RecommendProduct_Account]    Script Date: 07/25/2014 14:44:51 ******/
ALTER TABLE [dbo].[RecommendProduct]  WITH CHECK ADD  CONSTRAINT [FK_RecommendProduct_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RecommendProduct] CHECK CONSTRAINT [FK_RecommendProduct_Account]
GO
