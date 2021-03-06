USE [mytest5]
GO
ALTER TABLE [dbo].[Store] DROP CONSTRAINT [FK__Store__IDPRO__3B75D760]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK__Products__IDCATE__38996AB5]
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK__OrderDeta__IDPRO__412EB0B6]
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK__OrderDeta__IDORD__403A8C7D]
GO
ALTER TABLE [dbo].[Cart] DROP CONSTRAINT [FK__Cart__idProduct__440B1D61]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 21-Apr-21 08:41:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Store]') AND type in (N'U'))
DROP TABLE [dbo].[Store]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 21-Apr-21 08:41:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 21-Apr-21 08:41:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 21-Apr-21 08:41:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetails]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 21-Apr-21 08:41:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 21-Apr-21 08:41:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cart]') AND type in (N'U'))
DROP TABLE [dbo].[Cart]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 21-Apr-21 08:41:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Blogs]') AND type in (N'U'))
DROP TABLE [dbo].[Blogs]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 21-Apr-21 08:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[ID] [varchar](10) NOT NULL,
	[DATEPOST] [date] NULL,
	[TITLE] [nvarchar](200) NULL,
	[CONTENT] [nvarchar](4000) NULL,
	[BLOGIMAGE] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 21-Apr-21 08:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [varchar](50) NULL,
	[idProduct] [varchar](10) NOT NULL,
	[count] [int] NOT NULL,
	[DateCreated] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 21-Apr-21 08:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [varchar](10) NOT NULL,
	[CATEGORYNAME] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 21-Apr-21 08:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDORDER] [int] NOT NULL,
	[IDPRODUCT] [varchar](10) NOT NULL,
	[COUNT] [int] NOT NULL,
	[UNITPRICE] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 21-Apr-21 08:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EMAIL] [varchar](100) NULL,
	[ADDRESS] [nvarchar](500) NULL,
	[PHONE] [varchar](15) NULL,
	[TOTALPRICE] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 21-Apr-21 08:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [varchar](10) NOT NULL,
	[PRODUCTNAME] [nvarchar](100) NULL,
	[IDCATE] [varchar](10) NULL,
	[SIZE] [varchar](5) NULL,
	[PRICE] [int] NOT NULL,
	[MATERIAL] [nvarchar](100) NULL,
	[HDBQ] [nvarchar](4000) NULL,
	[PRODUCTIMAGE] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 21-Apr-21 08:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDPRO] [varchar](10) NOT NULL,
	[COUNTIN] [int] NOT NULL,
	[COUNTOUT] [int] NULL,
	[DATEIN] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Blogs] ([ID], [DATEPOST], [TITLE], [CONTENT], [BLOGIMAGE]) VALUES (N'BL01', CAST(N'2021-04-20' AS Date), N'Về đầm', N'a ', N'Blog1.jpg')
INSERT [dbo].[Blogs] ([ID], [DATEPOST], [TITLE], [CONTENT], [BLOGIMAGE]) VALUES (N'BL02', CAST(N'2021-04-20' AS Date), N'về váy', N'a ă', N'Blog2.jpg')
INSERT [dbo].[Blogs] ([ID], [DATEPOST], [TITLE], [CONTENT], [BLOGIMAGE]) VALUES (N'BL03', CAST(N'2021-04-20' AS Date), N'về đồ công sở', N'a ă â', N'Blog4.jpg')
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (1, N'1a68ca08-e24a-456a-b3a0-221a5d4a8e17', N'SP01', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (2, N'1a68ca08-e24a-456a-b3a0-221a5d4a8e17', N'SP21', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (3, N'b88e7e50-e1ce-4823-8383-b97950600220', N'SP09', 2, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (4, N'b88e7e50-e1ce-4823-8383-b97950600220', N'SP01', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (5, N'f3e61558-0bc3-4d2c-b579-6fa1a3291d80', N'SP05', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (6, N'dbb48fb1-b2eb-4cab-933d-48e246135e02', N'SP01', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (7, N'03e450f4-b037-4519-a626-725374104922', N'SP01', 2, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (8, N'38d021cf-177d-4b34-8848-c5690d411c76', N'SP01', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (9, N'38099d1c-a597-48c6-99d1-1f8f9daea794', N'SP09', 2, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (10, N'a62a0013-fb83-4188-92f5-6fea75b9e2a4', N'SP01', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (11, N'7afbe052-d853-4b72-9f25-590a4f7169b3', N'SP05', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (12, N'87a19f50-a722-4c03-9228-6745a3358adf', N'SP01', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (14, N'c049fd11-0694-4f00-acb8-c4946cdbfb0a', N'SP05', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (16, N'e801e61b-219d-4da6-8ea5-1ff9e342a0ac', N'SP17', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (17, N'a35b703f-ccef-4cb2-9873-a2e13313618a', N'SP01', 2, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (18, N'f72a60ab-5afe-4f14-9728-ecc51e69e130', N'SP05', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (19, N'46463b19-5c2b-497a-bd01-b8514fee4903', N'SP09', 1, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (20, N'34b2dd54-dec3-435a-98e4-a84bf5223a09', N'SP17', 2, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (21, N'4e00657e-9851-45ad-b348-524a3e009238', N'SP01', 2, CAST(N'2021-04-21' AS Date))
INSERT [dbo].[Cart] ([RecordID], [CartID], [idProduct], [count], [DateCreated]) VALUES (22, N'09107f2e-cde1-470c-8514-f9fcba9192ac', N'SP05', 1, CAST(N'2021-04-21' AS Date))
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[Categories] ([ID], [CATEGORYNAME]) VALUES (N'CP01', N'ĐẦM')
INSERT [dbo].[Categories] ([ID], [CATEGORYNAME]) VALUES (N'CP02', N'VÁY')
INSERT [dbo].[Categories] ([ID], [CATEGORYNAME]) VALUES (N'CP03', N'ĐỒ CÔNG SỞ')
INSERT [dbo].[Categories] ([ID], [CATEGORYNAME]) VALUES (N'CP04', N'SẢN PHẨM KHÁC')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [IDORDER], [IDPRODUCT], [COUNT], [UNITPRICE]) VALUES (1, 1, N'SP01', 1, 100000)
INSERT [dbo].[OrderDetails] ([ID], [IDORDER], [IDPRODUCT], [COUNT], [UNITPRICE]) VALUES (2, 2, N'SP01', 1, 100000)
INSERT [dbo].[OrderDetails] ([ID], [IDORDER], [IDPRODUCT], [COUNT], [UNITPRICE]) VALUES (3, 3, N'SP09', 1, 200000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [EMAIL], [ADDRESS], [PHONE], [TOTALPRICE]) VALUES (1, N'', N'2', N'0938712520', 100000)
INSERT [dbo].[Orders] ([ID], [EMAIL], [ADDRESS], [PHONE], [TOTALPRICE]) VALUES (2, N'vunhatminhtruong242@gmail.com', N'fscsasazxc', N'0938712520', 100000)
INSERT [dbo].[Orders] ([ID], [EMAIL], [ADDRESS], [PHONE], [TOTALPRICE]) VALUES (3, N'truongvnm24@gmail.com', N'2', N'0938712520', 200000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP01', N'Clothes1', N'CP01', N'S', 100000, N'a', N'b', N'Clothes1.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP02', N'Clothes2', N'CP02', N'M', 150000, N'c', N'd', N'Clothes2.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP03', N'Clothes3', N'CP03', N'S', 200000, N'e', N'f', N'Clothes3.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP04', N'Clothes4', N'CP04', N'M', 200000, N'g', N'h', N'Clothes4.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP05', N'ÁO LỆCH VAI HỌA TIẾT MS 16M6308', N'CP01', N'S', 200000, N'a', N'b', N'ALVHT.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP06', N'ÁO PEPLUM DẬP LY MS 15M6422', N'CP02', N'M', 200000, N'g', N'b', N'APDL.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP07', N'ÁO PEPLUM HOA NỔI MS 16M6415', N'CP03', N'S', 200000, N'e', N'b', N'APHN.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP08', N'ĐẦM CHẦN CHUN ĐUÔI CÁ MS 48B8', N'CP04', N'M', 200000, N'g', N'b', N'DCCDC.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP09', N'ĐẦM DẬP LY XẾP TẦNG MS 48M6349', N'CP01', N'M', 200000, N'a', N'h', N'DDLXT.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP10', N'ĐẦM HOA NHÍ SÁT NÁCH MS 41M6424', N'CP02', N'S', 200000, N'c', N'f', N'DHNSN.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP11', N'ĐẦM LỤA HỌA TIẾT EO ĐÍNH NƠ MS', N'CP03', N'S', 200000, N'a', N'b', N'DLHTEDN.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP12', N'ĐẦM LỤA MAXI HỌA TIẾT MS 41B8576', N'CP04', N'M', 200000, N'e', N'b', N'DLMHT.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP13', N'ĐẦM LỤA XÒE VAI LỆCH MS 48M6260', N'CP01', N'S', 200000, N'a', N'd', N'DLXVL.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP14', N'ĐẦM MAXI CỔ V MS 41B8575', N'CP02', N'S', 200000, N'c', N'b', N'DMCV.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP15', N'ĐẦM ÔM PHỐI VOAN MS 48B8497', N'CP03', N'S', 200000, N'g', N'b', N'DOPV.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP16', N'ĐẦM THÊU XẺ TÀ MS 41M6350', N'CP04', N'M', 200000, N'a', N'h', N'DTXT.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP17', N'ĐẦM THUN ÔM CỔ ĐỨC MS 42C5920', N'CP01', N'S', 200000, N'a', N'b', N'DTOCD.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP18', N'ĐẦM VOAN TRỄ VAI MS 48B8571', N'CP02', N'S', 200000, N'a', N'b', N'DVTV.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP19', N'ĐẦM XẾP LY CỔ YẾM MS 41M6335', N'CP03', N'M', 200000, N'e', N'b', N'DXLCY.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP20', N'ĐẦM XẾP LY CỔ YẾM MS jpg', N'CP04', N'M', 200000, N'a', N'b', N'DXLCYjpg.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP21', N'ĐẦM XÒE SÁT NÁCH MS 41B8601', N'CP01', N'S', 200000, N'a', N'b', N'DXSN.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP22', N'ĐẦM XÒE TRỄ VAI MS 48B8553', N'CP02', N'M', 200000, N'c', N'b', N'DXTV.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP23', N'QUẦN DÀI KẺ ỐNG ĐỨNG MS 22M5067', N'CP03', N'S', 200000, N'g', N'b', N'QDKOD.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP24', N'QUẦN LỬNG ỐNG SUÔNG MS 21M6330', N'CP04', N'S', 200000, N'e', N'b', N'QLOS.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP25', N'QUẦN LỬNG ỐNG SUÔNG MS', N'CP01', N'S', 200000, N'c', N'b', N'QLOS1.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP26', N'QUẦN SOOC GIẢ VÁY MS 20M6412', N'CP02', N'S', 200000, N'a', N'h', N'QSGV.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP27', N'ZUÝP BÚT CHÌ TRẮNG MS 31M6055', N'CP03', N'M', 200000, N'a', N'b', N'ZBCT.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP28', N'ZUÝP CHỮ A PHỐI NÚT MS 31M6340', N'CP04', N'S', 200000, N'a', N'h', N'ZCAPN.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP29', N'ZUÝP LỤA GRACEFULLY MS 30M6441', N'CP01', N'S', 200000, N'a', N'b', N'ZLG.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP30', N'ZUÝP XẾP LY 2 LỚP MS 31M6327', N'CP02', N'M', 200000, N'g', N'b', N'ZXL2L.jpg')
INSERT [dbo].[Products] ([ID], [PRODUCTNAME], [IDCATE], [SIZE], [PRICE], [MATERIAL], [HDBQ], [PRODUCTIMAGE]) VALUES (N'SP31', N'ZUÝP XẾP LY NGANG GỐI MS 31M5908', N'CP03', N'S', 200000, N'e', N'b', N'ZXLNG.jpg')
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([idProduct])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([IDORDER])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([IDPRODUCT])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([IDCATE])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD FOREIGN KEY([IDPRO])
REFERENCES [dbo].[Products] ([ID])
GO
