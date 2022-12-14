USE [master]
GO
/****** Object:  Database [ParkingApartment]    Script Date: 8/1/2022 8:37:15 PM ******/
CREATE DATABASE [ParkingApartment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ParkingApartment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ParkingApartment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ParkingApartment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ParkingApartment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ParkingApartment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ParkingApartment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ParkingApartment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ParkingApartment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ParkingApartment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ParkingApartment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ParkingApartment] SET ARITHABORT OFF 
GO
ALTER DATABASE [ParkingApartment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ParkingApartment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ParkingApartment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ParkingApartment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ParkingApartment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ParkingApartment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ParkingApartment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ParkingApartment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ParkingApartment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ParkingApartment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ParkingApartment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ParkingApartment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ParkingApartment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ParkingApartment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ParkingApartment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ParkingApartment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ParkingApartment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ParkingApartment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ParkingApartment] SET  MULTI_USER 
GO
ALTER DATABASE [ParkingApartment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ParkingApartment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ParkingApartment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ParkingApartment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ParkingApartment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ParkingApartment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ParkingApartment] SET QUERY_STORE = OFF
GO
USE [ParkingApartment]
GO
/****** Object:  Table [dbo].[tblAccounts]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccounts](
	[idAccount] [nvarchar](50) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleID] [nvarchar](5) NOT NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblAccounts] PRIMARY KEY CLUSTERED 
(
	[idAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomers](
	[cusID] [nvarchar](50) NOT NULL,
	[cusName] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[vehicleID] [nvarchar](50) NOT NULL,
	[idAccount] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.tblCustomers] PRIMARY KEY CLUSTERED 
(
	[cusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedback](
	[idFeedback] [int] IDENTITY(1,1) NOT NULL,
	[cusID] [nvarchar](50) NOT NULL,
	[infoFeedBack] [nvarchar](250) NOT NULL,
	[rate] [nvarchar](250) NULL,
 CONSTRAINT [PK__tblFeedb__0E3142BC84C8D45D] PRIMARY KEY CLUSTERED 
(
	[idFeedback] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFloors]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFloors](
	[floorID] [nvarchar](50) NOT NULL,
	[floorName] [nvarchar](50) NOT NULL,
	[NumberOfSlot] [int] NOT NULL,
 CONSTRAINT [PK_tblFloor] PRIMARY KEY CLUSTERED 
(
	[floorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHistoryVehicle]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistoryVehicle](
	[historyID] [int] IDENTITY(1,1) NOT NULL,
	[vehicleID] [nvarchar](50) NOT NULL,
	[empID] [nvarchar](50) NOT NULL,
	[timeCheckIn] [nvarchar](50) NULL,
	[timeCheckOut] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblHistoryVehicle_1] PRIMARY KEY CLUSTERED 
(
	[historyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLongTermCard]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLongTermCard](
	[longCardID] [int] NOT NULL,
	[vehicleID] [nvarchar](50) NOT NULL,
	[cusID] [nvarchar](50) NOT NULL,
	[importDate] [nvarchar](50) NOT NULL,
	[expirationDate] [nvarchar](50) NOT NULL,
	[licensePlates] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblLongTermCard] PRIMARY KEY CLUSTERED 
(
	[longCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNews]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNews](
	[idNew] [nvarchar](10) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[infoNew] [nvarchar](500) NOT NULL,
	[image] [nvarchar](1000) NOT NULL,
	[dateSubmitted] [nvarchar](50) NOT NULL,
	[officeEmpID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblNews] PRIMARY KEY CLUSTERED 
(
	[idNew] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOfficeEmployees]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOfficeEmployees](
	[officeEmpID] [nvarchar](50) NOT NULL,
	[officeEmpName] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[idAccount] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblOfficeEmployees] PRIMARY KEY CLUSTERED 
(
	[officeEmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] NOT NULL,
	[orderDate] [nvarchar](50) NOT NULL,
	[total] [float] NOT NULL,
	[cusID] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] NOT NULL,
	[price] [float] NOT NULL,
	[timeStart] [nvarchar](50) NOT NULL,
	[timeEnd] [nvarchar](50) NOT NULL,
	[orderID] [int] NOT NULL,
	[slotID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblParkingAttendants]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblParkingAttendants](
	[empID] [nvarchar](50) NOT NULL,
	[empName] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[idAccount] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblParkingAttendants] PRIMARY KEY CLUSTERED 
(
	[empID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblParkingDetail]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblParkingDetail](
	[parkingDetailID] [int] IDENTITY(1,1) NOT NULL,
	[slotID] [nvarchar](50) NOT NULL,
	[timeStart] [nvarchar](50) NOT NULL,
	[timeEnd] [nvarchar](50) NOT NULL,
	[vehicleID] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[floorID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblParkingDetail_1] PRIMARY KEY CLUSTERED 
(
	[parkingDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblParkingSlots]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblParkingSlots](
	[slotID] [nvarchar](50) NOT NULL,
	[floorID] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[parkingDetailID] [int] NOT NULL,
 CONSTRAINT [PK_tblParkingSlots] PRIMARY KEY CLUSTERED 
(
	[slotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](5) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVehicles]    Script Date: 8/1/2022 8:37:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVehicles](
	[vehicleID] [nvarchar](50) NOT NULL,
	[cusID] [nvarchar](50) NOT NULL,
	[vehicleType] [nvarchar](50) NOT NULL,
	[licensePlates] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblVehicles] PRIMARY KEY CLUSTERED 
(
	[vehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA001', N'se150485', N'1', N'CUS', N'trungthse150485@fpt.edu.vn')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA002', N'se150492', N'1', N'PAT', N'nguyenldlse150492@fpt.edu.vn')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA003', N'se150409', N'1', N'OE', N'khanhhpse150409@fpt.edu.vn')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA004', N'se150477', N'1', N'OE', N'huyptse150477@fpt.edu.vn')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA005', N'se150357', N'1', N'CUS', N'cuonglqse150357@fpt.edu.vn')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA006', N'user', N'1', N'CUS', N'user1010@gmail.com')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA008', N'admin', N'1', N'OE', N'admin1010@gmail.com')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA009', N'baove', N'1', N'PAT', N'baove1010@gmail.com')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA010', N'se150445', N'1', N'CUS', N'phatphse150445@fpt.edu.vn')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA011', N'se150441', N'1', N'CUS', N'congtbse150441@fpt.edu.vn')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA012', N'se150150', N'1', N'CUS', N'se150150@gmail.com')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA013', N'se150151', N'1', N'CUS', N'se150151@gmail.com')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA014', N'se150152', N'1', N'CUS', N'se150152@gmail.com')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA015', N'se150153', N'1', N'CUS', N'se150153@gmail.com')
INSERT [dbo].[tblAccounts] ([idAccount], [userName], [password], [roleID], [email]) VALUES (N'PA016', N'se150154', N'1', N'CUS', N'se150154@gmail.com')
GO
INSERT [dbo].[tblCustomers] ([cusID], [cusName], [phone], [email], [vehicleID], [idAccount]) VALUES (N'C001', N'Tran Hieu Trung', N'0766884855', N'trungthse150485@fpt.edu.vn', N'CAR001', N'PA001')
INSERT [dbo].[tblCustomers] ([cusID], [cusName], [phone], [email], [vehicleID], [idAccount]) VALUES (N'C002', N'Le Quoc Cuong', N'0987678967', N'cuonglqse150357@fpt.edu.vn', N'CAR002', N'PA005')
INSERT [dbo].[tblCustomers] ([cusID], [cusName], [phone], [email], [vehicleID], [idAccount]) VALUES (N'C003', N'Toi la User', N'0000000000', N'ht10102001@gmail.com', N'CAR003', N'PA006')
INSERT [dbo].[tblCustomers] ([cusID], [cusName], [phone], [email], [vehicleID], [idAccount]) VALUES (N'C004', N'Pham Hung Phat', N'0987656784', N'phatphse150445@fpt.edu.vn', N'CAR004', N'PA010')
INSERT [dbo].[tblCustomers] ([cusID], [cusName], [phone], [email], [vehicleID], [idAccount]) VALUES (N'C005', N'Tran Ba Cong', N'098767895', N'congtbse150441@fpt.edu.vn', N'CAR005', N'PA011')
INSERT [dbo].[tblCustomers] ([cusID], [cusName], [phone], [email], [vehicleID], [idAccount]) VALUES (N'C006', N'Nguyen Van A', N'0909090998', N'se150150@gmail.com', N'M001', N'PA012')
INSERT [dbo].[tblCustomers] ([cusID], [cusName], [phone], [email], [vehicleID], [idAccount]) VALUES (N'C007', N'Nguyen Van B', N'0909090997', N'se150151@gmail.com', N'M002', N'PA013')
INSERT [dbo].[tblCustomers] ([cusID], [cusName], [phone], [email], [vehicleID], [idAccount]) VALUES (N'C008', N'Nguyen Van C', N'0909090996', N'se150152@gmail.com', N'M003', N'PA014')
INSERT [dbo].[tblCustomers] ([cusID], [cusName], [phone], [email], [vehicleID], [idAccount]) VALUES (N'C009', N'Nguyen Van D', N'0909090995', N'se150153@gmail.com', N'M004', N'PA015')
INSERT [dbo].[tblCustomers] ([cusID], [cusName], [phone], [email], [vehicleID], [idAccount]) VALUES (N'C010', N'Nguyen Van E', N'0909090994', N'se150154@gmail.com', N'M005', N'PA016')
GO
SET IDENTITY_INSERT [dbo].[tblFeedback] ON 

INSERT [dbo].[tblFeedback] ([idFeedback], [cusID], [infoFeedBack], [rate]) VALUES (1003, N'C001', N'qua tuyet', N'4')
INSERT [dbo].[tblFeedback] ([idFeedback], [cusID], [infoFeedBack], [rate]) VALUES (1004, N'C002', N'cung tam dc', N'3')
INSERT [dbo].[tblFeedback] ([idFeedback], [cusID], [infoFeedBack], [rate]) VALUES (1005, N'C003', N'qua nhiet tinh', N'5')
INSERT [dbo].[tblFeedback] ([idFeedback], [cusID], [infoFeedBack], [rate]) VALUES (1006, N'C004', N'yeu to quoc', N'5')
INSERT [dbo].[tblFeedback] ([idFeedback], [cusID], [infoFeedBack], [rate]) VALUES (1007, N'C005', N'yeu dong bao', N'5')
INSERT [dbo].[tblFeedback] ([idFeedback], [cusID], [infoFeedBack], [rate]) VALUES (1008, N'C001', N'tuyet hon chu tuyet', N'5')
SET IDENTITY_INSERT [dbo].[tblFeedback] OFF
GO
INSERT [dbo].[tblFloors] ([floorID], [floorName], [NumberOfSlot]) VALUES (N'A1', N'Block A1', 25)
INSERT [dbo].[tblFloors] ([floorID], [floorName], [NumberOfSlot]) VALUES (N'A2', N'Block A2', 25)
INSERT [dbo].[tblFloors] ([floorID], [floorName], [NumberOfSlot]) VALUES (N'B1', N'Block B1', 25)
INSERT [dbo].[tblFloors] ([floorID], [floorName], [NumberOfSlot]) VALUES (N'B2', N'Block B2', 25)
GO
SET IDENTITY_INSERT [dbo].[tblHistoryVehicle] ON 

INSERT [dbo].[tblHistoryVehicle] ([historyID], [vehicleID], [empID], [timeCheckIn], [timeCheckOut]) VALUES (15, N'CAR001', N'PAT001', N'2020-10-10', N'2020-9-10')
INSERT [dbo].[tblHistoryVehicle] ([historyID], [vehicleID], [empID], [timeCheckIn], [timeCheckOut]) VALUES (16, N'CAR002', N'PAT001', N'2020-10-11', N'2020-10-12')
INSERT [dbo].[tblHistoryVehicle] ([historyID], [vehicleID], [empID], [timeCheckIn], [timeCheckOut]) VALUES (17, N'CAR001', N'PAT002', N'2021-10-11', N'2021-10-12')
INSERT [dbo].[tblHistoryVehicle] ([historyID], [vehicleID], [empID], [timeCheckIn], [timeCheckOut]) VALUES (18, N'M001', N'PAT001', N'2021-10-11', N'2021-10-12')
INSERT [dbo].[tblHistoryVehicle] ([historyID], [vehicleID], [empID], [timeCheckIn], [timeCheckOut]) VALUES (21, N'M004', N'PAT002', N'2021-10-10', N'2021-10-11')
INSERT [dbo].[tblHistoryVehicle] ([historyID], [vehicleID], [empID], [timeCheckIn], [timeCheckOut]) VALUES (22, N'M003', N'PAT002', N'2021-10-10', N'2021-10-11')
INSERT [dbo].[tblHistoryVehicle] ([historyID], [vehicleID], [empID], [timeCheckIn], [timeCheckOut]) VALUES (23, N'CAR001', N'PAT002', N'2021-12-12', N'2021-12-13')
INSERT [dbo].[tblHistoryVehicle] ([historyID], [vehicleID], [empID], [timeCheckIn], [timeCheckOut]) VALUES (24, N'M005', N'PAT001', N'2022-7-7', N'2022-7-8')
INSERT [dbo].[tblHistoryVehicle] ([historyID], [vehicleID], [empID], [timeCheckIn], [timeCheckOut]) VALUES (25, N'M001', N'PAT001', N'2022-7-7', N'2022-7-8')
INSERT [dbo].[tblHistoryVehicle] ([historyID], [vehicleID], [empID], [timeCheckIn], [timeCheckOut]) VALUES (26, N'M004', N'PAT001', N'2022-7-7', N'2022-7-8')
SET IDENTITY_INSERT [dbo].[tblHistoryVehicle] OFF
GO
INSERT [dbo].[tblLongTermCard] ([longCardID], [vehicleID], [cusID], [importDate], [expirationDate], [licensePlates], [status]) VALUES (1, N'CAR001', N'C004', N'10/10/2001', N'10/10/2001', N'63A', 0)
INSERT [dbo].[tblLongTermCard] ([longCardID], [vehicleID], [cusID], [importDate], [expirationDate], [licensePlates], [status]) VALUES (2, N'M002', N'C008', N'10/10/2001', N'10/10/2001', N'63A', 1)
INSERT [dbo].[tblLongTermCard] ([longCardID], [vehicleID], [cusID], [importDate], [expirationDate], [licensePlates], [status]) VALUES (3, N'M002', N'C008', N'10/10/2001', N'10/10/2001', N'63A', 1)
INSERT [dbo].[tblLongTermCard] ([longCardID], [vehicleID], [cusID], [importDate], [expirationDate], [licensePlates], [status]) VALUES (4, N'M001', N'C004', N'10/10/2001', N'10/10/2001', N'63A', 0)
INSERT [dbo].[tblLongTermCard] ([longCardID], [vehicleID], [cusID], [importDate], [expirationDate], [licensePlates], [status]) VALUES (5, N'CAR001', N'C003', N'2001-10-10', N'2001-12-20', N'63A', 0)
INSERT [dbo].[tblLongTermCard] ([longCardID], [vehicleID], [cusID], [importDate], [expirationDate], [licensePlates], [status]) VALUES (6, N'M001', N'C003', N'2022-08-01', N'2022-09-01', N'63A', 0)
GO
INSERT [dbo].[tblOfficeEmployees] ([officeEmpID], [officeEmpName], [phone], [email], [idAccount]) VALUES (N'E001', N'Hoang Phi Khanh', N'0909090909', N'khanhhpse150409@fpt.edu.vn', N'PA003')
INSERT [dbo].[tblOfficeEmployees] ([officeEmpID], [officeEmpName], [phone], [email], [idAccount]) VALUES (N'E002', N'Pham Tuong Huy', N'0909090901', N'huyptse150477@fpt.edu.vn', N'PA004')
INSERT [dbo].[tblOfficeEmployees] ([officeEmpID], [officeEmpName], [phone], [email], [idAccount]) VALUES (N'E003', N'Tui la Admin', N'0000000000', N'admin1010@gmail.com', N'PA008')
GO
INSERT [dbo].[tblParkingAttendants] ([empID], [empName], [phone], [email], [idAccount]) VALUES (N'PAT001', N'Le Dinh Linh Nguyen', N'0987898712', N'nguyenldlse150492@fpt.edu.vn', N'PA002')
INSERT [dbo].[tblParkingAttendants] ([empID], [empName], [phone], [email], [idAccount]) VALUES (N'PAT002', N'Bao Ve', N'0909090901', N'baove1010@gmail.com', N'PA009')
GO
SET IDENTITY_INSERT [dbo].[tblParkingDetail] ON 

INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (1, N'SA001', N'Empty', N'Empty', N'Empty', 10000, N'A1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (2, N'SA002', N'Empty', N'Empty', N'Empty', 10000, N'A1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (3, N'SA003', N'Empty', N'Empty', N'Empty', 10000, N'A1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (4, N'SA004', N'Empty', N'Empty', N'Empty', 10000, N'A1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (5, N'SA005', N'Empty', N'Empty', N'Empty', 10000, N'A1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (6, N'SA006', N'Empty', N'Empty', N'Empty', 10000, N'A1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (7, N'SA007', N'Empty', N'Empty', N'Empty', 10000, N'A1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (8, N'SA008', N'Empty', N'Empty', N'Empty', 10000, N'A1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (9, N'SA009', N'Empty', N'Empty', N'Empty', 10000, N'A1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (10, N'SA010', N'Empty', N'Empty', N'Empty', 10000, N'A1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (11, N'SB001', N'Empty', N'Empty', N'Empty', 10000, N'B1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (12, N'SB002', N'Empty', N'Empty', N'Empty', 10000, N'B1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (13, N'SB003', N'Empty', N'Empty', N'Empty', 10000, N'B1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (14, N'SB004', N'Empty', N'Empty', N'Empty', 10000, N'B1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (15, N'SB005', N'Empty', N'Empty', N'Empty', 10000, N'B1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (16, N'SB006', N'Empty', N'Empty', N'Empty', 10000, N'B1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (17, N'SB007', N'Empty', N'Empty', N'Empty', 10000, N'B1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (18, N'SB008', N'Empty', N'Empty', N'Empty', 10000, N'B1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (19, N'SB009', N'Empty', N'Empty', N'Empty', 10000, N'B1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (20, N'SB010', N'Empty', N'Empty', N'Empty', 10000, N'B1')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (22, N'SA011', N'Empty', N'Empty', N'Empty', 10000, N'A2')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (24, N'SA012', N'Empty', N'Empty', N'Empty', 10000, N'A2')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (25, N'SA013', N'Empty', N'Empty', N'Empty', 10000, N'A2')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (26, N'SA014', N'Empty', N'Empty', N'Empty', 10000, N'A2')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (27, N'SA015', N'Empty', N'Empty', N'Empty', 10000, N'A2')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (28, N'SA016', N'Empty', N'Empty', N'Empty', 10000, N'A2')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (29, N'SA017', N'Empty', N'Empty', N'Empty', 10000, N'A2')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (30, N'SA018', N'Empty', N'Empty', N'Empty', 10000, N'A2')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (31, N'SA019', N'Empty', N'Empty', N'Empty', 10000, N'A2')
INSERT [dbo].[tblParkingDetail] ([parkingDetailID], [slotID], [timeStart], [timeEnd], [vehicleID], [price], [floorID]) VALUES (33, N'SA020', N'Empty', N'Empty', N'Empty', 10000, N'A2')
SET IDENTITY_INSERT [dbo].[tblParkingDetail] OFF
GO
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA001', N'A1', 1, 1)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA002', N'A1', 1, 2)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA003', N'A1', 1, 3)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA004', N'A1', 1, 4)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA005', N'A1', 1, 5)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA006', N'A1', 1, 6)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA007', N'A1', 1, 7)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA008', N'A1', 1, 8)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA009', N'A1', 1, 9)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA010', N'A1', 1, 10)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA011', N'A2', 1, 22)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA012', N'A2', 1, 24)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA013', N'A2', 1, 25)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA014', N'A2', 1, 26)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA015', N'A2', 1, 27)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA016', N'A2', 1, 28)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA017', N'A2', 1, 29)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA018', N'A2', 1, 30)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA019', N'A2', 1, 31)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SA020', N'A2', 1, 33)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SB001', N'B1', 1, 11)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SB002', N'B1', 1, 12)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SB003', N'B1', 1, 13)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SB004', N'B1', 1, 14)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SB005', N'B1', 1, 15)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SB006', N'B2', 1, 16)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SB007', N'B2', 1, 17)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SB008', N'B2', 1, 18)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SB009', N'B2', 1, 19)
INSERT [dbo].[tblParkingSlots] ([slotID], [floorID], [status], [parkingDetailID]) VALUES (N'SB010', N'B2', 1, 20)
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'CUS', N'Customers')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'OE', N'Office Employees')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'PAT', N'Parking Attendants')
GO
INSERT [dbo].[tblVehicles] ([vehicleID], [cusID], [vehicleType], [licensePlates]) VALUES (N'CAR001', N'C001', N'Car', N'63C1-19658')
INSERT [dbo].[tblVehicles] ([vehicleID], [cusID], [vehicleType], [licensePlates]) VALUES (N'CAR002', N'C002', N'Car', N'63C2-19657')
INSERT [dbo].[tblVehicles] ([vehicleID], [cusID], [vehicleType], [licensePlates]) VALUES (N'CAR003', N'C003', N'Car', N'63C1-19652')
INSERT [dbo].[tblVehicles] ([vehicleID], [cusID], [vehicleType], [licensePlates]) VALUES (N'CAR004', N'C004', N'Car', N'63C1-19651')
INSERT [dbo].[tblVehicles] ([vehicleID], [cusID], [vehicleType], [licensePlates]) VALUES (N'CAR005', N'C005', N'Car', N'63C1-19660')
INSERT [dbo].[tblVehicles] ([vehicleID], [cusID], [vehicleType], [licensePlates]) VALUES (N'Empty', N'Empty', N'Empty', N'Empty')
INSERT [dbo].[tblVehicles] ([vehicleID], [cusID], [vehicleType], [licensePlates]) VALUES (N'M001', N'C006', N'Moto', N'63C3-19656')
INSERT [dbo].[tblVehicles] ([vehicleID], [cusID], [vehicleType], [licensePlates]) VALUES (N'M002', N'C007', N'Moto', N'63C4-19655')
INSERT [dbo].[tblVehicles] ([vehicleID], [cusID], [vehicleType], [licensePlates]) VALUES (N'M003', N'C008', N'Moto', N'63C1-19650')
INSERT [dbo].[tblVehicles] ([vehicleID], [cusID], [vehicleType], [licensePlates]) VALUES (N'M004', N'C009', N'Moto', N'63C1-19654')
INSERT [dbo].[tblVehicles] ([vehicleID], [cusID], [vehicleType], [licensePlates]) VALUES (N'M005', N'C010', N'Moto', N'63C1-19653')
GO
ALTER TABLE [dbo].[tblAccounts]  WITH CHECK ADD  CONSTRAINT [FK_tblAccounts_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblAccounts] CHECK CONSTRAINT [FK_tblAccounts_tblRoles]
GO
ALTER TABLE [dbo].[tblCustomers]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomers_tblAccounts] FOREIGN KEY([idAccount])
REFERENCES [dbo].[tblAccounts] ([idAccount])
GO
ALTER TABLE [dbo].[tblCustomers] CHECK CONSTRAINT [FK_tblCustomers_tblAccounts]
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedback_tblCustomers] FOREIGN KEY([cusID])
REFERENCES [dbo].[tblCustomers] ([cusID])
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK_tblFeedback_tblCustomers]
GO
ALTER TABLE [dbo].[tblHistoryVehicle]  WITH CHECK ADD  CONSTRAINT [FK_tblHistoryVehicle_tblParkingAttendants] FOREIGN KEY([empID])
REFERENCES [dbo].[tblParkingAttendants] ([empID])
GO
ALTER TABLE [dbo].[tblHistoryVehicle] CHECK CONSTRAINT [FK_tblHistoryVehicle_tblParkingAttendants]
GO
ALTER TABLE [dbo].[tblHistoryVehicle]  WITH CHECK ADD  CONSTRAINT [FK_tblHistoryVehicle_tblVehicles1] FOREIGN KEY([vehicleID])
REFERENCES [dbo].[tblVehicles] ([vehicleID])
GO
ALTER TABLE [dbo].[tblHistoryVehicle] CHECK CONSTRAINT [FK_tblHistoryVehicle_tblVehicles1]
GO
ALTER TABLE [dbo].[tblLongTermCard]  WITH CHECK ADD  CONSTRAINT [FK_tblLongTermCard_tblVehicles1] FOREIGN KEY([vehicleID])
REFERENCES [dbo].[tblVehicles] ([vehicleID])
GO
ALTER TABLE [dbo].[tblLongTermCard] CHECK CONSTRAINT [FK_tblLongTermCard_tblVehicles1]
GO
ALTER TABLE [dbo].[tblNews]  WITH CHECK ADD  CONSTRAINT [FK_tblNews_tblOfficeEmployees] FOREIGN KEY([officeEmpID])
REFERENCES [dbo].[tblOfficeEmployees] ([officeEmpID])
GO
ALTER TABLE [dbo].[tblNews] CHECK CONSTRAINT [FK_tblNews_tblOfficeEmployees]
GO
ALTER TABLE [dbo].[tblOfficeEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tblOfficeEmployees_tblAccounts] FOREIGN KEY([idAccount])
REFERENCES [dbo].[tblAccounts] ([idAccount])
GO
ALTER TABLE [dbo].[tblOfficeEmployees] CHECK CONSTRAINT [FK_tblOfficeEmployees_tblAccounts]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblCustomers] FOREIGN KEY([cusID])
REFERENCES [dbo].[tblCustomers] ([cusID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblCustomers]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblParkingAttendants]  WITH CHECK ADD  CONSTRAINT [FK_tblParkingAttendants_tblAccounts] FOREIGN KEY([idAccount])
REFERENCES [dbo].[tblAccounts] ([idAccount])
GO
ALTER TABLE [dbo].[tblParkingAttendants] CHECK CONSTRAINT [FK_tblParkingAttendants_tblAccounts]
GO
ALTER TABLE [dbo].[tblParkingDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblParkingDetail_tblVehicles1] FOREIGN KEY([vehicleID])
REFERENCES [dbo].[tblVehicles] ([vehicleID])
GO
ALTER TABLE [dbo].[tblParkingDetail] CHECK CONSTRAINT [FK_tblParkingDetail_tblVehicles1]
GO
ALTER TABLE [dbo].[tblParkingSlots]  WITH CHECK ADD  CONSTRAINT [FK_tblParkingSlots_tblFloors] FOREIGN KEY([floorID])
REFERENCES [dbo].[tblFloors] ([floorID])
GO
ALTER TABLE [dbo].[tblParkingSlots] CHECK CONSTRAINT [FK_tblParkingSlots_tblFloors]
GO
ALTER TABLE [dbo].[tblParkingSlots]  WITH CHECK ADD  CONSTRAINT [FK_tblParkingSlots_tblParkingDetail] FOREIGN KEY([parkingDetailID])
REFERENCES [dbo].[tblParkingDetail] ([parkingDetailID])
GO
ALTER TABLE [dbo].[tblParkingSlots] CHECK CONSTRAINT [FK_tblParkingSlots_tblParkingDetail]
GO
USE [master]
GO
ALTER DATABASE [ParkingApartment] SET  READ_WRITE 
GO
