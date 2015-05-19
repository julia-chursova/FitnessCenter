USE [master]
GO

/****** Object:  Database [FitnessCenter]    Script Date: 13.04.2015 7:48:13 ******/
CREATE DATABASE [FitnessCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FitnessCenter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FitnessCenter.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FitnessCenter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FitnessCenter_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [FitnessCenter] SET COMPATIBILITY_LEVEL = 120
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

ALTER DATABASE [FitnessCenter] SET HONOR_BROKER_PRIORITY OFF 
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

ALTER DATABASE [FitnessCenter] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [FitnessCenter] SET  READ_WRITE 
GO


USE [FitnessCenter]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 13.04.2015 7:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clients]    Script Date: 13.04.2015 7:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NULL,
	[TicketId] [int] NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 13.04.2015 7:49:27 ******/
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
	[PhotoFileName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 13.04.2015 7:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 13.04.2015 7:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[ValidFrom] [datetime] NOT NULL,
	[ValidTo] [datetime] NOT NULL,
	[AvailableFrom] [time](7) NULL,
	[AvailableTo] [time](7) NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TicketToActivities]    Script Date: 13.04.2015 7:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketToActivities](
	[ActivityId] [int] NOT NULL,
	[TicketId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 13.04.2015 7:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[ActivityId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Timetable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VisitRecords]    Script Date: 13.04.2015 7:49:27 ******/
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
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Tickets] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([Id])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Tickets]
GO
ALTER TABLE [dbo].[TicketToActivities]  WITH CHECK ADD  CONSTRAINT [FK_TicketToActivities_Activities] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activities] ([Id])
GO
ALTER TABLE [dbo].[TicketToActivities] CHECK CONSTRAINT [FK_TicketToActivities_Activities]
GO
ALTER TABLE [dbo].[TicketToActivities]  WITH CHECK ADD  CONSTRAINT [FK_TicketToActivities_Tickets] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([Id])
GO
ALTER TABLE [dbo].[TicketToActivities] CHECK CONSTRAINT [FK_TicketToActivities_Tickets]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Activities] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activities] ([Id])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_Activities]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_Employees]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_Rooms]
GO
ALTER TABLE [dbo].[VisitRecords]  WITH CHECK ADD  CONSTRAINT [FK_VisitRecords_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[VisitRecords] CHECK CONSTRAINT [FK_VisitRecords_Clients]
GO
ALTER TABLE [dbo].[VisitRecords]  WITH CHECK ADD  CONSTRAINT [FK_VisitRecords_Timetable] FOREIGN KEY([TimetableId])
REFERENCES [dbo].[Timetable] ([Id])
GO
ALTER TABLE [dbo].[VisitRecords] CHECK CONSTRAINT [FK_VisitRecords_Timetable]
GO
/****** Object:  StoredProcedure [dbo].[DeleteActivity]    Script Date: 13.04.2015 7:49:27 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 13.04.2015 7:49:27 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteRoom]    Script Date: 13.04.2015 7:49:27 ******/
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
/****** Object:  StoredProcedure [dbo].[GetActivities]    Script Date: 13.04.2015 7:49:27 ******/
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
/****** Object:  StoredProcedure [dbo].[GetActivity]    Script Date: 13.04.2015 7:49:27 ******/
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
/****** Object:  StoredProcedure [dbo].[GetEmployee]    Script Date: 13.04.2015 7:49:27 ******/
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
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 13.04.2015 7:49:27 ******/
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
/****** Object:  StoredProcedure [dbo].[GetRoom]    Script Date: 13.04.2015 7:49:27 ******/
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
/****** Object:  StoredProcedure [dbo].[GetRooms]    Script Date: 13.04.2015 7:49:27 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertActivity]    Script Date: 13.04.2015 7:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[InsertActivity] 
	@Name nvarchar(MAX), 	
	@Description nvarchar(MAX),
	@Id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Activities
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
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 13.04.2015 7:49:27 ******/
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
	@Surname nvarchar(MAX) NULL, 	
	@Description nvarchar(MAX) NULL,
	@PhotoFileName nvarchar(MAX) NULL,
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
		PhotoFileName
	)
	VALUES
	(
		@Name,
		@MiddleName,
		@Surname,
		@Description,
		@PhotoFileName
	)

	SELECT @Id = @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[InsertRoom]    Script Date: 13.04.2015 7:49:27 ******/
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
	@Description nvarchar(MAX) NULL,
	@Id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Rooms
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
/****** Object:  StoredProcedure [dbo].[UpdateActivity]    Script Date: 13.04.2015 7:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[UpdateActivity] 
	@Name nvarchar(MAX), 	
	@Description nvarchar(MAX),
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Activities
	SET
		Name = @Name,
		Description = @Description
	WHERE Id = @Id

END

GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 13.04.2015 7:49:27 ******/
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
	@MiddleName nvarchar(MAX) NULL, 	
	@Description nvarchar(MAX) NULL,
	@PhotoFileName nvarchar(MAX) NULL,
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
		PhotoFileName = @PhotoFileName
	WHERE Id = @Id

END

GO
/****** Object:  StoredProcedure [dbo].[UpdateRoom]    Script Date: 13.04.2015 7:49:27 ******/
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
	@Description nvarchar(MAX) NULL,
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Rooms
	SET
		Name = @Name,
		Description = @Description
	WHERE Id = @Id

END

GO
