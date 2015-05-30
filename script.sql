USE [FitnessCenter]
GO
/****** Object:  StoredProcedure [dbo].[UpdateTimetable]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[UpdateTimetable]
GO
/****** Object:  StoredProcedure [dbo].[UpdateTicketOrder]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[UpdateTicketOrder]
GO
/****** Object:  StoredProcedure [dbo].[UpdateTicket]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[UpdateTicket]
GO
/****** Object:  StoredProcedure [dbo].[UpdateRoom]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[UpdateRoom]
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[UpdateEmployee]
GO
/****** Object:  StoredProcedure [dbo].[UpdateDiscount]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[UpdateDiscount]
GO
/****** Object:  StoredProcedure [dbo].[UpdateActivityType]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[UpdateActivityType]
GO
/****** Object:  StoredProcedure [dbo].[UpdateActivityToType]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[UpdateActivityToType]
GO
/****** Object:  StoredProcedure [dbo].[UpdateActivity]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[UpdateActivity]
GO
/****** Object:  StoredProcedure [dbo].[InsertTimetable]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[InsertTimetable]
GO
/****** Object:  StoredProcedure [dbo].[InsertTicketOrder]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[InsertTicketOrder]
GO
/****** Object:  StoredProcedure [dbo].[InsertTicket]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[InsertTicket]
GO
/****** Object:  StoredProcedure [dbo].[InsertRoomImage]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[InsertRoomImage]
GO
/****** Object:  StoredProcedure [dbo].[InsertRoom]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[InsertRoom]
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployeeImage]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[InsertEmployeeImage]
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[InsertEmployee]
GO
/****** Object:  StoredProcedure [dbo].[InsertDiscount]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[InsertDiscount]
GO
/****** Object:  StoredProcedure [dbo].[InsertClient]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[InsertClient]
GO
/****** Object:  StoredProcedure [dbo].[InsertActivityType]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[InsertActivityType]
GO
/****** Object:  StoredProcedure [dbo].[InsertActivityToType]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[InsertActivityToType]
GO
/****** Object:  StoredProcedure [dbo].[InsertActivity]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[InsertActivity]
GO
/****** Object:  StoredProcedure [dbo].[GetUserRoles]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetUserRoles]
GO
/****** Object:  StoredProcedure [dbo].[GetUserByLoginPassword]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetUserByLoginPassword]
GO
/****** Object:  StoredProcedure [dbo].[GetUserByLogin]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetUserByLogin]
GO
/****** Object:  StoredProcedure [dbo].[GetTimetables]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetTimetables]
GO
/****** Object:  StoredProcedure [dbo].[GetTimetable]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetTimetable]
GO
/****** Object:  StoredProcedure [dbo].[GetTickets]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetTickets]
GO
/****** Object:  StoredProcedure [dbo].[GetTicketOrders]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetTicketOrders]
GO
/****** Object:  StoredProcedure [dbo].[GetTicketOrder]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetTicketOrder]
GO
/****** Object:  StoredProcedure [dbo].[GetTicket]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetTicket]
GO
/****** Object:  StoredProcedure [dbo].[GetRooms]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetRooms]
GO
/****** Object:  StoredProcedure [dbo].[GetRoomImages]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetRoomImages]
GO
/****** Object:  StoredProcedure [dbo].[GetRoom]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetRoom]
GO
/****** Object:  StoredProcedure [dbo].[GetPositions]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetPositions]
GO
/****** Object:  StoredProcedure [dbo].[GetPosition]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetPosition]
GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetEmployees]
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeImages]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetEmployeeImages]
GO
/****** Object:  StoredProcedure [dbo].[GetEmployee]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetEmployee]
GO
/****** Object:  StoredProcedure [dbo].[GetDiscounts]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetDiscounts]
GO
/****** Object:  StoredProcedure [dbo].[GetDiscount]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetDiscount]
GO
/****** Object:  StoredProcedure [dbo].[GetClients]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetClients]
GO
/****** Object:  StoredProcedure [dbo].[GetClient]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetClient]
GO
/****** Object:  StoredProcedure [dbo].[GetActivityTypes]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetActivityTypes]
GO
/****** Object:  StoredProcedure [dbo].[GetActivityType]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetActivityType]
GO
/****** Object:  StoredProcedure [dbo].[GetActivity]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetActivity]
GO
/****** Object:  StoredProcedure [dbo].[GetActivitiesByType]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetActivitiesByType]
GO
/****** Object:  StoredProcedure [dbo].[GetActivities]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[GetActivities]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTimetable]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[DeleteTimetable]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTicketOrder]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[DeleteTicketOrder]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTicket]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[DeleteTicket]
GO
/****** Object:  StoredProcedure [dbo].[DeleteRoomImage]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[DeleteRoomImage]
GO
/****** Object:  StoredProcedure [dbo].[DeleteRoom]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[DeleteRoom]
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployeeImage]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[DeleteEmployeeImage]
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 30.05.2015 17:04:13 ******/
DROP PROCEDURE [dbo].[DeleteEmployee]
/****** Object:  Database [FitnessCenter]    Script Date: 30.05.2015 17:04:13 ******/
DROP DATABASE [FitnessCenter]
GO
/****** Object:  Database [FitnessCenter]    Script Date: 30.05.2015 17:04:13 ******/
CREATE DATABASE [FitnessCenter]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FitnessCenter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FitnessCenter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FitnessCenter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FitnessCenter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FitnessCenter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FitnessCenter] SET ARITHABORT OFF 
GO
ALTER DATABASE [FitnessCenter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FitnessCenter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FitnessCenter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FitnessCenter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FitnessCenter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FitnessCenter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FitnessCenter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FitnessCenter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FitnessCenter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FitnessCenter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FitnessCenter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FitnessCenter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FitnessCenter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FitnessCenter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FitnessCenter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FitnessCenter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FitnessCenter] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FitnessCenter] SET  MULTI_USER 
GO
ALTER DATABASE [FitnessCenter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FitnessCenter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FitnessCenter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FitnessCenter] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [FitnessCenter]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[TypeId] [int] NOT NULL,
	[Duration] [time](7) NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivityToTypes]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityToTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_ActivitiesToTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivityTypes]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_ActivityTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clients]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NULL,
	[BirthdayDate] [date] NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](100) NULL,
	[Gender] [bit] NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeImages]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[FileName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_EmployeeImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeePositions]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePositions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_EmployeePositions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Salary] [decimal](10, 2) NULL,
	[PositionId] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](100) NULL,
	[BirthdayDate] [date] NULL,
	[AcceptanceDate] [date] NOT NULL,
	[LeaveDate] [date] NULL,
	[Education] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomImages]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_RoomImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Capacity] [int] NULL,
	[Area] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TicketOrders]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NOT NULL,
	[ActivationDate] [date] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ClientId] [int] NOT NULL,
	[ManagerId] [int] NOT NULL,
 CONSTRAINT [PK_TicketOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[AvailableFrom] [time](7) NULL,
	[AvailableTo] [time](7) NULL,
	[Duration] [int] NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[ActivityId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[DayOfWeek] [int] NOT NULL,
 CONSTRAINT [PK_Timetable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersToRoles]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersToRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UsersToRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VisitRecords]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitRecords](
	[ClientId] [int] NOT NULL,
	[TimetableId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Activities] ON 

INSERT [dbo].[Activities] ([Id], [Name], [Description], [TypeId], [Duration]) VALUES (1, N'пап', N'опроапо', 1, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Activities] ([Id], [Name], [Description], [TypeId], [Duration]) VALUES (2, N'yuy', N'ut', 1, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Activities] ([Id], [Name], [Description], [TypeId], [Duration]) VALUES (3, N'Йога', NULL, 2, CAST(N'01:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Activities] OFF
SET IDENTITY_INSERT [dbo].[ActivityTypes] ON 

INSERT [dbo].[ActivityTypes] ([Id], [Name], [Description]) VALUES (1, N'рпра', N'парап')
INSERT [dbo].[ActivityTypes] ([Id], [Name], [Description]) VALUES (2, N'Групповые занятия', NULL)
SET IDENTITY_INSERT [dbo].[ActivityTypes] OFF
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [Name], [Surname], [MiddleName], [BirthdayDate], [Address], [Phone], [Gender]) VALUES (1, N'ghj', N'jkh', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [MiddleName], [BirthdayDate], [Address], [Phone], [Gender]) VALUES (2, N'hfgh', N'gfh', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [MiddleName], [BirthdayDate], [Address], [Phone], [Gender]) VALUES (3, N'ytut', N'jyt', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [MiddleName], [BirthdayDate], [Address], [Phone], [Gender]) VALUES (4, N'444', N'444', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Clients] OFF
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([Id], [TicketId], [Value], [StartDate], [EndDate]) VALUES (1, 2, 45, CAST(N'2015-05-10' AS Date), CAST(N'2015-06-10' AS Date))
SET IDENTITY_INSERT [dbo].[Discounts] OFF
SET IDENTITY_INSERT [dbo].[EmployeePositions] ON 

INSERT [dbo].[EmployeePositions] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[EmployeePositions] ([Id], [Name]) VALUES (2, N'Менеджер')
INSERT [dbo].[EmployeePositions] ([Id], [Name]) VALUES (3, N'Инструктор')
INSERT [dbo].[EmployeePositions] ([Id], [Name]) VALUES (4, N'Врач')
INSERT [dbo].[EmployeePositions] ([Id], [Name]) VALUES (5, N'Охранник')
SET IDENTITY_INSERT [dbo].[EmployeePositions] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Name], [Surname], [MiddleName], [Description], [Salary], [PositionId], [Address], [Phone], [BirthdayDate], [AcceptanceDate], [LeaveDate], [Education]) VALUES (1, N'Пупкин', N'Василий', N'Васильевич', NULL, CAST(9000.00 AS Decimal(10, 2)), 2, N'Леронтова, 2', N'89271515900', CAST(N'1950-05-05' AS Date), CAST(N'2015-05-30' AS Date), NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [MiddleName], [Description], [Salary], [PositionId], [Address], [Phone], [BirthdayDate], [AcceptanceDate], [LeaveDate], [Education]) VALUES (2, N'Степанов', N'Карл', NULL, NULL, CAST(8000.00 AS Decimal(10, 2)), 3, NULL, NULL, CAST(N'1980-10-10' AS Date), CAST(N'2015-05-30' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [Description], [Name], [Capacity], [Area]) VALUES (1, NULL, N'Синий зал', NULL, NULL)
INSERT [dbo].[Rooms] ([Id], [Description], [Name], [Capacity], [Area]) VALUES (2, NULL, N'Красный зал', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[TicketOrders] ON 

INSERT [dbo].[TicketOrders] ([Id], [TicketId], [ActivationDate], [OrderDate], [ClientId], [ManagerId]) VALUES (1, 2, CAST(N'2015-05-30' AS Date), CAST(N'2015-05-30' AS Date), 4, 1)
SET IDENTITY_INSERT [dbo].[TicketOrders] OFF
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [Name], [Cost], [AvailableFrom], [AvailableTo], [Duration]) VALUES (2, N'Утро, 3 месяца', CAST(1200.00 AS Decimal(10, 2)), CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 3)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
SET IDENTITY_INSERT [dbo].[Timetable] ON 

INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (1, 2, 3, 2, CAST(N'08:00:00' AS Time), 4)
INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (2, 2, 3, 2, CAST(N'06:00:00' AS Time), 1)
INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (3, 1, 1, 2, CAST(N'09:00:00' AS Time), 5)
INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (4, 1, 1, 2, CAST(N'07:00:00' AS Time), 5)
SET IDENTITY_INSERT [dbo].[Timetable] OFF
INSERT [dbo].[UserRoles] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[UserRoles] ([Id], [Name]) VALUES (2, N'Manager')
INSERT [dbo].[UserRoles] ([Id], [Name]) VALUES (4, N'Account')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Login], [Password]) VALUES (1, N'admin', N'admin', N'123')
INSERT [dbo].[Users] ([Id], [Name], [Login], [Password]) VALUES (2, N'manager', N'manager', N'123')
INSERT [dbo].[Users] ([Id], [Name], [Login], [Password]) VALUES (3, N'account', N'account', N'123')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UsersToRoles] ON 

INSERT [dbo].[UsersToRoles] ([Id], [UserId], [RoleId]) VALUES (1, 1, 1)
INSERT [dbo].[UsersToRoles] ([Id], [UserId], [RoleId]) VALUES (2, 2, 2)
INSERT [dbo].[UsersToRoles] ([Id], [UserId], [RoleId]) VALUES (3, 3, 4)
SET IDENTITY_INSERT [dbo].[UsersToRoles] OFF
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activities_ActivityTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[ActivityTypes] ([Id])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activities_ActivityTypes]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Tickets] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([Id])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Tickets]
GO
ALTER TABLE [dbo].[EmployeeImages]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeImages_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeImages] CHECK CONSTRAINT [FK_EmployeeImages_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_EmployeePositions] FOREIGN KEY([PositionId])
REFERENCES [dbo].[EmployeePositions] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_EmployeePositions]
GO
ALTER TABLE [dbo].[RoomImages]  WITH CHECK ADD  CONSTRAINT [FK_RoomImages_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoomImages] CHECK CONSTRAINT [FK_RoomImages_Rooms]
GO
ALTER TABLE [dbo].[TicketOrders]  WITH CHECK ADD  CONSTRAINT [FK_TicketOrders_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TicketOrders] CHECK CONSTRAINT [FK_TicketOrders_Clients]
GO
ALTER TABLE [dbo].[TicketOrders]  WITH CHECK ADD  CONSTRAINT [FK_TicketOrders_Employees] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[TicketOrders] CHECK CONSTRAINT [FK_TicketOrders_Employees]
GO
ALTER TABLE [dbo].[TicketOrders]  WITH CHECK ADD  CONSTRAINT [FK_TicketOrders_Tickets] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TicketOrders] CHECK CONSTRAINT [FK_TicketOrders_Tickets]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Activities] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activities] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_Activities]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_Employees]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_Rooms]
GO
ALTER TABLE [dbo].[UsersToRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersToRoles_UserRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRoles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersToRoles] CHECK CONSTRAINT [FK_UsersToRoles_UserRoles]
GO
ALTER TABLE [dbo].[UsersToRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersToRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersToRoles] CHECK CONSTRAINT [FK_UsersToRoles_Users]
GO
/****** Object:  StoredProcedure [dbo].[DeleteActivity]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[DeleteActivity] 
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Activities
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteActivityToType]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteActivityToType] 
	@ActivityId int,
	@TypeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM ActivityToTypes
	WHERE ActivityId = @ActivityId and TypeId = @TypeId

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteActivityType]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteActivityType] 
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM ActivityTypes
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteClient]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteClient] 
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Clients
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteDiscount]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteDiscount] 
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Discounts
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[DeleteEmployee] 
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Employees
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployeeImage]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteEmployeeImage] 
	@FileName nvarchar(MAX) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM EmployeeImages
	WHERE FileName = @FileName

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteRoom]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[DeleteRoom] 
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Rooms
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteRoomImage]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteRoomImage] 
	@FileName nvarchar(MAX) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM RoomImages
	WHERE FileName = @FileName

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteTicket]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteTicket] 
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Tickets
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteTicketOrder]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteTicketOrder] 
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM TicketOrders
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteTimetable]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteTimetable] 
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Timetable
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[GetActivities]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[GetActivities]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Activities;

END



GO
/****** Object:  StoredProcedure [dbo].[GetActivitiesByType]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetActivitiesByType]
@TypeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Activities	
	WHERE TypeId = @TypeId;

END



GO
/****** Object:  StoredProcedure [dbo].[GetActivity]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[GetActivity]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Activities
	WHERE Id = @Id;

END



GO
/****** Object:  StoredProcedure [dbo].[GetActivityType]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetActivityType]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM ActivityTypes
	WHERE Id = @Id;

END



GO
/****** Object:  StoredProcedure [dbo].[GetActivityTypes]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetActivityTypes]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM ActivityTypes;

END



GO
/****** Object:  StoredProcedure [dbo].[GetClient]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClient]
@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Clients
	WHERE Id = @Id;

END



GO
/****** Object:  StoredProcedure [dbo].[GetClients]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClients]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Clients;

END



GO
/****** Object:  StoredProcedure [dbo].[GetDiscount]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDiscount]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Discounts
	WHERE Id = @Id;

END



GO
/****** Object:  StoredProcedure [dbo].[GetDiscounts]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDiscounts]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Discounts;

END



GO
/****** Object:  StoredProcedure [dbo].[GetEmployee]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[GetEmployee]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Employees
	WHERE Id = @Id;

END



GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeImages]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmployeeImages]
	@EmployeeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM EmployeeImages
	WHERE EmployeeId = @EmployeeId;

END



GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[GetEmployees]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Employees;

END



GO
/****** Object:  StoredProcedure [dbo].[GetPosition]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPosition]
@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM EmployeePositions
	WHERE Id = @Id
END



GO
/****** Object:  StoredProcedure [dbo].[GetPositions]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPositions]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM EmployeePositions
END



GO
/****** Object:  StoredProcedure [dbo].[GetRoom]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[GetRoom]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Rooms
	WHERE Id = @Id;

END



GO
/****** Object:  StoredProcedure [dbo].[GetRoomImages]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRoomImages]
	@RoomId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM RoomImages
	WHERE RoomId = @RoomId;

END



GO
/****** Object:  StoredProcedure [dbo].[GetRooms]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[GetRooms]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Rooms;

END



GO
/****** Object:  StoredProcedure [dbo].[GetTicket]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTicket]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Tickets
	WHERE Id = @Id;

END



GO
/****** Object:  StoredProcedure [dbo].[GetTicketOrder]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTicketOrder]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM TicketOrders
	WHERE Id = @Id;

END



GO
/****** Object:  StoredProcedure [dbo].[GetTicketOrders]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTicketOrders]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM TicketOrders;

END



GO
/****** Object:  StoredProcedure [dbo].[GetTickets]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTickets]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Tickets;

END



GO
/****** Object:  StoredProcedure [dbo].[GetTimetable]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTimetable] 
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Timetable
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[GetTimetables]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTimetables] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Timetable

END



GO
/****** Object:  StoredProcedure [dbo].[GetUserByLogin]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByLogin]
	@Login nvarchar(MAX)
AS
BEGIN
	SELECT * FROM Users
	WHERE Login = @Login
END



GO
/****** Object:  StoredProcedure [dbo].[GetUserByLoginPassword]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByLoginPassword]
	@Login nvarchar(MAX),
	@Password nvarchar(MAX)
AS
BEGIN
	SELECT * FROM Users
	WHERE Login = @Login AND Password = @Password
END



GO
/****** Object:  StoredProcedure [dbo].[GetUserRoles]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserRoles] 
	@UserId int
AS
BEGIN
	SELECT UserRoles.Id, UserRoles.Name FROM UserRoles
	INNER JOIN UsersToRoles on UserRoles.Id = UsersToRoles.RoleId
	WHERE UsersToRoles.UserId = @UserId
END



GO
/****** Object:  StoredProcedure [dbo].[InsertActivity]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertActivity] 
	@Name nvarchar(MAX), 	
	@Description nvarchar(MAX),
	@TypeId int,
	@Duration time(7),
	@Id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Activities
	(
		Name,
		Description,
		TypeId,
		Duration
	)
	VALUES
	(
		@Name,
		@Description,
		@TypeId,
		@Duration
	)

	SELECT @Id = @@IDENTITY
END



GO
/****** Object:  StoredProcedure [dbo].[InsertActivityToType]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertActivityToType] 
	@ActivityId int,
	@TypeId int,
	@Id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO ActivityToTypes
	(
		ActivityId,
		TypeId
	)
	VALUES
	(
		@ActivityId,
		@TypeId
	)

	SELECT @Id = @@IDENTITY
END



GO
/****** Object:  StoredProcedure [dbo].[InsertActivityType]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertActivityType] 
	@Name nvarchar(MAX),
	@Description nvarchar(MAX),
	@Id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO ActivityTypes
	(
		Name,
		Description
	)
	VALUES
	(
		@Name,
		@Description
	)

	SELECT @Id = @@IDENTITY
END



GO
/****** Object:  StoredProcedure [dbo].[InsertClient]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertClient]
	@Name nvarchar(MAX),
	@Surname nvarchar(MAX),
	@MiddleName nvarchar(MAX),
	@Birthday date,
	@Address nvarchar(MAX),
	@Phone nvarchar(100),
	@Gender bit,
	@Id int OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Clients
	(
		Name,
		Surname,
		MiddleName,
		BirthdayDate,
		Address,
		Phone,
		Gender
	)
	VALUES
	(
		@Name,
		@Surname,
		@MiddleName,
		@Birthday,
		@Address,
		@Phone,
		@Gender
	)

	SELECT @Id = @@IDENTITY
END


GO
/****** Object:  StoredProcedure [dbo].[InsertDiscount]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertDiscount] 
	@TicketId int,
	@Value int,
	@StartDate date,
	@EndDate date,
	@Id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Discounts
	(
		TicketId,
		Value,
		StartDate,
		EndDate
	)
	VALUES
	(
		@TicketId,
		@Value,
		@StartDate,
		@EndDate
	)

	SELECT @Id = @@IDENTITY
END



GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertEmployee] 
	@Name nvarchar(MAX),
	@MiddleName nvarchar(MAX),
	@Surname nvarchar(MAX), 	
	@Description nvarchar(MAX),
	@Salary decimal(10,2),
	@PositionId int,
	@Address nvarchar(MAX),
	@Phone nvarchar(100),
	@BirthdayDate date,
	@AcceptanceDate date,
	@LeaveDate date,
	@Education nvarchar(MAX),
	@Id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Employees
	(
		Name,
		MiddleName,
		Surname,
		Description,
		Salary,
		PositionId,
		Address,
		Phone,
		BirthdayDate,
		AcceptanceDate,
		LeaveDate,
		Education
	)
	VALUES
	(
		@Name,
		@MiddleName,
		@Surname,
		@Description,
		@Salary,
		@PositionId,
		@Address,
		@Phone,
		@BirthdayDate,
		@AcceptanceDate,
		@LeaveDate,
		@Education
	)

	SELECT @Id = @@IDENTITY
END



GO
/****** Object:  StoredProcedure [dbo].[InsertEmployeeImage]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertEmployeeImage] 
	@EmployeeId int, 	
	@FileName nvarchar(MAX),
	@Id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO EmployeeImages
	(
		EmployeeId,
		FileName
	)
	VALUES
	(
		@EmployeeId,
		@FileName
	)

	SELECT @Id = @@IDENTITY
END



GO
/****** Object:  StoredProcedure [dbo].[InsertRoom]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertRoom] 
	@Name nvarchar(MAX), 	
	@Description nvarchar(MAX),
	@Capacity int,
	@Area decimal(18, 0),
	@Id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Rooms
	(
		Name,
		Description,
		Capacity,
		Area
	)
	VALUES
	(
		@Name,
		@Description,
		@Capacity,
		@Area
	)

	SELECT @Id = @@IDENTITY
END



GO
/****** Object:  StoredProcedure [dbo].[InsertRoomImage]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertRoomImage] 
	@RoomId int, 	
	@FileName nvarchar(MAX),
	@Id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO RoomImages
	(
		RoomId,
		FileName
	)
	VALUES
	(
		@RoomId,
		@FileName
	)

	SELECT @Id = @@IDENTITY
END



GO
/****** Object:  StoredProcedure [dbo].[InsertTicket]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertTicket] 
	@Name nvarchar(MAX), 	
	@Cost decimal(10, 2),
	@AvailableFrom time(7),
	@AvailableTo time(7),
	@Duration int,
	@Id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Tickets
	(
		Name,
		Cost,
		AvailableFrom,
		AvailableTo,
		Duration
	)
	VALUES
	(
		@Name,
		@Cost,
		@AvailableFrom,
		@AvailableTo,
		@Duration
	)

	SELECT @Id = @@IDENTITY
END



GO
/****** Object:  StoredProcedure [dbo].[InsertTicketOrder]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertTicketOrder] 
	@TicketId int,
	@ClientId int,
	@ManagerId int,
	@ActivationDate date,
	@OrderDate date,
	@Id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO TicketOrders
	(
		TicketId,
		ClientId,
		ManagerId,
		ActivationDate,
		OrderDate
	)
	VALUES
	(
		@TicketId,
		@ClientId,
		@ManagerId,
		@ActivationDate,
		@OrderDate
	)

	SELECT @Id = @@IDENTITY
END



GO
/****** Object:  StoredProcedure [dbo].[InsertTimetable]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertTimetable] 
	@RoomId int,
	@ActivityId int,
	@EmployeeId int,
	@StartTime time,
	@DayOfWeek int,
	@Id int OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Timetable
	(
		RoomId,
		ActivityId,
		EmployeeId,
		StartTime,
		DayOfWeek
	)
	VALUES
	(
		@RoomId,
		@ActivityId,
		@EmployeeId,
		@StartTime,
		@DayOfWeek
	)

	SELECT @Id = @@IDENTITY

END



GO
/****** Object:  StoredProcedure [dbo].[UpdateActivity]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateActivity] 
	@Name nvarchar(MAX), 	
	@Description nvarchar(MAX),
	@TypeId int,
	@Duration time(7),
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Activities
	SET
		Name = @Name,
		Description = @Description,
		TypeId = @TypeId,
		Duration = @Duration
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[UpdateActivityToType]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateActivityToType] 
	@ActivityId int,
	@TypeId int,
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE ActivityToTypes
	SET
		ActivityId = @ActivityId,
		TypeId = @TypeId
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[UpdateActivityType]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateActivityType] 
	@Name nvarchar(MAX),
	@Description nvarchar(MAX),
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE ActivityTypes
	SET
		Name = @Name,
		Description = @Description
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[UpdateDiscount]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateDiscount] 
	@TicketId int,
	@Value int,
	@StartDate date,
	@EndDate date,
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Discounts
	SET
		TicketId = @TicketId,
		Value = @Value,
		StartDate = @StartDate,
		EndDate = @EndDate
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateEmployee] 
	@Name nvarchar(MAX),
	@Surname nvarchar(MAX),
	@MiddleName nvarchar(MAX), 	
	@Description nvarchar(MAX),
	@Salary decimal(10,2),
	@PositionId int,
	@Address nvarchar(MAX),
	@Phone nvarchar(100),
	@BirthdayDate date,
	@AcceptanceDate date,
	@LeaveDate date,
	@Education nvarchar(MAX),
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Employees
	SET
		Name = @Name,
		Surname = @Surname,
		MiddleName = @MiddleName,
		Description = @Description,
		Salary = @Salary,
		PositionId = @PositionId,
		Address = @Address,
		Phone = @Phone,
		BirthdayDate = @BirthdayDate,
		AcceptanceDate = @AcceptanceDate,
		LeaveDate = @LeaveDate,
		Education = @Education
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[UpdateRoom]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateRoom] 
	@Name nvarchar(MAX), 	
	@Description nvarchar(MAX),
	@Capacity int,
	@Area decimal(18,0),
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Rooms
	SET
		Name = @Name,
		Description = @Description,
		Capacity = @Capacity,
		Area = @Area
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[UpdateTicket]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTicket] 
	@Name nvarchar(MAX), 	
	@Cost decimal(10, 2),
	@AvailableFrom time(7),
	@AvailableTo time(7),
	@Duration int,
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Tickets
	SET
		Name = @Name,
		Cost = @Cost,
		AvailableFrom = @AvailableFrom,
		AvailableTo = @AvailableTo,
		Duration = @Duration
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[UpdateTicketOrder]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTicketOrder] 
	@TicketId int,
	@ClientId int,
	@ManagerId int,
	@ActivationDate date,
	@OrderDate date,
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE TicketOrders
	SET
		TicketId = @TicketId,
		ClientId = @ClientId,
		ManagerId = @ManagerId,
		ActivationDate = @ActivationDate,
		OrderDate = @OrderDate
	WHERE Id = @Id

END



GO
/****** Object:  StoredProcedure [dbo].[UpdateTimetable]    Script Date: 30.05.2015 17:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTimetable] 
	@RoomId int,
	@ActivityId int,
	@EmployeeId int,
	@StartTime time,
	@DayOfWeek int,
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Timetable
	SET
		RoomId = @RoomId,
		ActivityId = @ActivityId,
		EmployeeId = @EmployeeId,
		StartTime = @StartTime,
		DayOfWeek = @DayOfWeek
	WHERE Id = @Id

END



GO
USE [master]
GO
ALTER DATABASE [FitnessCenter] SET  READ_WRITE 
GO
