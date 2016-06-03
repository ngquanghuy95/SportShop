USE [dbSportShop]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 6/3/2016 23:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/3/2016 23:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chitiethoadon]    Script Date: 6/3/2016 23:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chitiethoadon](
	[HoadonID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Soluong] [int] NOT NULL,
	[Giagoc] [real] NOT NULL,
	[Giadaban] [real] NOT NULL,
 CONSTRAINT [PK_Chitiethoadon] PRIMARY KEY CLUSTERED 
(
	[HoadonID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Color]    Script Date: 6/3/2016 23:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hoadon]    Script Date: 6/3/2016 23:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoadon](
	[HoadonID] [int] IDENTITY(1,1) NOT NULL,
	[Ngaythang] [datetime] NOT NULL,
	[KhachhangID] [int] NULL,
 CONSTRAINT [PK_Hoadon] PRIMARY KEY CLUSTERED 
(
	[HoadonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Image]    Script Date: 6/3/2016 23:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL CONSTRAINT [DF_Image_ProductID]  DEFAULT ((1)),
	[LinkImage] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khachhang]    Script Date: 6/3/2016 23:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khachhang](
	[KhachhangID] [int] IDENTITY(1,1) NOT NULL,
	[Tenkhachhang] [nvarchar](50) NOT NULL,
	[Sodienthoai] [nvarchar](150) NOT NULL,
	[Sotiendagiaodich] [real] NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Diachi] [nvarchar](100) NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[KhachhangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/3/2016 23:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[TypeID] [int] NOT NULL CONSTRAINT [DF_Product_TypeID]  DEFAULT ((1)),
	[CategoryID] [int] NOT NULL CONSTRAINT [DF_Product_CategoryID]  DEFAULT ((1)),
	[BrandID] [int] NOT NULL CONSTRAINT [DF_Product_BrandID]  DEFAULT ((1)),
	[ColorID] [int] NOT NULL CONSTRAINT [DF_Product_ColorID]  DEFAULT ((1)),
	[SaleID] [int] NOT NULL CONSTRAINT [DF_Product_SaleID]  DEFAULT ((1)),
	[SizeID] [int] NOT NULL CONSTRAINT [DF_Product_SizeID]  DEFAULT ((1)),
	[Price] [real] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsNew] [bit] NULL,
	[Rating] [int] NULL,
	[Avatar] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sale]    Script Date: 6/3/2016 23:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[SaleNum] [int] NULL,
	[Date] [datetime] NULL,
	[SaleName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShoeType]    Script Date: 6/3/2016 23:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoeType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Size]    Script Date: 6/3/2016 23:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeNum] [real] NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 6/3/2016 23:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Birthday] [datetime] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (1, N'Không xác định')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (2, N'Adidas Originals')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (3, N'Adidas NEO')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (4, N'Adidas Stella McCartney')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (5, N'Adidas Porsche Design Sport')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (6, N'Nike')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (7, N'Nike Jordan')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (8, N'Nike Hurley')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Không xác định')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Nam')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Nữ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Trẻ em')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (1, N'Không xác định')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (2, N'Xanh lá')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (3, N'Đỏ')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (4, N'Tím')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (5, N'Vàng')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (6, N'Cam')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (7, N'Xanh dương')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (8, N'Xám')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (9, N'Đen')
INSERT [dbo].[Color] ([ColorID], [ColorName]) VALUES (10, N'Trắng')
SET IDENTITY_INSERT [dbo].[Color] OFF
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([ImageID], [ProductID], [LinkImage]) VALUES (1, 7, N'/Images/product/s2.1.jpg')
INSERT [dbo].[Image] ([ImageID], [ProductID], [LinkImage]) VALUES (4, 7, N'/Images/product/s2.2.jpg')
INSERT [dbo].[Image] ([ImageID], [ProductID], [LinkImage]) VALUES (5, 7, N'/Images/product/s2_3.jpg')
INSERT [dbo].[Image] ([ImageID], [ProductID], [LinkImage]) VALUES (6, 8, N'/Images/product/s3_1.jpg')
INSERT [dbo].[Image] ([ImageID], [ProductID], [LinkImage]) VALUES (7, 8, N'/Images/product/s3.2.jpg')
INSERT [dbo].[Image] ([ImageID], [ProductID], [LinkImage]) VALUES (8, 8, N'/Images/product/s3.3.jpg')
SET IDENTITY_INSERT [dbo].[Image] OFF
SET IDENTITY_INSERT [dbo].[Khachhang] ON 

INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Sodienthoai], [Sotiendagiaodich], [Email], [Password], [Diachi]) VALUES (1, N'DungHT', N'01643456789', 0, N'dzunght95@gmail.com', N'123', N'hn')
INSERT [dbo].[Khachhang] ([KhachhangID], [Tenkhachhang], [Sodienthoai], [Sotiendagiaodich], [Email], [Password], [Diachi]) VALUES (2, N'Huy', N'00111', NULL, N'ace@gmail.com', N'123', N'saâ')
SET IDENTITY_INSERT [dbo].[Khachhang] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (7, N'Jordan Ultra.Fly ', 5, 2, 7, 3, 1, 2, 2500, N'The Jordan Ultra.Fly Men’s Basketball Shoe is designed with strategically placed Kurim © material that feels like a second skin, giving you lightweight flexibility and lasting support. Nike Zoom Air provides low-profile, responsive cushioning ideal for dynamic playmakers.', 1, NULL, N'/Images/images/s2_1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (8, N'Jordan Melo M12', 5, 2, 7, 9, 1, 2, 2700, N'The Jordan Melo M12 Men''s Basketball Shoe reflects the evolution of Melo''s game by optimizing lightweight stability and support. It harnesses the energy return of FlightSpeed technology to maximize responsiveness, while the dynamic engineered mesh and leather upper delivers total lockdown.', 1, NULL, N'/images/product/s3.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (9, N'Jordan CP3.IX AE', 5, 2, 7, 9, 1, 2, 2300, N'The Jordan CP3.IX AE Men''s Basketball Shoe features a Nike Zoom Air unit for low-profile, responsive cushioning, and a lightweight mesh upper for unparalleled breathability and comfort. ', 1, NULL, N'/images/product/s4.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (10, N'Jordan Reveal', 2, 2, 7, 8, 1, 2, 2300, N'The Jordan Reveal Men''s Shoe features a breathable mesh upper, leather trim and low-profile Air-Sole cushioning for lasting comfort a streamlined look.', 1, NULL, N'/images/product/s5.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (11, N'Air Jordan 1 Retro High OG', 2, 2, 7, 6, 1, 2, 3200, N'The Air Jordan 1 Retro High OG Men''s Shoe is updated with signature hoops detail while maintaining the same plush feel and lightweight fit that made the original famous.', 0, NULL, N'/images/product/s6.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (12, N'Jordan Flow ', 2, 2, 7, 10, 1, 2, 2600, N'The Jordan Flow Men''s Shoe provides everyday comfort with a classic look. Perforations and a textile toe box allow for breathability, while low-profile Nike Air Zoom gives you resilient cushioning.', 0, NULL, N'/images/product/s7.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (13, N'Jordan Trainer ST', 7, 2, 7, 8, 1, 2, 1800, N'The Jordan Trainer ST Men''s Shoe optimizes cushioning and natural motion with a Flight Flex midsole pattern that gives you a flexibility in all directions. Dual-density cushioning creates lightweight impact protection and support.', 0, NULL, N'/images/product/s8.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (14, N'Jordan Flight Flex Trainer 2 ', 4, 2, 7, 10, 2, 2, 2200, N'The Jordan Flight Flex Trainer 2 Men''s Training Shoe features a Hyperfuse construction and flexible midsole design for a streamlined, breathable fit and natural range of motion.', 1, NULL, N'/images/product/s9.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (15, N'Jordan 5 AM', 4, 2, 7, 3, 2, 2, 2000, N'The Jordan 5 AM Men''s Training Shoe is built for versatility with a leather upper, Max Air cushioning and a flexible outsole for support, impact protection and great range of motion, no matter what your workout brings.', 1, NULL, N'/images/product/s10.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (16, N'Jordan 4 Retro Metal ', 8, 2, 7, 9, 2, 2, 2700, N'The Jordan 4 Retro Metal Men''s Baseball Cleat is designed with full-bootie construction and nine strategically placed cleats for a fit that hugs the foot and excellent traction on the diamond.', 1, NULL, N'/images/product/s11.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (17, N'Jordan IV Retro MCS ', 8, 2, 7, 10, 1, 2, 2000, N'The Jordan IV Retro MCS Men''s Baseball Cleat is designed with a full-bootie construction and TPU overlays for a supportive fit that hugs the foot, giving you stability and comfort during play. Twelve strategically placed cleats provide incredible traction for quick starts, stops and changes of direction.', 1, NULL, N'/images/product/s12.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (18, N'Air Jordan 9 Retro ', 7, 2, 7, 9, 1, 2, 4500, N'The Air Jordan 9 Retro Men''s Golf Shoe combines the iconic hoops profile with modern technology designed for stability and cushioning on the course.', 1, NULL, N'/images/product/s13.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (19, N'Hurley Phantom Free Elite', 1, 2, 8, 9, 2, 1, 1600, N'The Hurley Phantom Free Elite Men''s Sandal features an ergonomic footbed that mimics your foot''s natural movement for premium comfort and everyday wear.', 1, NULL, N'/images/product/s14.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (20, N'Hurley Phantom Free Slide', 1, 2, 8, 3, 1, 2, 1200, N'The Hurley Phantom Free Slide Men''s Sandal features a perforated slide strap for breathability and easy on-and-off.', 1, NULL, N'/images/product/s15.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (21, N'Hurley Phantom Free', 1, 2, 8, 7, 1, 2, 1200, N'Hexagonal grooves are hot-knife cut into the outsole, wrapping the sidewall to enable more natural motion. Secondary hexagonal and horizontal cuts intersect the flex grooves for even greater flexibility.', 1, NULL, N'/images/product/s16.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (22, N'Hurley Fusion', 1, 2, 8, 8, 1, 2, 800, N'The Hurley Fusion Men''s Sandal is made with a soft EVA footbed that conforms to your foot and deep, full-length flex grooves to provide all-day comfort and natural range of motion.', 1, NULL, N'/images/product/s17.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (23, N'Nike Free RN Motion Flyknit', 3, 2, 6, 7, 1, 2, 3000, N'Nike''s most natural ride to date, the Nike Free RN Motion Flyknit Men''s Running Shoe features a supportive, conforming Flyknit upper and a revolutionary new midsole pattern that allows the shoe to expand, flex and contract with your foot during every step—so you can move more freely than ever before.', 1, NULL, N'/images/product/s18.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (24, N'Nike Flyknit Racer', 3, 2, 6, 4, 2, 2, 3000, N'The innovative Nike Flyknit Racer Unisex Running Shoe (Men''s Sizing) gets its structure and support from Nike Flyknit technology. As a result, it''s incredibly lightweight, with a precision fit that feels like a second skin. It''s no wonder the world''s best marathon runners are wearing it in competition.', 1, NULL, N'/images/product/s19.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (25, N'Nike Air Zoom Vomero 11', 3, 2, 6, 4, 1, 2, 2800, N'The most comfortable version yet, the Nike Air Zoom Vomero 11 Men''s Running Shoe is designed with plusher materials than its predecessor, while still offering a magical combination of soft cushioning and responsive speed.', NULL, NULL, N'/images/product/s20.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (26, N'Nike FI Premiere ', 7, 2, 6, 8, 1, 2, 4000, N'The Nike FI Premiere Men''s Golf Shoe gives you a natural ride with a midsole borrowed from Nike Free and an innovative collar that provides support as you move.', NULL, NULL, N'/images/product/s21.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (27, N'Nike FI Bermuda', 7, 2, 6, 7, 1, 2, 2800, N'The Nike FI Bermuda Men''s Golf Shoe is designed for stability and a locked-in feel with integrated outsole traction and an interior bootie that hugs the foot. Flex grooves inspired by Nike Free give you natural range of motion with every step.', 0, NULL, N'/images/product/s22.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (28, N'Nike Vapor Untouchable 2 ', 6, 2, 6, 3, 2, 2, 4000, N'The Nike Vapor Untouchable 2 Men''s Football Cleat features a Flyweave upper and carbon fiber plate for a super-lightweight fit and stability that''s ideal for game-breaking skill players. Flywire cables integrate with the laces to lock down the foot, and strategically placed cleats create superb traction.', 1, NULL, N'/images/product/s23.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (29, N'Nike Force Lunarbeast Pro D ', 6, 2, 6, 9, 2, 2, 2000, N'The Nike Force Lunarbeast Pro D Men''s Football Cleat features a wide midfoot strap and a Phylon midsole for a locked-down feel and responsive cushioning. ', 1, NULL, N'/images/product/s24.1.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [TypeID], [CategoryID], [BrandID], [ColorID], [SaleID], [SizeID], [Price], [Description], [IsNew], [Rating], [Avatar]) VALUES (30, N'SB50 Nike Vapor Untouchable 2 ', 6, 2, 6, 5, 2, 2, 3600, N'The SB50 Nike Vapor Untouchable 2 (NFL) Men''s Football Cleat features a Flyweave upper and carbon fiber plate for a super-lightweight fit and stability that''s ideal for game-breaking skill players. Flywire cables integrate with the laces to lock down the foot, and strategically placed cleats create superb traction.', 1, NULL, N'/images/product/s25.1.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([SaleID], [SaleNum], [Date], [SaleName]) VALUES (1, 0, CAST(N'2016-05-08 00:00:00.000' AS DateTime), N'Không giảm giá')
INSERT [dbo].[Sale] ([SaleID], [SaleNum], [Date], [SaleName]) VALUES (2, 5, CAST(N'2015-01-05 00:00:00.000' AS DateTime), N'Đợt giảm giá tháng 5')
INSERT [dbo].[Sale] ([SaleID], [SaleNum], [Date], [SaleName]) VALUES (3, 10, CAST(N'2016-01-12 00:00:00.000' AS DateTime), N'Đợt giảm giá tháng 12')
INSERT [dbo].[Sale] ([SaleID], [SaleNum], [Date], [SaleName]) VALUES (4, 15, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'Đợt giảm giá sinh nhật lần 1')
INSERT [dbo].[Sale] ([SaleID], [SaleNum], [Date], [SaleName]) VALUES (5, 15, CAST(N'2017-01-01 00:00:00.000' AS DateTime), N'Đợt giảm giá sinh nhật lần 2')
SET IDENTITY_INSERT [dbo].[Sale] OFF
SET IDENTITY_INSERT [dbo].[ShoeType] ON 

INSERT [dbo].[ShoeType] ([TypeID], [TypeName]) VALUES (1, N'Không xác định')
INSERT [dbo].[ShoeType] ([TypeID], [TypeName]) VALUES (2, N'Lifestyle')
INSERT [dbo].[ShoeType] ([TypeID], [TypeName]) VALUES (3, N'Running')
INSERT [dbo].[ShoeType] ([TypeID], [TypeName]) VALUES (4, N'Training-Gym')
INSERT [dbo].[ShoeType] ([TypeID], [TypeName]) VALUES (5, N'Basketball')
INSERT [dbo].[ShoeType] ([TypeID], [TypeName]) VALUES (6, N'Football')
INSERT [dbo].[ShoeType] ([TypeID], [TypeName]) VALUES (7, N'Golf')
INSERT [dbo].[ShoeType] ([TypeID], [TypeName]) VALUES (8, N'Baseball')
INSERT [dbo].[ShoeType] ([TypeID], [TypeName]) VALUES (9, N'Tennis')
INSERT [dbo].[ShoeType] ([TypeID], [TypeName]) VALUES (10, N'ZX')
INSERT [dbo].[ShoeType] ([TypeID], [TypeName]) VALUES (12, N'Superstar')
SET IDENTITY_INSERT [dbo].[ShoeType] OFF
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (1, 0, N'Không xác định')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (2, -1, N'Đủ size')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (3, 34, N'34EU')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (4, 35, N'35EU')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (5, 36, N'36EU')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (6, 37, N'37EU')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (7, 38, N'38EU')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (8, 39, N'39EU')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (9, 40, N'40EU')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (10, 41, N'41EU')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (11, 42, N'42EU')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (12, 43, N'43EU')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (13, 44, N'44EU')
INSERT [dbo].[Size] ([SizeID], [SizeNum], [Description]) VALUES (14, 45, N'45EU')
SET IDENTITY_INSERT [dbo].[Size] OFF
INSERT [dbo].[User] ([Account], [Password], [UserName], [Birthday], [PhoneNumber]) VALUES (N'admin', N'123456', N'DoanVD', CAST(N'1995-01-01 00:00:00.000' AS DateTime), N'0981234567')
INSERT [dbo].[User] ([Account], [Password], [UserName], [Birthday], [PhoneNumber]) VALUES (N'admin2', N'123456', N'HuyNQ', CAST(N'1995-08-22 00:00:00.000' AS DateTime), N'01648908901')
ALTER TABLE [dbo].[Chitiethoadon]  WITH CHECK ADD  CONSTRAINT [FK_Chitiethoadon_Hoadon] FOREIGN KEY([HoadonID])
REFERENCES [dbo].[Hoadon] ([HoadonID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Chitiethoadon] CHECK CONSTRAINT [FK_Chitiethoadon_Hoadon]
GO
ALTER TABLE [dbo].[Chitiethoadon]  WITH CHECK ADD  CONSTRAINT [FK_Chitiethoadon_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Chitiethoadon] CHECK CONSTRAINT [FK_Chitiethoadon_Product]
GO
ALTER TABLE [dbo].[Hoadon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_Khachhang] FOREIGN KEY([KhachhangID])
REFERENCES [dbo].[Khachhang] ([KhachhangID])
ON UPDATE SET DEFAULT
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Hoadon] CHECK CONSTRAINT [FK_Hoadon_Khachhang]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON UPDATE SET DEFAULT
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
ON UPDATE SET DEFAULT
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
ON UPDATE SET DEFAULT
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Color] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Color] ([ColorID])
ON UPDATE SET DEFAULT
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Color]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Sale] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sale] ([SaleID])
ON UPDATE SET DEFAULT
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Sale]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Size] ([SizeID])
ON UPDATE SET DEFAULT
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Size]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ShoeType] ([TypeID])
ON UPDATE SET DEFAULT
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Type]
GO
