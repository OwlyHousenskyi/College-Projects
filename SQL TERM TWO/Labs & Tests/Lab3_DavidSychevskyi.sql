-- Script to create the Sport Motors database in SQL Server
--
-- Note: Before you execute this script!! 
-- 		 You MUST replace all occurences of username_ with your own username!
--			(should be 9 occurences to replace, including 2 in the comments).


USE master
GO
/****** Object:  Database [username_SportMotors]  Drop it if it exists   ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'username_SportMotors')
Begin
	ALTER DATABASE [username_SportMotors]
	SET OFFLINE WITH ROLLBACK IMMEDIATE
	ALTER DATABASE [username_SportMotors]
	SET ONLINE
	DROP DATABASE [username_SportMotors]
End
GO

CREATE DATABASE username_SportMotors 
GO
ALTER DATABASE username_SportMotors SET RECOVERY SIMPLE
Go
----------------------------------------------------------------------------------

USE [username_SportMotors]
GO
/****** Object:  Table [dbo].[SportEmployee]    Script Date: 06/14/2013 09:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportEmployee](
	[EmployeeID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeLastName] [varchar](30) NOT NULL,
	[EmployeeFirstName] [varchar](30) NULL,
	[EmployeeMI] [varchar](30) NULL,
	[EmployeeDOB] [datetime] NULL,
	[EmployeeManagerID] [bigint] NULL,
	[EmployeeHireDate] [datetime] NULL,
	[EmployeeHomePhone] [varchar](20) NULL,
	[EmployeePhotoFilename] [varchar](30) NULL,
	[EmployeePhotoBinary] [image] NULL,
	[EmployeeCommission] [decimal](18, 0) NOT NULL,
	[DepartmentID] [bigint] NULL,
	[EmployeeUsername] [varchar](35) NULL,
	[EmployeePassword] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SportEmployee] ON
INSERT [dbo].[SportEmployee] ([EmployeeID], [EmployeeLastName], [EmployeeFirstName], [EmployeeMI], [EmployeeDOB], [EmployeeManagerID], [EmployeeHireDate], [EmployeeHomePhone], [EmployeePhotoFilename], [EmployeePhotoBinary], [EmployeeCommission], [DepartmentID], [EmployeeUsername], [EmployeePassword]) VALUES (1, N'Mathews', N'Roy', N'D', CAST(0x0000462300000000 AS DateTime), NULL, CAST(0x00007AFC00000000 AS DateTime), N'7155552923', N'mathews.jpg', NULL, CAST(0 AS Decimal(18, 0)), 3, N'mathewsr1', N'plant')
INSERT [dbo].[SportEmployee] ([EmployeeID], [EmployeeLastName], [EmployeeFirstName], [EmployeeMI], [EmployeeDOB], [EmployeeManagerID], [EmployeeHireDate], [EmployeeHomePhone], [EmployeePhotoFilename], [EmployeePhotoBinary], [EmployeeCommission], [DepartmentID], [EmployeeUsername], [EmployeePassword]) VALUES (2, N'Kaiser', N'Greg', N'M', CAST(0x00004EF300000000 AS DateTime), 1, CAST(0x000087E200000000 AS DateTime), N'7155554498', N'kaiserg.jpg', NULL, CAST(0 AS Decimal(18, 0)), 3, N'kaiserg1', N'theone')
INSERT [dbo].[SportEmployee] ([EmployeeID], [EmployeeLastName], [EmployeeFirstName], [EmployeeMI], [EmployeeDOB], [EmployeeManagerID], [EmployeeHireDate], [EmployeeHomePhone], [EmployeePhotoFilename], [EmployeePhotoBinary], [EmployeeCommission], [DepartmentID], [EmployeeUsername], [EmployeePassword]) VALUES (3, N'Jones', N'Mark', N'J', CAST(0x00005D0C00000000 AS DateTime), 2, CAST(0x0000819A00000000 AS DateTime), N'7155559998', N'jonesm.jpg', NULL, CAST(0 AS Decimal(18, 0)), 1, N'jonesm1', N'indiana')
INSERT [dbo].[SportEmployee] ([EmployeeID], [EmployeeLastName], [EmployeeFirstName], [EmployeeMI], [EmployeeDOB], [EmployeeManagerID], [EmployeeHireDate], [EmployeeHomePhone], [EmployeePhotoFilename], [EmployeePhotoBinary], [EmployeeCommission], [DepartmentID], [EmployeeUsername], [EmployeePassword]) VALUES (4, N'Ward', N'Dennis', NULL, CAST(0x000056CE00000000 AS DateTime), 3, CAST(0x00007AFC00000000 AS DateTime), N'7155550089', N'wardd.jpg', NULL, CAST(0 AS Decimal(18, 0)), 2, N'wardd1', N'redhot')
INSERT [dbo].[SportEmployee] ([EmployeeID], [EmployeeLastName], [EmployeeFirstName], [EmployeeMI], [EmployeeDOB], [EmployeeManagerID], [EmployeeHireDate], [EmployeeHomePhone], [EmployeePhotoFilename], [EmployeePhotoBinary], [EmployeeCommission], [DepartmentID], [EmployeeUsername], [EmployeePassword]) VALUES (5, N'Rumell', N'Alicia', N'B', CAST(0x0000498000000000 AS DateTime), 5, CAST(0x00007AFC00000000 AS DateTime), N'7155554936', N'rumella.jpg', NULL, CAST(0 AS Decimal(18, 0)), 4, N'rumella1', N'rapunzel')
INSERT [dbo].[SportEmployee] ([EmployeeID], [EmployeeLastName], [EmployeeFirstName], [EmployeeMI], [EmployeeDOB], [EmployeeManagerID], [EmployeeHireDate], [EmployeeHomePhone], [EmployeePhotoFilename], [EmployeePhotoBinary], [EmployeeCommission], [DepartmentID], [EmployeeUsername], [EmployeePassword]) VALUES (6, N'Haugen', N'Sarah', N'R', CAST(0x0000839200000000 AS DateTime), 4, CAST(0x000083BB00000000 AS DateTime), N'7155552031', N'haugens.jpg', NULL, CAST(0 AS Decimal(18, 0)), 5, N'haugens1', N'daze')
INSERT [dbo].[SportEmployee] ([EmployeeID], [EmployeeLastName], [EmployeeFirstName], [EmployeeMI], [EmployeeDOB], [EmployeeManagerID], [EmployeeHireDate], [EmployeeHomePhone], [EmployeePhotoFilename], [EmployeePhotoBinary], [EmployeeCommission], [DepartmentID], [EmployeeUsername], [EmployeePassword]) VALUES (7, N'Smith', N'Jerry', N'K', CAST(0x0000765600000000 AS DateTime), 2, CAST(0x0000914C00000000 AS DateTime), N'7155559933', N'smithj.jpg', NULL, CAST(0 AS Decimal(18, 0)), 1, N'smithj1', N'credenza')
INSERT [dbo].[SportEmployee] ([EmployeeID], [EmployeeLastName], [EmployeeFirstName], [EmployeeMI], [EmployeeDOB], [EmployeeManagerID], [EmployeeHireDate], [EmployeeHomePhone], [EmployeePhotoFilename], [EmployeePhotoBinary], [EmployeeCommission], [DepartmentID], [EmployeeUsername], [EmployeePassword]) VALUES (8, N'Milner', N'Chris', N'P', CAST(0x0000635E00000000 AS DateTime), 3, CAST(0x000082F200000000 AS DateTime), N'7155551188', N'milnerc.jpg', NULL, CAST(0 AS Decimal(18, 0)), 2, N'milnerc1', N'yoohoo')
INSERT [dbo].[SportEmployee] ([EmployeeID], [EmployeeLastName], [EmployeeFirstName], [EmployeeMI], [EmployeeDOB], [EmployeeManagerID], [EmployeeHireDate], [EmployeeHomePhone], [EmployeePhotoFilename], [EmployeePhotoBinary], [EmployeeCommission], [DepartmentID], [EmployeeUsername], [EmployeePassword]) VALUES (9, N'Balmer', N'Janet', N'T', CAST(0x000067FC00000000 AS DateTime), 3, CAST(0x000093FE00000000 AS DateTime), N'7155550437', N'balmerj.jpg', NULL, CAST(0 AS Decimal(18, 0)), 2, N'balmerj1', N'ceo')
INSERT [dbo].[SportEmployee] ([EmployeeID], [EmployeeLastName], [EmployeeFirstName], [EmployeeMI], [EmployeeDOB], [EmployeeManagerID], [EmployeeHireDate], [EmployeeHomePhone], [EmployeePhotoFilename], [EmployeePhotoBinary], [EmployeeCommission], [DepartmentID], [EmployeeUsername], [EmployeePassword]) VALUES (10, N'Akey', N'Corey', N'R', CAST(0x0000464B00000000 AS DateTime), 3, CAST(0x000084D900000000 AS DateTime), N'7155559290', N'akeyc.jpg', NULL, CAST(0 AS Decimal(18, 0)), 2, N'akeyc1', N'bones')
INSERT [dbo].[SportEmployee] ([EmployeeID], [EmployeeLastName], [EmployeeFirstName], [EmployeeMI], [EmployeeDOB], [EmployeeManagerID], [EmployeeHireDate], [EmployeeHomePhone], [EmployeePhotoFilename], [EmployeePhotoBinary], [EmployeeCommission], [DepartmentID], [EmployeeUsername], [EmployeePassword]) VALUES (11, N'Crain', N'Craig', N'K', CAST(0x0000685B00000000 AS DateTime), 1, CAST(0x000091E100000000 AS DateTime), N'7155553989', N'crainc.jpg', NULL, CAST(0 AS Decimal(18, 0)), 3, N'crainc1', N'hiddenvalley')
INSERT [dbo].[SportEmployee] ([EmployeeID], [EmployeeLastName], [EmployeeFirstName], [EmployeeMI], [EmployeeDOB], [EmployeeManagerID], [EmployeeHireDate], [EmployeeHomePhone], [EmployeePhotoFilename], [EmployeePhotoBinary], [EmployeeCommission], [DepartmentID], [EmployeeUsername], [EmployeePassword]) VALUES (12, N'Heyde', N'Jennifer', N'E', CAST(0x00006BE400000000 AS DateTime), 1, CAST(0x0000938B00000000 AS DateTime), N'7155555459', N'heydej.jpg', NULL, CAST(0 AS Decimal(18, 0)), 3, N'heydej1', N'redgreen')
SET IDENTITY_INSERT [dbo].[SportEmployee] OFF
/****** Object:  Table [dbo].[SportDepartment]    Script Date: 06/14/2013 09:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportDepartment](
	[DepartmentID] [bigint] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
	[DepartmentManagerID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SportDepartment] ON
INSERT [dbo].[SportDepartment] ([DepartmentID], [DepartmentName], [DepartmentManagerID]) VALUES (1, N'Parts', 2)
INSERT [dbo].[SportDepartment] ([DepartmentID], [DepartmentName], [DepartmentManagerID]) VALUES (2, N'Service', 3)
INSERT [dbo].[SportDepartment] ([DepartmentID], [DepartmentName], [DepartmentManagerID]) VALUES (3, N'Sales', 1)
INSERT [dbo].[SportDepartment] ([DepartmentID], [DepartmentName], [DepartmentManagerID]) VALUES (4, N'Apparel', 5)
INSERT [dbo].[SportDepartment] ([DepartmentID], [DepartmentName], [DepartmentManagerID]) VALUES (5, N'Accounting', 4)
SET IDENTITY_INSERT [dbo].[SportDepartment] OFF
/****** Object:  Table [dbo].[SportState]    Script Date: 06/14/2013 09:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportState](
	[StateAbbreviation] [varchar](2) NOT NULL,
	[StateName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StateAbbreviation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'AK', N'ALASKA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'AL', N'ALABAMA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'AR', N'ARKANSAS')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'AZ', N'ARIZONA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'CA', N'CALIFORNIA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'CO', N'COLORADO')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'CT', N'CONNECTICUT')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'DC', N'DISTRICT OF COLUMBIA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'DE', N'DELAWARE')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'FL', N'FLORIDA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'GA', N'GEORGIA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'HI', N'HAWAII')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'IA', N'IOWA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'ID', N'IDAHO')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'IL', N'ILLINOIS')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'IN', N'INDIANA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'KS', N'KANSAS')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'KY', N'KENTUCKY')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'LA', N'LOUISIANA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'MA', N'MASSACHUSETTS')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'MD', N'MARYLAND')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'ME', N'MAINE')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'MI', N'MICHIGAN')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'MN', N'MINNESOTA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'MO', N'MISSOURI')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'MS', N'MISSISSIPPI')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'MT', N'MONTANA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'NC', N'NORTH CAROLINA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'ND', N'NORTH DAKOTA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'NE', N'NEBRASKA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'NH', N'NEW HAMPSHIRE')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'NJ', N'NEW JERSEY')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'NM', N'NEW MEXICO')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'NV', N'NEVADA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'NY', N'NEW YORK')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'OH', N'OHIO')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'OK', N'OKLAHOMA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'OR', N'OREGON')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'PA', N'PENNSYLVANIA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'RI', N'RHODE ISLAND')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'SC', N'SOUTH CAROLINA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'SD', N'SOUTH DAKOTA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'TN', N'TENNESSEE')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'TX', N'TEXAS')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'UT', N'UTAH')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'VA', N'VIRGINIA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'VT', N'VERMONT')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'WA', N'WASHINGTON')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'WI', N'WISCONSIN')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'WV', N'WEST VIRGINIA')
INSERT [dbo].[SportState] ([StateAbbreviation], [StateName]) VALUES (N'WY', N'WYOMING')
/****** Object:  Table [dbo].[SportPaymentType]    Script Date: 06/14/2013 09:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportPaymentType](
	[PaymentType] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[SportPaymentType] ([PaymentType]) VALUES (N'Cash')
INSERT [dbo].[SportPaymentType] ([PaymentType]) VALUES (N'Check')
INSERT [dbo].[SportPaymentType] ([PaymentType]) VALUES (N'Credit Card')
INSERT [dbo].[SportPaymentType] ([PaymentType]) VALUES (N'Loan')
/****** Object:  Table [dbo].[SportColor]    Script Date: 06/14/2013 09:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportColor](
	[ColorDescription] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorDescription] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Black')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Blue')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Green')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Grey')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Metallic Blue')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Metallic Green')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Metallic Red')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Orange')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Pearlescent Silver')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Red')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Tan')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Tangerine')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'White')
INSERT [dbo].[SportColor] ([ColorDescription]) VALUES (N'Yellow')
/****** Object:  Table [dbo].[SportCategory]    Script Date: 06/14/2013 09:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportCategory](
	[CategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryDescription] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SportCategory] ON
INSERT [dbo].[SportCategory] ([CategoryID], [CategoryDescription]) VALUES (1, N'Apparel')
INSERT [dbo].[SportCategory] ([CategoryID], [CategoryDescription]) VALUES (2, N'Motorcycles')
INSERT [dbo].[SportCategory] ([CategoryID], [CategoryDescription]) VALUES (3, N'All Terrain Vehicles')
INSERT [dbo].[SportCategory] ([CategoryID], [CategoryDescription]) VALUES (4, N'Snowmobiles')
INSERT [dbo].[SportCategory] ([CategoryID], [CategoryDescription]) VALUES (5, N'Parts')
SET IDENTITY_INSERT [dbo].[SportCategory] OFF
/****** Object:  Table [dbo].[SportSupplier]    Script Date: 06/14/2013 09:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportSupplier](
	[SupplierID] [bigint] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](100) NOT NULL,
	[SupplierContactName] [varchar](60) NULL,
	[SupplierContactPhone] [varchar](20) NULL,
	[SupplierAddress] [varchar](30) NULL,
	[SupplierCity] [varchar](30) NULL,
	[StateAbbreviation] [varchar](2) NULL,
	[SupplierZip] [varchar](10) NULL,
	[SupplierPhone] [varchar](20) NULL,
	[SupplierUsername] [varchar](10) NULL,
	[SupplierPassword] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SportSupplier] ON
INSERT [dbo].[SportSupplier] ([SupplierID], [SupplierName], [SupplierContactName], [SupplierContactPhone], [SupplierAddress], [SupplierCity], [StateAbbreviation], [SupplierZip], [SupplierPhone], [SupplierUsername], [SupplierPassword]) VALUES (1, N'Red Cycle Supply', N'Rhonda Hanover', N'3335551928', N'110 Industrial Blvd', N'Denver', N'CO', N'29388', N'3335552292', N'redcycle', N'rhan3')
INSERT [dbo].[SportSupplier] ([SupplierID], [SupplierName], [SupplierContactName], [SupplierContactPhone], [SupplierAddress], [SupplierCity], [StateAbbreviation], [SupplierZip], [SupplierPhone], [SupplierUsername], [SupplierPassword]) VALUES (2, N'Green Cycle Imports', N'Reed Hoke', N'4445552290', N'2371 910 St', N'Detroit', N'MI', N'22333', N'4445550939', N'greencycle', N'zxcvj')
INSERT [dbo].[SportSupplier] ([SupplierID], [SupplierName], [SupplierContactName], [SupplierContactPhone], [SupplierAddress], [SupplierCity], [StateAbbreviation], [SupplierZip], [SupplierPhone], [SupplierUsername], [SupplierPassword]) VALUES (3, N'Thunder Cycles', N'Harley Westover', N'1115554989', N'2001 Thunder Rd', N'Milwaukee', N'WI', N'54777', N'1115552321', N'thunder', N'gjfkdl')
INSERT [dbo].[SportSupplier] ([SupplierID], [SupplierName], [SupplierContactName], [SupplierContactPhone], [SupplierAddress], [SupplierCity], [StateAbbreviation], [SupplierZip], [SupplierPhone], [SupplierUsername], [SupplierPassword]) VALUES (4, N'No Limit Parts', N'John Swallow', N'2225553325', N'23 Diesel Dr', N'Dallas', N'TX', N'73400', N'2225559829', N'nolimit', N'parts')
INSERT [dbo].[SportSupplier] ([SupplierID], [SupplierName], [SupplierContactName], [SupplierContactPhone], [SupplierAddress], [SupplierCity], [StateAbbreviation], [SupplierZip], [SupplierPhone], [SupplierUsername], [SupplierPassword]) VALUES (5, N'Fast Gear', N'Malcom Smith', N'1235559948', N'1090 Rodeo Dr', N'Los Angeles', N'CA', N'22022', N'1235552939', N'fastgear', N'smoking')
INSERT [dbo].[SportSupplier] ([SupplierID], [SupplierName], [SupplierContactName], [SupplierContactPhone], [SupplierAddress], [SupplierCity], [StateAbbreviation], [SupplierZip], [SupplierPhone], [SupplierUsername], [SupplierPassword]) VALUES (6, N'Cycle Riding Attire', N'Mike O''Brien', N'3215553948', N'835 E Fifth St', N'Minneapolis', N'MN', N'44555', N'3215552291', N'cycleridin', N'password')
SET IDENTITY_INSERT [dbo].[SportSupplier] OFF
/****** Object:  Table [dbo].[SportSubCategory]    Script Date: 06/14/2013 09:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportSubCategory](
	[SubCategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[SubCategoryDescription] [varchar](100) NOT NULL,
	[CategoryID] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SportSubCategory] ON
INSERT [dbo].[SportSubCategory] ([SubCategoryID], [SubCategoryDescription], [CategoryID]) VALUES (1, N'Women''s', 1)
INSERT [dbo].[SportSubCategory] ([SubCategoryID], [SubCategoryDescription], [CategoryID]) VALUES (2, N'Men''s', 1)
INSERT [dbo].[SportSubCategory] ([SubCategoryID], [SubCategoryDescription], [CategoryID]) VALUES (3, N'Children''s', 1)
INSERT [dbo].[SportSubCategory] ([SubCategoryID], [SubCategoryDescription], [CategoryID]) VALUES (4, N'Off Road', 2)
INSERT [dbo].[SportSubCategory] ([SubCategoryID], [SubCategoryDescription], [CategoryID]) VALUES (5, N'Street', 2)
INSERT [dbo].[SportSubCategory] ([SubCategoryID], [SubCategoryDescription], [CategoryID]) VALUES (6, N'Utility', 3)
INSERT [dbo].[SportSubCategory] ([SubCategoryID], [SubCategoryDescription], [CategoryID]) VALUES (7, N'Sport', 3)
INSERT [dbo].[SportSubCategory] ([SubCategoryID], [SubCategoryDescription], [CategoryID]) VALUES (8, N'Motorcycle', 5)
INSERT [dbo].[SportSubCategory] ([SubCategoryID], [SubCategoryDescription], [CategoryID]) VALUES (9, N'ATV', 5)
INSERT [dbo].[SportSubCategory] ([SubCategoryID], [SubCategoryDescription], [CategoryID]) VALUES (10, N'Snowmobile', 5)
INSERT [dbo].[SportSubCategory] ([SubCategoryID], [SubCategoryDescription], [CategoryID]) VALUES (11, N'Miscellaneous', 5)
SET IDENTITY_INSERT [dbo].[SportSubCategory] OFF
/****** Object:  Table [dbo].[SportOrder]    Script Date: 06/14/2013 09:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportOrder](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderNetTotal] [money] NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[EmployeeID] [bigint] NULL,
	[PaymentType] [varchar](11) NOT NULL,
 CONSTRAINT [PK__SportOrd__C3905BAF1DE57479] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SportOrder] ON
INSERT [dbo].[SportOrder] ([OrderID], [OrderDate], [OrderNetTotal], [CustomerID], [EmployeeID], [PaymentType]) VALUES (1, CAST(0x000098EE00000000 AS DateTime), 8640.9500, 1, 2, N'Loan')
INSERT [dbo].[SportOrder] ([OrderID], [OrderDate], [OrderNetTotal], [CustomerID], [EmployeeID], [PaymentType]) VALUES (2, CAST(0x000098EE00000000 AS DateTime), 147.3400, 6, 3, N'Check')
INSERT [dbo].[SportOrder] ([OrderID], [OrderDate], [OrderNetTotal], [CustomerID], [EmployeeID], [PaymentType]) VALUES (3, CAST(0x000098EE00000000 AS DateTime), 25.9500, 10, 4, N'Cash')
INSERT [dbo].[SportOrder] ([OrderID], [OrderDate], [OrderNetTotal], [CustomerID], [EmployeeID], [PaymentType]) VALUES (4, CAST(0x000098EF00000000 AS DateTime), 479.9300, 8, 4, N'Credit Card')
SET IDENTITY_INSERT [dbo].[SportOrder] OFF
/****** Object:  Table [dbo].[SportCustomer]    Script Date: 06/14/2013 09:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportCustomer](
	[CustomerID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerLastName] [varchar](30) NOT NULL,
	[CustomerFirstName] [varchar](30) NULL,
	[CustomerMI] [char](1) NULL,
	[CustomerAddress] [varchar](30) NULL,
	[CustomerCity] [varchar](30) NULL,
	[StateAbbreviation] [varchar](2) NULL,
	[CustomerZipCode] [varchar](10) NULL,
	[CustomerPhone] [varchar](20) NULL,
	[CustomerComments] [varchar](3000) NULL,
	[CustomerDiscount] [float] NOT NULL,
	[CustomerUsername] [varchar](35) NULL,
	[CustomerPassword] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SportCustomer] ON
INSERT [dbo].[SportCustomer] ([CustomerID], [CustomerLastName], [CustomerFirstName], [CustomerMI], [CustomerAddress], [CustomerCity], [StateAbbreviation], [CustomerZipCode], [CustomerPhone], [CustomerComments], [CustomerDiscount], [CustomerUsername], [CustomerPassword]) VALUES (1, N'Scholten', N'Allison', N'G', N'1605 Broad Blvd', N'Denver', N'CO', N'54701', N'7155553929', NULL, 0.05, N'scholtena1', N'asdfjk')
INSERT [dbo].[SportCustomer] ([CustomerID], [CustomerLastName], [CustomerFirstName], [CustomerMI], [CustomerAddress], [CustomerCity], [StateAbbreviation], [CustomerZipCode], [CustomerPhone], [CustomerComments], [CustomerDiscount], [CustomerUsername], [CustomerPassword]) VALUES (2, N'Potter', N'Anthony', N'R', N'1304 W Back St', N'Eau Claire', N'WI', N'54702', N'7155551411', N'Frequent Customer', 0.15, N'pottera1', N'qwerty')
INSERT [dbo].[SportCustomer] ([CustomerID], [CustomerLastName], [CustomerFirstName], [CustomerMI], [CustomerAddress], [CustomerCity], [StateAbbreviation], [CustomerZipCode], [CustomerPhone], [CustomerComments], [CustomerDiscount], [CustomerUsername], [CustomerPassword]) VALUES (3, N'Knutson', N'Stacey', N'T', N'2402 131st St', N'Chippewa Falls', N'WI', N'54729', N'7155550032', NULL, 0.1, N'knutsons1', N'clever')
INSERT [dbo].[SportCustomer] ([CustomerID], [CustomerLastName], [CustomerFirstName], [CustomerMI], [CustomerAddress], [CustomerCity], [StateAbbreviation], [CustomerZipCode], [CustomerPhone], [CustomerComments], [CustomerDiscount], [CustomerUsername], [CustomerPassword]) VALUES (4, N'Endres', N'Bernard', N'A', N'993 Beverly Dr', N'Altoona', N'WI', N'54720', N'7155551352', NULL, 0.1, N'endresb1', N'fluffy')
INSERT [dbo].[SportCustomer] ([CustomerID], [CustomerLastName], [CustomerFirstName], [CustomerMI], [CustomerAddress], [CustomerCity], [StateAbbreviation], [CustomerZipCode], [CustomerPhone], [CustomerComments], [CustomerDiscount], [CustomerUsername], [CustomerPassword]) VALUES (5, N'Askland', N'Sandra', NULL, N'3215 E Fillmore St', N'Hallie', N'WI', N'54728', N'7155554493', NULL, 0.05, N'asklands1', N'f92eruy4r')
INSERT [dbo].[SportCustomer] ([CustomerID], [CustomerLastName], [CustomerFirstName], [CustomerMI], [CustomerAddress], [CustomerCity], [StateAbbreviation], [CustomerZipCode], [CustomerPhone], [CustomerComments], [CustomerDiscount], [CustomerUsername], [CustomerPassword]) VALUES (6, N'O''Conner', N'Robin', N'J', N'6775 Lamont Rd', N'Eau Claire', N'WI', N'54703', N'7155553399', NULL, 0.05, N'oconnerr1', N'secret')
INSERT [dbo].[SportCustomer] ([CustomerID], [CustomerLastName], [CustomerFirstName], [CustomerMI], [CustomerAddress], [CustomerCity], [StateAbbreviation], [CustomerZipCode], [CustomerPhone], [CustomerComments], [CustomerDiscount], [CustomerUsername], [CustomerPassword]) VALUES (7, N'Wendt', N'Daniel', N'B', N'642 River Rd', N'Chippewa Falls', N'WI', N'54729', N'7155555489', NULL, 0.15, N'wendtd1', N'shadow')
INSERT [dbo].[SportCustomer] ([CustomerID], [CustomerLastName], [CustomerFirstName], [CustomerMI], [CustomerAddress], [CustomerCity], [StateAbbreviation], [CustomerZipCode], [CustomerPhone], [CustomerComments], [CustomerDiscount], [CustomerUsername], [CustomerPassword]) VALUES (8, N'Zimmerman', N'Leland', N'S', N'N8194 Highway 93', N'Hallie', N'WI', N'54728', N'7155552190', NULL, 0.1, N'zimmermanl1', N'submarine')
INSERT [dbo].[SportCustomer] ([CustomerID], [CustomerLastName], [CustomerFirstName], [CustomerMI], [CustomerAddress], [CustomerCity], [StateAbbreviation], [CustomerZipCode], [CustomerPhone], [CustomerComments], [CustomerDiscount], [CustomerUsername], [CustomerPassword]) VALUES (9, N'Sessions', N'Gene', NULL, N'1219 Lawrence', N'Chippewa Falls', N'WI', N'54729', N'7155553376', NULL, 0.15, N'sessionsg1', N'gene')
INSERT [dbo].[SportCustomer] ([CustomerID], [CustomerLastName], [CustomerFirstName], [CustomerMI], [CustomerAddress], [CustomerCity], [StateAbbreviation], [CustomerZipCode], [CustomerPhone], [CustomerComments], [CustomerDiscount], [CustomerUsername], [CustomerPassword]) VALUES (10, N'McGinnis', N'Paul', N'N', N'157 Bartig Rd', N'Eau Claire', N'WI', N'54701', N'7155553329', NULL, 0.1, N'mcginnisp1', N'bartig')
SET IDENTITY_INSERT [dbo].[SportCustomer] OFF
/****** Object:  Table [dbo].[SportOrderDetail]    Script Date: 06/14/2013 09:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SportOrderDetail](
	[OrderID] [bigint] NOT NULL,
	[InventoryID] [bigint] NOT NULL,
	[DetailQuantity] [int] NOT NULL,
	[DetailUnitPrice] [money] NOT NULL,
 CONSTRAINT [OrderDetail_PK] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[InventoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SportOrderDetail] ([OrderID], [InventoryID], [DetailQuantity], [DetailUnitPrice]) VALUES (1, 3, 1, 8595.0000)
INSERT [dbo].[SportOrderDetail] ([OrderID], [InventoryID], [DetailQuantity], [DetailUnitPrice]) VALUES (1, 18, 1, 45.9500)
INSERT [dbo].[SportOrderDetail] ([OrderID], [InventoryID], [DetailQuantity], [DetailUnitPrice]) VALUES (2, 27, 1, 95.9900)
INSERT [dbo].[SportOrderDetail] ([OrderID], [InventoryID], [DetailQuantity], [DetailUnitPrice]) VALUES (2, 29, 1, 15.3900)
INSERT [dbo].[SportOrderDetail] ([OrderID], [InventoryID], [DetailQuantity], [DetailUnitPrice]) VALUES (2, 32, 4, 8.9900)
INSERT [dbo].[SportOrderDetail] ([OrderID], [InventoryID], [DetailQuantity], [DetailUnitPrice]) VALUES (3, 25, 1, 25.9500)
INSERT [dbo].[SportOrderDetail] ([OrderID], [InventoryID], [DetailQuantity], [DetailUnitPrice]) VALUES (4, 28, 1, 299.9500)
INSERT [dbo].[SportOrderDetail] ([OrderID], [InventoryID], [DetailQuantity], [DetailUnitPrice]) VALUES (4, 31, 2, 89.9900)
/****** Object:  Table [dbo].[SportInventory]    Script Date: 06/14/2013 09:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SportInventory](
	[InventoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[InventoryDescription] [varchar](100) NULL,
	[InventorySize] [varchar](5) NULL,
	[ColorDescription] [varchar](20) NULL,
	[InventoryQOH] [int] NOT NULL,
	[InventorySuggestedPrice] [money] NULL,
	[InventoryComments] [varchar](3000) NULL,
	[InventoryImageFilename] [varchar](30) NULL,
	[InventoryImageBinary] [image] NULL,
	[CategoryID] [bigint] NOT NULL,
	[SubCategoryID] [bigint] NULL,
	[SupplierID] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SportInventory] ON
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (1, N'RC 99', NULL, N'Red', 1, 12000.0000, N'991 CC Sport Motorcycle', N'rc55.jpg', NULL, 2, 5, 1)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (2, N'CR 250', NULL, N'Red', 2, 5499.0000, N'250 CC Motocross Motorcycle', N'cr250.jpg', NULL, 2, 4, 1)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (3, N'CRF 450', NULL, N'Red', 2, 7199.0000, N'450 CC Off Road Motorcycle', N'crf450.jpg', NULL, 2, 4, 1)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (4, N'KDX 220', NULL, N'Green', 2, 7199.0000, N'220 CC Off Road Motorcycle', N'kdx220.jpg', NULL, 2, 4, 2)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (5, N'NightFlyer', NULL, N'Metallic Green', 1, 8995.0000, N'1200 CC Standard Motorcycle', N'nightflyer.jpg', NULL, 2, 5, 2)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (6, N'Tour Master 1500', NULL, N'Pearlescent Silver', 1, 14950.0000, N'1500 CC Touring Motorcycle', N'tourmaster.jpg', NULL, 2, 5, 2)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (7, N'Custom', NULL, N'Yellow', 1, 2100.0000, N'150 CC Factory Customized Cruising Motorcycle', N'custom.jpg', NULL, 2, 5, 3)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (8, N'Sahara 600', NULL, N'Grey', 2, 7000.0000, N'600 CC Sport ATV', N'sahara600.jpg', NULL, 3, 7, 1)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (9, N'Mojave 400', NULL, N'Green', 1, 5199.0000, N'400 CC Sport/Utility ATV', N'mojave400.jpg', NULL, 3, 6, 2)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (10, N'Leather Gloves', N'XS', N'Black', 2, 34.9500, NULL, N'w_gloves.jpg', NULL, 1, 1, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (11, N'Leather Gloves', N'S', N'Black', 3, 34.9500, NULL, N'w_gloves.jpg', NULL, 1, 1, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (12, N'Leather Gloves', N'M', N'Black', 3, 34.9500, NULL, N'w_gloves.jpg', NULL, 1, 1, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (13, N'Leather Gloves', N'L', N'Black', 2, 34.9500, NULL, N'w_gloves.jpg', NULL, 1, 1, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (14, N'Leather Riding Pants', N'S', N'Black', 1, 149.9900, NULL, N'lr_pants.jpg', NULL, 1, 1, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (15, N'Leather Riding Pants', N'M', N'Black', 1, 149.9900, NULL, N'lr_pants.jpg', NULL, 1, 1, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (16, N'Leather Riding Pants', N'L', N'Black', 1, 149.9900, NULL, N'lr_pants.jpg', NULL, 1, 1, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (17, N'Riding Gloves', N'S', N'Black', 3, 45.9500, NULL, N'm_gloves.jpg', NULL, 1, 2, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (18, N'Riding Gloves', N'M', N'Black', 3, 45.9500, NULL, N'm_gloves.jpg', NULL, 1, 2, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (19, N'Riding Gloves', N'L', N'Black', 2, 45.9500, NULL, N'm_gloves.jpg', NULL, 1, 2, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (20, N'Riding Gloves', N'XL', N'Black', 2, 45.9500, NULL, N'm_gloves.jpg', NULL, 1, 2, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (21, N'Leather Chaps', N'S', N'Black', 1, 129.9900, NULL, N'l_chaps.jpg', NULL, 1, 2, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (22, N'Leather Chaps', N'M', N'Black', 1, 129.9900, NULL, N'l_chaps.jpg', NULL, 1, 2, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (23, N'Leather Chaps', N'L', N'Black', 1, 129.9900, NULL, N'l_chaps.jpg', NULL, 1, 2, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (24, N'ZZ Jersey', N'S', N'Black', 3, 25.9500, NULL, N'c_jersey.jpg', NULL, 1, 3, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (25, N'ZZ Jersey', N'M', N'Yellow', 3, 25.9500, NULL, N'c_jersey.jpg', NULL, 1, 3, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (26, N'ZZ Jersey', N'M', N'Orange', 2, 25.9500, NULL, N'c_jersey.jpg', NULL, 1, 3, 6)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (27, N'Chain Break and Rivet Tool', NULL, NULL, 5, 95.9900, NULL, N'chaintool.jpg', NULL, 5, 8, 4)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (28, N'Large capacity gas tank', NULL, NULL, 2, 299.9500, NULL, N'largegastank.jpg', NULL, 5, 8, 4)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (29, N'140 Main Jet', NULL, NULL, 4, 15.3900, NULL, N'mainjet.jpg', NULL, 5, 8, 4)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (30, N'145 Main Jet', NULL, NULL, 2, 15.3900, NULL, N'mainjet.jpg', NULL, 5, 8, 4)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (31, N'190x17 Tire', NULL, NULL, 2, 89.9900, NULL, N'tire.jpg', NULL, 5, 8, 4)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (32, N'Super Synthetic Oil', NULL, NULL, 50, 8.9900, NULL, N'syntheticoil.jpg', NULL, 5, 11, 4)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (33, N'#12 Bolt', NULL, NULL, 25, 0.5000, NULL, N'12bolt.jpg', NULL, 5, 11, 4)
INSERT [dbo].[SportInventory] ([InventoryID], [InventoryDescription], [InventorySize], [ColorDescription], [InventoryQOH], [InventorySuggestedPrice], [InventoryComments], [InventoryImageFilename], [InventoryImageBinary], [CategoryID], [SubCategoryID], [SupplierID]) VALUES (34, N'Oil Filter', NULL, NULL, 45, 9.9000, NULL, N'oilfilter.jpg', NULL, 5, 11, 4)
SET IDENTITY_INSERT [dbo].[SportInventory] OFF
/****** Object:  Default [DF_SportOrder_OrderNetTotal]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportOrder] ADD  CONSTRAINT [DF_SportOrder_OrderNetTotal]  DEFAULT ((0)) FOR [OrderNetTotal]
GO
/****** Object:  ForeignKey [FK_Employee_DepartmentID]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportEmployee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[SportDepartment] ([DepartmentID])
GO
ALTER TABLE [dbo].[SportEmployee] CHECK CONSTRAINT [FK_Employee_DepartmentID]
GO
/****** Object:  ForeignKey [FK_SportEmployee_Manager]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportEmployee]  WITH CHECK ADD  CONSTRAINT [FK_SportEmployee_Manager] FOREIGN KEY([EmployeeManagerID])
REFERENCES [dbo].[SportEmployee] ([EmployeeID])
GO
ALTER TABLE [dbo].[SportEmployee] CHECK CONSTRAINT [FK_SportEmployee_Manager]
GO
/****** Object:  ForeignKey [FK_SportDepartmentDeptManagerID_SportDepartmentDeptID]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportDepartment]  WITH CHECK ADD  CONSTRAINT [FK_SportDepartmentDeptManagerID_SportDepartmentDeptID] FOREIGN KEY([DepartmentManagerID])
REFERENCES [dbo].[SportEmployee] ([EmployeeID])
GO
ALTER TABLE [dbo].[SportDepartment] CHECK CONSTRAINT [FK_SportDepartmentDeptManagerID_SportDepartmentDeptID]
GO
/****** Object:  ForeignKey [Supplier_StateAbbreviation_FK]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportSupplier]  WITH CHECK ADD  CONSTRAINT [Supplier_StateAbbreviation_FK] FOREIGN KEY([StateAbbreviation])
REFERENCES [dbo].[SportState] ([StateAbbreviation])
GO
ALTER TABLE [dbo].[SportSupplier] CHECK CONSTRAINT [Supplier_StateAbbreviation_FK]
GO
/****** Object:  ForeignKey [FK_SubCategory_CategoryID]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[SportCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[SportSubCategory] CHECK CONSTRAINT [FK_SubCategory_CategoryID]
GO
/****** Object:  ForeignKey [FK_Order_CustomerID]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[SportCustomer] ([CustomerID])
GO
ALTER TABLE [dbo].[SportOrder] CHECK CONSTRAINT [FK_Order_CustomerID]
GO
/****** Object:  ForeignKey [FK_Order_EmployeeID]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[SportEmployee] ([EmployeeID])
GO
ALTER TABLE [dbo].[SportOrder] CHECK CONSTRAINT [FK_Order_EmployeeID]
GO
/****** Object:  ForeignKey [FK_Order_PaymentType]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentType] FOREIGN KEY([PaymentType])
REFERENCES [dbo].[SportPaymentType] ([PaymentType])
GO
ALTER TABLE [dbo].[SportOrder] CHECK CONSTRAINT [FK_Order_PaymentType]
GO
/****** Object:  ForeignKey [Customer_StateAbbreviation_FK]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportCustomer]  WITH CHECK ADD  CONSTRAINT [Customer_StateAbbreviation_FK] FOREIGN KEY([StateAbbreviation])
REFERENCES [dbo].[SportState] ([StateAbbreviation])
GO
ALTER TABLE [dbo].[SportCustomer] CHECK CONSTRAINT [Customer_StateAbbreviation_FK]
GO
/****** Object:  ForeignKey [FK_OrderDetail_InventoryID]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_InventoryID] FOREIGN KEY([InventoryID])
REFERENCES [dbo].[SportInventory] ([InventoryID])
GO
ALTER TABLE [dbo].[SportOrderDetail] CHECK CONSTRAINT [FK_OrderDetail_InventoryID]
GO
/****** Object:  ForeignKey [FK_OrderDetail_OrderID]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[SportOrder] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SportOrderDetail] CHECK CONSTRAINT [FK_OrderDetail_OrderID]
GO
/****** Object:  ForeignKey [FK_Inventory_CategoryID]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportInventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[SportCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[SportInventory] CHECK CONSTRAINT [FK_Inventory_CategoryID]
GO
/****** Object:  ForeignKey [FK_Inventory_ColorDescription]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportInventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_ColorDescription] FOREIGN KEY([ColorDescription])
REFERENCES [dbo].[SportColor] ([ColorDescription])
GO
ALTER TABLE [dbo].[SportInventory] CHECK CONSTRAINT [FK_Inventory_ColorDescription]
GO
/****** Object:  ForeignKey [FK_Inventory_SubcategoryID]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportInventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_SubcategoryID] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SportSubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[SportInventory] CHECK CONSTRAINT [FK_Inventory_SubcategoryID]
GO
/****** Object:  ForeignKey [FK_Inventory_SupplierID]    Script Date: 06/14/2013 09:17:44 ******/
ALTER TABLE [dbo].[SportInventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[SportSupplier] ([SupplierID])
GO
ALTER TABLE [dbo].[SportInventory] CHECK CONSTRAINT [FK_Inventory_SupplierID]
GO

-- LAB WORKING : 

-- #1 --
CREATE FUNCTION dbo.recieveTotalCost(@orderID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @costTotal DECIMAL(10,2)
	SELECT @costTotal = SUM(SportOrderDetail.DetailQuantity * SportOrderDetail.DetailUnitPrice)
	FROM SportOrder INNER JOIN SportOrderDetail
	ON SportOrder.OrderID = SportOrderDetail.OrderID
	WHERE SportOrder.OrderID = @orderID
	RETURN @costTotal
END
GO 

-- #2 --
SELECT
    SO.OrderID,
    SO.OrderDate,
    SO.OrderNetTotal,
    dbo.recieveTotalCost(SO.OrderID) AS 'CalculatedTotal'
FROM
    SportOrder AS SO;

-- #3 --
-- INSERT -- 
CREATE TRIGGER trg_SportOrderDetail_Insert
ON SportOrderDetail
AFTER INSERT
AS
BEGIN
    UPDATE SportOrder
    SET OrderNetTotal = dbo.recieveTotalCost(SportOrder.OrderID)
    FROM SportOrder
    INNER JOIN inserted ON SportOrder.OrderID = inserted.OrderID;
END
GO

-- UPDATE --
CREATE TRIGGER trg_SportOrderDetail_Update
ON SportOrderDetail
AFTER UPDATE
AS
BEGIN
    UPDATE SportOrder
    SET OrderNetTotal = dbo.recieveTotalCost(SportOrder.OrderID)
    FROM SportOrder
    INNER JOIN inserted ON SportOrder.OrderID = inserted.OrderID;
END
GO

-- DELETE --
CREATE TRIGGER trg_SportOrderDetail_Delete
ON SportOrderDetail
AFTER DELETE
AS
BEGIN
    UPDATE SportOrder
    SET OrderNetTotal = dbo.recieveTotalCost(SportOrder.OrderID)
    FROM SportOrder
    INNER JOIN deleted ON SportOrder.OrderID = deleted.OrderID;
END
GO

-- #4 --
-- SELECTALL --
CREATE PROCEDURE dbo.SelectAllSportEmployees
AS
BEGIN
    SELECT * FROM SportEmployee;
END
GO

-- SELECTBYID --
CREATE PROCEDURE dbo.SelectSportEmployeeByID
    @employeeID INT
AS
BEGIN
    SELECT * FROM SportEmployee WHERE EmployeeID = @employeeID;
END
GO

-- INSERT --
CREATE PROCEDURE dbo.InsertSportEmployee
    @EmployeeLastName VARCHAR(30),
	@EmployeeFirstName VARCHAR(30),
	@EmployeeMI VARCHAR(30),
	@EmployeeDOB DATETIME,
	@EmployeeManagerID BIGINT,
	@EmployeeHireDate DATETIME,
	@EmployeeHomePhone VARCHAR(20),
	@EmployeePhotoFilename VARCHAR(30),
	@EmployeePhotoBinary IMAGE,
	@EmployeeCommission DECIMAL(18, 0),
	@DepartmentID BIGINT,
	@EmployeeUsername VARCHAR(35),
	@EmployeePassword VARCHAR(20)
AS
BEGIN
    INSERT INTO SportEmployee (EmployeeLastName, EmployeeFirstName, EmployeeMI, EmployeeDOB,
	                           EmployeeManagerID, EmployeeHireDate, EmployeeHomePhone,
							   EmployeePhotoFilename, EmployeePhotoBinary, EmployeeCommission,
							   DepartmentID, EmployeeUsername, EmployeePassword)

    VALUES (@EmployeeLastName, @EmployeeFirstName, @EmployeeMI, @EmployeeDOB,
	                           @EmployeeManagerID, @EmployeeHireDate, @EmployeeHomePhone,
							   @EmployeePhotoFilename, @EmployeePhotoBinary, @EmployeeCommission,
							   @DepartmentID, @EmployeeUsername, @EmployeePassword);
END
GO

-- UPDATE --
CREATE PROCEDURE dbo.UpdateSportEmployee
    @EmployeeID BIGINT,
    @EmployeeLastName VARCHAR(30),
	@EmployeeFirstName VARCHAR(30),
	@EmployeeMI VARCHAR(30),
	@EmployeeDOB DATETIME,
	@EmployeeManagerID BIGINT,
	@EmployeeHireDate DATETIME,
	@EmployeeHomePhone VARCHAR(20),
	@EmployeePhotoFilename VARCHAR(30),
	@EmployeePhotoBinary IMAGE,
	@EmployeeCommission DECIMAL(18, 0),
	@DepartmentID BIGINT,
	@EmployeeUsername VARCHAR(35),
	@EmployeePassword VARCHAR(20)
AS
BEGIN
    UPDATE SportEmployee
    SET EmployeeLastName = @EmployeeLastName,
	    EmployeeFirstName = @EmployeeFirstName,
		EmployeeMI = @EmployeeMI,
		EmployeeDOB = @EmployeeDOB,
		EmployeeManagerID = @EmployeeManagerID,
		EmployeeHireDate = @EmployeeHireDate,
		EmployeeHomePhone = @EmployeeHomePhone,
		EmployeePhotoFilename = @EmployeePhotoFilename,
		EmployeePhotoBinary = @EmployeePhotoBinary,
		EmployeeCommission = @EmployeeCommission,
		DepartmentID = @DepartmentID,
		EmployeeUsername = @EmployeeUsername,
		EmployeePassword = @EmployeePassword
    WHERE EmployeeID = @EmployeeID;
END
GO

-- DELETE --
CREATE PROCEDURE dbo.DeleteSportEmployee
    @employeeID INT
AS
BEGIN
    DELETE FROM SportEmployee WHERE EmployeeID = @employeeID;
END
GO


