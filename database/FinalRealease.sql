USE [CPS_Solution]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 09/03/2014 20:46:15 ******/
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
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (1, N'Chưa xác Định', N'#', N'default', 0)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (2, N'LaZaDa', N'lazada.vn', N'images/StoreLogo/lazada.jpg', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (3, N'Nguyễn Kim', N'nguyenkim.com', N'images/StoreLogo/nguyenkim.jpg', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (4, N'Điện Máy Thiên Hòa', N'dienmaythienhoa.vn', N'images/StoreLogo/thienhoa.jpg', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (5, N'Điện Máy Chợ Lớn', N'dienmaycholon.vn', N'images/StoreLogo/Dienmaycholon.png', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (6, N'Laptop Gia Huy', N'laptopgiahuy.com', N'images/StoreLogo/Laptopgiahuy.png', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (7, N'Viettel Store', N'viettelstore.vn', N'images/StoreLogo/viettelstore.jpg', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (8, N'Thiết Bị Số', N'thietbiso.com', N'images/StoreLogo/logo-thietbiso.jpg', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (9, N'Thế giới Di Động', N'thegioididong.com', N'images/StoreLogo/tgdd.jpg', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (10, N'Viễn Thông A', N'vienthonga.vn', N'images/StoreLogo/vienthonga.jpg', 1)
INSERT [dbo].[Store] ([ID], [StoreName], [StoreUrl], [LogoImage], [IsActive]) VALUES (11, N'Bảo An', N'laptopno1.com', N'images/StoreLogo/laptopno1.png', 1)
SET IDENTITY_INSERT [dbo].[Store] OFF
/****** Object:  Table [dbo].[Role]    Script Date: 09/03/2014 20:46:15 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 09/03/2014 20:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](2000) NULL,
	[ImageURL] [nvarchar](2000) NULL,
	[TotalWeightPoint] [float] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (183, N'Vostro 5560 ra mắt mỏng hơn,mạnh mẽ hơn, được cải tiến nhiều hơn so với sản phẩm đã thành công trước đây là Vostro 3460. Điều này cho thấy Dell ngàycàng chú trọng hơn vào kích thước của sản phẩm bên cạnh chất lượng bền bỉ lâuđời, cạnh tranh của với các hãng Asus, Acer vốn nổi tiếng về thiếtkế.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera39af8a6ea39f86e98c255d2f395791b10712a6849_olm1372652169.jpg.jpg', 18.379500130528932, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (184, N'Series Inspiron của nhà sảnxuất laptop hàng đầu thế giới – Dell,vừa cho ra mắt sản phẩm thế hệ tiếp theo, đó là Inspiron (15) 3542, dòng sảnphẩm tầm trung nhắm vào những người tiêu dùng trẻ, thu nhập ở mức trung bình vàsử dụng laptop để đáp ứng những nhu cầu học tập, làm việc, giải trí.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera63ac2a93a63c2935a7450f0ed198e073bd2f005aa_dell_3542-1.jpg.jpg', 15.212768368155333, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (185, N'Series Inspiron của nhà sảnxuất laptop hàng đầu thế giới – Dell,vừa cho ra mắt sản phẩm thế hệ tiếp theo, đó là Inspiron N3521I, dòng sảnphẩm tầm trung nhắm vào những người tiêu dùng trẻ, thu nhập ở mức trung bình vàsử dụng laptop để đáp ứng những nhu cầu học tập, làm việc, giải trí.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera2ba47a42a2b474253768d7c6caa9f0ee975363f9d_dell-inspiron-n3521-front.jpg.jpg', 12.926202322875708, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (186, N'Series Inspiron của nhà sảnxuất laptop hàng đầu thế giới – Dell,vừa cho ra mắt sản phẩm thế hệ tiếp theo, đó là 15 3537 52GNP4, dòng sảnphẩm tầm trung nhắm vào những người tiêu dùng trẻ, thu nhập ở mức trung bình vàsử dụng laptop để đáp ứng những nhu cầu học tập, làm việc, giải trí.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderaefa3caa6aef3ca62be3dd11e88980b9cb4e67ed8f_abcv.jpg.jpg', 14.930041095428059, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (187, N'Series Inspiron của nhà sảnxuất laptop hàng đầu thế giới – Dell,vừa cho ra mắt sản phẩm thế hệ tiếp theo, đó là 15-N3537, dòng sảnphẩm tầm trung nhắm vào những người tiêu dùng trẻ, thu nhập ở mức trung bình vàsử dụng laptop để đáp ứng những nhu cầu học tập, làm việc, giải trí.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderad6a54a58ad654581f7757db8f0c68b13394b12b1d_5138_115.jpg.jpg', 15.576550166346149, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (188, N'Dell Vostro 2421 ra mắt mỏng hơn,mạnh mẽ hơn, được cải tiến nhiều hơn so với sản phẩm đã thành công trước đây là Vostro 2123. Điều này cho thấy Dell ngàycàng chú trọng hơn vào kích thước của sản phẩm bên cạnh chất lượng bền bỉ lâuđời, cạnh tranh của với các hãng Asus, Acer vốn nổi tiếng về thiếtkế.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera55a52a10a555210f11d513d05342e985e044e2c34_laptop-dell-vostro-2421-w522104.jpg.jpg', 13.06858441278496, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (189, N'Dell Vostro 3550 4G ra mắt mỏng hơn,mạnh mẽ hơn, được cải tiến nhiều hơn so với sản phẩm đã thành công trước đây là Vostro 3460. Điều này cho thấy Dell ngàycàng chú trọng hơn vào kích thước của sản phẩm bên cạnh chất lượng bền bỉ lâuđời, cạnh tranh của với các hãng Asus, Acer vốn nổi tiếng về thiếtkế.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderacba0ea57acb0e576ff5aaccb3c69e65cf832bb873_OriginalPng_thumbnail_560_420.png.png', 13.915838986377134, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (190, N'Dell Vostro 2420  ra mắt mỏng hơn,mạnh mẽ hơn, được cải tiến nhiều hơn so với sản phẩm đã thành công trước đây là Vostro 2130. Điều này cho thấy Dell ngàycàng chú trọng hơn vào kích thước của sản phẩm bên cạnh chất lượng bền bỉ lâuđời, cạnh tranh của với các hãng Asus, Acer vốn nổi tiếng về thiếtkế.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'Images/I/dde7155861eb59169b1d7fb97ff18fbf_dell-vostro-2420-53234g50g_clip_image002_thumbnail_560_420.jpg', 13.10559275902915, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (191, N'Laptop HP 15 - D102TX được coi là dòng laptop có thể cân bằng giữa công việc và giải trí. Với màn hình 15.6 inch, bạn có thể dễ dàng đọc số liệu, bàn phím số chuyên dụng cho dân văn phòng, kế toán. Máy cũng có thể thiết kế đồ họa, chơi game nặng nhờ card màn hình rời 2GB.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderac7aceab2ac7ceb216b56097ebdec29b4b1a42f76d_1333670322159996684.jpg.jpg', 18.248347857385181, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (192, N'Nắm được nhu cầu sở hữu các sản phẩm gọn nhẹ, thuận tiện cho việc di chuyển, đi lại, du lịch trong mùa hè này, HP Pavilion 14 - R006TU đã được HP tung ra nhằm đáp ứng cho nhu cầu của các bạn trẻ, dân văn phòng với thế mạnh là sự gọn nhẹ, thiết kế trẻ trung nhưng không kém phần mạnh mẽ.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'Images/I/1bcc31672d319ca23a894c588310d59b_HP Pavilion TouchSmart 14-b170us Ultrabook.jpg', 11.99606604604999, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (193, N'Nắm được nhu cầu sở hữu các sản phẩm gọn nhẹ, thuận tiện cho việc di chuyển, đi lại, du lịch trong mùa hè này, HP Pavilion 14 N237TU đã được HP tung ra nhằm đáp ứng cho nhu cầu của các bạn trẻ, dân văn phòng với thế mạnh là sự gọn nhẹ, thiết kế trẻ trung nhưng không kém phần mạnh mẽ.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderad2a47a25ad24725adef7088d88b85735b35a0ea9e_8147_pavilion_14_2014-sS.jpg.jpg', 14.467613349763321, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (194, N'Nắm được nhu cầu sở hữu các sản phẩm gọn nhẹ, thuận tiện cho việc di chuyển, đi lại, du lịch trong mùa hè này, HP Pavilion 15-N233TU đã được HP tung ra nhằm đáp ứng cho nhu cầu của các bạn trẻ, dân văn phòng với thế mạnh là sự gọn nhẹ, thiết kế trẻ trung nhưng không kém phần mạnh mẽ.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderad3ac3ad1ad3c3d1035e60ee8554a7b57548355794_14305_hp_pavilion_15_e022tx.png.png', 14.930041095428059, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (195, N'HP Envy 4-1012TU, một trong những dòng Ultrabook khá thành công của HP. Ngoài sức mạnh phần cứng hiện đại, thiết bị này còn hấp dẫn ngay từ vẻ ngoài hào nhoáng, sang trọng. Chất liệu, sự tỉ mỉ và kinh nghiệm thiết kế đã mang đến một sản phẩm vừa mạnh mẽ, đẹp đến hoàn hảo trong từng đường nét.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderaabacda2baabcd2b239e1db67f1fb17151fa47caa4_hp-envy-4-1011tu-1.jpg.jpg', 13.641956395392786, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (196, N'HP ProBook 4430S-LX014  là một trong những dòng laptop được cải tiến theo phong cách mới của HP, được thiết kế cân bằng giữa giá thành và hiệu năng của máy, thích hợp với người có nhu cầu laptop để làm việc, hoặc học tập hay giải trí. Thế mạnh của sản phẩm chính là bộ xử lý thế hệ mới Haswell của Intel, màn hình rộng đến 15.6 inch, card đồ họa rời và đặc biệt máy có kiểu dáng thời trang, mỏng, nhẹ và tính di động cao.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'Images/I/f1437c9d5fd06c91b7542f7fc6c87737_big_26536_7D29CC1C696B0ED31ACAC831512E8A83_thumbnail_560_420.jpg', 12.851047304483696, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (197, N'HP Compaq CQ43 - 206TU  là một trong những dòng laptop được cải tiến theo phong cách mới của HP, được thiết kế cân bằng giữa giá thành và hiệu năng của máy, thích hợp với người có nhu cầu laptop để làm việc, hoặc học tập hay giải trí. Thế mạnh của sản phẩm chính là bộ xử lý thế hệ mới Haswell của Intel, màn hình rộng đến 15.6 inch, card đồ họa rời và đặc biệt máy có kiểu dáng thời trang, mỏng, nhẹ và tính di động cao.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'Images/I/7008f33ee8e17190dcc3b89258c64222_big_9795_1cf01a1dfa0cf716c9a22c15ee595be6_thumbnail_560_420.jpg', 11.884247864231808, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (198, N'Nắm được nhu cầu sở hữu các sản phẩm gọn nhẹ, thuận tiện cho việc di chuyển, đi lại, du lịch trong mùa hè này, HP Pavilion Sleekbook TS đã được HP tung ra nhằm đáp ứng cho nhu cầu của các bạn trẻ, dân văn phòng với thế mạnh là sự gọn nhẹ, thiết kế trẻ trung nhưng không kém phần mạnh mẽ.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'Images/I/77694981f09174c5d0fc3061c13f82e4_HP-Pavilion-Sleekbook-14_Black_front__91576_zoom_thumbnail_560_420.jpg', 13.730611500595444, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (199, N'Nắm được nhu cầu sở hữu các sản phẩm gọn nhẹ, thuận tiện cho việc di chuyển, đi lại, du lịch trong mùa hè này,HP Pavilion 15-E061TX TS đã được HP tung ra nhằm đáp ứng cho nhu cầu của các bạn trẻ, dân văn phòng với thế mạnh là sự gọn nhẹ, thiết kế trẻ trung nhưng không kém phần mạnh mẽ.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderad3ac3ad1ad3c3d1035e60ee8554a7b57548355794_14305_hp_pavilion_15_e022tx.png.png', 17.833950836044782, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (200, N'Hãng Acer vừa tung ra sản phẩm Acer Aspire Acer Aspire E1 470G  tiếp nối dòng sản phẩm laptop bình dân. Aspire E1 432 hấp dẫn người dùng với thiết kế thời trang nhỏ gọn hơn các dòng sản phẩm trước, hiệu năng ổn định đáp ứng hầu hết các nhu cầu cơ bản của bạn như xem phim, lướt web, nghe nhạc,…                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera5da95a8da5d958dc726e853fb58563320afe77531_download.jpg.jpg', 12.869492004368746, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (201, N'Hãng Acer vừa tung ra sản phẩm Acer Aspire E5-511 NX.MPKSV.003 tiếp nối dòng sản phẩm laptop bình dân. Aspire E1 432 hấp dẫn người dùng với thiết kế thời trang nhỏ gọn hơn các dòng sản phẩm trước, hiệu năng ổn định đáp ứng hầu hết các nhu cầu cơ bản của bạn như xem phim, lướt web, nghe nhạc,…                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera91ac4a3aa91c43a76dec57d2d3ce19435dcec9008_129965.jpg.jpg', 13.370311973532912, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (202, N'Hãng Acer vừa tung ra sản phẩm Acer Aspire E1-570-33214G50Dnkk tiếp nối dòng sản phẩm laptop bình dân. Aspire E1 432 hấp dẫn người dùng với thiết kế thời trang nhỏ gọn hơn các dòng sản phẩm trước, hiệu năng ổn định đáp ứng hầu hết các nhu cầu cơ bản của bạn như xem phim, lướt web, nghe nhạc,…                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderac0a79a1dac0791d49b43dea04ed9d2bfab428c078_0024529_acer-aspire-e1-570-33214g50dnkk.jpeg.jpeg', 13.926202322875708, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (203, N'Lenovo B490 (59365363) mang trong mình sức mạnh của bộ xử lý Pentium Haswell mới nhất của Intel đáp ứng nhu cầu sử dụng hằng ngày của người dùng – một sản phẩm nhắm đến những người có thu nhập còn hạn hẹp.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera1ea61adaa1e61dacf97480fb5df28eb761815a1ff_lenovo-e49-3464-cto.jpg.jpg', 13.1851569551409, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (204, N'Lenovo G5070 (59423771) mang trong mình sức mạnh của bộ xử lý Pentium Haswell mới nhất của Intel đáp ứng nhu cầu sử dụng hằng ngày của người dùng – một sản phẩm nhắm đến những người có thu nhập còn hạn hẹp.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera3daa8a71a3da87184ad67bb1e53b64c00ff825b89_Lenovo-G5070-org-1.jpg.jpg', 13.23095018633715, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (205, N'Laptop Lenovo G40-70(59-414338)  mang trong mình sức mạnh của bộ xử lý Pentium Haswell mới nhất của Intel đáp ứng nhu cầu sử dụng hằng ngày của người dùng – một sản phẩm nhắm đến những người có thu nhập còn hạn hẹp.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera3ea84a6ca3e846ccd480f2a11bc02bf889bc0c341_lenovo_g400-1-600x600-500x500.jpg.jpg', 12.1851569551409, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (206, N'Lenovo G500s (59409052) mang trong mình sức mạnh của bộ xử lý Pentium Haswell mới nhất của Intel đáp ứng nhu cầu sử dụng hằng ngày của người dùng – một sản phẩm nhắm đến những người có thu nhập còn hạn hẹp.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderaaaa19a0caaa190ca9f7fed690eb19a157cd7c4e59_s510p-1-700x700.jpg.jpg', 13.46576651898746, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (207, N'Lenovo Y480 - 59357549 mang trong mình sức mạnh của bộ xử lý Pentium Haswell mới nhất của Intel đáp ứng nhu cầu sử dụng hằng ngày của người dùng – một sản phẩm nhắm đến những người có thu nhập còn hạn hẹp.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera4fa0caeda4f0cedbc65af0388da6e41f9103ea496_dsc00447-1337776359.jpg.jpg', 16.982627884889176, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (208, N'LENOVO IDEAPAD S210 (59389595) mang trong mình sức mạnh của bộ xử lý Pentium Haswell mới nhất của Intel đáp ứng nhu cầu sử dụng hằng ngày của người dùng – một sản phẩm nhắm đến những người có thu nhập còn hạn hẹp.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'Images/I/httpbaalaptopno1.comaimagesaProductsalenovo-ideapad-s210.jpg.jpg', 10.256964627237588, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (209, N'Lenovo IdeaPad G400 (59375061) mang trong mình sức mạnh của bộ xử lý Pentium Haswell mới nhất của Intel đáp ứng nhu cầu sử dụng hằng ngày của người dùng – một sản phẩm nhắm đến những người có thu nhập còn hạn hẹp.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'Images/I/httpbaalaptopno1.comaimagesaProductsa5061.jpg.jpg', 12.380683967985121, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (210, N'Lenovo S410P ( 59409051) (59389595) mang trong mình sức mạnh của bộ xử lý Pentium Haswell mới nhất của Intel đáp ứng nhu cầu sử dụng hằng ngày của người dùng – một sản phẩm nhắm đến những người có thu nhập còn hạn hẹp.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpbaalaptopno1.comaimagesaProductsa09051.jpg.jpg', 12.287410940847332, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (211, N'LENOVO IDEAPAD S210 (59402712) mang trong mình sức mạnh của bộ xử lý Pentium Haswell mới nhất của Intel đáp ứng nhu cầu sử dụng hằng ngày của người dùng – một sản phẩm nhắm đến những người có thu nhập còn hạn hẹp.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ', N'Images/I/httpbaalaptopno1.comaimagesaProductsalenovo-ideapad-s211.jpg.jpg', 12.076491340216748, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (212, N'Sony Vaio SVT14127 là dòng laptop khá thành công trong phân khúc tầm trung của Sony, thiết bị mang đến sự lựa chọn dễ dàng hơn, không chỉ với mức giá phù hợp mà còn có thiết kế đẹp, cấu hình tốt.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Images/I/httpbaalaptopno1.comaimagesaProductsa130484076610255395.jpeg.jpeg', 15.30650184993824, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (213, N'Sony Vaio SVE14114FXW  là dòng laptop khá thành công trong phân khúc tầm trung của Sony, thiết bị mang đến sự lựa chọn dễ dàng hơn, không chỉ với mức giá phù hợp mà còn có thiết kế đẹp, cấu hình tốt.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderaa1aeea74aa1ee74873140aeebacd0a771eed2749b_2769_4855.jpg.jpg', 15.153130637817029, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (214, N'Sony Vaio SVE14135CXP là dòng laptop khá thành công trong phân khúc tầm trung của Sony, thiết bị mang đến sự lựa chọn dễ dàng hơn, không chỉ với mức giá phù hợp mà còn có thiết kế đẹp, cấu hình tốt.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera7cacfa30a7ccf30f.jpg', 18.016577607514, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (215, N'Sony SVT13134CXS là dòng laptop khá thành công trong phân khúc tầm trung của Sony, thiết bị mang đến sự lựa chọn dễ dàng hơn, không chỉ với mức giá phù hợp mà còn có thiết kế đẹp, cấu hình tốt.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera87acea11a87ce1108eb0aa20304d420dedc79335d_816_P_1367825856925goods_thumbnail_560_420.jpg.jpg', 13.453165013364409, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (216, N'Sony Vaio EG26 FX/B là dòng laptop khá thành công trong phân khúc tầm trung của Sony, thiết bị mang đến sự lựa chọn dễ dàng hơn, không chỉ với mức giá phù hợp mà còn có thiết kế đẹp, cấu hình tốt.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderaa9acca68aa9cc688e77a826f1191f8d11e163c180_qsl1335329363_thumbnail_560_420.jpg.jpg', 14.377959985443932, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (217, N'Sony Vaio SVE14A15FLH là dòng laptop khá thành công trong phân khúc tầm trung của Sony, thiết bị mang đến sự lựa chọn dễ dàng hơn, không chỉ với mức giá phù hợp mà còn có thiết kế đẹp, cấu hình tốt.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera87ad5a22a87d5224cb3627c743a1e66dc5b63c95d_mt_thumbnail_560_420.jpg.jpg', 14.900169990941457, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (218, N'Sony Vaio SVE1511KFXW là dòng laptop khá thành công trong phân khúc tầm trung của Sony, thiết bị mang đến sự lựa chọn dễ dàng hơn, không chỉ với mức giá phù hợp mà còn có thiết kế đẹp, cấu hình tốt.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderacca1ba14acc1b14cef0bb7e9252e6a451b191b2c8__281012120146_thumbnail_560_420.jpg.jpg', 14.63343106993953, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (219, N'Laptop Sam Sung - máy tính xáy tay máy nhẹ hơn, màn hình sáng hơn và pin lâu hơn. Thiết kế mạnh mẽ cho phong cách của chính bạn. Laptop Samsung mang đến những trải nghiệm tuyệt với nhất.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera25ae5abea25e5be5162cd45968f195a6db3dcadbb_Sams.jpg.jpg', 11.2676569551409, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (220, N'Laptop Sam Sung - máy tính xáy tay máy nhẹ hơn, màn hình sáng hơn và pin lâu hơn. Thiết kế mạnh mẽ cho phong cách của chính bạn. Laptop Samsung mang đến những trải nghiệm tuyệt với nhất.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpbaalaptopno1.comaimagesaProductsa130113387989637202.jpg.jpg', 13.003338773322721, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (221, N'Laptop Sam Sung - máy tính xáy tay máy nhẹ hơn, màn hình sáng hơn và pin lâu hơn. Thiết kế mạnh mẽ cho phong cách của chính bạn. Laptop Samsung mang đến những trải nghiệm tuyệt với nhất.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpbaalaptopno1.comaimagesaProductsa130113397510001735.jpg.jpg', 12.794606364756284, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (222, N'Toshiba mang đến Mmột chiếc laptop có khả năng đáp ứng những nhu cầu giải trí, học tập, làm việc cho bất cứ người sử dụng nào, từ sinh viên đến nhân viên văn phòng, từ người nội trợ đến nhà điều hành công ty.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderaf5ac9a78af5c978d1d6cca55c8a95469b31b4d18c_8803_1350439701c840___en.jpg.jpg', 11.185838773322718, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (223, N'Toshiba mang đến Mmột chiếc laptop có khả năng đáp ứng những nhu cầu giải trí, học tập, làm việc cho bất cứ người sử dụng nào, từ sinh viên đến nhân viên văn phòng, từ người nội trợ đến nhà điều hành công ty.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'Images/I/667349dc5d0d349f446fc619e806c351_big_5902_8a852f6527044f7f29e449b83b15ca0f_thumbnail_560_420.jpg', 12.911221064442003, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (224, N'Toshiba mang đến Mmột chiếc laptop có khả năng đáp ứng những nhu cầu giải trí, học tập, làm việc cho bất cứ người sử dụng nào, từ sinh viên đến nhân viên văn phòng, từ người nội trợ đến nhà điều hành công ty.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'Images/I/0c7e911d21ae0070dbfad503343e8e2c_big_7134_f93a8746d0efd1b364fff1362168af65_thumbnail_560_420.jpg', 11.599702409686357, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (225, N'Toshiba mang đến Mmột chiếc laptop có khả năng đáp ứng những nhu cầu giải trí, học tập, làm việc cho bất cứ người sử dụng nào, từ sinh viên đến nhân viên văn phòng, từ người nội trợ đến nhà điều hành công ty.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'Images/I/7a3fbb6ad708a138bb37eda8d0112ea1_big_17583_15DF8F57008750D09B9C704B24C79364_thumbnail_560_420.jpg', 13.102130155351096, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (226, N'Toshiba mang đến Mmột chiếc laptop có khả năng đáp ứng những nhu cầu giải trí, học tập, làm việc cho bất cứ người sử dụng nào, từ sinh viên đến nhân viên văn phòng, từ người nội trợ đến nhà điều hành công ty.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderadaa5ca93ada5c9315dca1ac2775db239bd455d33d_C840_1012X_v2_thumbnail_560_420.jpg.jpg', 13.192403694108364, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (227, N'Là lựa chọn khá tốt cho người dùng bởi sự gọn nhẹ, thiết kế đẹp cùng những tính năng độc quyền của Asus giúp sản phẩm hỗ trợ tốt nhất nhu cầu giải trí, công việc của bạn.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpbaalaptopno1.comaimagesaProductsak450cc-wx263d.jpg.jpg', 14.467613349763321, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (228, N'Là lựa chọn khá tốt cho người dùng bởi sự gọn nhẹ, thiết kế đẹp cùng những tính năng độc quyền của Asus giúp sản phẩm hỗ trợ tốt nhất nhu cầu giải trí, công việc của bạn.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpbaalaptopno1.comaimagesaproductsaasus20k550-bk0.jpg.jpg', 15.212768368155333, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (229, N'Là lựa chọn khá tốt cho người dùng bởi sự gọn nhẹ, thiết kế đẹp cùng những tính năng độc quyền của Asus giúp sản phẩm hỗ trợ tốt nhất nhu cầu giải trí, công việc của bạn.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpbaalaptopno1.comaimagesaProductsak551lb3.jpg.jpg', 17.659207762094727, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (230, N'Là lựa chọn khá tốt cho người dùng bởi sự gọn nhẹ, thiết kế đẹp cùng những tính năng độc quyền của Asus giúp sản phẩm hỗ trợ tốt nhất nhu cầu giải trí, công việc của bạn.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpbaalaptopno1.comaimagesaproductsak451203.jpg.jpg', 14.467613349763321, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (231, N'Là lựa chọn khá tốt cho người dùng bởi sự gọn nhẹ, thiết kế đẹp cùng những tính năng độc quyền của Asus giúp sản phẩm hỗ trợ tốt nhất nhu cầu giải trí, công việc của bạn.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpbaalaptopno1.comaimagesaProductsak551.jpg.jpg', 15.754670012415414, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (232, N'Là lựa chọn khá tốt cho người dùng bởi sự gọn nhẹ, thiết kế đẹp cùng những tính năng độc quyền của Asus giúp sản phẩm hỗ trợ tốt nhất nhu cầu giải trí, công việc của bạn.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpbaalaptopno1.comaimagesaProductsak451.jpg.jpg', 14.810658979230061, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (233, N'Là lựa chọn khá tốt cho người dùng bởi sự gọn nhẹ, thiết kế đẹp cùng những tính năng độc quyền của Asus giúp sản phẩm hỗ trợ tốt nhất nhu cầu giải trí, công việc của bạn.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpbaalaptopno1.comaimagesaProductsak450.jpg.jpg', 12.463774577210966, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (234, N'Là lựa chọn khá tốt cho người dùng bởi sự gọn nhẹ, thiết kế đẹp cùng những tính năng độc quyền của Asus giúp sản phẩm hỗ trợ tốt nhất nhu cầu giải trí, công việc của bạn.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera59a33ae2a5933e206f3b02fb1250bb8d71fcd437c_9366_laptop-asus-vivobook-x202e-ct140h-grey-win8.jpg.jpg', 10.59921861294402, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (235, N'Là lựa chọn khá tốt cho người dùng bởi sự gọn nhẹ, thiết kế đẹp cùng những tính năng độc quyền của Asus giúp sản phẩm hỗ trợ tốt nhất nhu cầu giải trí, công việc của bạn.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFolderacaadca09acadc09feee54e4ad3adcbff3b94dcb68_ImageView.aspx_thumbnail_560_420.png.png', 12.741956395392789, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (236, N'Là lựa chọn khá tốt cho người dùng bởi sự gọn nhẹ, thiết kế đẹp cùng những tính năng độc quyền của Asus giúp sản phẩm hỗ trợ tốt nhất nhu cầu giải trí, công việc của bạn.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera17a3ea07a173e07d67c08875fc2296cd56f347cc5_1_thumbnail_560_420.jpg.jpg', 11.595592759029149, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (237, N'Là dòng sản phẩm mới của Fujitsu với hiệu suất cao, hoạt động ổn định đồng thời tiết kiệm điện năng hơn nhiều đáp ứng nhiều mục đích sử dụng của người dùng từ học tập, văn phòng cho tới chơi game hay đồ họa.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'Images/I/804f11c8d89dd003c0eeda8651fe172a_Laptop_Fujitsu_LH531_chinh_hang_1_thumbnail_560_420.jpg', 11.049001849938239, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (238, N'Là dòng sản phẩm mới của Fujitsu với hiệu suất cao, hoạt động ổn định đồng thời tiết kiệm điện năng hơn nhiều đáp ứng nhiều mục đích sử dụng của người dùng từ học tập, văn phòng cho tới chơi game hay đồ họa.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera33a19afba3319fb8591874c61fe0c3972cb9be0c6_big_23247_Fujitsu-LH531V_thumbnail_560_420.jpg.jpg', 12.46858441278496, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (239, N'Là phiên bản laptop cao cấp của Apple, được tung ra thị trường nhằm đáp ứng các nhu cầu cao hơn của người dùng. Quan trọng là bên trong máy được nâng cấp rất nhiều chi tiết đáng giá và tiên tiến hơn người tiền nhiệm trước đó.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'Images/I/httpbaacdn.tgdd.vnaProductsaImagesa44a61360aSlidera1.jpg.jpg', 20.358568976631517, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (240, N'Là phiên bản laptop cao cấp của Apple, được tung ra thị trường nhằm đáp ứng các nhu cầu cao hơn của người dùng. Quan trọng là bên trong máy được nâng cấp rất nhiều chi tiết đáng giá và tiên tiến hơn người tiền nhiệm trước đó.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'Images/I/httpbaacdn.tgdd.vnaProductsaImagesa44a67602aKitaMACbook-800x496-Pro.jpg.jpg', 23.155083201480338, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (241, N'Là phiên bản laptop cao cấp của Apple, được tung ra thị trường nhằm đáp ứng các nhu cầu cao hơn của người dùng. Quan trọng là bên trong máy được nâng cấp rất nhiều chi tiết đáng giá và tiên tiến hơn người tiền nhiệm trước đó.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'Images/I/httpbaacdn.tgdd.vnaProductsaImagesa44a68577aSliderAlbuma2494a0-macbook-air-2014-md-11inch-04a.jpg.jpg', 14.563403448518011, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (242, N' MSI GX70  Destroyer được trang bị card đồ họa mobile mới nhất của AMD là R9-M290X, chip xử lý 4 nhân cũng thuộc hàng cao cấp của AMD: A10-5750M, đồ họa tích hợp HD8650G, cùng công nghệ đa màn hình Eyefinity. Cấu hình trên giúp máy có thể chơi game ở tốc độ khung hình 32 fps với thiết lập full HD và Ultra settings trong Battlefield 4.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'Images/I/httpbaalaptopno1.comaimagesaProductsaGX6020Hitman0.png.png', 25.661214514523373, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (243, N'GS70 bản mẫu lần đầu tiên được MSI trưng bày tại triển lãm Computex 2013 vừa qua. Tuy nhiên, hôm nay hãng mới trình làng chính thức sản phẩm cùng cấu hình khủng với card đồ họa GeForce GTX 765M. Đây là linh kiện thuộc dòng GeForce GTX 700M chuyên dành cho laptop chơi game và các laptop yêu cầu khủng mới được Nvidia ra mắt.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Images/I/httpbaalaptopno1.comaimagesaProductsa130225719055705070.png.png', 24.709392834279488, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (244, N'MSI sẽ bán cho chúng ta một chiếc laptop chơi game dùng chip Core i7-4702MQ tốc độ 2,9 GHz, card đồ họa GeForce GTX760M dung lượng 2 GB, RAM 8 GB, ổ cứng 750 GB tốc độ 7200 rpm. Máy có pin 90Wh, màn hình độ phân giải 1600 x 900. So với chiếc laptop chơi gameAlienware 14, máy của MSI nhẹ hơn nhiều với trọng lượng chỉ 2 kg (Alienware 14 nặng 2,76 kg).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'Images/I/httpbaalaptopno1.comaimagesaProductsa130238881743522864.png.png', 15.293602425512566, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (245, N'MSI sẽ bán cho chúng ta một chiếc laptop chơi game dùng chip Core i7-4702MQ tốc độ 2,9 GHz, card đồ họa GeForce GTX760M dung lượng 2 GB, RAM 8 GB, ổ cứng 750 GB tốc độ 7200 rpm. Máy có pin 90Wh, màn hình độ phân giải 1600 x 900. So với chiếc laptop chơi gameAlienware 14, máy của MSI nhẹ hơn nhiều với trọng lượng chỉ 2 kg (Alienware 14 nặng 2,76 kg).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'Images/I/httpbaalaptopno1.comaimagesaProductsaGP6020Leopard.png.png', 15.927552985910676, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (246, N'Hãng Acer vừa tung ra sản phẩm Acer Aspire E1-572- NX.M8KSV.001  tiếp nối dòng sản phẩm laptop bình dân. Aspire E1 432 hấp dẫn người dùng với thiết kế thời trang nhỏ gọn hơn các dòng sản phẩm trước, hiệu năng ổn định đáp ứng hầu hết các nhu cầu cơ bản của bạn như xem phim, lướt web, nghe nhạc,…                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'Images/I/httpbaalaptopno1.comaimagesaProductsa130209239439416882.jpg.jpg', 14.834384141057528, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (247, N'Hãng Acer vừa tung ra sản phẩm Acer Aspire E1-572- NX.M8KSV.005  tiếp nối dòng sản phẩm laptop bình dân. Aspire E1 432 hấp dẫn người dùng với thiết kế thời trang nhỏ gọn hơn các dòng sản phẩm trước, hiệu năng ổn định đáp ứng hầu hết các nhu cầu cơ bản của bạn như xem phim, lướt web, nghe nhạc,…                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'Images/I/httpbaachinhnhan.vnacomponentsacom_productaimgaproducta1384314548hinh4.jpg.jpg', 14.834384141057528, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (248, N'Sony Vaio Multi Flip Fit 14A SVF14N26SGS  là dòng laptop khá thành công trong phân khúc tầm trung của Sony, thiết bị mang đến sự lựa chọn dễ dàng hơn, không chỉ với mức giá phù hợp mà còn có thiết kế đẹp, cấu hình tốt.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Images/I/httpbaalaptopno1.comaimagesaProductsa14n26.jpg.jpg', 17.196780016429987, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (249, N'Sony Vaio Multi Flip Fit 14A SVF14N16SGS là dòng laptop khá thành công trong phân khúc tầm trung của Sony, thiết bị mang đến sự lựa chọn dễ dàng hơn, không chỉ với mức giá phù hợp mà còn có thiết kế đẹp, cấu hình tốt.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'Images/I/httpbaalaptopno1.comaimagesaProductsa130470259708149666.jpg.jpg', 17.196780016429987, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (250, N'Toshiba mang đến Mmột chiếc laptop có khả năng đáp ứng những nhu cầu giải trí, học tập, làm việc cho bất cứ người sử dụng nào, từ sinh viên đến nhân viên văn phòng, từ người nội trợ đến nhà điều hành công ty.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'Images/I/fc0d582f1df21be85a7a7e995349e8ee_big_17581_90AF73D51EA497E32E35BFB71A05DB1B_thumbnail_560_420.jpg', 14.051901711667131, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (251, N'Toshiba mang đến Mmột chiếc laptop có khả năng đáp ứng những nhu cầu giải trí, học tập, làm việc cho bất cứ người sử dụng nào, từ sinh viên đến nhân viên văn phòng, từ người nội trợ đến nhà điều hành công ty.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Toshiba mang đến Mmột chiếc laptop có khả năng đáp ứng những nhu cầu giải trí, học tập, làm việc cho bất cứ người sử dụng nào, từ sinh viên đến nhân viên văn phòng, từ người nội trợ đến nhà điều hành công ty.                 ', N'Images/I/c842f15ebc45926ef4de3255513f1e75_medium_17578_758B769DB2ED2C3109462510D60D87DD_thumbnail_560_420.jpg', 14.051901711667131, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (252, N'Là dòng sản phẩm mới của Fujitsu với hiệu suất cao, hoạt động ổn định đồng thời tiết kiệm điện năng hơn nhiều đáp ứng nhiều mục đích sử dụng của người dùng từ học tập, văn phòng cho tới chơi game hay đồ họa.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'Images/I/httpsbaaviettelstore.vnagetfilesaTemp_FileManagementaPublishedFoldera7fad5a9fa7fd59f8a8ce1ddbf613759acb4261412_91_1313150702_4799415_images_thumbnail_560_420.jpg.jpg', 11.543728921455481, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (254, N'Sản phẩm có thế mạnh về phần cứng bên trong, tiêu biểu là bộ xử lý mới nhất Core i5 Haswell của Intel, cùng ổ đĩa cứng SSD và chip đồ họa “khủng” Intel HD Graphics 5100. Bên cạnh đó còn có màn hình Retina chất lượng cao cùng sự phong phú về kết nối.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'Images/I/httpbaacdn.tgdd.vnaProductsaImagesa44a68579aSlideramacbook-air-2014-md-11inch-07a.jpg.jpg', 15.488258939847492, 1)
INSERT [dbo].[Product] ([ID], [Description], [ImageURL], [TotalWeightPoint], [IsActive]) VALUES (255, N'Sản phẩm có thế mạnh về phần cứng bên trong, tiêu biểu là bộ xử lý mới nhất Core i5 Haswell của Intel, cùng ổ đĩa cứng SSD và chip đồ họa “khủng” Intel HD Graphics 5100. Bên cạnh đó còn có màn hình Retina chất lượng cao cùng sự phong phú về kết nối.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'Images/I/httpbaacdn.tgdd.vnaProductsaImagesa44a68575aKitaApple-Macbook-Air-2014-MD711ZPB-kich-800x496-thuoc.jpg.jpg', 15.789104206093771, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[ParseInfo]    Script Date: 09/03/2014 20:46:15 ******/
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
/****** Object:  Table [dbo].[LogFile]    Script Date: 09/03/2014 20:46:15 ******/
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
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (19, N'r5r54djq.nc1.txt', CAST(0x0000A37601061D0F AS DateTime), 1)
INSERT [dbo].[LogFile] ([ID], [Filename], [CreatedTime], [IsActive]) VALUES (20, N'qu5gb0ld.e2m.txt', CAST(0x0000A376011109E8 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[LogFile] OFF
/****** Object:  Table [dbo].[Codetype]    Script Date: 09/03/2014 20:46:15 ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 09/03/2014 20:46:15 ******/
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
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (12, N'Khác')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (13, N'Tất cả')
SET IDENTITY_INSERT [dbo].[Brand] OFF
/****** Object:  Table [dbo].[AliasProduct]    Script Date: 09/03/2014 20:46:15 ******/
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
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (183, 183, N'Dell Vostro V5560B (P34F001)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Dell/Dell-Vostro-V5560B-P34F001/', 15490000, 7, 4, CAST(0x0000A378018856F2 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (184, 184, N'Dell Insprion 15 3542 (DND6X3 BLACK)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Dell/Dell-Insprion-15-3542-DND6X3-BLACK/', 12990000, 7, 4, CAST(0x0000A37801885C3A AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (185, 185, N'Dell Inspiron N3521I (P28F001-TI32500)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Dell/Dell-Inspiron-N3521I-P28F001TI32500/', 9990000, 7, 4, CAST(0x0000A378018861D9 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (186, 186, N'DELL Inspiron 15 3537 52GNP4', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Dell/DELL-Inspiron-15-3537-52GNP4/', 12890000, 7, 4, CAST(0x0000A37801886851 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (187, 187, N'Dell Inspiron 15-N3537 (HSW15V15012133)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Dell/Dell-Inspiron-15N3537-HSW15V15012133/', 12990000, 7, 4, CAST(0x0000A37801886E99 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (188, 188, N'Dell Vostro 2421 W522104 Black', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Dell/Dell-Vostro-2421-W522104-Black/', 11990000, 7, 4, CAST(0x0000A37801887512 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (189, 189, N'Dell Vostro 3550 4G', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Dell/Dell-Vostro-3550-4G/', 13990000, 7, 4, CAST(0x0000A37801887BA2 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (190, 190, N'Dell Vostro 2420 - V522134 - Grey', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Dell/Dell-Vostro-2420-V522134-Grey/', 9490000, 7, 4, CAST(0x0000A37801888276 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (191, 191, N'Laptop HP 15 - D102TX (G2G91PA)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,HP/Laptop-HP-15-D102TX-G2G91PA/', 13490000, 7, 6, CAST(0x0000A37801888986 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (192, 192, N'HP Pavilion 14 - R006TU (G8D71PA)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,HP/HP-Pavilion-14-R006TU-G8D71PA/', 7690000, 7, 6, CAST(0x0000A37801889051 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (193, 193, N'HP Pavilion 14 N237TU (G4W46PA)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,HP/HP-Pavilion-14-N237TU-G4W46PA/', 12490000, 7, 6, CAST(0x0000A37801889730 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (194, 194, N'HP Pavilion 15-N233TU (G4W48PA)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,HP/HP-Pavilion-15N233TU-G4W48PA/', 12490000, 7, 6, CAST(0x0000A37801889E6D AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (195, 195, N'HP Envy 4-1012TU - B4P92PA', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,HP/HP-Envy-41012TU-B4P92PA/', 19990000, 7, 6, CAST(0x0000A3780188A518 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (196, 196, N'HP ProBook 4430S-LX014 (LX014PA)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,HP/HP-ProBook-4430SLX014-LX014PA/', 10990000, 7, 6, CAST(0x0000A3780188AC33 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (197, 197, N'HP Compaq CQ43 - 206TU', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,HP/HP-Compaq-CQ43-206TU/', 8490000, 7, 6, CAST(0x0000A3780188B298 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (198, 198, N'HP Pavilion Sleekbook TS 14(D9G53PA)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,HP/HP-Pavilion-Sleekbook-TS-14D9G53PA/', 11990000, 7, 6, CAST(0x0000A3780188B93A AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (199, 199, N'HP Pavilion 15-E061TX F4A49PA', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,HP/HP-Pavilion-15E061TX-F4A49PA/', 12990000, 7, 6, CAST(0x0000A3780188BEFD AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (200, 200, N'Acer Aspire E1 470G (NX.MF2SV.002)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Acer/Acer-Aspire-E1-470G-NXMF2SV002/', 8990000, 7, 2, CAST(0x0000A3780188C40C AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (201, 201, N'Acer Aspire E5-511 NX.MPKSV.003', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Acer/Acer-Aspire-E5511-NXMPKSV003/', 6690000, 7, 2, CAST(0x0000A3780188C9A5 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (202, 202, N'Acer Aspire E1-570-33214G50Dnkk (NX.MEPSV.001)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Acer/Acer-Aspire-E157033214G50Dnkk-NXMEPSV001/', 8290000, 7, 2, CAST(0x0000A3780188CEA1 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (203, 203, N'Lenovo B490 (59365363)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Lenovo/Lenovo-B490-59365363/', 9990000, 7, 9, CAST(0x0000A3780188D411 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (204, 204, N'Lenovo G5070 (59423771)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Lenovo/Lenovo-G5070-59423771/', 9490000, 7, 9, CAST(0x0000A3780188DB77 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (205, 205, N'Laptop Lenovo G40-70(59-414338)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Lenovo/Laptop-Lenovo-G407059414338/', 6990000, 7, 9, CAST(0x0000A3780188E6C0 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (206, 206, N'Lenovo G500s (59409052)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Lenovo/Lenovo-G500s-59409052/', 8990000, 7, 9, CAST(0x0000A3780188EC34 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (207, 207, N'Lenovo Y480 - 59357549', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Lenovo/Lenovo-Y480-59357549/', 10990000, 7, 9, CAST(0x0000A3780188F1C6 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (208, 208, N'LENOVO IDEAPAD S210 (59389595)', N'http://laptopno1.com/chi-tiet-san-pham/1589/lenovo-ideapad-s210-59389595-intel-1037u-2gb-500gb.htm', 6399000, 11, 9, CAST(0x0000A3780188F777 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (209, 209, N'Lenovo IdeaPad G400 (59375061)', N'http://laptopno1.com/chi-tiet-san-pham/1479/lenovo-ideapad-g400-59375061-pentium-2020m-2gb-500gb-intel-hd-14%E2%80%9D-led.htm', 6699000, 11, 9, CAST(0x0000A3780188FCAE AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (210, 210, N'Lenovo S410P ( 59409051)', N'http://laptopno1.com/chi-tiet-san-pham/1476/lenovo-s410p-59409051-pentium-haswell-3556u-2gb-ddr3-500gb-14-1-.htm', 7199000, 11, 9, CAST(0x0000A378018901F7 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (211, 211, N'LENOVO IDEAPAD S210 (59402712)', N'http://laptopno1.com/chi-tiet-san-pham/1590/lenovo-ideapad-s210-59402712-intel-core-i3-3217u-4gb-500gb-.htm', 8599000, 11, 9, CAST(0x0000A3780189071F AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (212, 212, N'Sony Vaio SVT14127', N'http://laptopno1.com/chi-tiet-san-pham/1302/sony-vaio-svt14127-core-i7-3537u-4gb-500gb-24g-ssd-touch.htm', 22499000, 11, 10, CAST(0x0000A37801890E23 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (213, 213, N'Sony Vaio SVE14114FXW (Màu Trắng)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Sony/Sony-Vaio-SVE14114FXW-Mau-Trang/', 17990000, 7, 10, CAST(0x0000A37801891373 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (214, 214, N'Sony Vaio SVE14135CXP', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Sony/Sony-Vaio-SVE14135CXP/', 17990000, 7, 10, CAST(0x0000A378018918CD AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (215, 215, N'Sony SVT13134CXS', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Sony/Sony-SVT13134CXS/', 14990000, 7, 10, CAST(0x0000A37801891E81 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (216, 216, N'Sony Vaio EG26 FX/B', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Sony/Sony-Vaio-EG26-FXB/', 16690000, 7, 10, CAST(0x0000A378018923F5 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (217, 217, N'Sony Vaio SVE14A15FLH', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Sony/Sony-Vaio-SVE14A15FLH/', 16990000, 7, 10, CAST(0x0000A3780189297E AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (218, 218, N'Sony Vaio SVE1511KFXW', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Sony/Sony-Vaio-SVE1511KFXW/', 20990000, 7, 10, CAST(0x0000A37801892FAC AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (219, 219, N'SamSung R439 (DA07VN)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Samsung-2/SamSung-R439-DA07VN/', 10990000, 7, 7, CAST(0x0000A37801893529 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (220, 220, N'Samsung Series 3 (NP300E4X-A06VN)', N'http://laptopno1.com/chi-tiet-san-pham/49/samsung-series-3-np300e4x-a06vn-intel-core-i3-3110m-2-4ghz-2gb-500gb-vga-intel.htm', 9500000, 11, 7, CAST(0x0000A37801893A9D AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (221, 221, N'Samsung Series 5 NP535U3X-A02VN', N'http://laptopno1.com/chi-tiet-san-pham/51/samsung-series-5-np535u3x-a02vn-amd-dual-core-a6-4455m-2-1ghz-4gb-500gb-vga-ati-radeon-hd-7500g.htm', 10999000, 11, 7, CAST(0x0000A3780189403C AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (222, 222, N'Toshiba Satelite C800 - 1016', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Toshiba/Toshiba-Satelite-C800-1016/', 7990000, 7, 5, CAST(0x0000A37801894613 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (223, 223, N'Toshiba Satellite L755-1006U (PSK1YL-001001)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Toshiba/Toshiba-Satellite-L7551006U-PSK1YL001001/', 12690000, 7, 5, CAST(0x0000A37801894B8E AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (224, 224, N'Toshiba Satellite C600-1009U (PSC4UL-00M007)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Toshiba/Toshiba-Satellite-C6001009U-PSC4UL00M007/', 8290000, 7, 5, CAST(0x0000A378018950DF AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (225, 225, N'Toshiba Sattelite C850-1000 (PSC74L-003002)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Toshiba/Toshiba-Sattelite-C8501000-PSC74L003002/', 11690000, 7, 5, CAST(0x0000A37801895647 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (226, 226, N'Toshiba Satellite C840-1012X (PSC6GL-009002)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Toshiba/Toshiba-Satellite-C8401012X-PSC6GL009002/', 10900000, 7, 5, CAST(0x0000A37801895B97 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (227, 227, N'Asus K450LA - WX040D', N'http://laptopno1.com/chi-tiet-san-pham/1707/asus-k450la-wx040d-core-i5-haswell-4200u-4gb-500gb.htm', 11790000, 11, 1, CAST(0x0000A3780189612B AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (228, 228, N'Asus K550LAV - XX410D', N'http://laptopno1.com/chi-tiet-san-pham/1710/asus-k550lav-xx410d-core-i5-haswell-4210u-4gb-500gb.htm', 11999000, 11, 1, CAST(0x0000A378018966E9 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (229, 229, N'ASUS K551LA XX216D', N'http://laptopno1.com/chi-tiet-san-pham/1620/asus-k551la-xx216d-core-i5-haswell-4200u-4gb-1tb.htm', 12199000, 11, 1, CAST(0x0000A37801896CF2 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (230, 230, N'Asus K451LA - WX089D', N'http://laptopno1.com/chi-tiet-san-pham/1691/asus-k451la-wx089d-core-i5-haswell-4200u-4gb-500gb.htm', 12299000, 11, 1, CAST(0x0000A378018972A1 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (231, 231, N'ASUS K551LB-XX276D', N'http://laptopno1.com/chi-tiet-san-pham/1417/asus-k551lb-xx276d-core-i5-haswell-4200u-4gb-500gb-24g-ssd-gt-740m-2gb.htm', 13599000, 11, 1, CAST(0x0000A37801897888 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (232, 232, N'ASUS K451LN-WX080D', N'http://laptopno1.com/chi-tiet-san-pham/1575/asus-k451ln-wx080d-core-i5-haswell-4200u-4gb-500gb-8gb-ssd-geforce-840m-gt-2gb.htm', 13699000, 11, 1, CAST(0x0000A37801897E50 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (233, 233, N'ASUS K450CA-WX210', N'http://laptopno1.com/chi-tiet-san-pham/1399/asus-k450ca-wx210-core-i3-3217-2gb-500gb.htm', 9199000, 11, 1, CAST(0x0000A37801898437 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (234, 234, N'Asus VivoBook X202E (CT141H) Grey', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Asus/Asus-VivoBook-X202E-CT141H-Grey/', 6990000, 7, 1, CAST(0x0000A37801898C64 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (235, 235, N'Combo Asus K43E-VX356 (K43E-3FVX)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Asus/Combo-Asus-K43EVX356-K43E3FVX/', 11590000, 7, 1, CAST(0x0000A3780189931C AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (236, 236, N'Asus A42F-VX390', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Asus/Asus-A42FVX390/', 8990000, 7, 1, CAST(0x0000A3780189993B AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (237, 237, N'Fujitsu LH531(B)-L0LH531AS00000120', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Fujitsu/Fujitsu-LH531BL0LH531AS00000120/', 8490000, 7, 12, CAST(0x0000A37801899E63 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (238, 238, N'Fujitsu LH531V(B) i3-2310M .Part L0LH531AS00000121', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Fujitsu/Fujitsu-LH531VB-i32310M-Part-L0LH531AS00000121/', 12690000, 7, 12, CAST(0x0000A3780189A3AF AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (239, 239, N'Apple Macbook Pro ME293 15inch 74758G256', N'http://www.thegioididong.com/laptop/apple-macbook-pro-me293-15inch-74758g256', 47890000, 9, 3, CAST(0x0000A3780189A923 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (240, 240, N'Apple Macbook Pro ME294 15inch 748516G512G', N'http://www.thegioididong.com/laptop/apple-macbook-pro-me294-15inch-748516g512g', 59890000, 9, 3, CAST(0x0000A3780189AE7F AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (241, 241, N'Macbook Air 2014 MD712ZP/B i5 4260U/4G/256G/MAC', N'http://www.thegioididong.com/laptop/apple-macbook-air-2014-md712zp-b', 26990000, 9, 3, CAST(0x0000A3780189B3FC AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (242, 242, N'MSI GX70 Destroyer 3CC-276XVN', N'http://laptopno1.com/chi-tiet-san-pham/1414/msi-gx70-destroyer-3cc-276xvn-quadcore-a10-5750m-4gb-750gb-radeon-r9-m290x-2gb-gddr5.htm', 24999000, 11, 8, CAST(0x0000A3780189BA3C AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (243, 243, N'MSI GS70 2OD-442 Core i7 4700HQ', N'http://laptopno1.com/chi-tiet-san-pham/1092/msi-gs70-2od-442-core-i7-4700hq-8gb-750gb-7200rpm-gtx-765m-2gb-ddr5-full-hd.htm', 29999000, 11, 8, CAST(0x0000A3780189C059 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (244, 244, N'MSI GE40 2OL-264 Core i5 4200M', N'http://laptopno1.com/chi-tiet-san-pham/1109/msi-ge40-2ol-264-core-i5-4200m-4gb-ram-750gb-gt-750m-2gb-900p-.htm', 19999000, 11, 8, CAST(0x0000A3780189C686 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (245, 245, N'MSI GP60 2PE-030 Leopard Pro', N'http://laptopno1.com/chi-tiet-san-pham/1110/msi-gp60-2pe-030-leopard-pro-core-i5-4200h-4gb-750gb-full-hd-vga-gf-840m-2gb.htm', 19999000, 11, 8, CAST(0x0000A3780189CC4F AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (246, 246, N'Acer Aspire E1-572- NX.M8KSV.001', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Acer/Acer-Aspire-E1572-NXM8KSV001/', 10990000, 7, 2, CAST(0x0000A3780189D1F4 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (247, 247, N'Acer Aspire E1-572- NX.M8KSV.005', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Acer/Acer-Aspire-E1572-NXM8KSV005/', 11490000, 7, 2, CAST(0x0000A3780189D8C1 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (248, 248, N'Sony Vaio Multi Flip Fit 14A SVF14N26SGS', N'http://laptopno1.com/chi-tiet-san-pham/1779/sony-vaio-multi-flip-fit-14a-svf14n26sgs-i5-4200u-4gb-1tb-touch-win8-.htm', 22799000, 11, 10, CAST(0x0000A3780189DEEB AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (249, 249, N'Sony Vaio Multi Flip Fit 14A SVF14N16SGS', N'http://laptopno1.com/chi-tiet-san-pham/1653/sony-vaio-multi-flip-fit-14a-svf14n16sgs-i5-4200u-4gb-1tb-touch-win8-.htm', 21999000, 11, 10, CAST(0x0000A3780189E53D AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (250, 250, N'Toshiba Sattelite L840-1008X (PSK8NL-001004)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Toshiba/Toshiba-Sattelite-L8401008X-PSK8NL001004/', 14890000, 7, 5, CAST(0x0000A3780189EB91 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (251, 251, N'Toshiba Sattelite L840-1008XW (PSK8NL-009004)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Toshiba/Toshiba-Sattelite-L8401008XW-PSK8NL009004/', 13890000, 7, 5, CAST(0x0000A3780189F124 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (252, 252, N'Fujitsu P771 (L00P771ASECK20037)', N'https://viettelstore.vn/Home/San-pham,Laptop/Hang-san-xuat,Fujitsu/Fujitsu-P771-L00P771ASECK20037/', 32990000, 7, 12, CAST(0x0000A3780189F6C0 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (254, 254, N'Apple Macbook Air 2014 MD761ZP/B', N'http://www.thegioididong.com/laptop/apple-macbook-air-2014-md761zp-b', 28990000, 9, 3, CAST(0x0000A378018A04D8 AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (255, 255, N'Apple Macbook Air 2014 MD711ZP/B', N'http://www.thegioididong.com/laptop/apple-macbook-air-2014-md711zp-b', 21990000, 9, 3, CAST(0x0000A378018A0A9B AS DateTime), 1, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (257, 183, N'Dell Vostro 5560 - V5560B', N'http://thietbiso.com/dell-vostro-5560-v5560b-4378315.html', 14749000, 8, 4, CAST(0x0000A37800000000 AS DateTime), 0, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (258, 183, N'Dell Vostro 5560 ( V5560B)', N'http://laptopno1.com/chi-tiet-san-pham/269/-dell-vostro-5560-v5560b-i5-3230-4g-1tg-vga-geforce-630m-gt-2gb.htm', 14299000, 11, 4, CAST(0x0000A37800000000 AS DateTime), 0, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (259, 184, N'Laptop Dell Inspiron 15 3542 (DND6X6-BLACK)	', N'http://dienmaycholon.vn/chi-tiet-san-pham/6057/laptop-dell-inspiron-15-3542-dnd6x6-black', 8490000, 5, 4, CAST(0x0000A37800000000 AS DateTime), 0, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (260, 184, N'DELL Inspiron N3542 (DND6X6) ', N'http://laptopno1.com/chi-tiet-san-pham/1684/dell-inspiron-n3542-dnd6x6-intel-pentium-3558u-2g-500g.htm', 7999000, 11, 4, CAST(0x0000A37800000000 AS DateTime), 0, 1)
INSERT [dbo].[AliasProduct] ([ID], [ProductID], [Name], [URL], [Price], [StoreID], [BrandID], [UpdateTime], [IsMain], [IsActive]) VALUES (261, 183, N'Dell Vostro 5560 53234G1TG', N'http://www.thegioididong.com/laptop/dell-vostro-5560-53234g1tg', 14490000, 9, 4, CAST(0x0000A39500E20272 AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[AliasProduct] OFF
/****** Object:  Table [dbo].[Account]    Script Date: 09/03/2014 20:46:15 ******/
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
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'admin', N'123456', N'iv250509@gmail.com', 2, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'Guest', N'123456', N'iv250509@gmail.com', 4, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'hanker12', N'123456', N'iv250509@gmail.com', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'member1', N'123456', N'iv250509@gmail.com', 3, 1)
INSERT [dbo].[Account] ([Username], [Password], [Email], [RoleID], [IsActive]) VALUES (N'staff', N'123456', N'iv250509@gmail.com', 2, 1)
/****** Object:  Table [dbo].[Hardware]    Script Date: 09/03/2014 20:46:15 ******/
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
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1546, N'V', N'AMD Radeon HD 7990', 18190, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1547, N'V', N'NVIDIA GeForce GTX 690', 9730, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1548, N'V', N'AMD Radeon R9 290X', 14570, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1549, N'V', N'AMD Radeon HD 7870 XT', 8090, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1550, N'V', N'ATI Radeon HD 5970', 7660, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1551, N'V', N'AMD Radeon HD 8970M', 6670, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1552, N'V', N'AMD Radeon HD 7850', 6630, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1553, N'V', N'NVIDIA GeForce GTX 560 Ti 448', 4730, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1554, N'V', N'NVIDIA GeForce GTX 650 Ti Boost', 5770, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1555, N'V', N'AMD Radeon R7 260X', 5280, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1556, N'V', N'AMD FirePro W5000', 4080, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1557, N'V', N'AMD Radeon HD 7770', 4000, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1558, N'V', N'ATI Radeon HD 5850', 3820, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1559, N'V', N'AMD Radeon HD 6970M / 6990M', 3120, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1560, N'V', N'AMD Radeon HD 7660D', 2740, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1561, N'V', N'NVIDIA GeForce GT 750M', 1040, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1562, N'V', N'ATI Mobility Radeon HD 5870', 2440, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1563, N'V', N'AMD Radeon HD 6550D', 2400, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1564, N'V', N'NVIDIA GeForce GT 640 (GK208)', 2400, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1565, N'V', N'NVIDIA GeForce GT 640 (GDDR5)', 2310, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1566, N'V', N'NVIDIA GeForce GT 745M', 1200, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1567, N'V', N'AMD Radeon R7 250', 2100, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1568, N'V', N'AMD Radeon HD 8750M', 1890, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1569, N'V', N'Intel Iris Pro Graphics 5200 Mobile', 1690, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1570, N'V', N'AMD Radeon HD 8670D', 1580, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1571, N'V', N'AMD Radeon HD 7690M', 1210, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1572, N'V', N'Intel HD Graphics 5000', 330, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1573, N'V', N'ATI Mobility Radeon HD 5650/5750', 930, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1574, N'V', N'Intel HD Graphics 4400 Mobile', 600, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1575, N'V', N'AMD Radeon HD 7540D', 860, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1576, N'V', N'NVIDIA NVS 4200M', 570, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1577, N'V', N'NVIDIA GeForce 605', 420, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1578, N'V', N'AMD Radeon HD 6310', 380, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1579, N'C', N'Intel Core i7-4960X', 13200, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1580, N'C', N'Intel Core i7-4930K', 12790, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1581, N'C', N'Intel Core i7-3970X Extreme Edition ', 11420, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1582, N'C', N'Intel Core i7-4820K', 11640, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1583, N'C', N'Intel Core i7-4790 ', 9340, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1584, N'C', N'Intel Core i7-990X ', 9050, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1585, N'C', N'Intel Core i7-970  ', 8530, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1586, N'C', N'Intel Core i7-3770K ', 7880, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1587, N'C', N'Intel Core i7-2700K ', 7880, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1588, N'C', N'AMD FX-9590', 7830, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1589, N'C', N'AMD FX-9370', 7420, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1590, N'C', N'Intel Core i7-4900MQ', 7160, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1591, N'C', N'AMD FX-4350', 7140, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1592, N'C', N'Intel Core i5-4690 ', 6970, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1593, N'C', N'AMD FX-8350', 6870, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1594, N'C', N'Intel Core i7-4700HQ', 6810, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1595, N'C', N'AMD FX-6350', 6730, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1596, N'C', N'Intel Core i7-4712MQ', 6730, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1597, N'C', N'AMD FX-4300', 6590, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1598, N'C', N'Intel Core i7-3840QM', 6440, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1599, N'C', N'AMD FX-4170', 6430, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1600, N'C', N'Intel Core i5-3570K ', 6420, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1601, N'C', N'Intel Core i5-4440', 6390, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1602, N'C', N'Intel Core i5-2550K ', 6220, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1603, N'C', N'AMD FX-6300', 6180, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1604, N'C', N'AMD FX-8320', 6180, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1605, N'C', N'Intel Core i7-875K  ', 6110, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1606, N'C', N'Intel Core i7-3720QM ', 6090, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1607, N'C', N'AMD FX-4130', 5990, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1608, N'C', N'AMD FX-6200', 5990, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1609, N'C', N'Intel Core i5-2400 ', 5970, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1610, N'C', N'Intel Core i5-3450 ', 5920, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1611, N'C', N'AMD FX-8300', 5900, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1612, N'C', N'Intel Core i5-2320 ', 5850, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1613, N'C', N'Intel Core i7-860 ', 5850, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1614, N'C', N'AMD FX-4100', 5770, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1615, N'C', N'AMD FX-8150', 5770, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1616, N'C', N'Intel Core i7-3635QM', 5750, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1617, N'C', N'Intel Core i7-3940XM', 5750, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1618, N'C', N'Intel Core i7-4600U ', 5740, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1619, N'C', N'Intel Core i7-3610QM ', 5570, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1620, N'C', N'AMD FX-6100', 5440, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1621, N'C', N'Intel Core i7-3520M', 5400, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1622, N'C', N'AMD FX-8120', 5220, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1623, N'C', N'AMD Phenom II X6 1100T', 5200, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1624, N'C', N'Intel Core i7-2760QM ', 5060, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1625, N'C', N'AMD Phenom II X6 1075T ', 4870, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1626, N'C', N'Intel Core i5-760 ', 4760, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1627, N'C', N'Intel Core i7-2670QM ', 4710, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1628, N'C', N'Intel Core i5  I5-750', 4570, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1629, N'C', N'Intel Core 2 Extreme  QX9650', 4140, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1630, N'C', N'Intel Core i3-3240', 4130, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1631, N'C', N'AMD Phenom II X4 975', 4120, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1632, N'C', N'AMD Phenom(tm) II X4 B60', 4000, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1633, N'C', N'Intel Core i5-3330', 3950, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1634, N'C', N'AMD A10-6800K', 3880, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1635, N'C', N'Intel Core i3-2120 ', 3880, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1636, N'C', N'Intel Core 2 Quad  Q9650', 3830, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1637, N'C', N'AMD A8-6600K', 3710, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1638, N'C', N'AMD A6-6400K', 3710, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1639, N'C', N'AMD Athlon X4 760K', 3620, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1640, N'C', N'AMD A10-5800K', 3590, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1641, N'C', N'AMD A10-6700', 3540, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1642, N'C', N'Intel Core i5-4200H', 2450, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1643, N'C', N'AMD A4-3870K', 3510, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1644, N'C', N'AMD A8-3850', 3470, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1645, N'C', N'AMD A8-5600K', 3420, 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1646, N'C', N'Intel Pentium G3420', 3420, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1647, N'C', N'AMD A8-6500', 3360, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1648, N'C', N'Intel Core 2 Quad  Q8400', 3330, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1649, N'C', N'AMD Phenom II X4 960T', 3310, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1650, N'C', N'AMD Athlon II X4 641', 3260, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1651, N'C', N'AMD A4-5300', 3250, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1652, N'C', N'Intel Core i3-550 ', 3180, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1653, N'C', N'Intel Core 2 Quad  Q6700', 3150, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1654, N'C', N'AMD Athlon X4 740', 3150, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1655, N'C', N'Intel Core i5-3210M ', 3130, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1656, N'C', N'Intel Core 2 Quad  Q9300', 3080, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1657, N'C', N'Intel Core i3-3110M', 3000, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1658, N'C', N'Intel Pentium  G2030', 2940, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1659, N'C', N'AMD Athlon II X4 Quad-Core  630', 2780, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1660, N'C', N'AMD Phenom II X3 720', 2770, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1661, N'C', N'Intel Core i5-4300U ', 2720, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1662, N'C', N'Intel Core i3-2350M ', 2600, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1663, N'C', N'Intel Core 2 Duo  E8600', 2570, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1664, N'C', N'AMD A10-5750M', 2510, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1665, N'C', N'AMD Athlon II X3 450', 2350, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1666, N'C', N'Intel Core 2 Duo  E7500', 2250, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1667, N'C', N'AMD A10-4600M', 2220, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1668, N'C', N'AMD Phenom II X2 555 BE', 2170, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1669, N'C', N'AMD A8-4500M', 2080, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1670, N'C', N'Intel Core 2 Duo  E6850', 2080, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1671, N'C', N'AMD Athlon II X2 240', 1690, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1672, N'C', N'Intel Pentium Dual-Core E5300', 1640, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1673, N'C', N'Intel Pentium Dual-Core processor E2200', 1400, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1674, N'C', N'AMD Athlon 64 X2  6000+', 1170, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1675, N'V', N'NVIDIA GeForce GTX 780 Ti', 15630, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1676, N'V', N'NVIDIA GeForce GTX Titan', 14090, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1677, N'V', N'NVIDIA GeForce GTX 780', 14020, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1678, N'V', N'NVIDIA GeForce GTX 770', 11310, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1679, N'V', N'AMD Radeon R9 280X', 10880, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1680, N'V', N'NVIDIA GeForce GTX 680', 10820, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1681, N'V', N'AMD Radeon HD 7970', 10680, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1682, N'V', N'AMD Radeon HD 6990', 10630, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1683, N'V', N'NVIDIA GeForce GTX 670', 9600, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1684, N'V', N'AMD Radeon HD 7950', 9290, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1685, N'V', N'NVIDIA GeForce GTX 660 Ti', 8900, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1686, N'V', N'NVIDIA GeForce GTX 760', 8730, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1687, N'V', N'AMD Radeon R9 270X', 8520, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1688, N'V', N'NVIDIA GeForce GTX 780M', 7530, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1689, N'V', N'NVIDIA GeForce GTX 660', 6850, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1690, N'V', N'NVIDIA GeForce GTX 680M', 6650, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1691, N'V', N'NVIDIA GeForce GTX 580', 6610, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1692, N'V', N'NVIDIA GeForce GTX 570', 5910, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1693, N'V', N'NVIDIA GeForce GTX 480', 5770, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1694, N'V', N'AMD Radeon HD 6970', 5680, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1695, N'V', N'AMD Radeon HD 7790', 5670, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1696, N'V', N'AMD Radeon HD 6950', 5240, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1697, N'V', N'NVIDIA GeForce GTX 770M', 5150, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1698, N'V', N'NVIDIA GeForce GTX 470', 4800, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1699, N'V', N'NVIDIA GeForce GTX 650 Ti', 4740, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1700, N'V', N'NVIDIA GeForce GTX 675MX', 4570, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1701, N'V', N'NVIDIA GeForce GTX 670MX', 4440, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1702, N'V', N'ATI Radeon HD 5870', 4390, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1703, N'V', N'AMD Radeon HD 6870', 4230, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1704, N'V', N'NVIDIA GeForce GTX 765M', 4170, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1705, N'V', N'NVIDIA GeForce GTX 560', 4060, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1706, N'V', N'NVIDIA GeForce GTX 460 v2', 3820, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1707, N'V', N'NVIDIA GeForce GTX 465', 3760, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1708, N'V', N'AMD Radeon HD 6850', 3640, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1709, N'V', N'NVIDIA GeForce GTX 460', 3580, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1710, N'V', N'NVIDIA GeForce GTX 760M', 3480, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1711, N'V', N'AMD Radeon HD 6990M', 3390, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1712, N'V', N'NVIDIA GeForce GTX 580M', 3380, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1713, N'V', N'NVIDIA GeForce GTX 675M', 3350, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1714, N'V', N'ATI Radeon HD 5830', 3290, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1715, N'V', N'NVIDIA GeForce GTX 560 SE', 3290, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1716, N'V', N'AMD Radeon HD 7750', 3240, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1717, N'V', N'AMD Radeon HD 6790', 3080, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1718, N'V', N'NVIDIA GeForce GTX 460 SE', 3070, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1719, N'V', N'NVIDIA GeForce GTX 670M', 2980, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1720, N'V', N'NVIDIA GeForce GTX 650', 2870, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1721, N'V', N'NVIDIA GeForce GTX 570M', 2800, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1722, N'V', N'AMD Radeon HD 8670', 2700, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1723, N'V', N'ATI Radeon HD 5770', 2620, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1724, N'V', N'AMD Radeon HD 6770', 2520, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1725, N'V', N'NVIDIA GeForce GTX 550 Ti', 2510, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1726, N'V', N'NVIDIA GeForce GTX 660M', 2500, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1727, N'V', N'ATI Radeon HD 5750', 2190, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1728, N'V', N'NVIDIA GeForce GT 640 (DDR3)', 2180, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1729, N'V', N'NVIDIA GeForce GTS 450', 2150, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1730, N'V', N'NVIDIA GeForce GTX 560M', 2100, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1731, N'V', N'NVIDIA GeForce GTX 460M', 2070, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1732, N'V', N'AMD Radeon HD 6750', 2040, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1733, N'V', N'ATI Mobility Radeon HD 5850', 2010, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1734, N'V', N'AMD Radeon HD 6670', 1990, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1735, N'V', N'AMD Radeon HD 8570', 1950, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1736, N'V', N'NVIDIA GeForce GT 740M', 1850, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1737, N'V', N'NVIDIA GeForce GT 730M', 1820, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1738, N'V', N'NVIDIA GeForce GT 640M', 1760, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1739, N'V', N'NVIDIA GeForce GT 630 (GK208)', 1750, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1740, N'V', N'NVIDIA GeForce GT 735M', 1700, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1741, N'V', N'AMD Radeon HD 6850M', 1610, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1742, N'V', N'AMD Radeon HD 8570D', 1560, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1743, N'V', N'NVIDIA GeForce GT 640M LE', 1530, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1744, N'V', N'AMD Radeon HD 7560D', 1510, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1745, N'V', N'ATI Radeon HD 5670', 1510, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1746, N'V', N'AMD Radeon HD 6570', 1480, 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1747, N'V', N'NVIDIA GeForce GT 555M', 1430, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1748, N'V', N'AMD Radeon HD 6770M', 1420, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1749, N'V', N'AMD Radeon HD 8570M', 1410, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1750, N'V', N'AMD Radeon HD 7570', 1230, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1751, N'V', N'NVIDIA GeForce GT 440', 1190, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1752, N'V', N'AMD Radeon HD 7670M', 1170, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1753, N'V', N'NVIDIA GeForce GT 630', 1160, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1754, N'V', N'ATI Mobility Radeon HD 5730', 1110, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1755, N'V', N'NVIDIA GeForce 710M', 1110, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1756, N'V', N'ATI Radeon HD 5570', 1100, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1757, N'V', N'NVIDIA GeForce GT 635M', 1070, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1758, N'V', N'Intel Iris Graphics 5100 Mobile', 1070, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1759, N'V', N'NVIDIA GeForce GT 720M', 1070, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1760, N'V', N'AMD Radeon HD 6650M', 1060, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1761, N'V', N'Intel HD Graphics 4200 Mobile', 1050, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1762, N'V', N'NVIDIA GeForce GT 630M', 1050, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1763, N'V', N'NVIDIA GeForce GT 540M', 990, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1764, N'V', N'NVIDIA GeForce GT 430', 990, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1765, N'V', N'NVIDIA GeForce GT 530', 990, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1766, N'V', N'NVIDIA GeForce GT 620M', 950, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1767, N'V', N'ATI Radeon HD 5550', 920, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1768, N'V', N'AMD Radeon HD 7650M', 850, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1769, N'V', N'NVIDIA GeForce GT 525M', 850, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1770, N'V', N'AMD Radeon HD 7570M', 830, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1771, N'V', N'AMD Radeon HD 8470D', 810, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1772, N'V', N'NVIDIA GeForce GT 620', 750, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1773, N'V', N'NVIDIA GeForce GT 520MX', 630, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1774, N'V', N'AMD Radeon HD 7470', 590, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1775, N'V', N'NVIDIA GeForce GT 610', 560, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1776, N'V', N'NVIDIA GeForce GT 520', 560, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1777, N'V', N'NVIDIA GeForce 610M', 550, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1778, N'V', N'AMD Radeon HD 7470M', 540, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1779, N'V', N'NVIDIA GeForce GT 520M', 540, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1780, N'V', N'AMD Radeon HD 6450', 480, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1781, N'V', N'ATI Mobility Radeon HD 5450', 370, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1782, N'V', N'AMD Radeon HD 6370M', 370, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1783, N'V', N'ATI Radeon HD 5450', 330, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1784, N'C', N'Intel Core i7-3930K ', 11210, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1785, N'C', N'Intel Core i7-3820 ', 10450, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1786, N'C', N'Intel Core i7-4770K', 9150, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1787, N'C', N'Intel Core i7-4771', 9150, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1788, N'C', N'Intel Core i7-4770', 8960, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1789, N'C', N'Intel Core i7-980X ', 8800, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1790, N'C', N'Intel Core i7-4770S', 8380, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1791, N'C', N'Intel Core i7-2600 ', 7690, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1792, N'C', N'Intel Core i7-2600K ', 7690, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1793, N'C', N'Intel Core i7-4930MX', 7330, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1794, N'C', N'Intel Core i7-4800MQ', 7070, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1795, N'C', N'Intel Core i7-975  Extreme Edition', 6880, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1796, N'C', N'Intel Core i5-4670K', 6820, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1797, N'C', N'Intel Core i5-4670', 6820, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1798, N'C', N'Intel Core i7-4700MQ', 6810, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1799, N'C', N'Intel Core i7-4702HQ', 6640, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1800, N'C', N'Intel Core i7-4702MQ', 6640, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1801, N'C', N'Intel Core i7-960 ', 6630, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1802, N'C', N'Intel Core i7-3740QM ', 6270, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1803, N'C', N'Intel Core i7-950 ', 6350, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1804, N'C', N'Intel Core i5-3550 ', 6250, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1805, N'C', N'Intel Core i5-4430', 6240, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1806, N'C', N'Intel Core i5-2500 ', 6220, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1807, N'C', N'Intel Core i7-870 ', 6100, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1808, N'C', N'Intel Core i7-940 ', 6100, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1809, N'C', N'Intel Core i5-3470 ', 6090, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1810, N'C', N'Intel Core i7-930 ', 5850, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1811, N'C', N'Intel Core i7-3630QM ', 5750, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1812, N'C', N'Intel Core i5-2310 ', 5730, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1813, N'C', N'Intel Core i5-2300 ', 5600, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1814, N'C', N'Intel Core i7-920 ', 5590, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1815, N'C', N'Intel Core i7-4500U', 5480, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1816, N'C', N'Intel Core i7-3632QM', 5400, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1817, N'C', N'Intel Core i7-3612QM ', 5230, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1818, N'C', N'AMD Phenom II X6 1090T', 5090, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1819, N'C', N'Intel Core i7-2720QM ', 4710, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1820, N'C', N'AMD Phenom II X6 1055T', 4660, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1821, N'C', N'AMD Phenom II X6 1045T ', 4550, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1822, N'C', N'Intel Core i7-2630QM ', 4360, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1823, N'C', N'Intel Core i5-4570', 4270, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1824, N'C', N'Intel Core i5-3350P', 4110, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1825, N'C', N'AMD Phenom II X4 965', 4100, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1826, N'C', N'Intel Core i3-3220', 4030, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1827, N'C', N'AMD Phenom II X4 970', 3980, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1828, N'C', N'AMD Phenom II X4 B55', 3900, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1829, N'C', N'AMD Phenom II X4 955', 3900, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1830, N'C', N'AMD Phenom II X4 B50', 3800, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1831, N'C', N'AMD Phenom II X4  945', 3710, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1832, N'C', N'AMD Phenom II X4 940', 3710, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1833, N'C', N'Intel Core i3-2100 ', 3680, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1834, N'C', N'AMD Phenom II X4 840', 3580, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1835, N'C', N'Intel Core 2 Quad  Q9550', 3570, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1836, N'C', N'Intel Core i7-740QM ', 3450, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1837, N'C', N'Intel Core i7-720QM  ', 3370, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1838, N'C', N'Intel Core 2 Quad  Q9450', 3320, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1839, N'C', N'Intel Core 2 Quad  Q9400', 3320, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1840, N'C', N'AMD Athlon X4 750K', 3290, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1841, N'C', N'Intel Core i5-3230M ', 3200, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1842, N'C', N'Intel Pentium G3220', 3130, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1843, N'C', N'Intel Core 2 Quad  Q8300', 3080, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1844, N'C', N'Intel Core i5  i5-650', 3070, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1845, N'C', N'Intel Core i3-540 ', 3050, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1846, N'C', N'Intel Core i3-530 ', 2920, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1847, N'C', N'Intel Core 2 Quad  Q6600', 2910, 1)
GO
print 'Processed 300 total records'
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1848, N'C', N'AMD Athlon II X4 640', 2900, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1849, N'C', N'AMD Athlon II X4 635', 2840, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1850, N'C', N'Intel Core 2 Quad  Q8200', 2840, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1851, N'C', N'Intel Pentium  G2020', 2830, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1852, N'C', N'Intel Core i5-2450M ', 2720, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1853, N'C', N'AMD Athlon II X4 631', 2650, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1854, N'C', N'AMD Athlon II X4 Quad-Core  620', 2650, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1855, N'C', N'Intel Core i5-2430M ', 2610, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1856, N'C', N'Intel Core i5-2410M ', 2500, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1857, N'C', N'Intel Core i5-3317U ', 2490, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1858, N'C', N'Intel Core 2 Duo  E8500', 2430, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1859, N'C', N'Intel Core i3-2310M ', 2390, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1860, N'C', N'Intel Core 2 Duo  E8400', 2310, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1861, N'C', N'Intel Core 2 Duo  E7400', 2150, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1862, N'C', N'Intel Core i5-3337U ', 1950, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1863, N'C', N'Intel Core 2 Duo  E6750', 1850, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1864, N'C', N'AMD Athlon II X2 250', 1810, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1865, N'C', N'AMD Athlon II X2 245', 1750, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1866, N'C', N'Intel Core i7-3820QM ', 6270, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1867, N'C', N'Intel Core i7-3920XM  Extreme Edition', 6610, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1868, N'C', N'Intel Pentium Dual-Core E5200', 1580, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1869, N'H', N'320GB 5400rpm', 320, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1870, N'H', N'500GB 5400 rpm', 500, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1871, N'H', N'640GB SATA (5400 rpm)', 640, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1872, N'H', N'750 GB SATA', 750, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1873, N'H', N'1TB', 1024, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1874, N'H', N'128GB SSD', 1000, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1875, N'H', N'120GB SSD', 240, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1876, N'H', N'256 GB SSD', 521, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1877, N'H', N'1.5TB', 1536, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1878, N'R', N'2GB DDR3', 2, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1879, N'R', N'4GB DDR3', 4, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1880, N'R', N'6GB', 6, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1881, N'R', N'8GB DDR3', 8, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1882, N'R', N'16GB DDR3', 16, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1884, N'D', N'10.1"', 10.1, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1885, N'D', N'11.6"', 11.6, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1886, N'D', N'12.1"', 12.1, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1887, N'D', N'13.3"', 13.3, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1888, N'D', N'15"', 15, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1889, N'D', N'15.6"', 15.6, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1890, N'D', N'14.0''''', 14, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1891, N'D', N'17.3"', 17.3, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1892, N'H', N'500GB Hard Drive + 24GB SSD', 548, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1893, N'H', N'SSD, 512 GB', 200, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1894, N'D', N'14.0”HD BrightView LED - TouchSmart (Cảm ứng đa điểm )', 14, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1895, N'V', N'Intel Graphics HD 4000', 455, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1896, N'V', N'Intel Graphics HD 3000', 307, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1897, N'V', N'Intel HD Graphics', 300, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1898, N'V', N'NVIDIA GeForce 820M 2GB', 5630, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1899, N'V', N'AMD Radeon HD 8670M 2GB', 5130, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1900, N'V', N'Mobile Intel HD', 409, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1901, N'V', N'Radeon HD 7550M', 940, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1902, N'V', N'Radeon HD 7500G', 840, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1903, N'V', N'1GB AMD Thames XT-M2', 1170, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1904, N'V', N'Radeon HD 7610M', 1000, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1905, N'V', N'NVIDIA GeForce 810M', 1120, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1906, N'V', N'NVIDIA GeForce GT 840M', 1300, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1907, N'V', N'Mobile Intel HM76 Express', 500, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1908, N'C', N'Intel Core i5-4210U', 3604, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1909, N'C', N'Intel Core i3-3217U', 2294, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1910, N'C', N'Intel Core i5-4200U', 3293, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1911, N'C', N'Intel Pentium N3520', 1892, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1912, N'C', N'Intel Pentium B940', 1769, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1913, N'C', N'Intel Core i3-2375M', 2700, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1914, N'C', N'Intel Celeron N2930', 1795, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1916, N'C', N'Intel Core i3-4010U', 2524, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1917, N'C', N'Intel Celeron 1037U ', 1505, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1918, N'C', N'Intel Pentium 2020M', 2310, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1919, N'C', N'Intel Pentium 3556U ', 2100, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1920, N'C', N'Intel Core i7-3537U', 4321, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1921, N'C', N'Intel Core i3-3227U', 2516, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1922, N'C', N'Intel Core i3 M 380', 2122, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1923, N'C', N'AMD A6-4455M APU', 1301, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1924, N'C', N'Intel Pentium B980', 2032, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1925, N'C', N'Intel Core2 Duo P7570', 1456, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1926, N'C', N'Intel Pentium P6200', 1339, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1927, N'C', N'Intel Core i7-4260U', 5000, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1929, N'C', N'Intel Core i7-4700HQ', 7140, 1)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1930, N'V', N'Intel HD 3000', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1931, N'V', N'Tích hợp', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1932, N'C', N'Intel Pentium 3558U Haswell 1.70Ghz (2Mb Cache L3)', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1933, N'D', N'13.3 inches WXGA (1366 x 768)', 13.3, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1934, N'V', N'AMD Mobility Radeon HD 7500G 1GB share', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1935, N'V', N'Integrated Intel® GMA HD', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1936, N'V', N'Integrated Intel® GMA HD', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1937, N'V', N'Integrated Intel® GMA HD', 0, 0)
INSERT [dbo].[Hardware] ([ID], [CodetypeID], [Name], [WeightCriteraPoint], [IsActive]) VALUES (1938, N'C', N'Intel, Core i5 Haswell, 4260U, 1.40 GHz', 0, 0)
SET IDENTITY_INSERT [dbo].[Hardware] OFF
/****** Object:  Table [dbo].[ParseAttribute]    Script Date: 09/03/2014 20:46:15 ******/
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
/****** Object:  Table [dbo].[MostViewProduct]    Script Date: 09/03/2014 20:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MostViewProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ViewTime] [int] NOT NULL,
 CONSTRAINT [PK_MostViewProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MostViewProduct] ON
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (1, 185, 4)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (2, 245, 2)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (3, 242, 7)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (4, 230, 2)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (5, 219, 2)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (6, 214, 3)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (7, 187, 2)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (8, 188, 1)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (9, 189, 4)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (10, 190, 2)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (11, 191, 2)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (12, 228, 6)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (13, 240, 2)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (14, 239, 3)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (15, 243, 3)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (16, 227, 1)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (17, 229, 1)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (18, 252, 1)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (19, 208, 1)
INSERT [dbo].[MostViewProduct] ([ID], [ProductID], [ViewTime]) VALUES (20, 183, 1)
SET IDENTITY_INSERT [dbo].[MostViewProduct] OFF
/****** Object:  Table [dbo].[RecommendProduct]    Script Date: 09/03/2014 20:46:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecommendProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[IsReceive] [bit] NOT NULL,
	[IsMailSent] [bit] NOT NULL,
	[Parselink] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NOT NULL,
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
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (23, N'member1', 1, 0, N'http://www.thegioididong.com/laptop/asus-p550ld-xo216', N'iv250509@gmail.com', 1, 1, CAST(0x0000A08700000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (26, N'member1', 1, 0, N'http://www.lazada.vn/lenovo-g4070-59414340-core-i3-17ghz-14-2gb-den-149555.html', N'iv250509@gmail.com', 1, 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (27, N'member1', 1, 1, N'http://thietbiso.com/san-pham/chi-tiet/6704/asus-p550ldv-xo517d-black.html', N'iv250509@gmail.com', 1, 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (28, N'member1', 1, 0, N'http://www.vienthonga.vn/laptop-asus-p550ld-xo216d-black.html', N'iv250509@gmail.com', 1, 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (31, N'member1', 1, 0, N'http://www.dienmaythienhoa.vn/may-tinh-xach-tay-asus-p550ca-xo998d-m.black.html', N'iv250509@gmail.com', 1, 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (32, N'member1', 1, 0, N'http://www.nguyenkim.com/may-tinh-xach-tay-asus-p550ld-xo330d.html', N'iv250509@gmail.com', 0, 0, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (35, N'member1', 1, 0, N'http://laptopno1.com/chi-tiet-san-pham/1701/asus-p550ldv-xo517d-i5-haswell-4210u-4gb-1tb-vga-nvidia-geforce-gt-820m-2gb.htm', N'iv250509@gmail.com', 1, 1, CAST(0x0000A36100000000 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (36, N'member1', 1, 0, N'http://www.thegioididong.com/laptop/acer-aspire-e1-432-29552g50dn', N'iv250509@gmail.com', 0, 0, CAST(0x0000A36D00CA84ED AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (37, N'member1', 1, 0, N'http://www.thegioididong.com/laptop/acer-aspire-e1-410-001', N'iv250509@gmail.com', 0, 0, CAST(0x0000A36D012C258A AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (38, N'member1', 1, 0, N'http://www.thegioididong.com/laptop/acer-aspire-e1-432-29552g50dn', N'iv250509@gmail.com', 0, 0, CAST(0x0000A36E009F1412 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (39, N'member1', 1, 0, N'http://www.thegioididong.com/laptop/acer-aspire-e1-432-29552g50dn', N'iv250509@gmail.com', 1, 1, CAST(0x0000A36F0001E2DA AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (46, N'staff', 1, 0, N'http://www.thegioididong.com/laptop/acer-aspire-e1-432-29552g50dn', N'iv250509@gmail.com', 0, 0, CAST(0x0000A375013B3528 AS DateTime), 0)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (47, N'staff', 1, 0, N'http://www.thegioididong.com/laptop/acer-aspire-e1-432-29552g50dn', N'iv250509@gmail.com', 0, 0, CAST(0x0000A3750142C05E AS DateTime), 0)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (48, N'member1', 1, 0, N'http://www.thegioididong.com/laptop/dell-inspiron-7537-5424g50g', N'iv250509@gmail.com', 1, 0, CAST(0x0000A37600E76B62 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (49, N'member1', 1, 0, N'http://www.thegioididong.com/laptop/dell-inspiron-7537-5424g50g-vs-hp-pavilion-15-74504g50g-f6c19pa', N'iv250509@gmail.com', 1, 0, CAST(0x0000A37600EA8152 AS DateTime), 1)
INSERT [dbo].[RecommendProduct] ([ID], [Username], [IsReceive], [IsMailSent], [Parselink], [Email], [IsApprove], [IsTrue], [RecommendTime], [IsSeen]) VALUES (51, N'member1', 1, 0, N'http://www.tangthuvien.vn/forum/showthread.php?t=87856', N'iv@yahooo.com.vn', 0, 0, CAST(0x0000A36100000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[RecommendProduct] OFF
/****** Object:  Table [dbo].[RatingProduct]    Script Date: 09/03/2014 20:46:15 ******/
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
SET IDENTITY_INSERT [dbo].[RatingProduct] ON
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (1, 188, N'staff', 18)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (2, 190, N'staff', 16)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (3, 186, N'staff', 14)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (4, 184, N'staff', 15)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (5, 183, N'staff', 18)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (6, 185, N'member1', 18)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (7, 214, N'member1', 15)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (8, 187, N'member1', 14)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (9, 189, N'member1', 18)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (10, 191, N'member1', 7)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (11, 190, N'member1', 7)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (12, 228, N'member1', 16)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (13, 242, N'member1', 20)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (14, 239, N'member1', 20)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (15, 239, N'member1', 19)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (16, 243, N'member1', 20)
INSERT [dbo].[RatingProduct] ([ID], [ProductID], [Username], [Point]) VALUES (17, 228, N'member1', 15)
SET IDENTITY_INSERT [dbo].[RatingProduct] OFF
/****** Object:  Table [dbo].[ProductAttribute]    Script Date: 09/03/2014 20:46:15 ******/
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
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (609, 183, 1841, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (610, 183, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (611, 183, 1873, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (612, 183, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (613, 183, 1737, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (614, 184, 1908, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (615, 184, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (616, 184, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (617, 184, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (618, 184, 1574, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (619, 185, 1909, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (620, 185, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (621, 185, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (622, 185, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (623, 185, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (624, 186, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (625, 186, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (626, 186, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (627, 186, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (628, 186, 1574, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (629, 187, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (630, 187, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (631, 187, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (632, 187, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (633, 187, 1570, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (634, 188, 1862, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (635, 188, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (636, 188, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (637, 188, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (638, 188, 1572, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (639, 189, 1859, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (640, 189, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (641, 189, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (642, 189, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (643, 189, 1896, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (644, 190, 1657, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (645, 190, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (646, 190, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (647, 190, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (648, 190, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (649, 191, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (650, 191, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (651, 191, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (652, 191, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (653, 191, 1898, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (654, 192, 1911, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (655, 192, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (656, 192, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (657, 192, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (658, 192, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (659, 193, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (660, 193, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (661, 193, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (662, 193, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (663, 193, 1574, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (664, 194, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (665, 194, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (666, 194, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (667, 194, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (668, 194, 1574, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (669, 195, 1857, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (670, 195, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (671, 195, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (672, 195, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (673, 195, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (674, 196, 1852, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (675, 196, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (676, 196, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (677, 196, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (678, 196, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (679, 197, 1912, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (680, 197, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (681, 197, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (682, 197, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (683, 197, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (684, 198, 1913, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (685, 198, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (686, 198, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (687, 198, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (688, 198, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (689, 199, 1841, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (690, 199, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (691, 199, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (692, 199, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (693, 199, 1899, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (694, 200, 1909, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (695, 200, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (696, 200, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (697, 200, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (698, 200, 1759, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (699, 201, 1914, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (700, 201, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (701, 201, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (702, 201, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (703, 201, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (704, 202, 1909, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (705, 202, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (706, 202, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (707, 202, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (708, 202, 1895, 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (709, 203, 1841, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (710, 203, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (711, 203, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (712, 203, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (713, 203, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (714, 204, 1916, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (715, 204, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (716, 204, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (717, 204, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (718, 204, 1574, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (719, 205, 1919, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (720, 205, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (721, 205, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (722, 205, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (723, 205, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (724, 206, 1657, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (725, 206, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (726, 206, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (727, 206, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (728, 206, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (729, 207, 1655, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (730, 207, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (731, 207, 1873, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (732, 207, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (733, 207, 1907, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (734, 208, 1917, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (735, 208, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (736, 208, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (737, 208, 1885, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (738, 208, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (739, 209, 1918, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (740, 209, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (741, 209, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (742, 209, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (743, 209, 1896, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (744, 210, 1919, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (745, 210, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (746, 210, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (747, 210, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (748, 210, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (749, 211, 1909, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (750, 211, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (751, 211, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (752, 211, 1885, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (753, 211, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (754, 212, 1920, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (755, 212, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (756, 212, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (757, 212, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (758, 212, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (759, 213, 1852, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (760, 213, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (761, 213, 1872, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (762, 213, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (763, 213, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (764, 214, 1841, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (765, 214, 1880, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (766, 214, 1873, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (767, 214, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (768, 214, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (769, 215, 1921, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (770, 215, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (771, 215, 1892, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (772, 215, 1887, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (773, 215, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (774, 216, 1855, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (775, 216, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (776, 216, 1871, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (777, 216, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (778, 216, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (779, 217, 1852, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (780, 217, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (781, 217, 1871, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (782, 217, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (783, 217, 1901, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (784, 218, 1852, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (785, 218, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (786, 218, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (787, 218, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (788, 218, 1901, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (789, 219, 1922, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (790, 219, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (791, 219, 1869, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (792, 219, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (793, 219, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (794, 220, 1657, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (795, 220, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (796, 220, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (797, 220, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (798, 220, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (799, 221, 1923, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (800, 221, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (801, 221, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (802, 221, 1887, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (803, 221, 1744, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (804, 222, 1924, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (805, 222, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (806, 222, 1869, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (807, 222, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (808, 222, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (809, 223, 1859, 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (810, 223, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (811, 223, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (812, 223, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (813, 223, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (814, 224, 1925, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (815, 224, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (816, 224, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (817, 224, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (818, 224, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (819, 225, 1662, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (820, 225, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (821, 225, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (822, 225, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (823, 225, 1897, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (824, 226, 1913, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (825, 226, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (826, 226, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (827, 226, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (828, 226, 1904, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (829, 227, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (830, 227, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (831, 227, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (832, 227, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (833, 227, 1574, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (834, 228, 1908, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (835, 228, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (836, 228, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (837, 228, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (838, 228, 1574, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (839, 229, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (840, 229, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (841, 229, 1873, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (842, 229, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (843, 229, 1574, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (844, 230, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (845, 230, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (846, 230, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (847, 230, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (848, 230, 1574, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (849, 231, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (850, 231, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (851, 231, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (852, 231, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (853, 231, 1736, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (854, 232, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (855, 232, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (856, 232, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (857, 232, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (858, 232, 1905, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (859, 233, 1909, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (860, 233, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (861, 233, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (862, 233, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (863, 233, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (864, 234, 1912, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (865, 234, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (866, 234, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (867, 234, 1885, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (868, 234, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (869, 235, 1662, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (870, 235, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (871, 235, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (872, 235, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (873, 235, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (874, 236, 1926, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (875, 236, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (876, 236, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (877, 236, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (878, 236, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (879, 237, 1912, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (880, 237, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (881, 237, 1869, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (882, 237, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (883, 237, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (884, 238, 1859, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (885, 238, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (886, 238, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (887, 238, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (888, 238, 1572, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (889, 239, 1929, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (890, 239, 1881, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (891, 239, 1876, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (892, 239, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (893, 239, 1572, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (894, 240, 1929, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (895, 240, 1882, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (896, 240, 1893, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (897, 240, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (898, 240, 1561, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (899, 241, 1927, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (900, 241, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (901, 241, 1876, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (902, 241, 1885, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (903, 241, 1572, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (904, 242, 1664, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (905, 242, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (906, 242, 1872, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (907, 242, 1891, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (908, 242, 1548, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (909, 243, 1798, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (910, 243, 1881, 1)
GO
print 'Processed 300 total records'
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (911, 243, 1872, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (912, 243, 1891, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (913, 243, 1704, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (914, 244, 1642, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (915, 244, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (916, 244, 1872, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (917, 244, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (918, 244, 1561, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (919, 245, 1642, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (920, 245, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (921, 245, 1872, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (922, 245, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (923, 245, 1906, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (924, 246, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (925, 246, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (926, 246, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (927, 246, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (928, 246, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (929, 247, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (930, 247, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (931, 247, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (932, 247, 1889, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (933, 247, 1895, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (934, 248, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (935, 248, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (936, 248, 1873, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (937, 248, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (938, 248, 1574, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (939, 249, 1910, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (940, 249, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (941, 249, 1873, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (942, 249, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (943, 249, 1574, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (944, 250, 1852, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (945, 250, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (946, 250, 1871, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (947, 250, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (948, 250, 1903, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (949, 251, 1852, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (950, 251, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (951, 251, 1871, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (952, 251, 1890, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (953, 251, 1903, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (954, 252, 1859, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (955, 252, 1878, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (956, 252, 1870, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (957, 252, 1886, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (958, 252, 1572, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (964, 254, 1927, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (965, 254, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (966, 254, 1876, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (967, 254, 1887, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (968, 254, 1572, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (969, 255, 1908, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (970, 255, 1879, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (971, 255, 1874, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (972, 255, 1885, 1)
INSERT [dbo].[ProductAttribute] ([ID], [ProductID], [AttributeID], [IsActive]) VALUES (973, 255, 1572, 1)
SET IDENTITY_INSERT [dbo].[ProductAttribute] OFF
/****** Object:  Table [dbo].[Dictionary]    Script Date: 09/03/2014 20:46:15 ******/
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
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1465, 1546, N'AMD Radeon HD 7990', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1466, 1547, N'NVIDIA GeForce GTX 690', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1467, 1548, N'AMD Radeon R9 290X', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1468, 1549, N'AMD Radeon HD 7870 XT', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1469, 1550, N'ATI Radeon HD 5970', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1470, 1551, N'AMD Radeon HD 8970M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1471, 1552, N'AMD Radeon HD 7850', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1472, 1553, N'NVIDIA GeForce GTX 560 Ti 448', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1473, 1554, N'NVIDIA GeForce GTX 650 Ti Boost', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1474, 1555, N'AMD Radeon R7 260X', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1475, 1556, N'AMD FirePro W5000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1476, 1557, N'AMD Radeon HD 7770', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1477, 1558, N'ATI Radeon HD 5850', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1478, 1559, N'AMD Radeon HD 6970M / 6990M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1479, 1560, N'AMD Radeon HD 7660D', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1480, 1561, N'NVIDIA GeForce GT 750M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1481, 1562, N'ATI Mobility Radeon HD 5870', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1482, 1563, N'AMD Radeon HD 6550D', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1483, 1564, N'NVIDIA GeForce GT 640 (GK208)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1484, 1565, N'NVIDIA GeForce GT 640 (GDDR5)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1485, 1566, N'NVIDIA GeForce GT 745M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1486, 1567, N'AMD Radeon R7 250', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1487, 1568, N'AMD Radeon HD 8750M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1488, 1569, N'Intel Iris Pro Graphics 5200 Mobile', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1489, 1570, N'AMD Radeon HD 8670D', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1490, 1571, N'AMD Radeon HD 7690M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1491, 1572, N'Intel HD Graphics 5000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1492, 1573, N'ATI Mobility Radeon HD 5650/5750', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1493, 1574, N'Intel HD Graphics 4400 Mobile', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1494, 1575, N'AMD Radeon HD 7540D', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1495, 1576, N'NVIDIA NVS 4200M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1496, 1577, N'NVIDIA GeForce 605', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1497, 1578, N'AMD Radeon HD 6310', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1498, 1579, N'Intel Core i7-4960X', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1499, 1580, N'Intel Core i7-4930K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1500, 1581, N'Intel Core i7-3970X Extreme Edition ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1501, 1582, N'Intel Core i7-4820K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1502, 1583, N'Intel Core i7-4790 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1503, 1584, N'Intel Core i7-990X ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1504, 1585, N'Intel Core i7-970  ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1505, 1586, N'Intel Core i7-3770K ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1506, 1587, N'Intel Core i7-2700K ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1507, 1588, N'AMD FX-9590', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1508, 1589, N'AMD FX-9370', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1509, 1590, N'Intel Core i7-4900MQ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1510, 1591, N'AMD FX-4350', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1511, 1592, N'Intel Core i5-4690 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1512, 1593, N'AMD FX-8350', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1513, 1594, N'Intel Core i7-4700HQ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1514, 1595, N'AMD FX-6350', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1515, 1596, N'Intel Core i7-4712MQ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1516, 1597, N'AMD FX-4300', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1517, 1598, N'Intel Core i7-3840QM', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1518, 1599, N'AMD FX-4170', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1519, 1600, N'Intel Core i5-3570K ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1520, 1601, N'Intel Core i5-4440', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1521, 1602, N'Intel Core i5-2550K ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1522, 1603, N'AMD FX-6300', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1523, 1604, N'AMD FX-8320', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1524, 1605, N'Intel Core i7-875K  ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1525, 1606, N'Intel Core i7-3720QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1526, 1607, N'AMD FX-4130', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1527, 1608, N'AMD FX-6200', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1528, 1609, N'Intel Core i5-2400 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1529, 1610, N'Intel Core i5-3450 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1530, 1611, N'AMD FX-8300', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1531, 1612, N'Intel Core i5-2320 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1532, 1613, N'Intel Core i7-860 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1533, 1614, N'AMD FX-4100', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1534, 1615, N'AMD FX-8150', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1535, 1616, N'Intel Core i7-3635QM', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1536, 1617, N'Intel Core i7-3940XM', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1537, 1618, N'Intel Core i7-4600U ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1538, 1619, N'Intel Core i7-3610QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1539, 1620, N'AMD FX-6100', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1540, 1621, N'Intel Core i7-3520M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1541, 1622, N'AMD FX-8120', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1542, 1623, N'AMD Phenom II X6 1100T', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1543, 1624, N'Intel Core i7-2760QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1544, 1625, N'AMD Phenom II X6 1075T ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1545, 1626, N'Intel Core i5-760 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1546, 1627, N'Intel Core i7-2670QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1547, 1628, N'Intel Core i5  I5-750', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1548, 1629, N'Intel Core 2 Extreme  QX9650', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1549, 1630, N'Intel Core i3-3240', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1550, 1631, N'AMD Phenom II X4 975', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1551, 1632, N'AMD Phenom(tm) II X4 B60', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1552, 1633, N'Intel Core i5-3330', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1553, 1634, N'AMD A10-6800K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1554, 1635, N'Intel Core i3-2120 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1555, 1636, N'Intel Core 2 Quad  Q9650', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1556, 1637, N'AMD A8-6600K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1557, 1638, N'AMD A6-6400K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1558, 1639, N'AMD Athlon X4 760K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1559, 1640, N'AMD A10-5800K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1560, 1641, N'AMD A10-6700', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1561, 1642, N'Intel Core i5-4200H', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1562, 1643, N'AMD A4-3870K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1563, 1644, N'AMD A8-3850', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1564, 1645, N'AMD A8-5600K', 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1565, 1646, N'Intel Pentium G3420', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1566, 1647, N'AMD A8-6500', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1567, 1648, N'Intel Core 2 Quad  Q8400', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1568, 1649, N'AMD Phenom II X4 960T', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1569, 1650, N'AMD Athlon II X4 641', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1570, 1651, N'AMD A4-5300', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1571, 1652, N'Intel Core i3-550 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1572, 1653, N'Intel Core 2 Quad  Q6700', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1573, 1654, N'AMD Athlon X4 740', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1574, 1655, N'Intel Core i5-3210M ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1575, 1656, N'Intel Core 2 Quad  Q9300', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1576, 1657, N'Intel Core i3-3110M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1577, 1658, N'Intel Pentium  G2030', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1578, 1659, N'AMD Athlon II X4 Quad-Core  630', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1579, 1660, N'AMD Phenom II X3 720', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1580, 1661, N'Intel Core i5-4300U ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1581, 1662, N'Intel Core i3-2350M ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1582, 1663, N'Intel Core 2 Duo  E8600', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1583, 1664, N'AMD A10-5750M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1584, 1665, N'AMD Athlon II X3 450', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1585, 1666, N'Intel Core 2 Duo  E7500', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1586, 1667, N'AMD A10-4600M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1587, 1668, N'AMD Phenom II X2 555 BE', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1588, 1669, N'AMD A8-4500M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1589, 1670, N'Intel Core 2 Duo  E6850', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1590, 1671, N'AMD Athlon II X2 240', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1591, 1672, N'Intel Pentium Dual-Core E5300', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1592, 1673, N'Intel Pentium Dual-Core processor E2200', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1593, 1674, N'AMD Athlon 64 X2  6000+', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1594, 1675, N'NVIDIA GeForce GTX 780 Ti', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1595, 1676, N'NVIDIA GeForce GTX Titan', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1596, 1677, N'NVIDIA GeForce GTX 780', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1597, 1678, N'NVIDIA GeForce GTX 770', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1598, 1679, N'AMD Radeon R9 280X', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1599, 1680, N'NVIDIA GeForce GTX 680', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1600, 1681, N'AMD Radeon HD 7970', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1601, 1682, N'AMD Radeon HD 6990', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1602, 1683, N'NVIDIA GeForce GTX 670', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1603, 1684, N'AMD Radeon HD 7950', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1604, 1685, N'NVIDIA GeForce GTX 660 Ti', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1605, 1686, N'NVIDIA GeForce GTX 760', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1606, 1687, N'AMD Radeon R9 270X', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1607, 1688, N'NVIDIA GeForce GTX 780M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1608, 1689, N'NVIDIA GeForce GTX 660', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1609, 1690, N'NVIDIA GeForce GTX 680M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1610, 1691, N'NVIDIA GeForce GTX 580', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1611, 1692, N'NVIDIA GeForce GTX 570', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1612, 1693, N'NVIDIA GeForce GTX 480', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1613, 1694, N'AMD Radeon HD 6970', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1614, 1695, N'AMD Radeon HD 7790', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1615, 1696, N'AMD Radeon HD 6950', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1616, 1697, N'NVIDIA GeForce GTX 770M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1617, 1698, N'NVIDIA GeForce GTX 470', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1618, 1699, N'NVIDIA GeForce GTX 650 Ti', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1619, 1700, N'NVIDIA GeForce GTX 675MX', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1620, 1701, N'NVIDIA GeForce GTX 670MX', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1621, 1702, N'ATI Radeon HD 5870', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1622, 1703, N'AMD Radeon HD 6870', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1623, 1704, N'NVIDIA GeForce GTX 765M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1624, 1705, N'NVIDIA GeForce GTX 560', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1625, 1706, N'NVIDIA GeForce GTX 460 v2', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1626, 1707, N'NVIDIA GeForce GTX 465', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1627, 1708, N'AMD Radeon HD 6850', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1628, 1709, N'NVIDIA GeForce GTX 460', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1629, 1710, N'NVIDIA GeForce GTX 760M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1630, 1711, N'AMD Radeon HD 6990M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1631, 1712, N'NVIDIA GeForce GTX 580M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1632, 1713, N'NVIDIA GeForce GTX 675M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1633, 1714, N'ATI Radeon HD 5830', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1634, 1715, N'NVIDIA GeForce GTX 560 SE', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1635, 1716, N'AMD Radeon HD 7750', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1636, 1717, N'AMD Radeon HD 6790', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1637, 1718, N'NVIDIA GeForce GTX 460 SE', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1638, 1719, N'NVIDIA GeForce GTX 670M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1639, 1720, N'NVIDIA GeForce GTX 650', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1640, 1721, N'NVIDIA GeForce GTX 570M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1641, 1722, N'AMD Radeon HD 8670', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1642, 1723, N'ATI Radeon HD 5770', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1643, 1724, N'AMD Radeon HD 6770', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1644, 1725, N'NVIDIA GeForce GTX 550 Ti', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1645, 1726, N'NVIDIA GeForce GTX 660M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1646, 1727, N'ATI Radeon HD 5750', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1647, 1728, N'NVIDIA GeForce GT 640 (DDR3)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1648, 1729, N'NVIDIA GeForce GTS 450', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1649, 1730, N'NVIDIA GeForce GTX 560M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1650, 1731, N'NVIDIA GeForce GTX 460M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1651, 1732, N'AMD Radeon HD 6750', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1652, 1733, N'ATI Mobility Radeon HD 5850', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1653, 1734, N'AMD Radeon HD 6670', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1654, 1735, N'AMD Radeon HD 8570', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1655, 1736, N'NVIDIA GeForce GT 740M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1656, 1737, N'NVIDIA GeForce GT 730M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1657, 1738, N'NVIDIA GeForce GT 640M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1658, 1739, N'NVIDIA GeForce GT 630 (GK208)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1659, 1740, N'NVIDIA GeForce GT 735M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1660, 1741, N'AMD Radeon HD 6850M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1661, 1742, N'AMD Radeon HD 8570D', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1662, 1743, N'NVIDIA GeForce GT 640M LE', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1663, 1744, N'AMD Radeon HD 7560D', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1664, 1745, N'ATI Radeon HD 5670', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1665, 1746, N'AMD Radeon HD 6570', 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1666, 1747, N'NVIDIA GeForce GT 555M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1667, 1748, N'AMD Radeon HD 6770M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1668, 1749, N'AMD Radeon HD 8570M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1669, 1750, N'AMD Radeon HD 7570', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1670, 1751, N'NVIDIA GeForce GT 440', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1671, 1752, N'AMD Radeon HD 7670M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1672, 1753, N'NVIDIA GeForce GT 630', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1673, 1754, N'ATI Mobility Radeon HD 5730', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1674, 1755, N'NVIDIA GeForce 710M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1675, 1756, N'ATI Radeon HD 5570', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1676, 1757, N'NVIDIA GeForce GT 635M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1677, 1758, N'Intel Iris Graphics 5100 Mobile', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1678, 1759, N'NVIDIA GeForce GT 720M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1679, 1760, N'AMD Radeon HD 6650M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1680, 1761, N'Intel HD Graphics 4200 Mobile', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1681, 1762, N'NVIDIA GeForce GT 630M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1682, 1763, N'NVIDIA GeForce GT 540M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1683, 1764, N'NVIDIA GeForce GT 430', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1684, 1765, N'NVIDIA GeForce GT 530', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1685, 1766, N'NVIDIA GeForce GT 620M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1686, 1767, N'ATI Radeon HD 5550', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1687, 1768, N'AMD Radeon HD 7650M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1688, 1769, N'NVIDIA GeForce GT 525M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1689, 1770, N'AMD Radeon HD 7570M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1690, 1771, N'AMD Radeon HD 8470D', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1691, 1772, N'NVIDIA GeForce GT 620', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1692, 1773, N'NVIDIA GeForce GT 520MX', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1693, 1774, N'AMD Radeon HD 7470', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1694, 1775, N'NVIDIA GeForce GT 610', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1695, 1776, N'NVIDIA GeForce GT 520', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1696, 1777, N'NVIDIA GeForce 610M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1697, 1778, N'AMD Radeon HD 7470M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1698, 1779, N'NVIDIA GeForce GT 520M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1699, 1780, N'AMD Radeon HD 6450', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1700, 1781, N'ATI Mobility Radeon HD 5450', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1701, 1782, N'AMD Radeon HD 6370M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1702, 1783, N'ATI Radeon HD 5450', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1703, 1784, N'Intel Core i7-3930K ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1704, 1785, N'Intel Core i7-3820 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1705, 1786, N'Intel Core i7-4770K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1706, 1787, N'Intel Core i7-4771', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1707, 1788, N'Intel Core i7-4770', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1708, 1789, N'Intel Core i7-980X ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1709, 1790, N'Intel Core i7-4770S', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1710, 1791, N'Intel Core i7-2600 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1711, 1792, N'Intel Core i7-2600K ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1712, 1793, N'Intel Core i7-4930MX', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1713, 1794, N'Intel Core i7-4800MQ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1714, 1795, N'Intel Core i7-975  Extreme Edition', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1715, 1796, N'Intel Core i5-4670K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1716, 1797, N'Intel Core i5-4670', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1717, 1798, N'Intel Core i7-4700MQ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1718, 1799, N'Intel Core i7-4702HQ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1719, 1800, N'Intel Core i7-4702MQ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1720, 1801, N'Intel Core i7-960 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1721, 1802, N'Intel Core i7-3740QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1722, 1803, N'Intel Core i7-950 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1723, 1804, N'Intel Core i5-3550 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1724, 1805, N'Intel Core i5-4430', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1725, 1806, N'Intel Core i5-2500 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1726, 1807, N'Intel Core i7-870 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1727, 1808, N'Intel Core i7-940 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1728, 1809, N'Intel Core i5-3470 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1729, 1810, N'Intel Core i7-930 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1730, 1811, N'Intel Core i7-3630QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1731, 1812, N'Intel Core i5-2310 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1732, 1813, N'Intel Core i5-2300 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1733, 1814, N'Intel Core i7-920 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1734, 1815, N'Intel Core i7-4500U', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1735, 1816, N'Intel Core i7-3632QM', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1736, 1817, N'Intel Core i7-3612QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1737, 1818, N'AMD Phenom II X6 1090T', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1738, 1819, N'Intel Core i7-2720QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1739, 1820, N'AMD Phenom II X6 1055T', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1740, 1821, N'AMD Phenom II X6 1045T ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1741, 1822, N'Intel Core i7-2630QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1742, 1823, N'Intel Core i5-4570', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1743, 1824, N'Intel Core i5-3350P', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1744, 1825, N'AMD Phenom II X4 965', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1745, 1826, N'Intel Core i3-3220', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1746, 1827, N'AMD Phenom II X4 970', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1747, 1828, N'AMD Phenom II X4 B55', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1748, 1829, N'AMD Phenom II X4 955', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1749, 1830, N'AMD Phenom II X4 B50', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1750, 1831, N'AMD Phenom II X4  945', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1751, 1832, N'AMD Phenom II X4 940', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1752, 1833, N'Intel Core i3-2100 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1753, 1834, N'AMD Phenom II X4 840', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1754, 1835, N'Intel Core 2 Quad  Q9550', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1755, 1836, N'Intel Core i7-740QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1756, 1837, N'Intel Core i7-720QM  ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1757, 1838, N'Intel Core 2 Quad  Q9450', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1758, 1839, N'Intel Core 2 Quad  Q9400', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1759, 1840, N'AMD Athlon X4 750K', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1760, 1841, N'Intel Core i5-3230M ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1761, 1842, N'Intel Pentium G3220', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1762, 1843, N'Intel Core 2 Quad  Q8300', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1763, 1844, N'Intel Core i5  i5-650', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1764, 1845, N'Intel Core i3-540 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1765, 1846, N'Intel Core i3-530 ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1766, 1847, N'Intel Core 2 Quad  Q6600', 1)
GO
print 'Processed 300 total records'
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1767, 1848, N'AMD Athlon II X4 640', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1768, 1849, N'AMD Athlon II X4 635', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1769, 1850, N'Intel Core 2 Quad  Q8200', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1770, 1851, N'Intel Pentium  G2020', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1771, 1852, N'Intel Core i5-2450M ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1772, 1853, N'AMD Athlon II X4 631', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1773, 1854, N'AMD Athlon II X4 Quad-Core  620', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1774, 1855, N'Intel Core i5-2430M ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1775, 1856, N'Intel Core i5-2410M ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1776, 1857, N'Intel Core i5-3317U ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1777, 1858, N'Intel Core 2 Duo  E8500', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1778, 1859, N'Intel Core i3-2310M ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1779, 1860, N'Intel Core 2 Duo  E8400', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1780, 1861, N'Intel Core 2 Duo  E7400', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1781, 1862, N'Intel Core i5-3337U ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1782, 1863, N'Intel Core 2 Duo  E6750', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1783, 1864, N'AMD Athlon II X2 250', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1784, 1865, N'AMD Athlon II X2 245', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1785, 1866, N'Intel Core i7-3820QM ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1786, 1867, N'Intel Core i7-3920XM  Extreme Edition', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1787, 1868, N'Intel Pentium Dual-Core E5200', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1788, 1869, N'320G', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1789, 1869, N'320GB 5400rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1790, 1870, N'500GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1791, 1870, N'500GB 5400 rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1792, 1870, N'500GB Sata', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1793, 1870, N'500GB Hard Drive', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1794, 1870, N'500GB SATA 5400 rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1795, 1870, N'500GB (5400rpm)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1796, 1871, N'640GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1797, 1871, N'640GB SATA Hard Drive (5400RPM)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1798, 1871, N'640GB SATA (5400 rpm)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1799, 1872, N'750 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1800, 1872, N'Ổ cứng: 750 GB SATA', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1801, 1872, N'750 GB SATA', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1802, 1872, N'750GB Hybrid HDD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1803, 1873, N' 1TB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1804, 1873, N' 1TB HDD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1805, 1873, N'1TB ( 1000GB )', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1806, 1873, N'1000GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1807, 1874, N'128GB SSD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1808, 1874, N'SSD 128GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1809, 1875, N'120GB SSD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1810, 1876, N'256 GB SSD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1811, 1877, N'1.5TB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1812, 1878, N'2GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1813, 1878, N'2GB DDR3', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1814, 1878, N'2GB DDR3 1066Mhz (PC3-8500)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1815, 1878, N'2GB DDR3, 1333MHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1816, 1878, N'2 GB DDR3 Bus 1600Mhz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1817, 1878, N'DDR3L (2 khe RAM), 2 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1818, 1878, N'DDR3 (on board), 2 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1819, 1879, N'4GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1820, 1879, N'4GB DDR3 1333MHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1821, 1879, N'4GB DDR3 1600 MHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1822, 1879, N'4 GB DDR3L 1600 MHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1823, 1879, N'4 GB DDR3L', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1824, 1880, N'6GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1825, 1881, N'8GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1826, 1881, N'8GB DDR3L Bus 1600 Mhz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1827, 1881, N'8GB DDR3L', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1828, 1881, N'8GB DDR3', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1829, 1882, N'16GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1830, 1882, N'16GB DDR3', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1831, 1882, N'16GB DDR3L', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1832, 1884, N'10.1"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1833, 1884, N'10.1 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1834, 1885, N'11.6"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1835, 1885, N'11.6 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1836, 1886, N'12.1"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1837, 1886, N'12.1"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1838, 1887, N'13.3"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1839, 1887, N'13.3 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1840, 1887, N'13.3 inch (Full HD: 1920 x 1080)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1841, 1888, N'15"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1842, 1888, N'15" LED, HD (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1843, 1889, N'15.6"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1844, 1889, N'LED, 15.6"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1845, 1889, N'15.6 inch Full HD (1920 x 1080) Led backlit display, Anti Glare', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1846, 1889, N'15.6 inches', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1847, 1889, N'15.6 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1848, 1890, N'14.0''''', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1849, 1890, N' LED, 14.0"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1850, 1890, N'14"LEDBacklight', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1851, 1890, N'14 " LED', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1852, 1890, N'14.0" HD LED GLARE HDMI', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1853, 1890, N'14 inch HD (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1854, 1890, N'14.0 HD 200 CSV LD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1855, 1890, N'14.0 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1856, 1890, N'14.0-inch LED-backlit Display (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1857, 1891, N'17.3"', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1858, 1891, N'17.3" FHD LED-backlit TFT LCD Display (1920x1080 / 16:9) , AntiGlare', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1859, 1891, N'17.3 inch', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1861, 1869, N'320 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1862, 1869, N'320.00GB SATA', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1865, 1870, N'500GB SATA 5400rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1866, 1870, N'500GB 5400rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1867, 1870, N'500 GB SATA 5400 rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1869, 1870, N'500 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1870, 1870, N'500GB HDD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1871, 1870, N'500GB -5400rpm', 1)
GO
print 'Processed 400 total records'
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1872, 1870, N'500Gb, 5400rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1873, 1870, N'500GB HDD-7200rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1874, 1870, N'500GB SATA,5400rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1875, 1870, N'500GB 5400RPM SATA', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1876, 1870, N'Serial ATA (SATA) 500GB - 5400 rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1877, 1870, N'500GB SATA HDD (5400rpm)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1878, 1892, N'500GB Hard Drive + 24GB SSD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1879, 1892, N'500GB SATA 5400rpm , 24GB SSD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1880, 1892, N'500GB Hard Drive + 8GB SSD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1881, 1871, N'640GB 5400prm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1883, 1872, N'750GB 5400 rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1884, 1872, N' 750B 7200rpm HDD ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1885, 1873, N'1TB SATA', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1886, 1873, N'1TB (5400rpm)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1887, 1873, N'Hybrid 1 TB + NAND Flash Memory for cache 16 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1888, 1873, N'1TB 5400 rpm', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1889, 1873, N'1TB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1890, 1874, N'SSD, 128 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1892, 1876, N'SSD, 256 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1893, 1893, N'SSD, 512 GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1894, 1893, N'512 GB SDD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1895, 1893, N'512GB SDD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1896, 1889, N'15.6" HD (1366 x 768 pixels)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1897, 1889, N'15.6" HD LED', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1898, 1889, N'15.6" LED (1366x768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1899, 1889, N'15.6 inch, HD WLED TrueLife', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1900, 1889, N'15.6 inch WXGA (1366x768) LED', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1901, 1889, N'15.6 " HD LED', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1903, 1889, N'15.6" HD, LED-backlit (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1904, 1889, N'15.6 inch (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1905, 1889, N'15.6" LED HD (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1906, 1889, N'15.6" LED backlight 1366 x 768 / HD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1907, 1889, N'15" LED, HD (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1908, 1889, N'15.6 inch HD (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1909, 1889, N'15.6" LED LCD wide', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1910, 1889, N'15.5-Inch Screen LED-backlit display', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1911, 1889, N'15.6 HD 200 CSV LD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1913, 1889, N'15.6" WXGA HD Clear SuperView LED Backlight TFT display (16:9),1366 x 768', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1914, 1889, N'15.4 inch, Retina (2880 x 1800 pixels)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1915, 1889, N'15.4 inch, Retina (2880 x 1800 pixels)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1916, 1889, N'15.6 inch Full HD (1920 x 1080) Led backlit display, Anti Glare', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1917, 1890, N'14.0" LED HD (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1918, 1890, N'14" LED Backlight', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1919, 1890, N'14.0 inch HD (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1920, 1890, N'14.0" LED, HD (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1921, 1890, N'14" HD Led (1366x768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1922, 1890, N'14" HD LED 1366 x 768', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1923, 1890, N'14.0" Diagonal High-Definition HP BrightView LED Display (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1924, 1894, N'14.0”HD BrightView LED - TouchSmart (Cảm ứng đa điểm )', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1925, 1890, N'14.0 inch backlit HD display (16:9 widescreen) (1366x768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1926, 1879, N'4GB DDR3', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1927, 1879, N'4GB DDR3 Bus 1600Mhz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1928, 1879, N'4GB DDR3L-1600Mhz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1929, 1879, N'4GB DDR3/1600MHz SDRAM', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1930, 1879, N'4GB DDR3 1600Mhz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1931, 1572, N'Intel HD Graphics 5000, Share', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1932, 1572, N'Intel HD Graphics 5000, Share 1664MB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1933, 1574, N'Intel HD Graphics 4400', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1934, 1895, N'Intel Graphics HD 4000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1935, 1896, N'Intel HD Graphics 3000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1936, 1895, N'Intel Graphic HD4000 upto 1649MB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1937, 1897, N'Intel HD Graphics', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1938, 1897, N'Intel(R) HD Graphics', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1939, 1897, N'Tích Hợp', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1940, 1895, N'Intel HD Gracphics 4000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1941, 1737, N'Nvidia Geforce GT 730M 2GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1942, 1898, N'NVIDIA GeForce 820M 2GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1943, 1898, N'GeForce 820M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1944, 1899, N'AMD Radeon HD 8670M 2GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1945, 1759, N'NVIDIA GeForce GT 720M -1GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1946, 1900, N'Mobile Intel HD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1947, 1900, N'Mobile Intel HM76 Express', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1948, 1901, N'Radeon HD 7550M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1949, 1901, N'AMD HD 7550M (512MB)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1950, 1902, N'Radeon HD 7500G', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1951, 1903, N'1GB AMD Thames XT-M2', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1952, 1904, N'Radeon HD 7610M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1953, 1904, N'AMD Thames LE-M2', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1954, 1905, N'NVIDIA GeForce 810M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1955, 1906, N'NVIDIA GeForce GT 840M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1956, 1907, N'Mobile Intel HM76 Express', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1957, 1908, N'Intel Core i5-4210U', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1958, 1909, N'Intel Core i3-3217U', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1959, 1910, N'Intel Core i5-4200U', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1960, 1911, N'Intel Pentium N3520', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1961, 1912, N'Intel Pentium B940', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1962, 1913, N'Intel Core i3-2375M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1963, 1914, N'Intel Celeron N2930', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1966, 1916, N'Intel Core i3-4010U', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1967, 1917, N'Intel Celeron 1037U ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1968, 1918, N'Intel Pentium 2020M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1969, 1919, N'Intel Pentium 3556U ', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1970, 1920, N'Intel Core i7-3537U', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1971, 1921, N'Intel Core i3-3227U', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1972, 1922, N'Intel Core i3 M 380', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1974, 1923, N'AMD A6-4455M APU', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1976, 1924, N'Intel Pentium B980', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1978, 1925, N'Intel Core2 Duo P7570', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1979, 1926, N'Intel Pentium P6200', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1980, 1927, N'Intel Core i7-4260U', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1982, 1929, N'Intel Core i7-4700HQ', 1)
GO
print 'Processed 500 total records'
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1983, 1930, N'Intel HD 3000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1984, 1931, N'Tích hợp', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1985, 1932, N'Intel Pentium 3558U Haswell 1.70Ghz (2Mb Cache L3)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1986, 1933, N'13.3 inches WXGA (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1987, 1934, N'AMD Mobility Radeon HD 7500G 1GB share', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1988, 1935, N'Integrated Intel® GMA HD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1989, 1936, N'Integrated Intel® GMA HD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1990, 1937, N'Integrated Intel® GMA HD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1991, 1938, N'Intel, Core i5 Haswell, 4260U, 1.40 GHz', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1992, 1570, N'AMD Radeon HD 8670M 1GB', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1993, 1572, N'Intel HD Graphics 4000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1994, 1572, N'Intel Graphics HD 3000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1995, 1642, N'Intel Core i5-4200M', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1996, 1896, N'Intel HD 3000', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1997, 1895, N'Tích hợp', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1998, 1887, N'13.3 inches WXGA (1366 x 768)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (1999, 1919, N'Intel Pentium 3558U Haswell 1.70Ghz (2Mb Cache L3)', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (2000, 1744, N'AMD Mobility Radeon HD 7500G 1GB share', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (2001, 1895, N'Integrated Intel® GMA HD', 1)
INSERT [dbo].[Dictionary] ([ID], [AttributeDicID], [Name], [IsActive]) VALUES (2002, 1908, N'Intel, Core i5 Haswell, 4260U, 1.40 GHz', 1)
SET IDENTITY_INSERT [dbo].[Dictionary] OFF
/****** Object:  Table [dbo].[History]    Script Date: 09/03/2014 20:46:15 ******/
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
INSERT [dbo].[History] ([ID], [Username], [CompareTime]) VALUES (4, N'member1', CAST(0x0000A38100000000 AS DateTime))
INSERT [dbo].[History] ([ID], [Username], [CompareTime]) VALUES (5, N'member1', CAST(0x0000A39900000000 AS DateTime))
INSERT [dbo].[History] ([ID], [Username], [CompareTime]) VALUES (6, N'member1', CAST(0x0000A39B00000000 AS DateTime))
INSERT [dbo].[History] ([ID], [Username], [CompareTime]) VALUES (7, N'member1', CAST(0x0000A39B0154B4A2 AS DateTime))
SET IDENTITY_INSERT [dbo].[History] OFF
/****** Object:  Table [dbo].[HistoryDetail]    Script Date: 09/03/2014 20:46:15 ******/
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
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (10, 2, 188, 0)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (11, 2, 189, 1)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (12, 2, 190, 0)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (13, 3, 190, 0)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (14, 3, 188, 0)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (15, 3, 189, 1)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (16, 4, 200, 0)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (17, 4, 188, 1)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (18, 5, 200, 0)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (19, 5, 201, 1)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (20, 6, 208, 0)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (21, 6, 219, 1)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (22, 6, 222, 0)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (23, 7, 208, 0)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (24, 7, 219, 1)
INSERT [dbo].[HistoryDetail] ([ID], [HistoryID], [ProductID], [isWinner]) VALUES (25, 7, 222, 0)
SET IDENTITY_INSERT [dbo].[HistoryDetail] OFF
/****** Object:  Default [DF_ProductAlias_IsMain]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[AliasProduct] ADD  CONSTRAINT [DF_ProductAlias_IsMain]  DEFAULT ((0)) FOR [IsMain]
GO
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
/****** Object:  ForeignKey [FK_AliasProduct_Brand]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[AliasProduct]  WITH CHECK ADD  CONSTRAINT [FK_AliasProduct_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([ID])
GO
ALTER TABLE [dbo].[AliasProduct] CHECK CONSTRAINT [FK_AliasProduct_Brand]
GO
/****** Object:  ForeignKey [FK_AliasProduct_Product]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[AliasProduct]  WITH CHECK ADD  CONSTRAINT [FK_AliasProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AliasProduct] CHECK CONSTRAINT [FK_AliasProduct_Product]
GO
/****** Object:  ForeignKey [FK_AliasProduct_Store]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[AliasProduct]  WITH CHECK ADD  CONSTRAINT [FK_AliasProduct_Store] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([ID])
GO
ALTER TABLE [dbo].[AliasProduct] CHECK CONSTRAINT [FK_AliasProduct_Store]
GO
/****** Object:  ForeignKey [FK_AttributeMapping_AttributeDictionary]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[Dictionary]  WITH CHECK ADD  CONSTRAINT [FK_AttributeMapping_AttributeDictionary] FOREIGN KEY([AttributeDicID])
REFERENCES [dbo].[Hardware] ([ID])
GO
ALTER TABLE [dbo].[Dictionary] CHECK CONSTRAINT [FK_AttributeMapping_AttributeDictionary]
GO
/****** Object:  ForeignKey [FK_Hardware_Codetype]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[Hardware]  WITH CHECK ADD  CONSTRAINT [FK_Hardware_Codetype] FOREIGN KEY([CodetypeID])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[Hardware] CHECK CONSTRAINT [FK_Hardware_Codetype]
GO
/****** Object:  ForeignKey [FK_History_Account]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Account]
GO
/****** Object:  ForeignKey [FK_HistoryDetail_History]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_History] FOREIGN KEY([HistoryID])
REFERENCES [dbo].[History] ([ID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_History]
GO
/****** Object:  ForeignKey [FK_HistoryDetail_Product]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_HistoryDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK_HistoryDetail_Product]
GO
/****** Object:  ForeignKey [FK_MostViewProduct_Product]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[MostViewProduct]  WITH CHECK ADD  CONSTRAINT [FK_MostViewProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[MostViewProduct] CHECK CONSTRAINT [FK_MostViewProduct_Product]
GO
/****** Object:  ForeignKey [FK_ParseAttribute_Codetype]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[ParseAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ParseAttribute_Codetype] FOREIGN KEY([CodetypeID])
REFERENCES [dbo].[Codetype] ([ID])
GO
ALTER TABLE [dbo].[ParseAttribute] CHECK CONSTRAINT [FK_ParseAttribute_Codetype]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_AttributeDictionary]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_AttributeDictionary] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Hardware] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_AttributeDictionary]
GO
/****** Object:  ForeignKey [FK_ProductAttribute_Product]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_Product]
GO
/****** Object:  ForeignKey [FK_RatingProduct_Account]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[RatingProduct]  WITH CHECK ADD  CONSTRAINT [FK_RatingProduct_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RatingProduct] CHECK CONSTRAINT [FK_RatingProduct_Account]
GO
/****** Object:  ForeignKey [FK_RatingProduct_Product]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[RatingProduct]  WITH CHECK ADD  CONSTRAINT [FK_RatingProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[RatingProduct] CHECK CONSTRAINT [FK_RatingProduct_Product]
GO
/****** Object:  ForeignKey [FK_RecommendProduct_Account]    Script Date: 09/03/2014 20:46:15 ******/
ALTER TABLE [dbo].[RecommendProduct]  WITH CHECK ADD  CONSTRAINT [FK_RecommendProduct_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[RecommendProduct] CHECK CONSTRAINT [FK_RecommendProduct_Account]
GO
