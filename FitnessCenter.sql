/****** Object:  Database [FitnessCenter]    Script Date: 31.05.2015 12:55:47 ******/
DROP DATABASE [FitnessCenter]
GO
/****** Object:  Database [FitnessCenter]    Script Date: 31.05.2015 12:55:47 ******/
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
USE [FitnessCenter]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[ActivityTypes]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[Clients]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[Discounts]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[EmployeeImages]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[EmployeePositions]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[RoomImages]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[Rooms]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[TicketOrders]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[Tickets]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[Timetable]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  Table [dbo].[UsersToRoles]    Script Date: 31.05.2015 12:55:47 ******/
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
SET IDENTITY_INSERT [dbo].[Activities] ON 

INSERT [dbo].[Activities] ([Id], [Name], [Description], [TypeId], [Duration]) VALUES (4, N'Pilates beg', N'Уровень подготовки: Рекомендуется посещение минимум 4х занятий Pilates beg до начала тренировки Pilates mat и Allegro intro.
Введение в метод PILATES. Изучение базовых принципов и основ техники выполнения упражнений системы Пилатес. ', 3, CAST(N'00:55:00' AS Time))
INSERT [dbo].[Activities] ([Id], [Name], [Description], [TypeId], [Duration]) VALUES (5, N'Pilates mat', N'Уровень подготовки: Рекомендуется после освоения программы Pilates Beg.
Класс направлен на поддержание мышечного тонуса, улучшение мышечного баланса, контроля над телом и развитие координации движения. Возможно использование оборудования (изотонического кольца, фитболов, резиновых амортизаторов).', 3, CAST(N'00:55:00' AS Time))
INSERT [dbo].[Activities] ([Id], [Name], [Description], [TypeId], [Duration]) VALUES (6, N'Stretch', N'Уровень подготовки: Для любого уровня подготовленности.
Класс с использованием упражнений на растягивание и расслабление.', 3, CAST(N'00:40:00' AS Time))
INSERT [dbo].[Activities] ([Id], [Name], [Description], [TypeId], [Duration]) VALUES (7, N'Yoga', N'Проверенная тысячелетиями практика развития личности – через физическое совершенствование тела к внутренней гармонии. Часовое занятие на нормализацию психоэмоционального состояния в целом, повышение силы и гибкости.', 3, CAST(N'01:20:00' AS Time))
INSERT [dbo].[Activities] ([Id], [Name], [Description], [TypeId], [Duration]) VALUES (8, N'Yoga beg', N'Класс с использованием базовых элементов программы Йоги. Первая ступень в освоении проверенной тысячелетиями практика развития личности. ', 3, CAST(N'00:55:00' AS Time))
INSERT [dbo].[Activities] ([Id], [Name], [Description], [TypeId], [Duration]) VALUES (9, N'Trekking', N'Урок проводится на беговых дорожках. Интервальная тренировка с чередованием нагрузки и отдыха. Параметры нагрузки задаются за счет изменения скорости и угла наклона дорожки.', 4, CAST(N'00:30:00' AS Time))
INSERT [dbo].[Activities] ([Id], [Name], [Description], [TypeId], [Duration]) VALUES (10, N'A-Intro', N'Введение в аэробику, рекомендуется для начинающих.', 5, CAST(N'00:45:00' AS Time))
INSERT [dbo].[Activities] ([Id], [Name], [Description], [TypeId], [Duration]) VALUES (11, N'Bodybalance', N'Программа, сочетающая базовые элементы программ Mind Body: йога, пилатес, тай-чи и др. Контроль над дыханием, концентрация, гибкость и силовые упражнения создают целостную тренировочную систему, которая приводит тело, разум и сознание в состояние равновесия и гармонии. ', 6, CAST(N'00:55:00' AS Time))
SET IDENTITY_INSERT [dbo].[Activities] OFF
SET IDENTITY_INSERT [dbo].[ActivityTypes] ON 

INSERT [dbo].[ActivityTypes] ([Id], [Name], [Description]) VALUES (2, N'Групповые занятия', NULL)
INSERT [dbo].[ActivityTypes] ([Id], [Name], [Description]) VALUES (3, N'ЙОГА | ПИЛАТЕС | MIND BODY | ТРЕНИРОВКА НА РАСТЯГИВАНИЕ', NULL)
INSERT [dbo].[ActivityTypes] ([Id], [Name], [Description]) VALUES (4, N'Занятия на беговых дорожках', NULL)
INSERT [dbo].[ActivityTypes] ([Id], [Name], [Description]) VALUES (5, N'КЛАССИЧЕСКАЯ АЭРОБИКА | AEROBICS TRAINING', NULL)
INSERT [dbo].[ActivityTypes] ([Id], [Name], [Description]) VALUES (6, N'ПРОГРАММЫ LES MILLS', N'Все программы Les Mills разрабатываются профессиональными хореографами, физиотерапевтами, музыкальными редакторами и проходят апробацию в Институте Les Mills в Новой Зеландии.
Программы Les Mills отличает заданный формат: все элементы урока (нагрузка, чередование мышечных групп, режим работы, паузы для отдыха) объединены в строгую, научно обоснованную последовательность. Занимающиеся выкладываются в полную силу по ходу всего занятия, не оставляя энергию на потом, потому что знают, что будет дальше. Это позволяет увеличить эффект от занятия на 15–20% (данные Института Les Mills). Хореография программ Les Mills проста, доступна и вместе с тем максимально эффективна. Первостепенным принципом всех программ Les Mills является безопасность. Заданный формат хореографии позволяет занимающимся контролировать свой прогресс, ставить новые задачи и поэтому добиваться лучших результатов. Программы Les Mills подходят для любого уровня подготовленности. Они разработаны таким образом, что на одном уроке могут заниматься как новички, так и подготовленные спортсмены, при этом каждый будет работать на пределе собственных возможностей, добиваясь максимального результата. Тренировку проводят только прошедшие специальное обучение и сертификацию инструкторы.')
SET IDENTITY_INSERT [dbo].[ActivityTypes] OFF
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [Name], [Surname], [MiddleName], [BirthdayDate], [Address], [Phone], [Gender]) VALUES (5, N'Иван', N'Иванов', N'Иванович', CAST(N'2000-03-01' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [MiddleName], [BirthdayDate], [Address], [Phone], [Gender]) VALUES (6, N'Петр', N'Петров', N'Петрович', CAST(N'1980-05-10' AS Date), NULL, N'89001546806', NULL)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [MiddleName], [BirthdayDate], [Address], [Phone], [Gender]) VALUES (7, N'Алия', N'Худоржабова', N'Махмедовна', CAST(N'1990-07-15' AS Date), N'ул. Матроскина, д.150', N'605718', NULL)
SET IDENTITY_INSERT [dbo].[Clients] OFF
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([Id], [TicketId], [Value], [StartDate], [EndDate]) VALUES (1, 2, 45, CAST(N'2015-05-10' AS Date), CAST(N'2015-06-10' AS Date))
INSERT [dbo].[Discounts] ([Id], [TicketId], [Value], [StartDate], [EndDate]) VALUES (2, 3, 15, CAST(N'2015-05-10' AS Date), CAST(N'2015-05-25' AS Date))
SET IDENTITY_INSERT [dbo].[Discounts] OFF
SET IDENTITY_INSERT [dbo].[EmployeeImages] ON 

INSERT [dbo].[EmployeeImages] ([Id], [EmployeeId], [FileName]) VALUES (1, 2, N'52e29071-7330-4ced-8065-e1e9bdabd51a.jpg')
INSERT [dbo].[EmployeeImages] ([Id], [EmployeeId], [FileName]) VALUES (2, 3, N'aeb0375b-2f99-497d-8278-d5f1997d1de6.jpg')
INSERT [dbo].[EmployeeImages] ([Id], [EmployeeId], [FileName]) VALUES (3, 4, N'44af6aac-b6e2-490f-a474-3fe17c72e1d0.jpg')
SET IDENTITY_INSERT [dbo].[EmployeeImages] OFF
SET IDENTITY_INSERT [dbo].[EmployeePositions] ON 

INSERT [dbo].[EmployeePositions] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[EmployeePositions] ([Id], [Name]) VALUES (2, N'Менеджер')
INSERT [dbo].[EmployeePositions] ([Id], [Name]) VALUES (3, N'Инструктор')
INSERT [dbo].[EmployeePositions] ([Id], [Name]) VALUES (4, N'Врач')
INSERT [dbo].[EmployeePositions] ([Id], [Name]) VALUES (5, N'Охранник')
SET IDENTITY_INSERT [dbo].[EmployeePositions] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Name], [Surname], [MiddleName], [Description], [Salary], [PositionId], [Address], [Phone], [BirthdayDate], [AcceptanceDate], [LeaveDate], [Education]) VALUES (1, N'Пупкин', N'Василий', N'Васильевич', NULL, CAST(9000.00 AS Decimal(10, 2)), 2, N'Леронтова, 2', N'89271515900', CAST(N'1950-05-05' AS Date), CAST(N'2015-05-30' AS Date), NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [MiddleName], [Description], [Salary], [PositionId], [Address], [Phone], [BirthdayDate], [AcceptanceDate], [LeaveDate], [Education]) VALUES (2, N'Степанов', N'Карл', NULL, N'Мастер спорта  России по офицерскому четырехборью, неоднократный призер чемпионатов ВВ по офицерскому четырехборью. КМС по самбо, неоднократный Чемпион и призер областных первенств по самбо.', CAST(8000.00 AS Decimal(10, 2)), 3, NULL, NULL, CAST(N'1980-10-10' AS Date), CAST(N'2015-05-30' AS Date), NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [MiddleName], [Description], [Salary], [PositionId], [Address], [Phone], [BirthdayDate], [AcceptanceDate], [LeaveDate], [Education]) VALUES (3, N'Семен', N'Николаев', N'Степанович', N'Окончил Колледж бодибилдинга и фитнеса им. Б.Вейдера в г.Санкт-Петербург со стажировкой в клубе премиум класса Fit Fasion (г. С-Петербург). Участник семинаров по питанию и диетологии. Опыт тренировок под руководством Саратовских чемпионов, Питерских  спортсменов мирового уровня ( Кодзоев, Кириленко).', CAST(7000.00 AS Decimal(10, 2)), 3, NULL, NULL, NULL, CAST(N'2015-05-30' AS Date), NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [MiddleName], [Description], [Salary], [PositionId], [Address], [Phone], [BirthdayDate], [AcceptanceDate], [LeaveDate], [Education]) VALUES (4, N'Дарья', N'Осипова', N'Игоревна', N'Инструктор групповых программ. Персональный тренер. Член федерации Фитнес Аэробики России. Сертифицированный инструктор: пилатес, йога и каланетика. Сертифицированный инструктор Федерации Фитнес Аэробики России «Классическая Аэробика». Участница международной конвенции World Class.', CAST(10000.00 AS Decimal(10, 2)), 3, NULL, NULL, NULL, CAST(N'2015-05-30' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[RoomImages] ON 

INSERT [dbo].[RoomImages] ([Id], [FileName], [RoomId]) VALUES (1, N'c3cc57ba-caa9-4a9f-ab4c-c0f0ebd4102a.jpeg', 3)
INSERT [dbo].[RoomImages] ([Id], [FileName], [RoomId]) VALUES (2, N'7f074366-1887-4c57-8868-db15c978833e.jpg', 4)
INSERT [dbo].[RoomImages] ([Id], [FileName], [RoomId]) VALUES (3, N'2e7b7022-6060-41b0-8298-82b1656504f8.jpg', 5)
SET IDENTITY_INSERT [dbo].[RoomImages] OFF
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [Description], [Name], [Capacity], [Area]) VALUES (3, N'Общая площадь 110 кв.м.
Количество мест на занятии ограничивается форматом тренировки. Большое количество занимающихся недопустимо, так как комфорт и травмобезопасность упражнений  снижаются. ', N'Зал групповых программ', NULL, NULL)
INSERT [dbo].[Rooms] ([Id], [Description], [Name], [Capacity], [Area]) VALUES (4, N'Площадь 140 кв. м.
Тренажеры кардио-линии для укрепления сердца и сжигания жира. 

С помощью кардио-тренажеров вы можете укрепить сердечно-сосудистую систему, скорректировать вес, повысить выносливость, укрепить дыхательную систему. 
Для занятий вы можете выбрать любой из понравившихся вам тренажеров, и вам никогда не надоест заниматься, ведь вашему выбору мы предлагаем: беговые дорожки, степеры, велотренажеры, элептические тренажеры таких известных производителей как "Panatta Sport" и "Precor". 

Во время нахождения на тренажере вы можете просматривать спутниковое телевидение или слушать музыку.', N'Зал кардио тренировок', NULL, NULL)
INSERT [dbo].[Rooms] ([Id], [Description], [Name], [Capacity], [Area]) VALUES (5, N'Это новый комфортный зал для занятий йогой, созданный для Вас с теплом и любовью.
Это настоящий оазис спокойствия и тишины!
Оригинальный интерьер зала, раздевалки с душевыми кабинами, новые коврики, пледы и даже подушки в восточном стиле - все это поможет вам забыть о городской суете и с легкостью настроиться на глубокую практику!', N'Зал для занятий йогой', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[TicketOrders] ON 

INSERT [dbo].[TicketOrders] ([Id], [TicketId], [ActivationDate], [OrderDate], [ClientId], [ManagerId]) VALUES (2, 2, CAST(N'2015-05-30' AS Date), CAST(N'2015-05-30' AS Date), 5, 1)
INSERT [dbo].[TicketOrders] ([Id], [TicketId], [ActivationDate], [OrderDate], [ClientId], [ManagerId]) VALUES (3, 3, CAST(N'2015-05-30' AS Date), CAST(N'2015-05-30' AS Date), 6, 1)
INSERT [dbo].[TicketOrders] ([Id], [TicketId], [ActivationDate], [OrderDate], [ClientId], [ManagerId]) VALUES (4, 4, CAST(N'2015-05-30' AS Date), CAST(N'2015-05-30' AS Date), 7, 1)
SET IDENTITY_INSERT [dbo].[TicketOrders] OFF
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [Name], [Cost], [AvailableFrom], [AvailableTo], [Duration]) VALUES (2, N'Утро, 3 месяца', CAST(1200.00 AS Decimal(10, 2)), CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 3)
INSERT [dbo].[Tickets] ([Id], [Name], [Cost], [AvailableFrom], [AvailableTo], [Duration]) VALUES (3, N'Стандарт', CAST(500.00 AS Decimal(10, 2)), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[Tickets] ([Id], [Name], [Cost], [AvailableFrom], [AvailableTo], [Duration]) VALUES (4, N'Вечерняя, 3 месяца', CAST(1500.00 AS Decimal(10, 2)), CAST(N'16:00:00' AS Time), CAST(N'22:00:00' AS Time), 3)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
SET IDENTITY_INSERT [dbo].[Timetable] ON 

INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (6, 5, 8, 4, CAST(N'08:00:00' AS Time), 1)
INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (7, 5, 8, 4, CAST(N'08:00:00' AS Time), 3)
INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (8, 5, 8, 4, CAST(N'08:00:00' AS Time), 5)
INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (9, 5, 7, 4, CAST(N'07:00:00' AS Time), 2)
INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (10, 5, 7, 4, CAST(N'07:15:00' AS Time), 4)
INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (11, 4, 9, 3, CAST(N'15:00:00' AS Time), 6)
INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (12, 3, 10, 4, CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (13, 3, 10, 4, CAST(N'12:00:00' AS Time), 3)
INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (14, 3, 10, 4, CAST(N'12:00:00' AS Time), 5)
INSERT [dbo].[Timetable] ([Id], [RoomId], [ActivityId], [EmployeeId], [StartTime], [DayOfWeek]) VALUES (15, 5, 4, 2, CAST(N'10:00:00' AS Time), 7)
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
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activities_ActivityTypes]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Tickets] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
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
ON UPDATE CASCADE
ON DELETE CASCADE
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
ON UPDATE CASCADE
ON DELETE CASCADE
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
/****** Object:  StoredProcedure [dbo].[DeleteActivity]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteActivityType]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteClient]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteDiscount]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteEmployeeImage]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteRoom]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteRoomImage]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteTicket]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteTicketOrder]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteTimetable]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetActivities]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetActivitiesByType]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetActivity]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetActivityType]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetActivityTypes]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetClient]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetClients]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetDiscount]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetDiscounts]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetEmployee]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetEmployeeImages]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPosition]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPositions]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetRoom]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetRoomImages]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetRooms]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTicket]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTicketOrder]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTicketOrders]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTickets]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTimetable]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTimetables]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserByLogin]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserByLoginPassword]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserRoles]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertActivity]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertActivityType]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertClient]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertDiscount]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertEmployeeImage]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertRoom]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertRoomImage]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertTicket]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertTicketOrder]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertTimetable]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateActivity]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateActivityType]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateClient]    Script Date: 31.05.2015 12:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateClient]
	@Name nvarchar(MAX),
	@Surname nvarchar(MAX),
	@MiddleName nvarchar(MAX),
	@Birthday date,
	@Address nvarchar(MAX),
	@Phone nvarchar(100),
	@Gender bit,
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Clients
	SET
		Name = @Name,
		Surname = @Surname,
		MiddleName = @MiddleName,
		BirthdayDate = @Birthday,
		Address = @Address,
		Phone = @Phone,
		Gender = @Gender
	WHERE Id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateDiscount]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateRoom]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateTicket]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateTicketOrder]    Script Date: 31.05.2015 12:55:47 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateTimetable]    Script Date: 31.05.2015 12:55:47 ******/
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
