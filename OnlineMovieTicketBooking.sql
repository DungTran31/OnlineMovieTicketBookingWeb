USE [master]
GO
/****** Object:  Database [MovieTicketBooking]    Script Date: 10/25/2024 4:40:39 PM ******/
CREATE DATABASE [MovieTicketBooking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieTicketBooking', FILENAME = N'D:\SQLServer\MSSQL16.SQLEXPRESS\MSSQL\DATA\MovieTicketBooking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieTicketBooking_log', FILENAME = N'D:\SQLServer\MSSQL16.SQLEXPRESS\MSSQL\DATA\MovieTicketBooking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MovieTicketBooking] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieTicketBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieTicketBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MovieTicketBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieTicketBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieTicketBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MovieTicketBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieTicketBooking] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MovieTicketBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieTicketBooking] SET  MULTI_USER 
GO
ALTER DATABASE [MovieTicketBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieTicketBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieTicketBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieTicketBooking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieTicketBooking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieTicketBooking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MovieTicketBooking] SET QUERY_STORE = ON
GO
ALTER DATABASE [MovieTicketBooking] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MovieTicketBooking]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/25/2024 4:40:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookedTicket]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookedTicket](
	[CustomerId] [nvarchar](450) NOT NULL,
	[SoldTicketId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BookedTicket] PRIMARY KEY CLUSTERED 
(
	[SoldTicketId] ASC,
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[IdentityNumber] [nvarchar](50) NOT NULL,
	[RegistrationDate] [datetime2](7) NULL,
	[Gender] [nvarchar](10) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Duration] [int] NOT NULL,
	[AgeRestriction] [int] NOT NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[Language] [nvarchar](50) NULL,
	[Actors] [nvarchar](100) NULL,
	[Country] [nvarchar](50) NULL,
	[Producer] [nvarchar](100) NULL,
	[Summary] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[MovieGenreId] [int] NOT NULL,
	[Poster] [nvarchar](255) NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieGenre]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieGenre](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_MovieGenre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Screening]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Screening](
	[Id] [nvarchar](50) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[ScreeningDate] [datetime2](7) NOT NULL,
	[MovieFormat] [nvarchar](100) NULL,
	[MovieId] [nvarchar](50) NOT NULL,
	[ScreeningRoomId] [int] NOT NULL,
 CONSTRAINT [PK_Screening] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScreeningRoom]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScreeningRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RowCount] [int] NOT NULL,
	[SeatCount] [int] NOT NULL,
 CONSTRAINT [PK_ScreeningRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RowPosition] [nvarchar](50) NOT NULL,
	[SeatPosition] [int] NOT NULL,
	[IsChosen] [nvarchar](10) NOT NULL,
	[ScreeningRoomId] [int] NOT NULL,
	[SeatTypeId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Seat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatType]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatType](
	[Id] [nvarchar](50) NOT NULL,
	[SeatName] [nvarchar](100) NOT NULL,
	[Surcharge] [int] NOT NULL,
 CONSTRAINT [PK_SeatType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoldTicket]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoldTicket](
	[Id] [nvarchar](50) NOT NULL,
	[SoldDate] [datetime2](7) NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[ScreeningId] [nvarchar](50) NOT NULL,
	[TicketPriceId] [int] NOT NULL,
	[SeatId] [int] NOT NULL,
	[StaffId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_SoldTicket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[IdentityNumber] [nvarchar](50) NOT NULL,
	[HireDate] [datetime2](7) NOT NULL,
	[Gender] [nvarchar](10) NULL,
	[IsActive] [bit] NOT NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketPrice]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [int] NOT NULL,
	[Image] [nvarchar](255) NULL,
 CONSTRAINT [PK_TicketPrice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 10/25/2024 4:40:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241018143250_InitialCreate', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241024074027_AddImageToTicketPrice', N'8.0.10')
GO
INSERT [dbo].[BookedTicket] ([CustomerId], [SoldTicketId]) VALUES (N'KH01', N'VB01')
INSERT [dbo].[BookedTicket] ([CustomerId], [SoldTicketId]) VALUES (N'KH01', N'VB04')
INSERT [dbo].[BookedTicket] ([CustomerId], [SoldTicketId]) VALUES (N'KH02', N'VB02')
INSERT [dbo].[BookedTicket] ([CustomerId], [SoldTicketId]) VALUES (N'KH03', N'VB03')
INSERT [dbo].[BookedTicket] ([CustomerId], [SoldTicketId]) VALUES (N'KH04', N'VB05')
GO
INSERT [dbo].[Customer] ([Id], [FullName], [IdentityNumber], [RegistrationDate], [Gender]) VALUES (N'KH01', N'Nguyễn Văn T', N'123456789', CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), N'Nam')
INSERT [dbo].[Customer] ([Id], [FullName], [IdentityNumber], [RegistrationDate], [Gender]) VALUES (N'KH02', N'Trần Thị Y', N'987654321', CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), N'Nữ')
INSERT [dbo].[Customer] ([Id], [FullName], [IdentityNumber], [RegistrationDate], [Gender]) VALUES (N'KH03', N'Phạm Minh H', N'321321321', CAST(N'2024-03-01T00:00:00.0000000' AS DateTime2), N'Nam')
INSERT [dbo].[Customer] ([Id], [FullName], [IdentityNumber], [RegistrationDate], [Gender]) VALUES (N'KH04', N'Lê Thị K', N'654987321', CAST(N'2024-04-01T00:00:00.0000000' AS DateTime2), N'Nữ')
INSERT [dbo].[Customer] ([Id], [FullName], [IdentityNumber], [RegistrationDate], [Gender]) VALUES (N'KH05', N'Vũ Văn M', N'456123789', CAST(N'2024-05-01T00:00:00.0000000' AS DateTime2), N'Nam')
GO
INSERT [dbo].[Movie] ([Id], [Name], [Duration], [AgeRestriction], [ReleaseDate], [Language], [Actors], [Country], [Producer], [Summary], [Status], [IsDeleted], [MovieGenreId], [Poster]) VALUES (N'P01', N'Avengers: Endgame', 181, 13, CAST(N'2025-04-26T00:00:00.0000000' AS DateTime2), N'Tiếng Anh', N'Robert Downey Jr., Chris Evans', N'Mỹ', N'Marvel Studios', N'Cuộc chiến cuối cùng giữa các siêu anh hùng và Thanos', N'Đang chiếu', 0, 1, N'Avengers_Endgame.png')
INSERT [dbo].[Movie] ([Id], [Name], [Duration], [AgeRestriction], [ReleaseDate], [Language], [Actors], [Country], [Producer], [Summary], [Status], [IsDeleted], [MovieGenreId], [Poster]) VALUES (N'P02', N'Frozen II', 103, 0, CAST(N'2019-11-22T00:00:00.0000000' AS DateTime2), N'Tiếng Anh', N'Idina Menzel, Kristen Bell', N'Mỹ', N'Walt Disney Animation Studios', N'Hành trình mới của Elsa và Anna để khám phá quá khứ của gia đình họ', N'Đang chiếu', 0, 9, N'Frozen2.png')
INSERT [dbo].[Movie] ([Id], [Name], [Duration], [AgeRestriction], [ReleaseDate], [Language], [Actors], [Country], [Producer], [Summary], [Status], [IsDeleted], [MovieGenreId], [Poster]) VALUES (N'P03', N'Parasite', 132, 16, CAST(N'2019-05-30T00:00:00.0000000' AS DateTime2), N'Tiếng Hàn', N'Song Kang-ho, Lee Sun-kyun', N'Hàn Quốc', N'Barunson E&A', N'Câu chuyện về sự chênh lệch giàu nghèo trong xã hội Hàn Quốc', N'Đã chiếu', 0, 3, N'Parasite.png')
INSERT [dbo].[Movie] ([Id], [Name], [Duration], [AgeRestriction], [ReleaseDate], [Language], [Actors], [Country], [Producer], [Summary], [Status], [IsDeleted], [MovieGenreId], [Poster]) VALUES (N'P04', N'The Conjuring', 112, 18, CAST(N'2013-07-19T00:00:00.0000000' AS DateTime2), N'Tiếng Anh', N'Vera Farmiga, Patrick Wilson', N'Mỹ', N'New Line Cinema', N'Một cặp vợ chồng điều tra những hiện tượng siêu nhiên', N'Đã chiếu', 0, 3, N'The_Conjuring.png')
INSERT [dbo].[Movie] ([Id], [Name], [Duration], [AgeRestriction], [ReleaseDate], [Language], [Actors], [Country], [Producer], [Summary], [Status], [IsDeleted], [MovieGenreId], [Poster]) VALUES (N'P05', N'Avatar', 162, 13, CAST(N'2009-12-18T00:00:00.0000000' AS DateTime2), N'Tiếng Anh', N'Sam Worthington, Zoe Saldana', N'Mỹ', N'20th Century Fox', N'Một câu chuyện khoa học viễn tưởng về hành tinh Pandora', N'Đang chiếu', 0, 2, N'Avatar.png')
INSERT [dbo].[Movie] ([Id], [Name], [Duration], [AgeRestriction], [ReleaseDate], [Language], [Actors], [Country], [Producer], [Summary], [Status], [IsDeleted], [MovieGenreId], [Poster]) VALUES (N'P06', N'Mộ đom đóm', 89, 0, CAST(N'2024-10-04T00:00:00.0000000' AS DateTime2), N'Tiếng Nhật', N'Tatsumi Tsutomu, Shiraishi Ayano, Shinohara Yoshiko', N'Nhật Bản', N'Takahata Isao', N'Hai anh em Seita và Setsuko mất mẹ sau cuộc thả bom dữ dội của không quân Mỹ. Cả hai phải vật lộn để tồn tại ở Nhật Bản hậu Thế chiến II. ', N'Đang chiếu', 0, 9, N'Mo_dom_dom.png')
GO
SET IDENTITY_INSERT [dbo].[MovieGenre] ON 

INSERT [dbo].[MovieGenre] ([Id], [Name]) VALUES (1, N'Hành động')
INSERT [dbo].[MovieGenre] ([Id], [Name]) VALUES (2, N'Phiêu lưu')
INSERT [dbo].[MovieGenre] ([Id], [Name]) VALUES (3, N'Kinh dị')
INSERT [dbo].[MovieGenre] ([Id], [Name]) VALUES (4, N'Khoa học viễn tưởng')
INSERT [dbo].[MovieGenre] ([Id], [Name]) VALUES (5, N'Tâm lý')
INSERT [dbo].[MovieGenre] ([Id], [Name]) VALUES (6, N'Thể thao')
INSERT [dbo].[MovieGenre] ([Id], [Name]) VALUES (7, N'Lịch sử')
INSERT [dbo].[MovieGenre] ([Id], [Name]) VALUES (8, N'Tội phạm')
INSERT [dbo].[MovieGenre] ([Id], [Name]) VALUES (9, N'Hoạt hình')
INSERT [dbo].[MovieGenre] ([Id], [Name]) VALUES (10, N'Huyền ảo')
INSERT [dbo].[MovieGenre] ([Id], [Name]) VALUES (11, N'Lãng mạn')
SET IDENTITY_INSERT [dbo].[MovieGenre] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4e63b755-1b1e-430c-a017-61ba32c0ec18', N'Staff', N'STAFF', NULL)
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'4ff51bf8-fd33-418c-a763-139ca7b3bf27', N'Member', N'MEMBER', NULL)
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'cab054dc-71f0-4096-bb29-e1eea0889001', N'Administrator', N'ADMINISTRATOR', NULL)
GO
INSERT [dbo].[Screening] ([Id], [StartTime], [EndTime], [ScreeningDate], [MovieFormat], [MovieId], [ScreeningRoomId]) VALUES (N'SC01', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), CAST(N'2024-10-10T00:00:00.0000000' AS DateTime2), N'DD01', N'P01', 1)
INSERT [dbo].[Screening] ([Id], [StartTime], [EndTime], [ScreeningDate], [MovieFormat], [MovieId], [ScreeningRoomId]) VALUES (N'SC02', CAST(N'18:00:00' AS Time), CAST(N'20:30:00' AS Time), CAST(N'2024-10-10T00:00:00.0000000' AS DateTime2), N'DD02', N'P03', 2)
INSERT [dbo].[Screening] ([Id], [StartTime], [EndTime], [ScreeningDate], [MovieFormat], [MovieId], [ScreeningRoomId]) VALUES (N'SC03', CAST(N'20:00:00' AS Time), CAST(N'22:00:00' AS Time), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2), N'DD03', N'P02', 3)
INSERT [dbo].[Screening] ([Id], [StartTime], [EndTime], [ScreeningDate], [MovieFormat], [MovieId], [ScreeningRoomId]) VALUES (N'SC04', CAST(N'15:30:00' AS Time), CAST(N'17:30:00' AS Time), CAST(N'2024-10-12T00:00:00.0000000' AS DateTime2), N'DD04', N'P04', 4)
INSERT [dbo].[Screening] ([Id], [StartTime], [EndTime], [ScreeningDate], [MovieFormat], [MovieId], [ScreeningRoomId]) VALUES (N'SC05', CAST(N'10:00:00' AS Time), CAST(N'12:30:00' AS Time), CAST(N'2024-10-13T00:00:00.0000000' AS DateTime2), N'DD05', N'P05', 5)
GO
SET IDENTITY_INSERT [dbo].[ScreeningRoom] ON 

INSERT [dbo].[ScreeningRoom] ([Id], [RowCount], [SeatCount]) VALUES (1, 10, 15)
INSERT [dbo].[ScreeningRoom] ([Id], [RowCount], [SeatCount]) VALUES (2, 8, 12)
INSERT [dbo].[ScreeningRoom] ([Id], [RowCount], [SeatCount]) VALUES (3, 12, 18)
INSERT [dbo].[ScreeningRoom] ([Id], [RowCount], [SeatCount]) VALUES (4, 6, 10)
INSERT [dbo].[ScreeningRoom] ([Id], [RowCount], [SeatCount]) VALUES (5, 14, 20)
SET IDENTITY_INSERT [dbo].[ScreeningRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[Seat] ON 

INSERT [dbo].[Seat] ([Id], [RowPosition], [SeatPosition], [IsChosen], [ScreeningRoomId], [SeatTypeId]) VALUES (1, N'A', 1, N'Chưa chọn', 1, N'LG01')
INSERT [dbo].[Seat] ([Id], [RowPosition], [SeatPosition], [IsChosen], [ScreeningRoomId], [SeatTypeId]) VALUES (2, N'A', 2, N'Chưa chọn', 1, N'LG02')
INSERT [dbo].[Seat] ([Id], [RowPosition], [SeatPosition], [IsChosen], [ScreeningRoomId], [SeatTypeId]) VALUES (3, N'B', 3, N'Đã chọn', 1, N'LG03')
INSERT [dbo].[Seat] ([Id], [RowPosition], [SeatPosition], [IsChosen], [ScreeningRoomId], [SeatTypeId]) VALUES (4, N'C', 4, N'Chưa chọn', 2, N'LG04')
INSERT [dbo].[Seat] ([Id], [RowPosition], [SeatPosition], [IsChosen], [ScreeningRoomId], [SeatTypeId]) VALUES (5, N'D', 5, N'Đã chọn', 2, N'LG02')
SET IDENTITY_INSERT [dbo].[Seat] OFF
GO
INSERT [dbo].[SeatType] ([Id], [SeatName], [Surcharge]) VALUES (N'LG01', N'Ghế thường', 0)
INSERT [dbo].[SeatType] ([Id], [SeatName], [Surcharge]) VALUES (N'LG02', N'Ghế VIP', 50000)
INSERT [dbo].[SeatType] ([Id], [SeatName], [Surcharge]) VALUES (N'LG03', N'Ghế đôi', 100000)
INSERT [dbo].[SeatType] ([Id], [SeatName], [Surcharge]) VALUES (N'LG04', N'Ghế Deluxe', 75000)
GO
INSERT [dbo].[SoldTicket] ([Id], [SoldDate], [TotalPrice], [ScreeningId], [TicketPriceId], [SeatId], [StaffId]) VALUES (N'VB01', CAST(N'2024-10-10T00:00:00.0000000' AS DateTime2), 50000, N'SC01', 1, 1, N'NV01')
INSERT [dbo].[SoldTicket] ([Id], [SoldDate], [TotalPrice], [ScreeningId], [TicketPriceId], [SeatId], [StaffId]) VALUES (N'VB02', CAST(N'2024-10-10T00:00:00.0000000' AS DateTime2), 150000, N'SC02', 2, 2, N'NV02')
INSERT [dbo].[SoldTicket] ([Id], [SoldDate], [TotalPrice], [ScreeningId], [TicketPriceId], [SeatId], [StaffId]) VALUES (N'VB03', CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2), 180000, N'SC03', 3, 3, N'NV03')
INSERT [dbo].[SoldTicket] ([Id], [SoldDate], [TotalPrice], [ScreeningId], [TicketPriceId], [SeatId], [StaffId]) VALUES (N'VB04', CAST(N'2024-10-12T00:00:00.0000000' AS DateTime2), 200000, N'SC04', 3, 4, N'NV04')
INSERT [dbo].[SoldTicket] ([Id], [SoldDate], [TotalPrice], [ScreeningId], [TicketPriceId], [SeatId], [StaffId]) VALUES (N'VB05', CAST(N'2024-10-13T00:00:00.0000000' AS DateTime2), 180000, N'SC05', 3, 5, N'NV05')
GO
INSERT [dbo].[Staff] ([Id], [FullName], [IdentityNumber], [HireDate], [Gender], [IsActive], [Role]) VALUES (N'NV01', N'Nguyễn Văn A', N'123456789', CAST(N'2024-01-01T00:00:00.0000000' AS DateTime2), N'Nam', 1, N'Nhân viên bán vé')
INSERT [dbo].[Staff] ([Id], [FullName], [IdentityNumber], [HireDate], [Gender], [IsActive], [Role]) VALUES (N'NV02', N'Trần Thị B', N'987654321', CAST(N'2024-02-01T00:00:00.0000000' AS DateTime2), N'Nữ', 1, N'Quản lý')
INSERT [dbo].[Staff] ([Id], [FullName], [IdentityNumber], [HireDate], [Gender], [IsActive], [Role]) VALUES (N'NV03', N'Phạm Minh C', N'123123123', CAST(N'2024-03-01T00:00:00.0000000' AS DateTime2), N'Nam', 1, N'Nhân viên bán vé')
INSERT [dbo].[Staff] ([Id], [FullName], [IdentityNumber], [HireDate], [Gender], [IsActive], [Role]) VALUES (N'NV04', N'Lê Thị D', N'321321321', CAST(N'2024-04-01T00:00:00.0000000' AS DateTime2), N'Nữ', 1, N'Nhân viên bán vé')
INSERT [dbo].[Staff] ([Id], [FullName], [IdentityNumber], [HireDate], [Gender], [IsActive], [Role]) VALUES (N'NV05', N'Vũ Văn E', N'456456456', CAST(N'2024-05-01T00:00:00.0000000' AS DateTime2), N'Nam', 1, N'Nhân viên bán vé')
GO
SET IDENTITY_INSERT [dbo].[TicketPrice] ON 

INSERT [dbo].[TicketPrice] ([Id], [Name], [Price], [Image]) VALUES (1, N'Vé trẻ em', 50000, N'KidsText.png')
INSERT [dbo].[TicketPrice] ([Id], [Name], [Price], [Image]) VALUES (2, N'Vé người lớn', 100000, N'AdultsText.png')
INSERT [dbo].[TicketPrice] ([Id], [Name], [Price], [Image]) VALUES (3, N'Vé sinh viên', 80000, N'StudentsText.png')
INSERT [dbo].[TicketPrice] ([Id], [Name], [Price], [Image]) VALUES (4, N'Vé Deluxe', 200000, N'DeluxeText.png')
INSERT [dbo].[TicketPrice] ([Id], [Name], [Price], [Image]) VALUES (5, N'Vé người già', 80000, N'OldsterText.png')
SET IDENTITY_INSERT [dbo].[TicketPrice] OFF
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'ce76d8e4-98c2-4d6c-8d72-2b0798fd2587', N'cab054dc-71f0-4096-bb29-e1eea0889001')
GO
INSERT [dbo].[Users] ([Id], [Discriminator], [Address], [DateOfBirth], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ce76d8e4-98c2-4d6c-8d72-2b0798fd2587', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'admin', N'ADMIN', N'admin@example.com', N'ADMIN@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAEBLduOKFnEGWwD3DX3FBAGr0yd4TBqE/zF6DcI1saamhB0OOZpLz+LWubhff1qKQ/g==', N'ZOLCGJ4KKOCS3WDR4XIG4L72AVMX2NPR', N'9066a923-fa57-415f-a2df-47bc7e7a010b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Discriminator], [Address], [DateOfBirth], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'KH01', NULL, NULL, CAST(N'2024-10-18T14:30:00.1234567' AS DateTime2), N'kh01@example.com', N'KH01@EXAMPLE.COM', N'kh01@example.com', N'KH01@EXAMPLE.COM', 0, N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Discriminator], [Address], [DateOfBirth], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'KH02', NULL, NULL, CAST(N'2024-10-18T14:30:00.1234567' AS DateTime2), N'kh02@example.com', N'KH02@EXAMPLE.COM', N'kh02@example.com', N'KH02@EXAMPLE.COM', 0, N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Discriminator], [Address], [DateOfBirth], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'KH03', NULL, NULL, CAST(N'2024-10-18T14:30:00.1234567' AS DateTime2), N'kh03@example.com', N'KH03@EXAMPLE.COM', N'kh03@example.com', N'KH03@EXAMPLE.COM', 0, N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Discriminator], [Address], [DateOfBirth], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'KH04', NULL, NULL, CAST(N'2024-10-18T14:30:00.1234567' AS DateTime2), N'kh04@example.com', N'KH04@EXAMPLE.COM', N'kh04@example.com', N'KH04@EXAMPLE.COM', 0, N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Discriminator], [Address], [DateOfBirth], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'KH05', NULL, NULL, CAST(N'2024-10-18T14:30:00.1234567' AS DateTime2), N'kh05@example.com', N'KH05@EXAMPLE.COM', N'kh05@example.com', N'KH05@EXAMPLE.COM', 0, N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Discriminator], [Address], [DateOfBirth], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'NV01', NULL, NULL, CAST(N'2024-10-18T14:30:00.1234567' AS DateTime2), N'nv01@example.com', N'NV01@EXAMPLE.COM', N'nv01@example.com', N'NV01@EXAMPLE.COM', 0, N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Discriminator], [Address], [DateOfBirth], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'NV02', NULL, NULL, CAST(N'2024-10-18T14:30:00.1234567' AS DateTime2), N'nv02@example.com', N'NV02@EXAMPLE.COM', N'nv02@example.com', N'NV02@EXAMPLE.COM', 0, N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Discriminator], [Address], [DateOfBirth], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'NV03', NULL, NULL, CAST(N'2024-10-18T14:30:00.1234567' AS DateTime2), N'nv03@example.com', N'NV03@EXAMPLE.COM', N'nv03@example.com', N'NV03@EXAMPLE.COM', 0, N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Discriminator], [Address], [DateOfBirth], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'NV04', NULL, NULL, CAST(N'2024-10-18T14:30:00.1234567' AS DateTime2), N'nv04@example.com', N'NV04@EXAMPLE.COM', N'nv04@example.com', N'NV04@EXAMPLE.COM', 0, N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [Discriminator], [Address], [DateOfBirth], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'NV05', NULL, NULL, CAST(N'2024-10-18T14:30:00.1234567' AS DateTime2), N'nv05@example.com', N'NV05@EXAMPLE.COM', N'nv05@example.com', N'NV05@EXAMPLE.COM', 0, N'your_password_hash', N'your_security_stamp', N'your_concurrency_stamp', NULL, 0, 0, NULL, 1, 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BookedTicket_CustomerId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookedTicket_CustomerId] ON [dbo].[BookedTicket]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movie_MovieGenreId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Movie_MovieGenreId] ON [dbo].[Movie]
(
	[MovieGenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleClaims_RoleId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleClaims_RoleId] ON [dbo].[RoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[Roles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Screening_MovieId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Screening_MovieId] ON [dbo].[Screening]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Screening_ScreeningRoomId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Screening_ScreeningRoomId] ON [dbo].[Screening]
(
	[ScreeningRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Seat_ScreeningRoomId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Seat_ScreeningRoomId] ON [dbo].[Seat]
(
	[ScreeningRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Seat_SeatTypeId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Seat_SeatTypeId] ON [dbo].[Seat]
(
	[SeatTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SoldTicket_ScreeningId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_SoldTicket_ScreeningId] ON [dbo].[SoldTicket]
(
	[ScreeningId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SoldTicket_SeatId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_SoldTicket_SeatId] ON [dbo].[SoldTicket]
(
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SoldTicket_StaffId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_SoldTicket_StaffId] ON [dbo].[SoldTicket]
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SoldTicket_TicketPriceId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_SoldTicket_TicketPriceId] ON [dbo].[SoldTicket]
(
	[TicketPriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserClaims_UserId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserClaims_UserId] ON [dbo].[UserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserLogins_UserId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserLogins_UserId] ON [dbo].[UserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserRoles_RoleId]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleId] ON [dbo].[UserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[Users]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/25/2024 4:40:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[Users]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookedTicket]  WITH CHECK ADD  CONSTRAINT [FK_BookedTicket_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookedTicket] CHECK CONSTRAINT [FK_BookedTicket_Customer_CustomerId]
GO
ALTER TABLE [dbo].[BookedTicket]  WITH CHECK ADD  CONSTRAINT [FK_BookedTicket_SoldTicket_SoldTicketId] FOREIGN KEY([SoldTicketId])
REFERENCES [dbo].[SoldTicket] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookedTicket] CHECK CONSTRAINT [FK_BookedTicket_SoldTicket_SoldTicketId]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Users_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Users_Id]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_MovieGenre_MovieGenreId] FOREIGN KEY([MovieGenreId])
REFERENCES [dbo].[MovieGenre] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_MovieGenre_MovieGenreId]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[Screening]  WITH CHECK ADD  CONSTRAINT [FK_Screening_Movie_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Screening] CHECK CONSTRAINT [FK_Screening_Movie_MovieId]
GO
ALTER TABLE [dbo].[Screening]  WITH CHECK ADD  CONSTRAINT [FK_Screening_ScreeningRoom_ScreeningRoomId] FOREIGN KEY([ScreeningRoomId])
REFERENCES [dbo].[ScreeningRoom] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Screening] CHECK CONSTRAINT [FK_Screening_ScreeningRoom_ScreeningRoomId]
GO
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD  CONSTRAINT [FK_Seat_ScreeningRoom_ScreeningRoomId] FOREIGN KEY([ScreeningRoomId])
REFERENCES [dbo].[ScreeningRoom] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Seat] CHECK CONSTRAINT [FK_Seat_ScreeningRoom_ScreeningRoomId]
GO
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD  CONSTRAINT [FK_Seat_SeatType_SeatTypeId] FOREIGN KEY([SeatTypeId])
REFERENCES [dbo].[SeatType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Seat] CHECK CONSTRAINT [FK_Seat_SeatType_SeatTypeId]
GO
ALTER TABLE [dbo].[SoldTicket]  WITH CHECK ADD  CONSTRAINT [FK_SoldTicket_Screening_ScreeningId] FOREIGN KEY([ScreeningId])
REFERENCES [dbo].[Screening] ([Id])
GO
ALTER TABLE [dbo].[SoldTicket] CHECK CONSTRAINT [FK_SoldTicket_Screening_ScreeningId]
GO
ALTER TABLE [dbo].[SoldTicket]  WITH CHECK ADD  CONSTRAINT [FK_SoldTicket_Seat_SeatId] FOREIGN KEY([SeatId])
REFERENCES [dbo].[Seat] ([Id])
GO
ALTER TABLE [dbo].[SoldTicket] CHECK CONSTRAINT [FK_SoldTicket_Seat_SeatId]
GO
ALTER TABLE [dbo].[SoldTicket]  WITH CHECK ADD  CONSTRAINT [FK_SoldTicket_Staff_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([Id])
GO
ALTER TABLE [dbo].[SoldTicket] CHECK CONSTRAINT [FK_SoldTicket_Staff_StaffId]
GO
ALTER TABLE [dbo].[SoldTicket]  WITH CHECK ADD  CONSTRAINT [FK_SoldTicket_TicketPrice_TicketPriceId] FOREIGN KEY([TicketPriceId])
REFERENCES [dbo].[TicketPrice] ([Id])
GO
ALTER TABLE [dbo].[SoldTicket] CHECK CONSTRAINT [FK_SoldTicket_TicketPrice_TicketPriceId]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Users_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Users_Id]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [MovieTicketBooking] SET  READ_WRITE 
GO
