USE [GuildCars]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicle]') AND type in (N'U'))
ALTER TABLE [dbo].[Vehicle] DROP CONSTRAINT IF EXISTS [FK_Vehicle_TransmissionType]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicle]') AND type in (N'U'))
ALTER TABLE [dbo].[Vehicle] DROP CONSTRAINT IF EXISTS [FK_Vehicle_MakeModel]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicle]') AND type in (N'U'))
ALTER TABLE [dbo].[Vehicle] DROP CONSTRAINT IF EXISTS [FK_Vehicle_InteriorColor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicle]') AND type in (N'U'))
ALTER TABLE [dbo].[Vehicle] DROP CONSTRAINT IF EXISTS [FK_Vehicle_ExteriorColor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicle]') AND type in (N'U'))
ALTER TABLE [dbo].[Vehicle] DROP CONSTRAINT IF EXISTS [FK_Vehicle_BodyStyle]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MakeModel]') AND type in (N'U'))
ALTER TABLE [dbo].[MakeModel] DROP CONSTRAINT IF EXISTS [FK_MakeModel_Model]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MakeModel]') AND type in (N'U'))
ALTER TABLE [dbo].[MakeModel] DROP CONSTRAINT IF EXISTS [FK_MakeModel_Make]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicle]') AND type in (N'U'))
ALTER TABLE [dbo].[Vehicle] DROP CONSTRAINT IF EXISTS [DF__Vehicle__Type__214BF109]
GO
DROP INDEX IF EXISTS [IX_MakeModel] ON [dbo].[MakeModel]
GO
DROP INDEX IF EXISTS [IX_ExteriorColor] ON [dbo].[ExteriorColor]
GO
DROP INDEX IF EXISTS [IX_BodyStyle] ON [dbo].[BodyStyle]
GO
DROP INDEX IF EXISTS [UserNameIndex] ON [dbo].[AspNetUsers]
GO
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
DROP INDEX IF EXISTS [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
DROP INDEX IF EXISTS [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
DROP TABLE IF EXISTS [dbo].[Vehicle]
GO
DROP TABLE IF EXISTS [dbo].[TransmissionType]
GO
DROP TABLE IF EXISTS [dbo].[State]
GO
DROP TABLE IF EXISTS [dbo].[Special]
GO
DROP TABLE IF EXISTS [dbo].[Sale]
GO
DROP TABLE IF EXISTS [dbo].[PurchaseType]
GO
DROP TABLE IF EXISTS [dbo].[Model]
GO
DROP TABLE IF EXISTS [dbo].[MakeModel]
GO
DROP TABLE IF EXISTS [dbo].[Make]
GO
DROP TABLE IF EXISTS [dbo].[InteriorColor]
GO
DROP TABLE IF EXISTS [dbo].[ExteriorColor]
GO
DROP TABLE IF EXISTS [dbo].[Contact]
GO
DROP TABLE IF EXISTS [dbo].[BodyStyle]
GO
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
DROP USER IF EXISTS [GuildAdmin]
GO
DROP USER IF EXISTS [RICHARD-LAPTOP\Richard]
GO
USE [master]
GO
DROP DATABASE IF EXISTS [GuildCars]
GO
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'GuildCars')
BEGIN
CREATE DATABASE [GuildCars]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GuildCars', FILENAME = N'E:\Data\GuildCars.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GuildCars_log', FILENAME = N'E:\Data\GuildCars_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [GuildCars] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GuildCars].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GuildCars] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [GuildCars] SET ANSI_NULLS ON 
GO
ALTER DATABASE [GuildCars] SET ANSI_PADDING ON 
GO
ALTER DATABASE [GuildCars] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [GuildCars] SET ARITHABORT ON 
GO
ALTER DATABASE [GuildCars] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GuildCars] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GuildCars] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GuildCars] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GuildCars] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [GuildCars] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [GuildCars] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GuildCars] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [GuildCars] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GuildCars] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GuildCars] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GuildCars] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GuildCars] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GuildCars] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GuildCars] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GuildCars] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GuildCars] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GuildCars] SET RECOVERY FULL 
GO
ALTER DATABASE [GuildCars] SET  MULTI_USER 
GO
ALTER DATABASE [GuildCars] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [GuildCars] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GuildCars] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GuildCars] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GuildCars] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GuildCars', N'ON'
GO
ALTER DATABASE [GuildCars] SET QUERY_STORE = OFF
GO
USE [GuildCars]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [GuildCars]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'RICHARD-LAPTOP\Richard')
CREATE USER [RICHARD-LAPTOP\Richard] FOR LOGIN [RICHARD-LAPTOP\Richard] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GuildAdmin')
CREATE USER [GuildAdmin] FOR LOGIN [GuildAdmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [RICHARD-LAPTOP\Richard]
GO
ALTER ROLE [db_owner] ADD MEMBER [GuildAdmin]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BodyStyle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BodyStyle](
	[BodyStyleID] [int] NOT NULL,
	[BodyStyle] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BodyStyleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contact]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [nvarchar](128) NOT NULL,
	[ContactEmail] [nvarchar](128) NOT NULL,
	[ContactPhone] [nchar](16) NULL,
	[ContactSubject] [nvarchar](128) NOT NULL,
	[ContactMessage] [nvarchar](1024) NOT NULL,
	[ContactGenerated] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExteriorColor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ExteriorColor](
	[ExteriorColorID] [int] NOT NULL,
	[ExteriorColor] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExteriorColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InteriorColor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InteriorColor](
	[InteriorColorID] [int] NOT NULL,
	[InteriorColor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_InteriorColor] PRIMARY KEY CLUSTERED 
(
	[InteriorColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Make]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Make](
	[MakeID] [int] NOT NULL,
	[Make_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Make] PRIMARY KEY CLUSTERED 
(
	[MakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MakeModel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MakeModel](
	[MakeModelID] [int] IDENTITY(1,1) NOT NULL,
	[MakeID] [int] NOT NULL,
	[ModelID] [int] NOT NULL,
	[MakeName] [varchar](50) NOT NULL,
	[ModelName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MakeModel] PRIMARY KEY CLUSTERED 
(
	[MakeModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Model]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Model](
	[ModelID] [int] NOT NULL,
	[Model_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PurchaseType](
	[PurchaseTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PurchaseType] PRIMARY KEY CLUSTERED 
(
	[PurchaseTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sale]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sale](
	[SaleId] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Street1] [nvarchar](50) NOT NULL,
	[Street2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[StateId] [int] NOT NULL,
	[ZipCode] [nchar](10) NOT NULL,
	[PurchasePrice] [money] NOT NULL,
	[PurchaseTypeId] [int] NOT NULL,
 CONSTRAINT [PK__Sales__3214EC07AF9CFB3D] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Special]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Special](
	[Special_ID] [int] NOT NULL,
	[Special_Title] [nvarchar](128) NOT NULL,
	[Special_Description] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_Special] PRIMARY KEY CLUSTERED 
(
	[Special_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[State]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Abbreviation] [varchar](255) NOT NULL,
	[Country] [varchar](255) NULL,
	[Type] [varchar](255) NULL,
	[Sort] [int] NULL,
	[Status] [varchar](255) NULL,
	[Occupied] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[FipsState] [varchar](255) NULL,
	[AssocPress] [varchar](255) NULL,
	[StandardFederalRegion] [varchar](255) NULL,
	[CensusRegion] [varchar](255) NULL,
	[CensusRegionName] [varchar](255) NULL,
	[CensusDivision] [varchar](255) NULL,
	[CensusDivisionName] [varchar](255) NULL,
	[CircuitCourt] [varchar](255) NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransmissionType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransmissionType](
	[TransmissionTypeID] [int] NOT NULL,
	[TransmissionType] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransmissionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vehicle](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [smallint] NOT NULL,
	[MakeModelID] [int] NOT NULL,
	[BodyStyleID] [int] NOT NULL,
	[TransmissionTypeID] [int] NOT NULL,
	[InteriorColorID] [int] NOT NULL,
	[ExteriorColorID] [int] NOT NULL,
	[Mileage] [int] NOT NULL,
	[VINumber] [char](17) NOT NULL,
	[SalesPrice] [money] NOT NULL,
	[MSRPrice] [money] NOT NULL,
	[Sold] [bit] NOT NULL,
	[Featured] [bit] NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[Type] [smallint] NOT NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201708210804351_init', N'GuildQuest.UI.Migrations.Configuration', 0x1F8B0800000000000400DD5C5B6FE3B6127E2F70FE83A0A7738AD4CAA5BBD806768BD449DAE06C2E5D27C5795BD012ED082B51AA44A5090EFACBFAD09F74FEC2194A942CDE74B115DB29165858E4F09BE170480E87C3FCEFCFBFC63F3C8781F58493D48FC8C43E1A1DDA16266EE4F96439B133BAF8E683FDC3F7FFF86A7CE185CFD6AF25DD09A38396249DD88F94C6A78E93BA8F3844E928F4DD244AA3051DB951E8202F728E0F0FBF738E8E1C0C10366059D6F85346A81FE2FC033EA71171714C33145C471E0E525E0E35B31CD5BA41214E63E4E289FD53E607DE2F194EE9E8E16A54D0DBD659E02390658683856D2142228A28487AFA90E2194D22B29CC5508082FB971803DD020529E63D385D9177EDCCE131EB8CB36A5842B9594AA3B027E0D109D78E23375F4BC776A53DD0DF05E899BEB05EE73A9CD8571ECE8B3E4501284066783A0D12463CB1AF2B1667697C83E9A86C382A202F1380FB3D4ABE8CEA880756E7760795351D8F0ED9BF036B9A05344BF084E08C262838B0EEB279E0BBFFC62FF7D1174C262747F3C5C98777EF9177F2FE5B7CF2AEDE53E82BD0090550749744314E4036BCA8FA6F5B8ED8CE911B56CD6A6D0AAD802DC1C4B0AD6BF4FC1193257D842973FCC1B62EFD67EC9525DCB81E880FF3081AD12483CF9B2C08D03CC055BDD3C893FDDFC0F5F8DDFB41B8DEA0277F990FBDC41F264E02F3EA130EF2DAF4D18F8BE9258CF7674E76994421FB16EDABA8FD3C8BB2C4659D898C24F72859622A4A377656C6DBC9A419D4F0665DA2EEBF69334955F3D692B20EAD33134A16DB9E0DA5BCAFCBB7B3C59DC5310C5E6E5A4C234D06A7DBAE4652FB034BA05A99CF5157F321D0ADBFF36A7811223F186039ECC0057C91859F84B8EAE58F11181F22BD65BE43690AAB81F7334A1F1B44879F03883EC36E968091CE280AE357E776F718117C93857366FBDBE335D8D0DCFF1E5D229746C90561AD36C6FB18B95FA28C5E10EF1C51FC40DD12907DDEFB61778041C439735D9CA69760CCD89B46E06A978057849E1CF786634BD4AEDD916980FC50EF8F488BE9E79274E593E82914BFC440A6F34D9A44FD182D7DD24DD492D42C6A41D12A2A27EB2B2A03EB2629A7340B9A13B4CA59500DE6EDE52334BCBB97C3EEBFBFB7D9E66D5A0B6A6A9CC10A897FC20427B08C797788529C90D50874593776E12CE4C3C798BEFADE9473FA1505D9D0ACD69A0DF92230FC6CC861F77F36E46242F193EF31AFA4C321A82406F84EF4FAF355FB9C9324DBF67410BAB96DE6DB59034CD3E52C4D23D7CF678126FCC58317A2FCE0C359ED918CA2377234043A0686EEB32D0F4AA06FB66C54B7E41C079862EBCC2DC2835394BAC853D5081DF27A0856EEA81AC156511151B8AF159E60E938618D103B04A530537D42D569E113D78F51D0AA25A965C72D8CF5BDE221D79CE31813C6B055135D98EB83204C808A8F34286D1A1A3B358B6B364483D76A1AF336177635EE4A6C622B36D9E23B1BEC92FB6FAF6298CD1ADB827136ABA48B00C680DE2E0C949F55BA1A807C70D93703954E4C0603E52ED5560C54D4D80E0C5454C99B33D0E288DA75FCA5F3EABE99A77850DEFEB6DEA8AE1DD8A6A08F3D33CDC2F78436145AE04435CFF339ABC4CF5473380339F9F92CE5AEAE6C220C7C86A918B259F9BB5A3FD46906918DA8097065682DA0FC2A50015226540FE1CA585EA374DC8BE8015BC6DD1A61F9DA2FC1D66C40C5AE5F89D608CD17A7B271763A7D543DABAC4131F24E87851A8EC620E4C54BEC7807A598E2B2AA62BAF8C27DBCE15AC7F8603428A8C5733528A9ECCCE05A2A4DB35D4B3A87AC8F4BB6919624F7C9A0A5B233836B89DB68BB92344E410FB7602315895BF84093AD8C7454BB4D5537768A5C295E30760C4955E36B14C73E59D692AC7889352B32ACA6DFCCFA271E850586E3A69AFCA34ADA8A138D12B4C4522DB006492FFD24A5E788A23962719EA9172A64DABDD5B0FC972CEBDBA73A88E53E5052B3DF450BED05BEB0DBAAEE0847B9843E86CCA7C903E91A0BD037B758DA1B0A50A289DD4FA3200B89D9C532B72E6EF0EAED8B121561EC48F22B2E94A22FC5D11595DF6968D46931D830553ECCFA4365863029BCF440EB2A3779A56694324855473105AE7636742667A6E770C99E62FFD16A45789DB9C5D353EA00BCA827462DC34101ABD57547159350EA98624D774429D3A40E2955F590B29E4F220859AF580BCFA0513D45770E6A06491D5DADED8EACC925A9436BAAD7C0D6C82CD77547D5A49BD48135D5DDB157B927F232BAC7BB97F1FCB2C1F6551C7237DBBF0C18AFB3260EB3FDD5EEF2EB40B5E29E58FCB65E01E3E57B694FC693DE06F654443736B327038679F511EEC1C5C5A7F1F2DE8C295C6E0B0B7CD3E5BE19AF9FD5BEAA6D28473D99A4E25E1DF9A4A3DD981FB3DA1FD528E7AE82C4B64A35C2E6FE92521C8E18C168F65B300D7CCC96F292E01A117F01E6562474D8C78747C7D2AB9CFD7921E3A4A917688EA9A66732E2986D21378B3CA1C47D44899A29B1C12B9215A81284BE221E7E9ED8FFCD5B9DE6F10CF62B2F3EB0AED207E2FF9641C57D9261EB0F35F37398ACFA0EEF382A41FF78130F24BAABFCEA3F9F8BA607D66D02D3E9D43A9414BDCEF08BCF267A495334DD409AB51F53BCDDD926BC52D0A24AB365FD4709739F0EF220A194F29F217AFE575FD1B48F0E3642D43C2C180A6F10159A1E0EAC83657C34E0C127CD1F0DF4EBACFE11C13AA2191F10F8A43F98FC7CA0FB3254B6DCE13EA439326D6349CAF5DC9A7EBD512EE6AEF726254B7BA389AE6662F7801B34DB7A3317E58D65310FB6756A929407C3DEA5DDBF7A66F2BE2423AF9CF6DDE6206F33EDB8E15AE96F956DBC07F9719A7C9FDDE7146FDBD64C31E03D4FCCEC9739BC67C6C6B7F9DDE7076FDBD84C01E23D37B65E59C07B666BBBDA3F776C699DB7D09DE7F4AAE94986BB1C5D14B92D67B708B9C3F17F1E8111141E65F1D4529F24D694E0DAC2704562666ACE4E93192B1347E1AB5034B3EDD757BEE1377696D334B335E47436F1E6EB7F236F4ED3CCDB9029B98B6C636DAEA22E03BC651D6B4AA27A4BD9C5424F5A92D9DB7CD6C68BF9B7944C3C885284D963B85D7E3BB9C383A864C8A9D3235758BD2886BDB3F6371A61FF4EFDE50A82FDC546825D61D7AC68AEC8222A376F49A292448AD05C638A3CD852CF12EA2F904BA19A05A0F3B7E279508F5D83CCB177456E331A6714BA8CC3792004BC9813D0C43F4F8816651EDFC6EC2B1DA20B20A6CF02F7B7E447967A51C97DA9890919209877C1C3BD6C2C290BFB2E5F2AA49B887404E2EAAB9CA27B1CC60180A5B764869EF03AB281F97DC44BE4BEAC22802690F68110D53E3EF7D1324161CA3156EDE1136CD80B9FBFFF3FC06A7A58AA540000, N'6.2.0-beta1-60406')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'44a43338-b8ff-4d1a-b1a3-652015bb56f0', N'richardturnmire@outlook.com', 0, N'AK9F59eHRfCC9pbfkPQvFFYn7fKUVpMmKw/mzX56a+Fm2/v79DgcKZqTksNo9UtN/A==', N'2d13d780-2c18-420c-9c08-8300a40cf2e5', NULL, 0, 0, NULL, 1, 0, N'richardturnmire@outlook.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fb4fde21-100e-42a4-a924-c9761d9bc325', N'rturnmire@hotmail.com', 0, N'AOBzuzMKlZs/ykadMGEYAstrcsZrjcax5LfMnLzCo1YEv/d8QaXd2EqyS4czhu8G6A==', N'79a3e417-56b6-46d4-8207-7c9d28d23232', N'5024173849', 1, 0, NULL, 1, 0, N'rturnmire@hotmail.com')
INSERT [dbo].[BodyStyle] ([BodyStyleID], [BodyStyle]) VALUES (4, N'Convertible')
INSERT [dbo].[BodyStyle] ([BodyStyleID], [BodyStyle]) VALUES (6, N'Hatchback')
INSERT [dbo].[BodyStyle] ([BodyStyleID], [BodyStyle]) VALUES (5, N'Pickup')
INSERT [dbo].[BodyStyle] ([BodyStyleID], [BodyStyle]) VALUES (2, N'Sedan')
INSERT [dbo].[BodyStyle] ([BodyStyleID], [BodyStyle]) VALUES (3, N'Sport Utility')
INSERT [dbo].[BodyStyle] ([BodyStyleID], [BodyStyle]) VALUES (1, N'Wagon')
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactID], [ContactName], [ContactEmail], [ContactPhone], [ContactSubject], [ContactMessage], [ContactGenerated]) VALUES (1, N'Richard Turnmire', N'richardturnmire@outlook.com', N'(502) 417-3849  ', N'This is a test', N'What can I do to get a job', NULL)
INSERT [dbo].[Contact] ([ContactID], [ContactName], [ContactEmail], [ContactPhone], [ContactSubject], [ContactMessage], [ContactGenerated]) VALUES (2, N'Richard Turnmire', N'richardturnmire@outlook.com', N'(502) 417-3849  ', N'This is a test of your non system', N'This is a test of the contact form', NULL)
INSERT [dbo].[Contact] ([ContactID], [ContactName], [ContactEmail], [ContactPhone], [ContactSubject], [ContactMessage], [ContactGenerated]) VALUES (3, N'Richard Turnmire', N'richardturnmire@outlook.com', N'(502) 417-3849  ', N'This is a test of your non system', N'Test #2', NULL)
INSERT [dbo].[Contact] ([ContactID], [ContactName], [ContactEmail], [ContactPhone], [ContactSubject], [ContactMessage], [ContactGenerated]) VALUES (4, N'Richard Turnmire', N'richardturnmire@outlook.com', N'(502) 417-3849  ', N'This is a test of your non system', N'test #3', NULL)
INSERT [dbo].[Contact] ([ContactID], [ContactName], [ContactEmail], [ContactPhone], [ContactSubject], [ContactMessage], [ContactGenerated]) VALUES (5, N'Richard Turnmire', N'richardturnmire@outlook.com', N'(502) 417-3849  ', N'This is a test of your non system', N'test #3', NULL)
INSERT [dbo].[Contact] ([ContactID], [ContactName], [ContactEmail], [ContactPhone], [ContactSubject], [ContactMessage], [ContactGenerated]) VALUES (6, N'Richard Turnmire', N'richardturnmire@outlook.com', N'(502) 417-3849  ', N'This is a test of your non system', N'test #4', NULL)
INSERT [dbo].[Contact] ([ContactID], [ContactName], [ContactEmail], [ContactPhone], [ContactSubject], [ContactMessage], [ContactGenerated]) VALUES (7, N'Richard Turnmire', N'richardturnmire@outlook.com', N'(502) 417-3849  ', N'This is a test of your non system', N'test 5', NULL)
SET IDENTITY_INSERT [dbo].[Contact] OFF
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (11, N'Alabaster Silver')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (25, N'Black')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (15, N'Blue')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (3, N'Bright Silver Metallic')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (17, N'Bright White')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (9, N'Chili Pepper Red')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (16, N'Copper Red Mica')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (18, N'Dakota Gray Metallic')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (20, N'Dover White Pearl')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (4, N'Evergreen')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (22, N'Frost Blue Metallic')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (24, N'Hypothic Teal Mica')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (28, N'Jet Black')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (23, N'Liquid Silver Metallic')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (6, N'Majestic Red Metallic')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (10, N'Malbec Black')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (27, N'Matador Red Mica')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (14, N'Midnight Black Metallic')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (21, N'Nighthawk Black Pearl')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (26, N'Oyster Gray Metallic')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (7, N'Pacific Blue')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (5, N'Pearl White')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (8, N'Platinum Granite')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (2, N'Red')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (1, N'Silver')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (13, N'Silver Atmosphere')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (12, N'Steel Blue Metallic')
INSERT [dbo].[ExteriorColor] ([ExteriorColorID], [ExteriorColor]) VALUES (19, N'White Suede')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (1, N'Black')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (2, N'Gray')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (3, N'Taupe Cloth')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (4, N'Beige Cloth')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (5, N'Black Leather')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (6, N'Java Leather')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (7, N'Black Cloth')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (8, N'Anthracite Leather')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (9, N'Carbon Black')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (10, N'Gray')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (11, N'Dark Slate')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (12, N'Gray Cloth')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (13, N'Jet Leather')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (14, N'Ebony Leather')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (15, N'Dark Charcoal')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (16, N'Dark Slate Gray')
INSERT [dbo].[InteriorColor] ([InteriorColorID], [InteriorColor]) VALUES (17, N'Stone Cloth')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (442, N'Jaguar')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (444, N'Land Rover')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (448, N'Toyota')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (452, N'BMW')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (456, N'MINI')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (460, N'Ford')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (464, N'Lincoln')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (465, N'Mercury')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (467, N'Chevrolet')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (468, N'Buick')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (469, N'Cadillac')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (472, N'GMC')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (473, N'Mazda')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (474, N'Honda')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (475, N'Acura')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (476, N'Dodge')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (477, N'Chrysler')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (478, N'Nissan')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (480, N'Infiniti')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (481, N'Mitsubishi')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (482, N'Volkswagen')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (483, N'Jeep')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (485, N'Volvo')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (496, N'Ram')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (498, N'Hyundai')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (499, N'Kia')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (509, N'Suzuki')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (515, N'Lexus')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (523, N'Subaru')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (536, N'Pontiac')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (542, N'Isuzu')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (582, N'Audi')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (1056, N'Saturn')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (1569, N'GM')
INSERT [dbo].[Make] ([MakeID], [Make_Name]) VALUES (5426, N'WHITEGMC')
SET IDENTITY_INSERT [dbo].[MakeModel] ON 

INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1, 442, 2242, N'Jaguar', N'XJ')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (2, 442, 2285, N'Jaguar', N'XF')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (3, 442, 2286, N'Jaguar', N'XK')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (4, 442, 2313, N'Jaguar', N'X-Type')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (5, 442, 2314, N'Jaguar', N'S-Type')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (6, 442, 2375, N'Jaguar', N'F-Type')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (7, 442, 6435, N'Jaguar', N'X100')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (8, 442, 6436, N'Jaguar', N'Sovereign')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (9, 442, 6437, N'Jaguar', N'VDP')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (10, 442, 9339, N'Jaguar', N'XK8')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (11, 442, 9340, N'Jaguar', N'XJR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (12, 442, 11440, N'Jaguar', N'XE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (13, 442, 11441, N'Jaguar', N'F-Pace')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (14, 442, 13576, N'Jaguar', N'XJ')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (15, 442, 13578, N'Jaguar', N'XJ8/XJ8L')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (16, 442, 14145, N'Jaguar', N'XJ6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (17, 442, 14615, N'Jaguar', N'XJS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (18, 452, 1707, N'BMW', N'128i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (19, 452, 1708, N'BMW', N'135i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (20, 452, 1709, N'BMW', N'328i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (21, 452, 1710, N'BMW', N'M3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (22, 452, 1711, N'BMW', N'335i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (23, 452, 1712, N'BMW', N'335is')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (24, 452, 1713, N'BMW', N'335d')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (25, 452, 1714, N'BMW', N'X6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (26, 452, 1715, N'BMW', N'528i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (27, 452, 1716, N'BMW', N'535i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (28, 452, 1717, N'BMW', N'X5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (29, 452, 1718, N'BMW', N'550i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (30, 452, 1719, N'BMW', N'X3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (31, 452, 1720, N'BMW', N'740i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (32, 452, 1721, N'BMW', N'740Li')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (33, 452, 1722, N'BMW', N'750i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (34, 452, 1723, N'BMW', N'750Li')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (35, 452, 1724, N'BMW', N'760Li')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (36, 452, 1725, N'BMW', N'Z4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (37, 452, 1727, N'BMW', N'750xi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (38, 452, 1728, N'BMW', N'750Lxi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (39, 452, 1729, N'BMW', N'M6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (40, 452, 1730, N'BMW', N'528xi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (41, 452, 1731, N'BMW', N'640i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (42, 452, 1732, N'BMW', N'650i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (43, 452, 1733, N'BMW', N'650xi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (44, 452, 1736, N'BMW', N'G450X')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (45, 452, 1737, N'BMW', N'F800S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (46, 452, 1738, N'BMW', N'F800ST')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (47, 452, 1739, N'BMW', N'F800GS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (48, 452, 1740, N'BMW', N'F800R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (49, 452, 1741, N'BMW', N'HP2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (50, 452, 1742, N'BMW', N'S1000RR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (51, 452, 1743, N'BMW', N'R1200GS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (52, 452, 1744, N'BMW', N'R1200R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (53, 452, 1745, N'BMW', N'R1200RT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (54, 452, 1746, N'BMW', N'K1300S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (55, 452, 1747, N'BMW', N'K1300GT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (56, 452, 1748, N'BMW', N'K1300R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (57, 452, 1749, N'BMW', N'F650GS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (58, 452, 1750, N'BMW', N'G650GS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (59, 452, 1751, N'BMW', N'R900RT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (60, 452, 1752, N'BMW', N'K1600GT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (61, 452, 1753, N'BMW', N'K1600GTL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (62, 452, 1754, N'BMW', N'F700GS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (63, 452, 1755, N'BMW', N'F800GT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (64, 452, 1756, N'BMW', N'C600')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (65, 452, 1757, N'BMW', N'C650GT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (66, 452, 1758, N'BMW', N'HP4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (67, 452, 1759, N'BMW', N'S1000R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (68, 452, 1760, N'BMW', N'RnineT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (69, 452, 1970, N'BMW', N'1M')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (70, 452, 1971, N'BMW', N'Active')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (71, 452, 2024, N'BMW', N'M5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (72, 452, 2170, N'BMW', N'228i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (73, 452, 2171, N'BMW', N'M235i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (74, 452, 2172, N'BMW', N'320i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (75, 452, 2173, N'BMW', N'328d')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (76, 452, 2178, N'BMW', N'i3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (77, 452, 2179, N'BMW', N'i8')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (78, 452, 2219, N'BMW', N'ActiveHybrid')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (79, 452, 2220, N'BMW', N'428i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (80, 452, 2221, N'BMW', N'438i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (81, 452, 2230, N'BMW', N'435i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (82, 452, 2231, N'BMW', N'535d')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (83, 452, 2240, N'BMW', N'ActiveHybrid')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (84, 452, 2300, N'BMW', N'X1')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (85, 452, 2350, N'BMW', N'R1150GS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (86, 452, 2351, N'BMW', N'R1200S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (87, 452, 2352, N'BMW', N'R1200ST')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (88, 452, 2353, N'BMW', N'K1200R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (89, 452, 2354, N'BMW', N'K1200S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (90, 452, 2355, N'BMW', N'K1200LT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (91, 452, 2359, N'BMW', N'K1200GT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (92, 452, 2360, N'BMW', N'R1150R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (93, 452, 2361, N'BMW', N'R850R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (94, 452, 2362, N'BMW', N'G650')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (95, 452, 2363, N'BMW', N'G650')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (96, 452, 2364, N'BMW', N'G650')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (97, 452, 2376, N'BMW', N'535xi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (98, 452, 2377, N'BMW', N'328xi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (99, 452, 2378, N'BMW', N'335xi')
GO
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (100, 452, 2584, N'BMW', N'525i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (101, 452, 2585, N'BMW', N'530i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (102, 452, 2586, N'BMW', N'530xi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (103, 452, 2587, N'BMW', N'525xi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (104, 452, 2759, N'BMW', N'325Cic')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (105, 452, 2760, N'BMW', N'330Cic')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (106, 452, 2761, N'BMW', N'M3Cic')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (107, 452, 2762, N'BMW', N'325Ci')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (108, 452, 2763, N'BMW', N'330Ci')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (109, 452, 2764, N'BMW', N'325i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (110, 452, 2765, N'BMW', N'325xi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (111, 452, 2766, N'BMW', N'325xiT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (112, 452, 2767, N'BMW', N'530xiT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (113, 452, 2777, N'BMW', N'330i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (114, 452, 2778, N'BMW', N'330xi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (115, 452, 2804, N'BMW', N'760i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (116, 452, 2887, N'BMW', N'HP2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (117, 452, 2888, N'BMW', N'HP2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (118, 452, 3050, N'BMW', N'325iT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (119, 452, 3051, N'BMW', N'545i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (120, 452, 3052, N'BMW', N'645Ci')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (121, 452, 3053, N'BMW', N'645Cic')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (122, 452, 3054, N'BMW', N'745i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (123, 452, 3055, N'BMW', N'745Li')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (124, 452, 3159, N'BMW', N'M')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (125, 452, 5094, N'BMW', N'K1100RS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (126, 452, 5095, N'BMW', N'K75')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (127, 452, 5096, N'BMW', N'K75S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (128, 452, 5097, N'BMW', N'K75RT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (129, 452, 5098, N'BMW', N'K1100LT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (130, 452, 5099, N'BMW', N'R100')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (131, 452, 5100, N'BMW', N'R100R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (132, 452, 5101, N'BMW', N'R100RT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (133, 452, 5102, N'BMW', N'R100GS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (134, 452, 5104, N'BMW', N'R1100R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (135, 452, 5105, N'BMW', N'R1100RS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (136, 452, 5106, N'BMW', N'R1100GS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (137, 452, 5108, N'BMW', N'F650')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (138, 452, 5109, N'BMW', N'F650S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (139, 452, 5110, N'BMW', N'R1100RT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (140, 452, 5111, N'BMW', N'K1200RS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (141, 452, 5112, N'BMW', N'R1200C')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (142, 452, 5132, N'BMW', N'F650CS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (143, 452, 5136, N'BMW', N'R1100S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (144, 452, 5137, N'BMW', N'R1150RS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (145, 452, 5138, N'BMW', N'R1150RT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (146, 452, 5139, N'BMW', N'R1200CL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (147, 452, 5178, N'BMW', N'318i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (148, 452, 5185, N'BMW', N'318iS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (149, 452, 5186, N'BMW', N'318iC')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (150, 452, 5187, N'BMW', N'325iS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (151, 452, 5190, N'BMW', N'325iC')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (152, 452, 5193, N'BMW', N'525iT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (153, 452, 5194, N'BMW', N'530iT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (154, 452, 5195, N'BMW', N'540i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (155, 452, 5198, N'BMW', N'840Ci')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (156, 452, 5199, N'BMW', N'850Ci')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (157, 452, 5200, N'BMW', N'850CSi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (158, 452, 5217, N'BMW', N'318ti')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (159, 452, 5237, N'BMW', N'328iC')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (160, 452, 5238, N'BMW', N'328iS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (161, 452, 5239, N'BMW', N'Z3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (162, 452, 5253, N'BMW', N'323i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (163, 452, 5254, N'BMW', N'323is')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (164, 452, 5255, N'BMW', N'323iC')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (165, 452, 5324, N'BMW', N'Z8')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (166, 452, 5343, N'BMW', N'525iA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (167, 452, 5347, N'BMW', N'530iA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (168, 452, 5348, N'BMW', N'540iA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (169, 452, 5349, N'BMW', N'525iAT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (170, 452, 5350, N'BMW', N'540iAT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (171, 452, 5355, N'BMW', N'Alpina')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (172, 452, 5384, N'BMW', N'645i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (173, 452, 5992, N'BMW', N'X4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (174, 452, 9253, N'BMW', N'335')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (175, 452, 9452, N'BMW', N'740iL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (176, 452, 9453, N'BMW', N'750iL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (177, 452, 9459, N'BMW', N'M3Ci')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (178, 452, 9547, N'BMW', N'ActiveHybrid')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (179, 452, 9567, N'BMW', N'M2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (180, 452, 9568, N'BMW', N'340i')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (181, 452, 9569, N'BMW', N'330e')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (182, 452, 9570, N'BMW', N'M4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (183, 452, 10045, N'BMW', N'S1000XR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (184, 452, 10046, N'BMW', N'R1200RS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (185, 452, 10047, N'BMW', N'C650')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (186, 452, 10587, N'BMW', N'328Ci')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (187, 456, 1761, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (188, 456, 1762, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (189, 456, 1763, N'MINI', N'JCW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (190, 456, 1764, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (191, 456, 1765, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (192, 456, 1766, N'MINI', N'JCW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (193, 456, 1767, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (194, 456, 1768, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (195, 456, 1769, N'MINI', N'JCW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (196, 456, 1862, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (197, 456, 1880, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (198, 456, 1881, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (199, 456, 1882, N'MINI', N'Cooper')
GO
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (200, 456, 1883, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (201, 456, 1886, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (202, 456, 1887, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (203, 456, 1888, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (204, 456, 1889, N'MINI', N'JCW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (205, 456, 1925, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (206, 456, 1926, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (207, 456, 1927, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (208, 456, 1928, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (209, 456, 1929, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (210, 456, 1930, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (211, 456, 1931, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (212, 456, 1932, N'MINI', N'JCW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (213, 456, 1933, N'MINI', N'JCW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (214, 456, 1964, N'MINI', N'JCW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (215, 456, 2327, N'MINI', N'Cooper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (216, 460, 1778, N'Ford', N'Crown')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (217, 460, 1779, N'Ford', N'Focus')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (218, 460, 1780, N'Ford', N'Fusion')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (219, 460, 1781, N'Ford', N'Mustang')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (220, 460, 1782, N'Ford', N'Taurus')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (221, 460, 1796, N'Ford', N'E-150')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (222, 460, 1797, N'Ford', N'Edge')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (223, 460, 1798, N'Ford', N'Escape')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (224, 460, 1799, N'Ford', N'Expedition')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (225, 460, 1800, N'Ford', N'Explorer')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (226, 460, 1801, N'Ford', N'F-150')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (227, 460, 1802, N'Ford', N'Flex')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (228, 460, 1803, N'Ford', N'Ranger')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (229, 460, 1804, N'Ford', N'Explorer')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (230, 460, 1805, N'Ford', N'F-250')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (231, 460, 1806, N'Ford', N'F-350')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (232, 460, 1807, N'Ford', N'F-450')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (233, 460, 1808, N'Ford', N'F-550')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (234, 460, 1809, N'Ford', N'F-650')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (235, 460, 1810, N'Ford', N'F-750')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (236, 460, 1811, N'Ford', N'Transit')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (237, 460, 1817, N'Ford', N'E-250')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (238, 460, 1818, N'Ford', N'E-350')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (239, 460, 1819, N'Ford', N'E-450')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (240, 460, 1820, N'Ford', N'Expedition')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (241, 460, 2345, N'Ford', N'Thunderbird')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (242, 460, 2346, N'Ford', N'GT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (243, 460, 2347, N'Ford', N'Five')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (244, 460, 2370, N'Ford', N'Excursion')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (245, 460, 2379, N'Ford', N'Freestyle')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (246, 460, 2384, N'Ford', N'Freestar')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (247, 460, 2737, N'Ford', N'Motorhome')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (248, 460, 3160, N'Ford', N'Taurus')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (249, 460, 3267, N'Ford', N'Fiesta')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (250, 460, 3410, N'Ford', N'Commercial')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (251, 460, 3462, N'Ford', N'C-max')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (252, 460, 3608, N'Ford', N'Transit')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (253, 460, 9201, N'Ford', N'Super')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (254, 460, 9213, N'Ford', N'L8501')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (255, 460, 9214, N'Ford', N'LT8501')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (256, 460, 9215, N'Ford', N'L9501')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (257, 460, 9216, N'Ford', N'LT9501')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (258, 460, 9217, N'Ford', N'L8511')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (259, 460, 9218, N'Ford', N'LT8511')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (260, 460, 9219, N'Ford', N'L9511')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (261, 460, 9220, N'Ford', N'LT9511')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (262, 460, 9221, N'Ford', N'L8513')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (263, 460, 9222, N'Ford', N'LT8513')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (264, 460, 9223, N'Ford', N'L9513')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (265, 460, 9224, N'Ford', N'LT9513')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (266, 460, 9225, N'Ford', N'L9522')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (267, 460, 9226, N'Ford', N'LT9522')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (268, 460, 9227, N'Ford', N'A8513')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (269, 460, 9228, N'Ford', N'AT8513')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (270, 460, 9229, N'Ford', N'A9513')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (271, 460, 9230, N'Ford', N'AT9513')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (272, 460, 9231, N'Ford', N'A9522')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (273, 460, 9232, N'Ford', N'AT9522')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (274, 460, 9268, N'Ford', N'B800')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (275, 460, 9270, N'Ford', N'F-Super')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (276, 460, 9272, N'Ford', N'F-700')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (277, 460, 9282, N'Ford', N'P700')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (278, 460, 9283, N'Ford', N'P800')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (279, 460, 9284, N'Ford', N'FT900')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (280, 460, 9285, N'Ford', N'L8000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (281, 460, 9286, N'Ford', N'L9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (282, 460, 9287, N'Ford', N'LL9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (283, 460, 9288, N'Ford', N'LLA9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (284, 460, 9289, N'Ford', N'LLS9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (285, 460, 9290, N'Ford', N'LS8000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (286, 460, 9291, N'Ford', N'LS9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (287, 460, 9292, N'Ford', N'LT8000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (288, 460, 9293, N'Ford', N'LT9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (289, 460, 9294, N'Ford', N'LTS8000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (290, 460, 9295, N'Ford', N'LTS9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (291, 460, 9296, N'Ford', N'LTL9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (292, 460, 9297, N'Ford', N'LTLA9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (293, 460, 9298, N'Ford', N'LTLS9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (294, 460, 9299, N'Ford', N'LA8000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (295, 460, 9300, N'Ford', N'LA9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (296, 460, 9301, N'Ford', N'LTA9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (297, 460, 9302, N'Ford', N'LN7000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (298, 460, 9303, N'Ford', N'LN8000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (299, 460, 9304, N'Ford', N'LN9000')
GO
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (300, 460, 9305, N'Ford', N'LNT8000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (301, 460, 9306, N'Ford', N'LNT9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (302, 460, 9307, N'Ford', N'CF8000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (303, 460, 9308, N'Ford', N'CFT8000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (304, 460, 9312, N'Ford', N'CF7000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (305, 460, 10378, N'Ford', N'Festiva')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (306, 460, 11942, N'Ford', N'Low')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (307, 460, 13958, N'Ford', N'Tempo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (308, 460, 13977, N'Ford', N'B600')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (309, 460, 13978, N'Ford', N'B700')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (310, 460, 13979, N'Ford', N'F-600')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (311, 460, 13980, N'Ford', N'Recreational')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (312, 460, 13981, N'Ford', N'F-590')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (313, 460, 13983, N'Ford', N'P600')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (314, 460, 14148, N'Ford', N'CL9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (315, 460, 14149, N'Ford', N'CLT9000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (316, 460, 14150, N'Ford', N'Bronco')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (317, 460, 14152, N'Ford', N'FT800')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (318, 460, 14153, N'Ford', N'CT8000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (319, 460, 14154, N'Ford', N'C800')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (320, 460, 14155, N'Ford', N'C8000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (321, 460, 14196, N'Ford', N'Laser')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (322, 460, 14199, N'Ford', N'LTD')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (323, 460, 14614, N'Ford', N'Fairmont')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (324, 460, 14618, N'Ford', N'Granada')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (325, 467, 1828, N'Chevrolet', N'Aveo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (326, 467, 1829, N'Chevrolet', N'Camaro')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (327, 467, 1830, N'Chevrolet', N'Caprice')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (328, 467, 1831, N'Chevrolet', N'Corvette')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (329, 467, 1832, N'Chevrolet', N'Cruze')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (330, 467, 1833, N'Chevrolet', N'Impala')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (331, 467, 1834, N'Chevrolet', N'Malibu')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (332, 467, 1835, N'Chevrolet', N'Sonic')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (333, 467, 1836, N'Chevrolet', N'Spark')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (334, 467, 1837, N'Chevrolet', N'SS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (335, 467, 1838, N'Chevrolet', N'Volt')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (336, 467, 1846, N'Chevrolet', N'Captiva')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (337, 467, 1847, N'Chevrolet', N'Equinox')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (338, 467, 1848, N'Chevrolet', N'Express')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (339, 467, 1849, N'Chevrolet', N'Orlando')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (340, 467, 1850, N'Chevrolet', N'Silverado')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (341, 467, 1851, N'Chevrolet', N'Suburban')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (342, 467, 1852, N'Chevrolet', N'Tahoe')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (343, 467, 1853, N'Chevrolet', N'Traverse')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (344, 467, 1854, N'Chevrolet', N'Tracker')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (345, 467, 1921, N'Chevrolet', N'City')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (346, 467, 3531, N'Chevrolet', N'Prizm')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (347, 467, 3876, N'Chevrolet', N'Avalanche')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (348, 467, 4047, N'Chevrolet', N'Matiz')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (349, 467, 4086, N'Chevrolet', N'Colorado')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (350, 467, 4234, N'Chevrolet', N'Cobalt')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (351, 467, 4251, N'Chevrolet', N'Optra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (352, 467, 4255, N'Chevrolet', N'Kalos')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (353, 467, 4256, N'Chevrolet', N'Lacetti')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (354, 467, 4548, N'Chevrolet', N'Trailblazer')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (355, 467, 4586, N'Chevrolet', N'HHR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (356, 467, 4588, N'Chevrolet', N'Uplander')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (357, 467, 4687, N'Chevrolet', N'W4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (358, 467, 4688, N'Chevrolet', N'W5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (359, 467, 4773, N'Chevrolet', N'Monte')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (360, 467, 4865, N'Chevrolet', N'Chevy')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (361, 467, 4889, N'Chevrolet', N'SSR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (362, 467, 4992, N'Chevrolet', N'Epica')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (363, 467, 5017, N'Chevrolet', N'Full')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (364, 467, 8834, N'Chevrolet', N'Cavalier')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (365, 467, 8835, N'Chevrolet', N'U100')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (366, 467, 8836, N'Chevrolet', N'Magnus')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (367, 467, 8837, N'Chevrolet', N'Rezzo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (368, 467, 8881, N'Chevrolet', N'3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (369, 467, 8882, N'Chevrolet', N'Astro')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (370, 467, 8883, N'Chevrolet', N'Venture')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (371, 467, 9016, N'Chevrolet', N'B7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (372, 467, 9064, N'Chevrolet', N'Lumina')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (373, 467, 9088, N'Chevrolet', N'Alero')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (374, 467, 9095, N'Chevrolet', N'Geo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (375, 467, 9115, N'Chevrolet', N'Caprice')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (376, 467, 9116, N'Chevrolet', N'Corsica')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (377, 467, 9117, N'Chevrolet', N'Beretta')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (378, 467, 9139, N'Chevrolet', N'Hearse/Limo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (379, 467, 10043, N'Chevrolet', N'Metro')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (380, 467, 10327, N'Chevrolet', N'3500')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (381, 467, 10977, N'Chevrolet', N'Special')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (382, 467, 10978, N'Chevrolet', N'GMT-400')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (383, 467, 10979, N'Chevrolet', N'Military')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (384, 467, 10980, N'Chevrolet', N'Compact')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (385, 467, 10981, N'Chevrolet', N'Vans/Sport')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (386, 467, 10983, N'Chevrolet', N'Forward')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (387, 467, 10984, N'Chevrolet', N'Small')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (388, 467, 10988, N'Chevrolet', N'Trax')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (389, 467, 10989, N'Chevrolet', N'Venture/Uplander')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (390, 467, 11483, N'Chevrolet', N'S-10')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (391, 467, 11489, N'Chevrolet', N'C/K')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (392, 467, 11491, N'Chevrolet', N'P')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (393, 467, 11497, N'Chevrolet', N'Lumina')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (394, 467, 11502, N'Chevrolet', N'Blazer')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (395, 467, 13634, N'Chevrolet', N'Impala')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (396, 467, 13672, N'Chevrolet', N'Bolt')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (397, 467, 13737, N'Chevrolet', N'3500HD')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (398, 467, 13738, N'Chevrolet', N'5500HD')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (399, 467, 13739, N'Chevrolet', N'3500')
GO
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (400, 467, 13740, N'Chevrolet', N'4500HD')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (401, 467, 13741, N'Chevrolet', N'4500XD')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (402, 467, 13742, N'Chevrolet', N'5500XD')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (403, 467, 14032, N'Chevrolet', N'T-Series')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (404, 467, 14033, N'Chevrolet', N'C4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (405, 467, 14034, N'Chevrolet', N'C5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (406, 467, 14035, N'Chevrolet', N'C6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (407, 467, 14036, N'Chevrolet', N'C7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (408, 467, 14037, N'Chevrolet', N'C8')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (409, 467, 14040, N'Chevrolet', N'W7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (410, 467, 14166, N'Chevrolet', N'Hearse/Limo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (411, 467, 14206, N'Chevrolet', N'W3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (412, 467, 14397, N'Chevrolet', N'Geo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (413, 467, 14450, N'Chevrolet', N'W6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (414, 467, 14451, N'Chevrolet', N'D7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (415, 467, 14452, N'Chevrolet', N'P6S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (416, 467, 14457, N'Chevrolet', N'S-10')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (417, 467, 14458, N'Chevrolet', N'P')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (418, 467, 14460, N'Chevrolet', N'Celebrity')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (419, 467, 14461, N'Chevrolet', N'Geo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (420, 467, 14462, N'Chevrolet', N'G-Series')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (421, 467, 14463, N'Chevrolet', N'Van')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (422, 467, 14464, N'Chevrolet', N'Cutaway')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (423, 467, 14465, N'Chevrolet', N'Motorhome')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (424, 467, 14475, N'Chevrolet', N'Chevette')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (425, 467, 14501, N'Chevrolet', N'Hi-Cube')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (426, 467, 14502, N'Chevrolet', N'Cutaway')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (427, 467, 14506, N'Chevrolet', N'S7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (428, 467, 14513, N'Chevrolet', N'Sprint')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (429, 467, 14515, N'Chevrolet', N'Nova')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (430, 467, 14544, N'Chevrolet', N'S6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (431, 467, 14545, N'Chevrolet', N'R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (432, 467, 14546, N'Chevrolet', N'V')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (433, 467, 14547, N'Chevrolet', N'Citation')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (434, 467, 14616, N'Chevrolet', N'Bus')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (435, 467, 14617, N'Chevrolet', N'Heavy')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (436, 467, 14619, N'Chevrolet', N'Aluminum')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (437, 467, 14637, N'Chevrolet', N'El')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (438, 467, 14782, N'Chevrolet', N'Medium')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (439, 467, 15634, N'Chevrolet', N'LUV')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (440, 467, 17528, N'Chevrolet', N'Malibu')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (441, 472, 1855, N'GMC', N'Acadia')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (442, 472, 1856, N'GMC', N'Savana')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (443, 472, 1857, N'GMC', N'Sierra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (444, 472, 1858, N'GMC', N'Terrain')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (445, 472, 1859, N'GMC', N'Yukon')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (446, 472, 4093, N'GMC', N'Canyon')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (447, 472, 4507, N'GMC', N'Envoy')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (448, 472, 4579, N'GMC', N'Yukon')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (449, 472, 5008, N'GMC', N'Full')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (450, 472, 5968, N'GMC', N'W4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (451, 472, 5969, N'GMC', N'W6/FSR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (452, 472, 5970, N'GMC', N'W7/FTR/FVR/EVR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (453, 472, 8879, N'GMC', N'Safari')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (454, 472, 9015, N'GMC', N'F6/F7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (455, 472, 9044, N'GMC', N'Electric')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (456, 472, 10985, N'GMC', N'GMT-400')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (457, 472, 10994, N'GMC', N'3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (458, 472, 10995, N'GMC', N'Suburban/Yukon')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (459, 472, 11073, N'GMC', N'Sonoma')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (460, 472, 11488, N'GMC', N'Suburban')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (461, 472, 11490, N'GMC', N'C/K')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (462, 472, 11503, N'GMC', N'Jimmy')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (463, 472, 13864, N'GMC', N'C-Series')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (464, 472, 13865, N'GMC', N'T-Series')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (465, 472, 14018, N'GMC', N'C4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (466, 472, 14019, N'GMC', N'C5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (467, 472, 14021, N'GMC', N'C6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (468, 472, 14022, N'GMC', N'C7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (469, 472, 14023, N'GMC', N'C8')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (470, 472, 14029, N'GMC', N'W5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (471, 472, 14030, N'GMC', N'W7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (472, 472, 14205, N'GMC', N'W3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (473, 472, 14297, N'GMC', N'B7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (474, 472, 14440, N'GMC', N'W6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (475, 472, 14444, N'GMC', N'P6S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (476, 472, 14447, N'GMC', N'D7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (477, 472, 14469, N'GMC', N'P')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (478, 472, 14470, N'GMC', N'Motorhome')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (479, 472, 14472, N'GMC', N'Cutaway')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (480, 472, 14476, N'GMC', N'S15')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (481, 472, 14479, N'GMC', N'Vandura')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (482, 472, 14480, N'GMC', N'Cutaway')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (483, 472, 14481, N'GMC', N'Rally')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (484, 472, 14497, N'GMC', N'Magna')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (485, 472, 14498, N'GMC', N'Typhoon')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (486, 472, 14499, N'GMC', N'Value')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (487, 472, 14500, N'GMC', N'Hi-Cube')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (488, 472, 14507, N'GMC', N'S7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (489, 472, 14533, N'GMC', N'Geo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (490, 472, 14535, N'GMC', N'S6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (491, 472, 14536, N'GMC', N'Jimmy')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (492, 472, 14537, N'GMC', N'Syclone')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (493, 472, 14538, N'GMC', N'R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (494, 472, 14539, N'GMC', N'V')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (495, 472, 14554, N'GMC', N'S15')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (496, 472, 14555, N'GMC', N'Forward')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (497, 472, 14571, N'GMC', N'Aluminum')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (498, 472, 14596, N'GMC', N'Heavy')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (499, 472, 14602, N'GMC', N'Bus')
GO
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (500, 472, 14626, N'GMC', N'Caballero')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (501, 472, 14629, N'GMC', N'Transit')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (502, 472, 14630, N'GMC', N'Articulated')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (503, 472, 16264, N'GMC', N'GM515')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (504, 473, 1860, N'Mazda', N'Tribute')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (505, 473, 2072, N'Mazda', N'MX-5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (506, 473, 2073, N'Mazda', N'RX-8')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (507, 473, 2074, N'Mazda', N'Mazda3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (508, 473, 2075, N'Mazda', N'Mazda5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (509, 473, 2076, N'Mazda', N'CX-7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (510, 473, 2077, N'Mazda', N'CX-9')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (511, 473, 2078, N'Mazda', N'Mazda6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (512, 473, 2153, N'Mazda', N'Mazda2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (513, 473, 2322, N'Mazda', N'MPV')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (514, 473, 2369, N'Mazda', N'CX-5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (515, 473, 2741, N'Mazda', N'B-Series')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (516, 473, 5410, N'Mazda', N'Protege')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (517, 473, 5470, N'Mazda', N'Millenia')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (518, 473, 5471, N'Mazda', N'626')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (519, 473, 5494, N'Mazda', N'323')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (520, 473, 5495, N'Mazda', N'MX-3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (521, 473, 5496, N'Mazda', N'929')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (522, 473, 5497, N'Mazda', N'RX-7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (523, 473, 7791, N'Mazda', N'MX-6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (524, 473, 10202, N'Mazda', N'CX-3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (525, 473, 13839, N'Mazda', N'GLC')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (526, 473, 13901, N'Mazda', N'Navajo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (527, 474, 1861, N'Honda', N'Accord')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (528, 474, 1863, N'Honda', N'Civic')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (529, 474, 1864, N'Honda', N'Pilot')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (530, 474, 1865, N'Honda', N'CR-V')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (531, 474, 1866, N'Honda', N'Ridgeline')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (532, 474, 1868, N'Honda', N'Element')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (533, 474, 1869, N'Honda', N'Odyssey')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (534, 474, 1870, N'Honda', N'Insight')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (535, 474, 1875, N'Honda', N'FCX Clarity')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (536, 474, 1934, N'Honda', N'GL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (537, 474, 1935, N'Honda', N'VT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (538, 474, 2127, N'Honda', N'Fit')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (539, 474, 2128, N'Honda', N'CR-Z')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (540, 474, 3153, N'Honda', N'S2000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (541, 474, 3233, N'Honda', N'NM4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (542, 474, 3234, N'Honda', N'PCX150')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (543, 474, 3235, N'Honda', N'CB1100')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (544, 474, 3236, N'Honda', N'CB300F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (545, 474, 3237, N'Honda', N'CB500F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (546, 474, 3238, N'Honda', N'CB500X')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (547, 474, 3239, N'Honda', N'CBR1000RR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (548, 474, 3240, N'Honda', N'CBR300R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (549, 474, 3241, N'Honda', N'CBR500R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (550, 474, 3242, N'Honda', N'CBR600RR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (551, 474, 3243, N'Honda', N'CBR650F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (552, 474, 3244, N'Honda', N'REBEL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (553, 474, 3245, N'Honda', N'CRF250L')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (554, 474, 3246, N'Honda', N'CTX1300')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (555, 474, 3247, N'Honda', N'CTX700')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (556, 474, 3248, N'Honda', N'CTX700N')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (557, 474, 3249, N'Honda', N'GOLDWING')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (558, 474, 3250, N'Honda', N'GROM')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (559, 474, 3251, N'Honda', N'NC700X')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (560, 474, 3252, N'Honda', N'METROPOLITAN')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (561, 474, 3253, N'Honda', N'NPS50 RUCKUS
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (562, 474, 3254, N'Honda', N'FORZA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (563, 474, 3255, N'Honda', N'ST1300PA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (564, 474, 3256, N'Honda', N'INTERCEPTOR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (565, 474, 3257, N'Honda', N'STATELINE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (566, 474, 3258, N'Honda', N'INTERSTATE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (567, 474, 3259, N'Honda', N'FURY')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (568, 474, 3260, N'Honda', N'SHADOW AERO
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (569, 474, 3261, N'Honda', N'SHADOW PHANTOM
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (570, 474, 3262, N'Honda', N'XR650L')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (571, 474, 3263, N'Honda', N'SHADOW SPIRIT 750
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (572, 474, 3264, N'Honda', N'ST1300')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (573, 474, 3265, N'Honda', N'GOLDWING F6B
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (574, 474, 3266, N'Honda', N'GOLDWING VALKYRIE
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (575, 474, 3409, N'Honda', N'CB1100R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (576, 474, 3411, N'Honda', N'Silverwing')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (577, 474, 3412, N'Honda', N'CB1000R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (578, 474, 3420, N'Honda', N'CBR250R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (579, 474, 3422, N'Honda', N'VFR1200F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (580, 474, 3423, N'Honda', N'SABRE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (581, 474, 3428, N'Honda', N'SHADOW RS
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (582, 474, 3438, N'Honda', N'NT700V')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (583, 474, 3439, N'Honda', N'PCX125')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (584, 474, 3444, N'Honda', N'ELITE 110
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (585, 474, 3445, N'Honda', N'SH150I')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (586, 474, 3446, N'Honda', N'VT1300CX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (587, 474, 3447, N'Honda', N'CRF 230L
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (588, 474, 3448, N'Honda', N'CRF 230M
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (589, 474, 3449, N'Honda', N'DN-01')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (590, 474, 3459, N'Honda', N'VTX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (591, 474, 3463, N'Honda', N'VTX1800F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (592, 474, 3464, N'Honda', N'VTX1800N')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (593, 474, 3465, N'Honda', N'VTX1800T')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (594, 474, 3466, N'Honda', N'CB250/NIGHTHAWK')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (595, 474, 3473, N'Honda', N'919')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (596, 474, 3474, N'Honda', N'Elite80')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (597, 474, 3475, N'Honda', N'Helix')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (598, 474, 3476, N'Honda', N'Reflex')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (599, 474, 3477, N'Honda', N'VTX1300C')
GO
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (600, 474, 3478, N'Honda', N'VTX1300R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (601, 474, 3479, N'Honda', N'VTX1300S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (602, 474, 3480, N'Honda', N'VTX1800C')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (603, 474, 3481, N'Honda', N'VTX1800R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (604, 474, 3482, N'Honda', N'Shadow Sabre
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (605, 474, 3483, N'Honda', N'Shadow Spirit
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (606, 474, 3484, N'Honda', N'Shadow VLX
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (607, 474, 3487, N'Honda', N'599')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (608, 474, 3488, N'Honda', N'BIG RUKUS
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (609, 474, 3489, N'Honda', N'VTX1800S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (610, 474, 3491, N'Honda', N'CBR600Fi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (611, 474, 3492, N'Honda', N'RC51')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (612, 474, 3506, N'Honda', N'VALKYRIE RUNE
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (613, 474, 3507, N'Honda', N'ST1300P')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (614, 474, 3509, N'Honda', N'SUPERHAWK')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (615, 474, 3515, N'Honda', N'CB600F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (616, 474, 3520, N'Honda', N'NIGHTHAWK 750
')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (617, 474, 3521, N'Honda', N'CBR1100XX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (618, 474, 3522, N'Honda', N'CBR954RR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (619, 474, 3523, N'Honda', N'SHADOW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (620, 474, 3526, N'Honda', N'VALKYRIE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (621, 474, 3527, N'Honda', N'ST1100P')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (622, 474, 3528, N'Honda', N'MAGNA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (623, 474, 3530, N'Honda', N'ST1100')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (624, 474, 3565, N'Honda', N'SHADOW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (625, 474, 3566, N'Honda', N'CBR929RR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (626, 474, 3567, N'Honda', N'ELITE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (627, 474, 3597, N'Honda', N'CBR900RR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (628, 474, 3616, N'Honda', N'CBR600F3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (629, 474, 3617, N'Honda', N'CBR600SE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (630, 474, 3618, N'Honda', N'Pacific')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (631, 474, 3654, N'Honda', N'VFR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (632, 474, 3657, N'Honda', N'Shadow')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (633, 474, 3658, N'Honda', N'Shadow')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (634, 474, 3664, N'Honda', N'CBR1000F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (635, 474, 3666, N'Honda', N'XR250L')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (636, 474, 3668, N'Honda', N'CB1000F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (637, 474, 3669, N'Honda', N'Shadow')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (638, 474, 3670, N'Honda', N'Shadow')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (639, 474, 3672, N'Honda', N'CT70')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (640, 474, 3673, N'Honda', N'CBR600F2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (641, 474, 3674, N'Honda', N'RC')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (642, 474, 3684, N'Honda', N'Hawk')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (643, 474, 3694, N'Honda', N'CBT125TT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (644, 474, 3695, N'Honda', N'CB-1')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (645, 474, 3696, N'Honda', N'Elite')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (646, 474, 3697, N'Honda', N'Tourist')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (647, 474, 3698, N'Honda', N'NS50F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (648, 474, 3699, N'Honda', N'NX250')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (649, 474, 3700, N'Honda', N'NX125')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (650, 474, 3701, N'Honda', N'SA50')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (651, 474, 3702, N'Honda', N'SB50P')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (652, 474, 3703, N'Honda', N'RC30')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (653, 474, 3704, N'Honda', N'VTR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (654, 474, 3705, N'Honda', N'XL600V')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (655, 474, 3720, N'Honda', N'CB125TT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (656, 474, 3735, N'Honda', N'VT1100C')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (657, 474, 3776, N'Honda', N'ELITE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (658, 474, 3777, N'Honda', N'TRANSALP')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (659, 474, 3778, N'Honda', N'NX650')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (660, 474, 3779, N'Honda', N'CBR600F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (661, 474, 5107, N'Honda', N'Prelude')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (662, 474, 5402, N'Honda', N'NC700JD')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (663, 474, 5411, N'Honda', N'ww150')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (664, 474, 5959, N'Honda', N'Passport')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (665, 474, 9173, N'Honda', N'Crosstour')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (666, 474, 9212, N'Honda', N'HR-V')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (667, 474, 9577, N'Honda', N'del')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (668, 474, 10001, N'Honda', N'CBR300RA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (669, 474, 10007, N'Honda', N'CBR650FA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (670, 474, 10250, N'Honda', N'RC213V-S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (671, 474, 10251, N'Honda', N'NC700XD')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (672, 474, 10252, N'Honda', N'CBR500RA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (673, 474, 10253, N'Honda', N'CB500FA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (674, 474, 10254, N'Honda', N'CB500XA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (675, 474, 10613, N'Honda', N'CRF450R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (676, 474, 10614, N'Honda', N'CRF250R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (677, 474, 10616, N'Honda', N'TRX500FPA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (678, 474, 10617, N'Honda', N'CRF150F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (679, 474, 10618, N'Honda', N'CRF50F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (680, 474, 10619, N'Honda', N'XR400R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (681, 474, 10620, N'Honda', N'TRX700XX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (682, 474, 10622, N'Honda', N'TRX450ER')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (683, 474, 10623, N'Honda', N'TRX500FM')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (684, 474, 10791, N'Honda', N'FourTrax')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (685, 474, 10792, N'Honda', N'TRX400X')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (686, 474, 10956, N'Honda', N'Sportrax')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (687, 474, 10957, N'Honda', N'TRX450R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (688, 474, 10958, N'Honda', N'CRF70F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (689, 474, 10959, N'Honda', N'CRF100F')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (690, 474, 10960, N'Honda', N'CR250R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (691, 474, 10961, N'Honda', N'XR650R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (692, 474, 11387, N'Honda', N'SA50P')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (693, 474, 11408, N'Honda', N'CR125R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (694, 474, 11409, N'Honda', N'XR250R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (695, 474, 11435, N'Honda', N'MUV700/Big')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (696, 474, 11517, N'Honda', N'EV')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (697, 474, 11588, N'Honda', N'TRX90')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (698, 474, 11589, N'Honda', N'XR600R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (699, 474, 11590, N'Honda', N'TRX200D')
GO
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (700, 474, 11591, N'Honda', N'TRX200DN')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (701, 474, 11592, N'Honda', N'TRX250')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (702, 474, 11593, N'Honda', N'TRX300')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (703, 474, 11594, N'Honda', N'TRX300EX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (704, 474, 11595, N'Honda', N'TRX300EXN')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (705, 474, 11596, N'Honda', N'TRX300FW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (706, 474, 11597, N'Honda', N'TRX300FWN')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (707, 474, 11598, N'Honda', N'TRX300N')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (708, 474, 11599, N'Honda', N'TRX400FW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (709, 474, 11600, N'Honda', N'TRX400FWN')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (710, 474, 11601, N'Honda', N'TRX450S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (711, 474, 11602, N'Honda', N'TRX450ES')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (712, 474, 11603, N'Honda', N'TRX400EX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (713, 474, 11648, N'Honda', N'CB500XL-CB500X')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (714, 474, 11649, N'Honda', N'CB500XA-CB500X')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (715, 474, 11650, N'Honda', N'NC700XL-NC700X')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (716, 474, 11651, N'Honda', N'NC700XD-NC700X')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (717, 474, 11652, N'Honda', N'NC700XDL-NC700X')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (718, 474, 11653, N'Honda', N'CMX250-REBEL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (719, 474, 11654, N'Honda', N'CMX250CL-REBEL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (720, 474, 11655, N'Honda', N'CTX700NL-CTX700N')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (721, 474, 11656, N'Honda', N'CTX700ND-CTX700N')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (722, 474, 11657, N'Honda', N'CTX700NDL-CTX700N')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (723, 474, 11658, N'Honda', N'NC700JD-NM4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (724, 474, 11659, N'Honda', N'VT750C-SHADOW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (725, 474, 11660, N'Honda', N'VT750CL-SHADOW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (726, 474, 11661, N'Honda', N'VT750CA-SHADOW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (727, 474, 11662, N'Honda', N'VT750CA-SHADOW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (728, 474, 11663, N'Honda', N'VT750CAL-SHADOW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (729, 474, 11664, N'Honda', N'VT750C2B-SHADOW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (730, 474, 11665, N'Honda', N'VT750C2BL-SHADOW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (731, 474, 11666, N'Honda', N'VT1300CX-FURY')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (732, 474, 11667, N'Honda', N'VT1300CXL-FURY')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (733, 474, 11668, N'Honda', N'VT1300CXA-FURY')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (734, 474, 11669, N'Honda', N'VT1300CR-STATELINE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (735, 474, 11670, N'Honda', N'VT1300CRL-STATELINE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (736, 474, 11671, N'Honda', N'VT1300CT-INTERSTATE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (737, 474, 11672, N'Honda', N'VT1300CTL-INTERSTATE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (738, 474, 11673, N'Honda', N'VT1300CTA-INTERSTATE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (739, 474, 11674, N'Honda', N'XR650LL-XR650L')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (740, 474, 11675, N'Honda', N'CBR300RA/CBR300R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (741, 474, 11676, N'Honda', N'WW150-PCX150')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (742, 474, 11677, N'Honda', N'CTX700-CTX700D')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (743, 474, 11678, N'Honda', N'CTX600D-CTX700DL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (744, 474, 11683, N'Honda', N'TRX90X')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (745, 474, 11684, N'Honda', N'TRX420FA1/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (746, 474, 11686, N'Honda', N'TRX420FA2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (747, 474, 11687, N'Honda', N'TRX420FA1/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (748, 474, 11688, N'Honda', N'TRX420FA2/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (749, 474, 11689, N'Honda', N'TRX420FA5/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (750, 474, 11690, N'Honda', N'TRX420FA5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (751, 474, 11691, N'Honda', N'TRX420FA6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (752, 474, 11698, N'Honda', N'TRX420FA6/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (753, 474, 11700, N'Honda', N'TRX420FA6C/TRX420FA6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (754, 474, 11703, N'Honda', N'TRX420FE1/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (755, 474, 11704, N'Honda', N'TRX420FM1/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (756, 474, 11709, N'Honda', N'TRX420FM1/TRX420FM')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (757, 474, 11710, N'Honda', N'TRX420FM2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (758, 474, 11718, N'Honda', N'TRX420FM2/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (759, 474, 11726, N'Honda', N'TRX420TE1/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (760, 474, 11727, N'Honda', N'TRZ420TM1/ROUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (761, 474, 11728, N'Honda', N'TRX500FA5/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (762, 474, 11729, N'Honda', N'TRX500FA6/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (763, 474, 11730, N'Honda', N'TRX500FA6/TRX500FA6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (764, 474, 11740, N'Honda', N'TRX500FA7/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (765, 474, 11741, N'Honda', N'TRX500FA7/TRX500FA7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (766, 474, 11742, N'Honda', N'TRX500FE1/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (767, 474, 11743, N'Honda', N'TRX500FE2/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (768, 474, 11744, N'Honda', N'TRX500FE2/TRX500FPE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (769, 474, 11745, N'Honda', N'TRX500FM1/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (770, 474, 11746, N'Honda', N'TRX500FM1/TRX500FPM')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (771, 474, 11747, N'Honda', N'TRX500FM2/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (772, 474, 11748, N'Honda', N'TRX500FM2/TRX500FPM')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (773, 474, 11749, N'Honda', N'TRX500FMS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (774, 474, 11750, N'Honda', N'TRX500FM5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (775, 474, 11751, N'Honda', N'TRX500FM6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (776, 474, 11752, N'Honda', N'TRX500FM7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (777, 474, 11753, N'Honda', N'TRX500FPA/FOUR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (778, 474, 11754, N'Honda', N'TRX500PG/RUBICON')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (779, 474, 11755, N'Honda', N'TRX680F/RINCON')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (780, 474, 11756, N'Honda', N'TRX680FA/FOURTRAX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (781, 474, 11757, N'Honda', N'TRX500FM1/TRX500FM')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (782, 474, 11759, N'Honda', N'NCH50/GIORNO')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (783, 474, 11760, N'Honda', N'NCH50/METROPOLITAN')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (784, 474, 11761, N'Honda', N'NPS50/RUCKUS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (785, 474, 11762, N'Honda', N'NSS300/FORZA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (786, 474, 11763, N'Honda', N'NSS300A/FORZA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (787, 474, 11764, N'Honda', N'WW150/PCX150')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (788, 474, 11765, N'Honda', N'CB300FA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (789, 474, 11766, N'Honda', N'CB500F-CB500FL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (790, 474, 12505, N'Honda', N'VTX1800C3/VTX	')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (791, 474, 12506, N'Honda', N'VTX1800F1/VTX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (792, 474, 12507, N'Honda', N'VTX1800F2/VTX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (793, 474, 12508, N'Honda', N'VTX1800N3/VTX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (794, 474, 12509, N'Honda', N'VTX1800N2/VTX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (795, 474, 12510, N'Honda', N'VTX1800N1/VTX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (796, 474, 12511, N'Honda', N'VTX1800R3/VTX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (797, 474, 12512, N'Honda', N'VTX1800R2/VTX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (798, 474, 12513, N'Honda', N'VTX1800R1/VTX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (799, 474, 12514, N'Honda', N'VTX1800S3/VTX')
GO
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (800, 474, 12515, N'Honda', N'VTX1800S2/VTX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (801, 474, 12516, N'Honda', N'VTX1800S1/VTX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (802, 474, 12520, N'Honda', N'VTX1800F3/VTX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (803, 474, 12522, N'Honda', N'NCW50/METROPOLITAN')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (804, 474, 12523, N'Honda', N'RC1000VS/RC213V-S')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (805, 474, 12527, N'Honda', N'TRX90/SPORTRAX90')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (806, 474, 12528, N'Honda', N'TRX250TE/RECON')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (807, 474, 12529, N'Honda', N'RX250TM/')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (808, 474, 12530, N'Honda', N'TRX400FW/FOURTRAX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (809, 475, 1867, N'Acura', N'ZDX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (810, 475, 1871, N'Acura', N'RDX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (811, 475, 1872, N'Acura', N'RL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (812, 475, 1873, N'Acura', N'TL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (813, 475, 1874, N'Acura', N'TSX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (814, 475, 2147, N'Acura', N'MDX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (815, 475, 2149, N'Acura', N'RLX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (816, 475, 2150, N'Acura', N'ILX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (817, 475, 3183, N'Acura', N'RSX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (818, 475, 5063, N'Acura', N'Integra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (819, 475, 5145, N'Acura', N'CL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (820, 475, 5168, N'Acura', N'NSX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (821, 475, 5339, N'Acura', N'Legend')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (822, 475, 5354, N'Acura', N'TLX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (823, 475, 6004, N'Acura', N'SLX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (824, 475, 11495, N'Acura', N'Vigor')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (825, 476, 1892, N'Dodge', N'Avenger')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (826, 476, 1893, N'Dodge', N'Challenger')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (827, 476, 1895, N'Dodge', N'Charger')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (828, 476, 1896, N'Dodge', N'Caliber')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (829, 476, 1897, N'Dodge', N'Viper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (830, 476, 1938, N'Dodge', N'Ram')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (831, 476, 1939, N'Dodge', N'Journey')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (832, 476, 1940, N'Dodge', N'Nitro')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (833, 476, 1941, N'Dodge', N'Dakota')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (834, 476, 1942, N'Dodge', N'Caravan/Grand')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (835, 476, 1958, N'Dodge', N'Ram')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (836, 476, 2054, N'Dodge', N'Dart')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (837, 476, 3121, N'Dodge', N'Sprinter')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (838, 476, 3508, N'Dodge', N'Durango')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (839, 476, 3510, N'Dodge', N'Chassis')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (840, 476, 3680, N'Dodge', N'Magnum')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (841, 476, 5878, N'Dodge', N'Intrepid')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (842, 476, 5879, N'Dodge', N'Stratus')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (843, 476, 5880, N'Dodge', N'Neon')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (844, 476, 6250, N'Dodge', N'Colt')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (845, 476, 6254, N'Dodge', N'Stealth')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (846, 476, 6356, N'Dodge', N'Ramcharger')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (847, 476, 10962, N'Dodge', N'Ram')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (848, 476, 10963, N'Dodge', N'Ram')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (849, 476, 14351, N'Dodge', N'Spirit')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (850, 476, 14363, N'Dodge', N'SHADOW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (851, 476, 14375, N'Dodge', N'Dynasty')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (852, 476, 14376, N'Dodge', N'Daytona')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (853, 476, 14389, N'Dodge', N'Monaco')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (854, 476, 14402, N'Dodge', N'OMNI')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (855, 476, 14414, N'Dodge', N'SHELBY')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (856, 476, 14415, N'Dodge', N'ARIES')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (857, 476, 14416, N'Dodge', N'600')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (858, 476, 14417, N'Dodge', N'DIPLOMAT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (859, 476, 14418, N'Dodge', N'LANCER')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (860, 476, 14419, N'Dodge', N'Conquest')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (861, 476, 14766, N'Dodge', N'400')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (862, 476, 14767, N'Dodge', N'Mirada')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (863, 476, 14772, N'Dodge', N'ST.REGIS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (864, 476, 14831, N'Dodge', N'Caravan')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (865, 476, 14832, N'Dodge', N'Grand')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (866, 476, 14864, N'Dodge', N'RAM')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (867, 476, 14868, N'Dodge', N'D-Series')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (868, 476, 14869, N'Dodge', N'W-Series')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (869, 476, 14939, N'Dodge', N'Raider')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (870, 476, 14969, N'Dodge', N'Mini')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (871, 476, 15003, N'Dodge', N'Royal')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (872, 476, 15056, N'Dodge', N'D50')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (873, 476, 15083, N'Dodge', N'Rampage')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (874, 476, 15124, N'Dodge', N'RD200')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (875, 478, 1890, N'Nissan', N'GT-R')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (876, 478, 1891, N'Nissan', N'VERSA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (877, 478, 1894, N'Nissan', N'Versa')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (878, 478, 1898, N'Nissan', N'Versa')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (879, 478, 1904, N'Nissan', N'Altima')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (880, 478, 1905, N'Nissan', N'Leaf')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (881, 478, 1906, N'Nissan', N'370Z')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (882, 478, 1907, N'Nissan', N'Sentra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (883, 478, 1911, N'Nissan', N'Pathfinder')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (884, 478, 1912, N'Nissan', N'Juke')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (885, 478, 1913, N'Nissan', N'Rogue')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (886, 478, 1914, N'Nissan', N'Murano')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (887, 478, 1915, N'Nissan', N'Armada')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (888, 478, 1916, N'Nissan', N'Xterra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (889, 478, 1917, N'Nissan', N'Quest')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (890, 478, 1918, N'Nissan', N'NV200')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (891, 478, 1919, N'Nissan', N'Frontier')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (892, 478, 1920, N'Nissan', N'Titan')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (893, 478, 1922, N'Nissan', N'NV')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (894, 478, 1923, N'Nissan', N'NV')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (895, 478, 2302, N'Nissan', N'Maxima')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (896, 478, 2303, N'Nissan', N'350Z')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (897, 478, 2323, N'Nissan', N'X-Trail')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (898, 478, 2341, N'Nissan', N'Cube')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (899, 478, 5565, N'Nissan', N'240SX')
GO
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (900, 478, 5566, N'Nissan', N'300ZX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (901, 478, 5748, N'Nissan', N'Pickup')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (902, 478, 5756, N'Nissan', N'Altra-EV')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (903, 478, 8459, N'Nissan', N'Sentra/200SX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (904, 478, 8461, N'Nissan', N'Stanza/Altima')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (905, 478, 11506, N'Nissan', N'NX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (906, 478, 11507, N'Nissan', N'NX/Sentra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (907, 478, 11508, N'Nissan', N'Stanza')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (908, 478, 11509, N'Nissan', N'Axxess')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (909, 478, 13524, N'Nissan', N'PULSAR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (910, 478, 13821, N'Nissan', N'NV3500')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (911, 478, 14272, N'Nissan', N'Van')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (912, 478, 14329, N'Nissan', N'Stanza')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (913, 478, 14385, N'Nissan', N'200SX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (914, 478, 17214, N'Nissan', N'Rogue')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (915, 478, 17615, N'Nissan', N'Sentra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (916, 478, 17616, N'Nissan', N'Altra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (917, 478, 17817, N'Nissan', N'Micra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (918, 478, 18137, N'Nissan', N'Rogue')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (919, 480, 1899, N'Infiniti', N'QX50')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (920, 480, 1900, N'Infiniti', N'Q40')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (921, 480, 1901, N'Infiniti', N'Q50')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (922, 480, 1902, N'Infiniti', N'Q60')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (923, 480, 1903, N'Infiniti', N'Q70')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (924, 480, 1908, N'Infiniti', N'QX70')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (925, 480, 1909, N'Infiniti', N'QX80')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (926, 480, 1910, N'Infiniti', N'QX60')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (927, 480, 2038, N'Infiniti', N'Q70L')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (928, 480, 2304, N'Infiniti', N'Q45')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (929, 480, 2305, N'Infiniti', N'G35')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (930, 480, 2306, N'Infiniti', N'M35')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (931, 480, 2307, N'Infiniti', N'M45')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (932, 480, 2324, N'Infiniti', N'FX35')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (933, 480, 2325, N'Infiniti', N'FX45')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (934, 480, 2326, N'Infiniti', N'QX56')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (935, 480, 2337, N'Infiniti', N'G37')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (936, 480, 2338, N'Infiniti', N'EX35')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (937, 480, 2343, N'Infiniti', N'FX50')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (938, 480, 2356, N'Infiniti', N'M56')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (939, 480, 2357, N'Infiniti', N'M37')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (940, 480, 2358, N'Infiniti', N'G25')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (941, 480, 2368, N'Infiniti', N'M35h')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (942, 480, 2373, N'Infiniti', N'FX37')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (943, 480, 2374, N'Infiniti', N'JX35')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (944, 480, 5572, N'Infiniti', N'J30')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (945, 480, 5573, N'Infiniti', N'G20')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (946, 480, 5813, N'Infiniti', N'I35')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (947, 480, 8702, N'Infiniti', N'I30')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (948, 480, 8717, N'Infiniti', N'QX4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (949, 480, 11510, N'Infiniti', N'M30')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (950, 480, 13514, N'Infiniti', N'FX35/FX45')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (951, 480, 13820, N'Infiniti', N'QX30')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (952, 481, 1950, N'Mitsubishi', N'Raider')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (953, 481, 2163, N'Mitsubishi', N'Outlander')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (954, 481, 2164, N'Mitsubishi', N'Lancer')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (955, 481, 2165, N'Mitsubishi', N'Galant')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (956, 481, 2166, N'Mitsubishi', N'Eclipse')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (957, 481, 2167, N'Mitsubishi', N'Endeavor')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (958, 481, 2318, N'Mitsubishi', N'Montero')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (959, 481, 2321, N'Mitsubishi', N'Eclipse')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (960, 481, 2336, N'Mitsubishi', N'RVR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (961, 481, 2339, N'Mitsubishi', N'i-MiEV')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (962, 481, 2340, N'Mitsubishi', N'Outlander')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (963, 481, 2342, N'Mitsubishi', N'Mirage')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (964, 481, 5422, N'Mitsubishi', N'Expo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (965, 481, 5423, N'Mitsubishi', N'3000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (966, 481, 5424, N'Mitsubishi', N'3000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (967, 481, 5425, N'Mitsubishi', N'Diamante')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (968, 481, 5426, N'Mitsubishi', N'Truck')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (969, 481, 5755, N'Mitsubishi', N'Montero')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (970, 481, 5808, N'Mitsubishi', N'Lancer')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (971, 481, 5809, N'Mitsubishi', N'Lancer')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (972, 481, 13842, N'Mitsubishi', N'Mirage')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (973, 481, 13867, N'Mitsubishi', N'Outlander')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (974, 481, 14367, N'Mitsubishi', N'Expo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (975, 481, 14395, N'Mitsubishi', N'Mitsubishi')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (976, 482, 1951, N'Volkswagen', N'Routan')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (977, 482, 3133, N'Volkswagen', N'Golf')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (978, 482, 3134, N'Volkswagen', N'Passat')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (979, 482, 3135, N'Volkswagen', N'Phaeton')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (980, 482, 3136, N'Volkswagen', N'Touareg')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (981, 482, 3137, N'Volkswagen', N'Jetta')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (982, 482, 3140, N'Volkswagen', N'GTI')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (983, 482, 3141, N'Volkswagen', N'R32')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (984, 482, 3142, N'Volkswagen', N'Jetta')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (985, 482, 4084, N'Volkswagen', N'Rabbit')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (986, 482, 4085, N'Volkswagen', N'New')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (987, 482, 4167, N'Volkswagen', N'Eos')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (988, 482, 5059, N'Volkswagen', N'Golf')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (989, 482, 8051, N'Volkswagen', N'Golf')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (990, 482, 8052, N'Volkswagen', N'Jetta')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (991, 482, 8053, N'Volkswagen', N'Corrado')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (992, 482, 8055, N'Volkswagen', N'Euro')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (993, 482, 8118, N'Volkswagen', N'e-Golf')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (994, 482, 8119, N'Volkswagen', N'Beetle')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (995, 482, 8121, N'Volkswagen', N'CC')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (996, 482, 8151, N'Volkswagen', N'Tiguan')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (997, 482, 8364, N'Volkswagen', N'Jetta')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (998, 482, 8460, N'Volkswagen', N'Cabrio')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (999, 482, 8475, N'Volkswagen', N'new')
GO
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1000, 482, 8486, N'Volkswagen', N'New')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1001, 482, 8487, N'Volkswagen', N'New')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1002, 482, 8488, N'Volkswagen', N'New')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1003, 482, 13668, N'Volkswagen', N'Golf/Golf')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1004, 482, 13670, N'Volkswagen', N'Golf')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1005, 482, 13844, N'Volkswagen', N'Golf')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1006, 482, 13845, N'Volkswagen', N'Golf')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1007, 482, 14216, N'Volkswagen', N'CABRIOLET')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1008, 482, 14217, N'Volkswagen', N'FOX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1009, 482, 14261, N'Volkswagen', N'Quantum')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1010, 482, 14262, N'Volkswagen', N'scirocco')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1011, 482, 14266, N'Volkswagen', N'Vanagon')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1012, 482, 14270, N'Volkswagen', N'MULTI-VAN')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1013, 482, 14271, N'Volkswagen', N'Camper')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1014, 482, 14568, N'Volkswagen', N'Dasher')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1015, 482, 14569, N'Volkswagen', N'KOMBI')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1016, 482, 17618, N'Volkswagen', N'Atlas')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1017, 485, 1959, N'Volvo', N'S60')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1018, 485, 1960, N'Volvo', N'S80')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1019, 485, 1961, N'Volvo', N'V60')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1020, 485, 1962, N'Volvo', N'XC60')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1021, 485, 1963, N'Volvo', N'XC70')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1022, 485, 3127, N'Volvo', N'S40')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1023, 485, 3128, N'Volvo', N'V50')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1024, 485, 3129, N'Volvo', N'C70')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1025, 485, 3130, N'Volvo', N'V70')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1026, 485, 3132, N'Volvo', N'XC90')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1027, 485, 3144, N'Volvo', N'C30')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1028, 485, 3511, N'Volvo', N'9700')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1029, 485, 9341, N'Volvo', N'940')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1030, 485, 9342, N'Volvo', N'960')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1031, 485, 9343, N'Volvo', N'850')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1032, 485, 9347, N'Volvo', N'874/875')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1033, 485, 9348, N'Volvo', N'S/V')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1034, 485, 9349, N'Volvo', N'S/V')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1035, 485, 9351, N'Volvo', N'V70/XC70')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1036, 485, 9352, N'Volvo', N'S40/V50')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1037, 485, 10206, N'Volvo', N'V60CC')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1038, 485, 10207, N'Volvo', N'S60/S60I')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1039, 485, 10208, N'Volvo', N'S60CC')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1040, 485, 13798, N'Volvo', N'S90')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1041, 485, 13799, N'Volvo', N'V90')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1042, 485, 13800, N'Volvo', N'V90CC')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1043, 485, 14118, N'Volvo', N'240')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1044, 485, 14119, N'Volvo', N'740')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1045, 485, 14120, N'Volvo', N'780')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1046, 485, 14121, N'Volvo', N'760')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1047, 485, 14122, N'Volvo', N'B10M')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1048, 485, 14124, N'Volvo', N'V40')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1049, 485, 14125, N'Volvo', N'S70')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1050, 485, 14126, N'Volvo', N'Cab')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1051, 485, 14127, N'Volvo', N'Cab')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1052, 485, 14128, N'Volvo', N'Cab')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1053, 485, 14129, N'Volvo', N'Cab')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1054, 485, 14130, N'Volvo', N'F12')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1055, 485, 14131, N'Volvo', N'F6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1056, 498, 2056, N'Hyundai', N'Equus')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1057, 498, 2057, N'Hyundai', N'Santa')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1058, 498, 2058, N'Hyundai', N'Tucson')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1059, 498, 2298, N'Hyundai', N'Veloster')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1060, 498, 2458, N'Hyundai', N'Genesis')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1061, 498, 2459, N'Hyundai', N'Sonata')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1062, 498, 2735, N'Hyundai', N'Elantra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1063, 498, 2736, N'Hyundai', N'Entourage')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1064, 498, 2771, N'Hyundai', N'Azera')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1065, 498, 2772, N'Hyundai', N'Veracruz')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1066, 498, 2773, N'Hyundai', N'Accent')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1067, 498, 2774, N'Hyundai', N'Genesis')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1068, 498, 5847, N'Hyundai', N'Tiburon')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1069, 498, 5871, N'Hyundai', N'Elantra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1070, 498, 5872, N'Hyundai', N'XG')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1071, 498, 9242, N'Hyundai', N'Excel')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1072, 498, 9252, N'Hyundai', N'Scoupe')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1073, 498, 9271, N'Hyundai', N'Elantra,')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1074, 498, 9319, N'Hyundai', N'XG300')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1075, 498, 11447, N'Hyundai', N'Elantra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1076, 498, 13617, N'Hyundai', N'Ioniq')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1077, 498, 13869, N'Hyundai', N'Ioniq')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1078, 498, 14192, N'Hyundai', N'Pony')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1079, 498, 14193, N'Hyundai', N'Stellar')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1080, 498, 16649, N'Hyundai', N'Elantra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1081, 498, 16694, N'Hyundai', N'Santa')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1082, 499, 2299, N'Kia', N'Rio')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1083, 499, 2460, N'Kia', N'Soul')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1084, 499, 2461, N'Kia', N'Borrego')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1085, 499, 2462, N'Kia', N'Forte')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1086, 499, 2738, N'Kia', N'Rondo')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1087, 499, 2739, N'Kia', N'Optima')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1088, 499, 2740, N'Kia', N'Sedona')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1089, 499, 2769, N'Kia', N'Sorento')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1090, 499, 2770, N'Kia', N'Sportage')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1091, 499, 3071, N'Kia', N'Cadenza')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1092, 499, 3184, N'Kia', N'K900')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1093, 499, 5498, N'Kia', N'Sephia')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1094, 499, 5499, N'Kia', N'Spectra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1095, 499, 5500, N'Kia', N'Amanti')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1096, 499, 5759, N'Kia', N'Spectra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1097, 499, 9243, N'Kia', N'Sephia')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1098, 499, 12815, N'Kia', N'Forte')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1099, 499, 13630, N'Kia', N'Soul')
GO
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1100, 499, 15705, N'Kia', N'Niro')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1101, 499, 16648, N'Kia', N'Optima')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1102, 515, 2180, N'Lexus', N'GS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1103, 515, 2182, N'Lexus', N'LS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1104, 515, 2183, N'Lexus', N'SC')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1105, 515, 2184, N'Lexus', N'IS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1106, 515, 2212, N'Lexus', N'LX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1107, 515, 2214, N'Lexus', N'RX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1108, 515, 2215, N'Lexus', N'GX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1109, 515, 2475, N'Lexus', N'ES')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1110, 515, 3154, N'Lexus', N'CT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1111, 515, 3185, N'Lexus', N'HS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1112, 515, 3406, N'Lexus', N'RC')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1113, 515, 3652, N'Lexus', N'LFA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1114, 515, 3653, N'Lexus', N'NX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1115, 515, 14273, N'Lexus', N'LC500')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1116, 515, 19306, N'Lexus', N'LX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1117, 523, 2232, N'Subaru', N'Legacy')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1118, 523, 2233, N'Subaru', N'Outback')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1119, 523, 2234, N'Subaru', N'Forester')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1120, 523, 2235, N'Subaru', N'Impreza')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1121, 523, 2236, N'Subaru', N'XV')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1122, 523, 2237, N'Subaru', N'WRX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1123, 523, 2238, N'Subaru', N'BRZ')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1124, 523, 2319, N'Subaru', N'Baja')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1125, 523, 2320, N'Subaru', N'B9')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1126, 523, 6093, N'Subaru', N'SVX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1127, 523, 13580, N'Subaru', N'Crosstrek')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1128, 523, 14213, N'Subaru', N'Justy')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1129, 523, 14224, N'Subaru', N'XT/XT6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1130, 523, 14226, N'Subaru', N'Loyale')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1131, 523, 14245, N'Subaru', N'Brat')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1132, 523, 17873, N'Subaru', N'XT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1133, 523, 17874, N'Subaru', N'XT6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1134, 523, 18054, N'Subaru', N'DL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1135, 523, 18055, N'Subaru', N'GL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1136, 523, 18056, N'Subaru', N'GL-10')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1137, 523, 18059, N'Subaru', N'RX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1138, 523, 18081, N'Subaru', N'Standard')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1139, 523, 18099, N'Subaru', N'GLF')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1157, 582, 3145, N'Audi', N'TT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1158, 582, 3146, N'Audi', N'A4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1159, 582, 3147, N'Audi', N'S4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1160, 582, 3148, N'Audi', N'A6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1161, 582, 3149, N'Audi', N'RS6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1162, 582, 3150, N'Audi', N'allroad')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1163, 582, 3151, N'Audi', N'A8')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1164, 582, 3675, N'Audi', N'RS4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1165, 582, 3676, N'Audi', N'A3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1166, 582, 3677, N'Audi', N'S6')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1167, 582, 3678, N'Audi', N'S8')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1168, 582, 3679, N'Audi', N'Q7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1169, 582, 3787, N'Audi', N'A5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1170, 582, 3788, N'Audi', N'S5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1171, 582, 3789, N'Audi', N'R8')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1172, 582, 3861, N'Audi', N'TTS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1173, 582, 3862, N'Audi', N'Q5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1174, 582, 4014, N'Audi', N'RS5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1175, 582, 4015, N'Audi', N'A7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1176, 582, 4016, N'Audi', N'TTRS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1177, 582, 4051, N'Audi', N'Q3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1178, 582, 4052, N'Audi', N'SQ5')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1179, 582, 8056, N'Audi', N'90')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1180, 582, 8057, N'Audi', N'100')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1181, 582, 8058, N'Audi', N'V8')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1182, 582, 8059, N'Audi', N'Cabriolet')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1183, 582, 8173, N'Audi', N'S3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1184, 582, 8258, N'Audi', N'S7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1185, 582, 8259, N'Audi', N'TT/TTS/TTRS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1186, 582, 8685, N'Audi', N'RS7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1187, 582, 13642, N'Audi', N'A6/S6/A7/S7/RS7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1188, 582, 13759, N'Audi', N'A4')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1189, 582, 13785, N'Audi', N'A3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1190, 582, 13837, N'Audi', N'S7/RS7')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1191, 582, 14336, N'Audi', N'5000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1192, 582, 14337, N'Audi', N'4000')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1193, 582, 14342, N'Audi', N'80')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1194, 582, 14343, N'Audi', N'200')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1195, 582, 14348, N'Audi', N'Coupe')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1196, 582, 16783, N'Audi', N'RS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1197, 582, 18874, N'Audi', N'TT/TTS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1198, 1056, 4323, N'Saturn', N'Astra')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1199, 1056, 4335, N'Saturn', N'Sky')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1200, 1056, 4336, N'Saturn', N'Aura')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1201, 1056, 4595, N'Saturn', N'Vue')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1202, 1056, 4596, N'Saturn', N'Outlook')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1203, 1056, 4781, N'Saturn', N'Ion')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1204, 1056, 4782, N'Saturn', N'Level')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1205, 1056, 4783, N'Saturn', N'Level')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1206, 1056, 4961, N'Saturn', N'Relay')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1207, 1056, 4964, N'Saturn', N'Relay')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1208, 1056, 8845, N'Saturn', N'Level')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1209, 1056, 8852, N'Saturn', N'L300')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1210, 1056, 8958, N'Saturn', N'L200')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1211, 1056, 8990, N'Saturn', N'SL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1212, 1056, 8991, N'Saturn', N'SL1')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1213, 1056, 8992, N'Saturn', N'SL2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1214, 1056, 8993, N'Saturn', N'SC1')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1215, 1056, 8994, N'Saturn', N'SC2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1216, 1056, 8995, N'Saturn', N'LS')
GO
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1217, 1056, 8996, N'Saturn', N'LS1/LW1')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1218, 1056, 8997, N'Saturn', N'LS2/LW2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1219, 1056, 9024, N'Saturn', N'SW1')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1220, 1056, 9070, N'Saturn', N'SW2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1221, 1056, 9071, N'Saturn', N'TBD')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1222, 1056, 9163, N'Saturn', N'SC/SL/SW')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1223, 1056, 10997, N'Saturn', N'LS1')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1224, 1056, 10998, N'Saturn', N'LS2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1225, 1056, 10999, N'Saturn', N'LW2')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1226, 1056, 11000, N'Saturn', N'LW1')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1227, 1056, 13757, N'Saturn', N'LW200')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1228, 1056, 13758, N'Saturn', N'LW300')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1229, 1056, 14186, N'Saturn', N'SL3')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1236, 5426, 14061, N'WHITEGMC', N'WCS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1237, 5426, 14062, N'WHITEGMC', N'WCM')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1238, 5426, 14063, N'WHITEGMC', N'WCL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1239, 5426, 14064, N'WHITEGMC', N'WX')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1240, 5426, 14065, N'WHITEGMC', N'WHS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1241, 5426, 14066, N'WHITEGMC', N'WHM')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1242, 5426, 14067, N'WHITEGMC', N'WXLL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1243, 5426, 14068, N'WHITEGMC', N'WHL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1244, 5426, 14069, N'WHITEGMC', N'WB')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1245, 5426, 14070, N'WHITEGMC', N'DS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1246, 5426, 14071, N'WHITEGMC', N'ACM')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1247, 5426, 14072, N'WHITEGMC', N'ACL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1248, 5426, 14073, N'WHITEGMC', N'AT')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1249, 5426, 14074, N'WHITEGMC', N'DK')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1250, 5426, 14075, N'WHITEGMC', N'WCA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1251, 5426, 14076, N'WHITEGMC', N'WIA')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1252, 5426, 14077, N'WHITEGMC', N'WIS')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1253, 5426, 14078, N'WHITEGMC', N'WIM')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1254, 5426, 14079, N'WHITEGMC', N'WIL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1255, 5426, 14094, N'WHITEGMC', N'WHR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1256, 5426, 14095, N'WHITEGMC', N'WHLB')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1257, 5426, 14096, N'WHITEGMC', N'CACL')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1258, 5426, 14097, N'WHITEGMC', N'FE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1259, 5426, 14098, N'WHITEGMC', N'CWG')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1260, 5426, 14099, N'WHITEGMC', N'NE')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1261, 5426, 14100, N'WHITEGMC', N'NR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1262, 5426, 14101, N'WHITEGMC', N'CNR')
INSERT [dbo].[MakeModel] ([MakeModelID], [MakeID], [ModelID], [MakeName], [ModelName]) VALUES (1263, 5426, 14102, N'WHITEGMC', N'WHEB')
SET IDENTITY_INSERT [dbo].[MakeModel] OFF
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1707, N'128i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1708, N'135i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1709, N'328i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1710, N'M3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1711, N'335i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1712, N'335is')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1713, N'335d')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1714, N'X6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1715, N'528i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1716, N'535i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1717, N'X5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1718, N'550i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1719, N'X3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1720, N'740i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1721, N'740Li')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1722, N'750i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1723, N'750Li')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1724, N'760Li')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1725, N'Z4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1727, N'750xi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1728, N'750Lxi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1729, N'M6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1730, N'528xi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1731, N'640i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1732, N'650i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1733, N'650xi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1736, N'G450X')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1737, N'F800S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1738, N'F800ST')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1739, N'F800GS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1740, N'F800R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1741, N'HP2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1742, N'S1000RR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1743, N'R1200GS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1744, N'R1200R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1745, N'R1200RT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1746, N'K1300S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1747, N'K1300GT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1748, N'K1300R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1749, N'F650GS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1750, N'G650GS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1751, N'R900RT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1752, N'K1600GT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1753, N'K1600GTL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1754, N'F700GS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1755, N'F800GT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1756, N'C600')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1757, N'C650GT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1758, N'HP4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1759, N'S1000R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1760, N'RnineT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1761, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1762, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1763, N'JCW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1764, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1765, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1766, N'JCW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1767, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1768, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1769, N'JCW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1778, N'Crown')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1779, N'Focus')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1780, N'Fusion')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1781, N'Mustang')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1782, N'Taurus')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1796, N'E-150')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1797, N'Edge')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1798, N'Escape')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1799, N'Expedition')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1800, N'Explorer')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1801, N'F-150')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1802, N'Flex')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1803, N'Ranger')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1804, N'Explorer')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1805, N'F-250')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1806, N'F-350')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1807, N'F-450')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1808, N'F-550')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1809, N'F-650')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1810, N'F-750')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1811, N'Transit')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1817, N'E-250')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1818, N'E-350')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1819, N'E-450')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1820, N'Expedition')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1828, N'Aveo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1829, N'Camaro')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1830, N'Caprice')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1831, N'Corvette')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1832, N'Cruze')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1833, N'Impala')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1834, N'Malibu')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1835, N'Sonic')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1836, N'Spark')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1837, N'SS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1838, N'Volt')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1846, N'Captiva')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1847, N'Equinox')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1848, N'Express')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1849, N'Orlando')
GO
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1850, N'Silverado')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1851, N'Suburban')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1852, N'Tahoe')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1853, N'Traverse')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1854, N'Tracker')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1855, N'Acadia')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1856, N'Savana')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1857, N'Sierra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1858, N'Terrain')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1859, N'Yukon')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1860, N'Tribute')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1861, N'Accord')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1862, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1863, N'Civic')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1864, N'Pilot')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1865, N'CR-V')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1866, N'Ridgeline')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1867, N'ZDX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1868, N'Element')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1869, N'Odyssey')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1870, N'Insight')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1871, N'RDX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1872, N'RL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1873, N'TL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1874, N'TSX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1875, N'FCX Clarity')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1880, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1881, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1882, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1883, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1886, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1887, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1888, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1889, N'JCW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1890, N'GT-R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1891, N'VERSA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1892, N'Avenger')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1893, N'Challenger')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1894, N'Versa')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1895, N'Charger')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1896, N'Caliber')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1897, N'Viper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1898, N'Versa')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1899, N'QX50')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1900, N'Q40')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1901, N'Q50')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1902, N'Q60')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1903, N'Q70')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1904, N'Altima')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1905, N'Leaf')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1906, N'370Z')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1907, N'Sentra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1908, N'QX70')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1909, N'QX80')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1910, N'QX60')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1911, N'Pathfinder')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1912, N'Juke')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1913, N'Rogue')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1914, N'Murano')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1915, N'Armada')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1916, N'Xterra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1917, N'Quest')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1918, N'NV200')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1919, N'Frontier')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1920, N'Titan')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1921, N'City')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1922, N'NV')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1923, N'NV')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1925, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1926, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1927, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1928, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1929, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1930, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1931, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1932, N'JCW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1933, N'JCW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1934, N'GL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1935, N'VT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1938, N'Ram')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1939, N'Journey')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1940, N'Nitro')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1941, N'Dakota')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1942, N'Caravan/Grand')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1950, N'Raider')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1951, N'Routan')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1958, N'Ram')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1959, N'S60')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1960, N'S80')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1961, N'V60')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1962, N'XC60')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1963, N'XC70')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1964, N'JCW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1970, N'1M')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (1971, N'Active')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2024, N'M5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2038, N'Q70L')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2054, N'Dart')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2056, N'Equus')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2057, N'Santa')
GO
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2058, N'Tucson')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2072, N'MX-5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2073, N'RX-8')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2074, N'Mazda3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2075, N'Mazda5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2076, N'CX-7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2077, N'CX-9')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2078, N'Mazda6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2127, N'Fit')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2128, N'CR-Z')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2147, N'MDX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2149, N'RLX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2150, N'ILX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2153, N'Mazda2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2163, N'Outlander')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2164, N'Lancer')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2165, N'Galant')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2166, N'Eclipse')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2167, N'Endeavor')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2170, N'228i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2171, N'M235i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2172, N'320i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2173, N'328d')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2178, N'i3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2179, N'i8')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2180, N'GS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2182, N'LS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2183, N'SC')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2184, N'IS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2212, N'LX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2214, N'RX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2215, N'GX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2219, N'ActiveHybrid')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2220, N'428i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2221, N'438i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2230, N'435i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2231, N'535d')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2232, N'Legacy')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2233, N'Outback')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2234, N'Forester')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2235, N'Impreza')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2236, N'XV')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2237, N'WRX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2238, N'BRZ')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2240, N'ActiveHybrid')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2242, N'XJ')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2285, N'XF')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2286, N'XK')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2298, N'Veloster')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2299, N'Rio')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2300, N'X1')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2302, N'Maxima')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2303, N'350Z')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2304, N'Q45')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2305, N'G35')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2306, N'M35')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2307, N'M45')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2313, N'X-Type')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2314, N'S-Type')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2318, N'Montero')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2319, N'Baja')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2320, N'B9')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2321, N'Eclipse')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2322, N'MPV')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2323, N'X-Trail')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2324, N'FX35')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2325, N'FX45')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2326, N'QX56')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2327, N'Cooper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2336, N'RVR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2337, N'G37')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2338, N'EX35')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2339, N'i-MiEV')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2340, N'Outlander')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2341, N'Cube')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2342, N'Mirage')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2343, N'FX50')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2345, N'Thunderbird')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2346, N'GT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2347, N'Five')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2350, N'R1150GS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2351, N'R1200S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2352, N'R1200ST')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2353, N'K1200R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2354, N'K1200S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2355, N'K1200LT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2356, N'M56')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2357, N'M37')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2358, N'G25')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2359, N'K1200GT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2360, N'R1150R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2361, N'R850R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2362, N'G650')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2363, N'G650')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2364, N'G650')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2368, N'M35h')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2369, N'CX-5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2370, N'Excursion')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2373, N'FX37')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2374, N'JX35')
GO
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2375, N'F-Type')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2376, N'535xi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2377, N'328xi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2378, N'335xi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2379, N'Freestyle')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2384, N'Freestar')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2458, N'Genesis')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2459, N'Sonata')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2460, N'Soul')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2461, N'Borrego')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2462, N'Forte')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2475, N'ES')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2584, N'525i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2585, N'530i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2586, N'530xi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2587, N'525xi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2735, N'Elantra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2736, N'Entourage')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2737, N'Motorhome')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2738, N'Rondo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2739, N'Optima')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2740, N'Sedona')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2741, N'B-Series')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2759, N'325Cic')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2760, N'330Cic')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2761, N'M3Cic')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2762, N'325Ci')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2763, N'330Ci')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2764, N'325i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2765, N'325xi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2766, N'325xiT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2767, N'530xiT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2769, N'Sorento')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2770, N'Sportage')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2771, N'Azera')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2772, N'Veracruz')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2773, N'Accent')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2774, N'Genesis')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2777, N'330i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2778, N'330xi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2804, N'760i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2887, N'HP2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (2888, N'HP2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3050, N'325iT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3051, N'545i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3052, N'645Ci')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3053, N'645Cic')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3054, N'745i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3055, N'745Li')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3071, N'Cadenza')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3121, N'Sprinter')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3127, N'S40')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3128, N'V50')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3129, N'C70')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3130, N'V70')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3132, N'XC90')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3133, N'Golf')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3134, N'Passat')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3135, N'Phaeton')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3136, N'Touareg')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3137, N'Jetta')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3140, N'GTI')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3141, N'R32')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3142, N'Jetta')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3144, N'C30')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3145, N'TT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3146, N'A4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3147, N'S4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3148, N'A6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3149, N'RS6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3150, N'allroad')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3151, N'A8')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3153, N'S2000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3154, N'CT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3159, N'M')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3160, N'Taurus')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3183, N'RSX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3184, N'K900')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3185, N'HS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3233, N'NM4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3234, N'PCX150')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3235, N'CB1100')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3236, N'CB300F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3237, N'CB500F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3238, N'CB500X')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3239, N'CBR1000RR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3240, N'CBR300R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3241, N'CBR500R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3242, N'CBR600RR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3243, N'CBR650F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3244, N'REBEL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3245, N'CRF250L')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3246, N'CTX1300')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3247, N'CTX700')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3248, N'CTX700N')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3249, N'GOLDWING')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3250, N'GROM')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3251, N'NC700X')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3252, N'METROPOLITAN')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3253, N'NPS50 RUCKUS
')
GO
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3254, N'FORZA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3255, N'ST1300PA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3256, N'INTERCEPTOR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3257, N'STATELINE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3258, N'INTERSTATE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3259, N'FURY')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3260, N'SHADOW AERO
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3261, N'SHADOW PHANTOM
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3262, N'XR650L')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3263, N'SHADOW SPIRIT 750
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3264, N'ST1300')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3265, N'GOLDWING F6B
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3266, N'GOLDWING VALKYRIE
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3267, N'Fiesta')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3406, N'RC')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3409, N'CB1100R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3410, N'Commercial')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3411, N'Silverwing')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3412, N'CB1000R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3420, N'CBR250R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3422, N'VFR1200F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3423, N'SABRE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3428, N'SHADOW RS
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3438, N'NT700V')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3439, N'PCX125')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3444, N'ELITE 110
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3445, N'SH150I')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3446, N'VT1300CX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3447, N'CRF 230L
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3448, N'CRF 230M
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3449, N'DN-01')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3459, N'VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3462, N'C-max')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3463, N'VTX1800F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3464, N'VTX1800N')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3465, N'VTX1800T')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3466, N'CB250/NIGHTHAWK')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3473, N'919')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3474, N'Elite80')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3475, N'Helix')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3476, N'Reflex')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3477, N'VTX1300C')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3478, N'VTX1300R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3479, N'VTX1300S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3480, N'VTX1800C')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3481, N'VTX1800R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3482, N'Shadow Sabre
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3483, N'Shadow Spirit
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3484, N'Shadow VLX
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3487, N'599')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3488, N'BIG RUKUS
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3489, N'VTX1800S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3491, N'CBR600Fi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3492, N'RC51')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3506, N'VALKYRIE RUNE
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3507, N'ST1300P')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3508, N'Durango')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3509, N'SUPERHAWK')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3510, N'Chassis')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3511, N'9700')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3515, N'CB600F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3520, N'NIGHTHAWK 750
')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3521, N'CBR1100XX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3522, N'CBR954RR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3523, N'SHADOW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3526, N'VALKYRIE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3527, N'ST1100P')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3528, N'MAGNA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3530, N'ST1100')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3531, N'Prizm')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3565, N'SHADOW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3566, N'CBR929RR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3567, N'ELITE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3597, N'CBR900RR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3608, N'Transit')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3616, N'CBR600F3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3617, N'CBR600SE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3618, N'Pacific')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3652, N'LFA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3653, N'NX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3654, N'VFR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3657, N'Shadow')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3658, N'Shadow')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3664, N'CBR1000F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3666, N'XR250L')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3668, N'CB1000F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3669, N'Shadow')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3670, N'Shadow')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3672, N'CT70')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3673, N'CBR600F2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3674, N'RC')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3675, N'RS4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3676, N'A3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3677, N'S6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3678, N'S8')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3679, N'Q7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3680, N'Magnum')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3684, N'Hawk')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3694, N'CBT125TT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3695, N'CB-1')
GO
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3696, N'Elite')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3697, N'Tourist')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3698, N'NS50F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3699, N'NX250')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3700, N'NX125')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3701, N'SA50')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3702, N'SB50P')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3703, N'RC30')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3704, N'VTR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3705, N'XL600V')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3720, N'CB125TT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3735, N'VT1100C')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3776, N'ELITE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3777, N'TRANSALP')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3778, N'NX650')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3779, N'CBR600F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3787, N'A5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3788, N'S5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3789, N'R8')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3861, N'TTS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3862, N'Q5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (3876, N'Avalanche')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4014, N'RS5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4015, N'A7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4016, N'TTRS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4047, N'Matiz')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4051, N'Q3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4052, N'SQ5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4084, N'Rabbit')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4085, N'New')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4086, N'Colorado')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4093, N'Canyon')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4167, N'Eos')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4234, N'Cobalt')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4251, N'Optra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4255, N'Kalos')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4256, N'Lacetti')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4323, N'Astra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4335, N'Sky')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4336, N'Aura')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4507, N'Envoy')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4548, N'Trailblazer')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4579, N'Yukon')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4586, N'HHR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4588, N'Uplander')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4595, N'Vue')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4596, N'Outlook')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4687, N'W4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4688, N'W5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4773, N'Monte')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4781, N'Ion')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4782, N'Level')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4783, N'Level')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4865, N'Chevy')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4889, N'SSR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4961, N'Relay')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4964, N'Relay')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (4992, N'Epica')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5008, N'Full')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5017, N'Full')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5059, N'Golf')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5063, N'Integra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5094, N'K1100RS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5095, N'K75')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5096, N'K75S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5097, N'K75RT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5098, N'K1100LT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5099, N'R100')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5100, N'R100R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5101, N'R100RT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5102, N'R100GS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5104, N'R1100R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5105, N'R1100RS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5106, N'R1100GS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5107, N'Prelude')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5108, N'F650')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5109, N'F650S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5110, N'R1100RT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5111, N'K1200RS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5112, N'R1200C')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5132, N'F650CS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5136, N'R1100S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5137, N'R1150RS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5138, N'R1150RT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5139, N'R1200CL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5145, N'CL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5168, N'NSX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5178, N'318i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5185, N'318iS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5186, N'318iC')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5187, N'325iS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5190, N'325iC')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5193, N'525iT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5194, N'530iT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5195, N'540i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5198, N'840Ci')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5199, N'850Ci')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5200, N'850CSi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5217, N'318ti')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5237, N'328iC')
GO
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5238, N'328iS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5239, N'Z3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5253, N'323i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5254, N'323is')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5255, N'323iC')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5324, N'Z8')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5339, N'Legend')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5343, N'525iA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5347, N'530iA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5348, N'540iA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5349, N'525iAT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5350, N'540iAT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5354, N'TLX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5355, N'Alpina')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5384, N'645i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5402, N'NC700JD')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5410, N'Protege')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5411, N'ww150')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5422, N'Expo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5423, N'3000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5424, N'3000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5425, N'Diamante')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5426, N'Truck')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5470, N'Millenia')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5471, N'626')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5494, N'323')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5495, N'MX-3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5496, N'929')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5497, N'RX-7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5498, N'Sephia')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5499, N'Spectra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5500, N'Amanti')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5565, N'240SX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5566, N'300ZX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5572, N'J30')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5573, N'G20')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5748, N'Pickup')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5755, N'Montero')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5756, N'Altra-EV')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5759, N'Spectra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5808, N'Lancer')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5809, N'Lancer')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5813, N'I35')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5847, N'Tiburon')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5871, N'Elantra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5872, N'XG')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5878, N'Intrepid')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5879, N'Stratus')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5880, N'Neon')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5959, N'Passport')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5968, N'W4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5969, N'W6/FSR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5970, N'W7/FTR/FVR/EVR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (5992, N'X4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (6004, N'SLX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (6093, N'SVX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (6250, N'Colt')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (6254, N'Stealth')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (6356, N'Ramcharger')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (6435, N'X100')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (6436, N'Sovereign')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (6437, N'VDP')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (7791, N'MX-6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8051, N'Golf')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8052, N'Jetta')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8053, N'Corrado')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8055, N'Euro')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8056, N'90')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8057, N'100')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8058, N'V8')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8059, N'Cabriolet')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8118, N'e-Golf')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8119, N'Beetle')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8121, N'CC')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8151, N'Tiguan')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8173, N'S3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8258, N'S7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8259, N'TT/TTS/TTRS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8364, N'Jetta')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8459, N'Sentra/200SX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8460, N'Cabrio')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8461, N'Stanza/Altima')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8475, N'new')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8486, N'New')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8487, N'New')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8488, N'New')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8685, N'RS7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8702, N'I30')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8717, N'QX4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8834, N'Cavalier')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8835, N'U100')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8836, N'Magnus')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8837, N'Rezzo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8845, N'Level')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8852, N'L300')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8879, N'Safari')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8881, N'3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8882, N'Astro')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8883, N'Venture')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8958, N'L200')
GO
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8990, N'SL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8991, N'SL1')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8992, N'SL2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8993, N'SC1')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8994, N'SC2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8995, N'LS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8996, N'LS1/LW1')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (8997, N'LS2/LW2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9015, N'F6/F7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9016, N'B7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9024, N'SW1')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9044, N'Electric')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9064, N'Lumina')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9070, N'SW2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9071, N'TBD')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9088, N'Alero')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9095, N'Geo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9115, N'Caprice')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9116, N'Corsica')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9117, N'Beretta')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9139, N'Hearse/Limo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9163, N'SC/SL/SW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9173, N'Crosstour')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9201, N'Super')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9212, N'HR-V')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9213, N'L8501')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9214, N'LT8501')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9215, N'L9501')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9216, N'LT9501')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9217, N'L8511')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9218, N'LT8511')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9219, N'L9511')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9220, N'LT9511')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9221, N'L8513')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9222, N'LT8513')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9223, N'L9513')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9224, N'LT9513')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9225, N'L9522')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9226, N'LT9522')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9227, N'A8513')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9228, N'AT8513')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9229, N'A9513')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9230, N'AT9513')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9231, N'A9522')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9232, N'AT9522')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9242, N'Excel')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9243, N'Sephia')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9252, N'Scoupe')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9253, N'335')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9268, N'B800')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9270, N'F-Super')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9271, N'Elantra,')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9272, N'F-700')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9282, N'P700')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9283, N'P800')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9284, N'FT900')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9285, N'L8000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9286, N'L9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9287, N'LL9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9288, N'LLA9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9289, N'LLS9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9290, N'LS8000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9291, N'LS9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9292, N'LT8000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9293, N'LT9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9294, N'LTS8000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9295, N'LTS9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9296, N'LTL9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9297, N'LTLA9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9298, N'LTLS9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9299, N'LA8000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9300, N'LA9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9301, N'LTA9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9302, N'LN7000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9303, N'LN8000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9304, N'LN9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9305, N'LNT8000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9306, N'LNT9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9307, N'CF8000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9308, N'CFT8000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9312, N'CF7000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9319, N'XG300')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9339, N'XK8')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9340, N'XJR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9341, N'940')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9342, N'960')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9343, N'850')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9347, N'874/875')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9348, N'S/V')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9349, N'S/V')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9351, N'V70/XC70')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9352, N'S40/V50')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9452, N'740iL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9453, N'750iL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9459, N'M3Ci')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9547, N'ActiveHybrid')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9567, N'M2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9568, N'340i')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9569, N'330e')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9570, N'M4')
GO
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (9577, N'del')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10001, N'CBR300RA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10007, N'CBR650FA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10043, N'Metro')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10045, N'S1000XR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10046, N'R1200RS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10047, N'C650')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10202, N'CX-3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10206, N'V60CC')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10207, N'S60/S60I')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10208, N'S60CC')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10250, N'RC213V-S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10251, N'NC700XD')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10252, N'CBR500RA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10253, N'CB500FA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10254, N'CB500XA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10327, N'3500')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10378, N'Festiva')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10587, N'328Ci')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10613, N'CRF450R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10614, N'CRF250R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10616, N'TRX500FPA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10617, N'CRF150F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10618, N'CRF50F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10619, N'XR400R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10620, N'TRX700XX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10622, N'TRX450ER')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10623, N'TRX500FM')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10791, N'FourTrax')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10792, N'TRX400X')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10956, N'Sportrax')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10957, N'TRX450R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10958, N'CRF70F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10959, N'CRF100F')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10960, N'CR250R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10961, N'XR650R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10962, N'Ram')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10963, N'Ram')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10977, N'Special')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10978, N'GMT-400')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10979, N'Military')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10980, N'Compact')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10981, N'Vans/Sport')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10983, N'Forward')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10984, N'Small')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10985, N'GMT-400')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10988, N'Trax')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10989, N'Venture/Uplander')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10994, N'3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10995, N'Suburban/Yukon')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10997, N'LS1')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10998, N'LS2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (10999, N'LW2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11000, N'LW1')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11073, N'Sonoma')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11387, N'SA50P')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11408, N'CR125R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11409, N'XR250R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11435, N'MUV700/Big')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11440, N'XE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11441, N'F-Pace')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11447, N'Elantra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11483, N'S-10')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11488, N'Suburban')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11489, N'C/K')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11490, N'C/K')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11491, N'P')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11495, N'Vigor')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11497, N'Lumina')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11502, N'Blazer')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11503, N'Jimmy')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11506, N'NX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11507, N'NX/Sentra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11508, N'Stanza')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11509, N'Axxess')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11510, N'M30')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11517, N'EV')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11588, N'TRX90')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11589, N'XR600R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11590, N'TRX200D')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11591, N'TRX200DN')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11592, N'TRX250')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11593, N'TRX300')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11594, N'TRX300EX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11595, N'TRX300EXN')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11596, N'TRX300FW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11597, N'TRX300FWN')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11598, N'TRX300N')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11599, N'TRX400FW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11600, N'TRX400FWN')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11601, N'TRX450S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11602, N'TRX450ES')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11603, N'TRX400EX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11648, N'CB500XL-CB500X')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11649, N'CB500XA-CB500X')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11650, N'NC700XL-NC700X')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11651, N'NC700XD-NC700X')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11652, N'NC700XDL-NC700X')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11653, N'CMX250-REBEL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11654, N'CMX250CL-REBEL')
GO
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11655, N'CTX700NL-CTX700N')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11656, N'CTX700ND-CTX700N')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11657, N'CTX700NDL-CTX700N')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11658, N'NC700JD-NM4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11659, N'VT750C-SHADOW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11660, N'VT750CL-SHADOW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11661, N'VT750CA-SHADOW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11662, N'VT750CA-SHADOW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11663, N'VT750CAL-SHADOW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11664, N'VT750C2B-SHADOW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11665, N'VT750C2BL-SHADOW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11666, N'VT1300CX-FURY')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11667, N'VT1300CXL-FURY')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11668, N'VT1300CXA-FURY')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11669, N'VT1300CR-STATELINE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11670, N'VT1300CRL-STATELINE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11671, N'VT1300CT-INTERSTATE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11672, N'VT1300CTL-INTERSTATE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11673, N'VT1300CTA-INTERSTATE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11674, N'XR650LL-XR650L')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11675, N'CBR300RA/CBR300R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11676, N'WW150-PCX150')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11677, N'CTX700-CTX700D')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11678, N'CTX600D-CTX700DL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11683, N'TRX90X')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11684, N'TRX420FA1/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11686, N'TRX420FA2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11687, N'TRX420FA1/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11688, N'TRX420FA2/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11689, N'TRX420FA5/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11690, N'TRX420FA5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11691, N'TRX420FA6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11698, N'TRX420FA6/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11700, N'TRX420FA6C/TRX420FA6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11703, N'TRX420FE1/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11704, N'TRX420FM1/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11709, N'TRX420FM1/TRX420FM')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11710, N'TRX420FM2')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11718, N'TRX420FM2/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11726, N'TRX420TE1/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11727, N'TRZ420TM1/ROUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11728, N'TRX500FA5/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11729, N'TRX500FA6/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11730, N'TRX500FA6/TRX500FA6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11740, N'TRX500FA7/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11741, N'TRX500FA7/TRX500FA7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11742, N'TRX500FE1/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11743, N'TRX500FE2/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11744, N'TRX500FE2/TRX500FPE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11745, N'TRX500FM1/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11746, N'TRX500FM1/TRX500FPM')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11747, N'TRX500FM2/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11748, N'TRX500FM2/TRX500FPM')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11749, N'TRX500FMS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11750, N'TRX500FM5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11751, N'TRX500FM6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11752, N'TRX500FM7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11753, N'TRX500FPA/FOUR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11754, N'TRX500PG/RUBICON')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11755, N'TRX680F/RINCON')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11756, N'TRX680FA/FOURTRAX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11757, N'TRX500FM1/TRX500FM')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11759, N'NCH50/GIORNO')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11760, N'NCH50/METROPOLITAN')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11761, N'NPS50/RUCKUS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11762, N'NSS300/FORZA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11763, N'NSS300A/FORZA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11764, N'WW150/PCX150')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11765, N'CB300FA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11766, N'CB500F-CB500FL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (11942, N'Low')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12505, N'VTX1800C3/VTX	')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12506, N'VTX1800F1/VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12507, N'VTX1800F2/VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12508, N'VTX1800N3/VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12509, N'VTX1800N2/VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12510, N'VTX1800N1/VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12511, N'VTX1800R3/VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12512, N'VTX1800R2/VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12513, N'VTX1800R1/VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12514, N'VTX1800S3/VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12515, N'VTX1800S2/VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12516, N'VTX1800S1/VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12520, N'VTX1800F3/VTX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12522, N'NCW50/METROPOLITAN')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12523, N'RC1000VS/RC213V-S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12527, N'TRX90/SPORTRAX90')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12528, N'TRX250TE/RECON')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12529, N'RX250TM/')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12530, N'TRX400FW/FOURTRAX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (12815, N'Forte')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13514, N'FX35/FX45')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13524, N'PULSAR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13576, N'XJ')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13578, N'XJ8/XJ8L')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13580, N'Crosstrek')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13617, N'Ioniq')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13630, N'Soul')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13634, N'Impala')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13642, N'A6/S6/A7/S7/RS7')
GO
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13668, N'Golf/Golf')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13670, N'Golf')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13672, N'Bolt')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13737, N'3500HD')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13738, N'5500HD')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13739, N'3500')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13740, N'4500HD')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13741, N'4500XD')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13742, N'5500XD')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13757, N'LW200')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13758, N'LW300')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13759, N'A4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13785, N'A3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13798, N'S90')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13799, N'V90')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13800, N'V90CC')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13820, N'QX30')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13821, N'NV3500')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13837, N'S7/RS7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13839, N'GLC')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13842, N'Mirage')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13844, N'Golf')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13845, N'Golf')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13864, N'C-Series')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13865, N'T-Series')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13867, N'Outlander')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13869, N'Ioniq')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13901, N'Navajo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13958, N'Tempo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13977, N'B600')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13978, N'B700')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13979, N'F-600')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13980, N'Recreational')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13981, N'F-590')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (13983, N'P600')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14018, N'C4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14019, N'C5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14021, N'C6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14022, N'C7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14023, N'C8')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14029, N'W5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14030, N'W7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14032, N'T-Series')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14033, N'C4')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14034, N'C5')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14035, N'C6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14036, N'C7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14037, N'C8')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14040, N'W7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14061, N'WCS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14062, N'WCM')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14063, N'WCL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14064, N'WX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14065, N'WHS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14066, N'WHM')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14067, N'WXLL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14068, N'WHL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14069, N'WB')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14070, N'DS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14071, N'ACM')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14072, N'ACL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14073, N'AT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14074, N'DK')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14075, N'WCA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14076, N'WIA')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14077, N'WIS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14078, N'WIM')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14079, N'WIL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14094, N'WHR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14095, N'WHLB')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14096, N'CACL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14097, N'FE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14098, N'CWG')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14099, N'NE')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14100, N'NR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14101, N'CNR')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14102, N'WHEB')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14118, N'240')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14119, N'740')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14120, N'780')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14121, N'760')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14122, N'B10M')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14124, N'V40')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14125, N'S70')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14126, N'Cab')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14127, N'Cab')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14128, N'Cab')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14129, N'Cab')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14130, N'F12')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14131, N'F6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14145, N'XJ6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14148, N'CL9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14149, N'CLT9000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14150, N'Bronco')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14152, N'FT800')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14153, N'CT8000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14154, N'C800')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14155, N'C8000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14166, N'Hearse/Limo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14186, N'SL3')
GO
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14192, N'Pony')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14193, N'Stellar')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14196, N'Laser')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14199, N'LTD')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14205, N'W3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14206, N'W3')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14213, N'Justy')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14216, N'CABRIOLET')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14217, N'FOX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14224, N'XT/XT6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14226, N'Loyale')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14245, N'Brat')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14261, N'Quantum')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14262, N'scirocco')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14266, N'Vanagon')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14270, N'MULTI-VAN')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14271, N'Camper')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14272, N'Van')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14273, N'LC500')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14297, N'B7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14329, N'Stanza')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14336, N'5000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14337, N'4000')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14342, N'80')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14343, N'200')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14348, N'Coupe')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14351, N'Spirit')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14363, N'SHADOW')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14367, N'Expo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14375, N'Dynasty')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14376, N'Daytona')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14385, N'200SX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14389, N'Monaco')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14395, N'Mitsubishi')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14397, N'Geo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14402, N'OMNI')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14414, N'SHELBY')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14415, N'ARIES')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14416, N'600')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14417, N'DIPLOMAT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14418, N'LANCER')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14419, N'Conquest')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14440, N'W6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14444, N'P6S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14447, N'D7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14450, N'W6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14451, N'D7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14452, N'P6S')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14457, N'S-10')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14458, N'P')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14460, N'Celebrity')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14461, N'Geo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14462, N'G-Series')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14463, N'Van')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14464, N'Cutaway')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14465, N'Motorhome')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14469, N'P')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14470, N'Motorhome')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14472, N'Cutaway')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14475, N'Chevette')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14476, N'S15')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14479, N'Vandura')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14480, N'Cutaway')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14481, N'Rally')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14497, N'Magna')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14498, N'Typhoon')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14499, N'Value')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14500, N'Hi-Cube')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14501, N'Hi-Cube')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14502, N'Cutaway')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14506, N'S7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14507, N'S7')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14513, N'Sprint')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14515, N'Nova')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14533, N'Geo')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14535, N'S6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14536, N'Jimmy')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14537, N'Syclone')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14538, N'R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14539, N'V')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14544, N'S6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14545, N'R')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14546, N'V')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14547, N'Citation')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14554, N'S15')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14555, N'Forward')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14568, N'Dasher')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14569, N'KOMBI')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14571, N'Aluminum')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14596, N'Heavy')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14602, N'Bus')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14614, N'Fairmont')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14615, N'XJS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14616, N'Bus')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14617, N'Heavy')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14618, N'Granada')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14619, N'Aluminum')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14626, N'Caballero')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14629, N'Transit')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14630, N'Articulated')
GO
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14637, N'El')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14766, N'400')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14767, N'Mirada')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14772, N'ST.REGIS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14782, N'Medium')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14831, N'Caravan')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14832, N'Grand')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14864, N'RAM')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14868, N'D-Series')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14869, N'W-Series')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14939, N'Raider')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (14969, N'Mini')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (15003, N'Royal')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (15056, N'D50')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (15083, N'Rampage')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (15124, N'RD200')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (15634, N'LUV')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (15705, N'Niro')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (16264, N'GM515')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (16648, N'Optima')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (16649, N'Elantra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (16694, N'Santa')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (16783, N'RS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (17214, N'Rogue')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (17528, N'Malibu')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (17615, N'Sentra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (17616, N'Altra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (17618, N'Atlas')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (17817, N'Micra')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (17873, N'XT')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (17874, N'XT6')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (18054, N'DL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (18055, N'GL')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (18056, N'GL-10')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (18059, N'RX')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (18081, N'Standard')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (18099, N'GLF')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (18137, N'Rogue')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (18874, N'TT/TTS')
INSERT [dbo].[Model] ([ModelID], [Model_Name]) VALUES (19306, N'LX')
SET IDENTITY_INSERT [dbo].[PurchaseType] ON 

INSERT [dbo].[PurchaseType] ([PurchaseTypeId], [Description]) VALUES (1, N'Dealer Finance')
INSERT [dbo].[PurchaseType] ([PurchaseTypeId], [Description]) VALUES (2, N'Bank Finance')
INSERT [dbo].[PurchaseType] ([PurchaseTypeId], [Description]) VALUES (3, N'Credit Union Finance')
INSERT [dbo].[PurchaseType] ([PurchaseTypeId], [Description]) VALUES (4, N'Cash')
INSERT [dbo].[PurchaseType] ([PurchaseTypeId], [Description]) VALUES (5, N'Credit Card')
SET IDENTITY_INSERT [dbo].[PurchaseType] OFF
INSERT [dbo].[Special] ([Special_ID], [Special_Title], [Special_Description]) VALUES (1, N'non fecit, plorum transit. apparens eudis novum Pro esset novum plorum vantis. estum. si quad novum vantis.', N'gravis glavans fecundio, vantis. esset volcans sed Tam estum. delerium. et transit. bono dolorum quo Versus in manifestum Id brevens, linguens')
INSERT [dbo].[Special] ([Special_ID], [Special_Title], [Special_Description]) VALUES (2, N'delerium. fecit, gravis plorum brevens, Tam quartu nomen non fecundio, Et bono si quartu Sed venit. homo, et', N'gravis novum Longam, transit. delerium. et e Id vantis. si dolorum parte gravis cognitio, Pro fecit, fecit.')
INSERT [dbo].[Special] ([Special_ID], [Special_Title], [Special_Description]) VALUES (3, N'funem. novum quis venit. e pars Sed apparens linguens linguens dolorum estis fecit, quo quoque glavans regit,', N'non estum. ut regit, nomen vobis cognitio, nomen plorum quorum et et eudis non rarendum imaginator Quad')
INSERT [dbo].[Special] ([Special_ID], [Special_Title], [Special_Description]) VALUES (4, N'bono novum vantis. brevens, travissimantor parte non regit, parte transit. e Id apparens plorum manifestum gravis apparens', N'nomen gravis eudis fecit, quo dolorum glavans quad parte apparens imaginator in parte eudis egreddior')
INSERT [dbo].[Special] ([Special_ID], [Special_Title], [Special_Description]) VALUES (5, N'estum. apparens habitatio imaginator ut essit. nomen regit, estis non egreddior Versus quo delerium. vantis.', N'quad quo, vobis si quo quartu non bono linguens habitatio Tam Multum esset nomen non delerium. Tam volcans')
INSERT [dbo].[Special] ([Special_ID], [Special_Title], [Special_Description]) VALUES (6, N'quo, essit. fecundio, quad gravum pladior vantis. fecundio, linguens quorum quad quo, pars fecit, volcans pars novum quad gravum', N'sed ut Multum essit. fecundio, et pars et glavans Pro dolorum esset gravum delerium. dolorum egreddior')
INSERT [dbo].[Special] ([Special_ID], [Special_Title], [Special_Description]) VALUES (7, N'quad esset quad quartu si et non habitatio funem. linguens dolorum Versus imaginator nomen et novum glavans', N'linguens habitatio ut et Tam fecundio, ut novum novum quantare quis non e et glavans Pro fecundio, quo')
INSERT [dbo].[Special] ([Special_ID], [Special_Title], [Special_Description]) VALUES (8, N'et manifestum quo linguens Id quo linguens gravum linguens dolorum glavans vobis non estis sed novum egreddior brevens, in', N'novum rarendum quoque fecit, si regit, glavans rarendum novum volcans delerium. si nomen quad egreddior in quo')
INSERT [dbo].[Special] ([Special_ID], [Special_Title], [Special_Description]) VALUES (9, N'volcans plorum quad Sed non eudis quis bono venit. cognitio, novum e estis linguens estis Versus et cognitio,', N'cognitio, rarendum quis novum quad glavans quis vobis e apparens sed vantis. quis plorum quo, fecundio,')
INSERT [dbo].[Special] ([Special_ID], [Special_Title], [Special_Description]) VALUES (10, N'habitatio vobis imaginator et Et quoque essit. gravum gravis imaginator Longam, esset quoque quoque et e Versus', N'gravis regit, et non linguens nomen quo, Versus plorum gravis gravis quis manifestum et vobis quantare quo, Pro')
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (1, N'Alabama', N'AL', N'USA', N'State', 10, N'current', N'Occupied', N'', N'1', N'Ala.', N'IV', N'3', N'South', N'6', N'East South Central', N'11')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (2, N'Alaska', N'AK', N'USA', N'State', 10, N'current', N'Occupied', N'', N'2', N'Alaska', N'X', N'4', N'West', N'9', N'Pacific', N'9')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (3, N'Arizona', N'AZ', N'USA', N'State', 10, N'current', N'Occupied', N'', N'4', N'Ariz.', N'IX', N'4', N'West', N'8', N'Mountain', N'9')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (4, N'Arkansas', N'AR', N'USA', N'State', 10, N'current', N'Occupied', N'', N'5', N'Ark.', N'VI', N'3', N'South', N'7', N'West South Central', N'8')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (5, N'California', N'CA', N'USA', N'State', 10, N'current', N'Occupied', N'', N'6', N'Calif.', N'IX', N'4', N'West', N'9', N'Pacific', N'9')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (6, N'Colorado', N'CO', N'USA', N'State', 10, N'current', N'Occupied', N'', N'8', N'Colo.', N'VIII', N'4', N'West', N'8', N'Mountain', N'10')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (7, N'Connecticut', N'CT', N'USA', N'State', 10, N'current', N'Occupied', N'', N'9', N'Conn.', N'I', N'1', N'Northeast', N'1', N'New England', N'2')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (8, N'Delaware', N'DE', N'USA', N'State', 10, N'current', N'Occupied', N'', N'10', N'Del.', N'III', N'3', N'South', N'5', N'South Atlantic', N'3')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (9, N'FlorStateIda', N'FL', N'USA', N'State', 10, N'current', N'Occupied', N'', N'12', N'Fla.', N'IV', N'3', N'South', N'5', N'South Atlantic', N'11')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (10, N'Georgia', N'GA', N'USA', N'State', 10, N'current', N'Occupied', N'', N'13', N'Ga.', N'IV', N'3', N'South', N'5', N'South Atlantic', N'11')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (11, N'Hawaii', N'HI', N'USA', N'State', 10, N'current', N'Occupied', N'', N'15', N'Hawaii', N'IX', N'4', N'West', N'9', N'Pacific', N'9')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (12, N'Idaho', N'ID', N'USA', N'State', 10, N'current', N'Occupied', N'', N'16', N'Idaho', N'X', N'4', N'West', N'8', N'Mountain', N'9')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (13, N'Illinois', N'IL', N'USA', N'State', 10, N'current', N'Occupied', N'', N'17', N'Ill.', N'V', N'2', N'MStateIdwest', N'3', N'East North Central', N'7')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (14, N'Indiana', N'IN', N'USA', N'State', 10, N'current', N'Occupied', N'', N'18', N'Ind.', N'V', N'2', N'MStateIdwest', N'3', N'East North Central', N'7')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (15, N'Iowa', N'IA', N'USA', N'State', 10, N'current', N'Occupied', N'', N'19', N'Iowa', N'VII', N'2', N'MStateIdwest', N'4', N'West North Central', N'8')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (16, N'Kansas', N'KS', N'USA', N'State', 10, N'current', N'Occupied', N'', N'20', N'Kan.', N'VII', N'2', N'MStateIdwest', N'4', N'West North Central', N'10')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (17, N'Kentucky', N'KY', N'USA', N'State', 10, N'current', N'Occupied', N'', N'21', N'Ky.', N'IV', N'3', N'South', N'6', N'East South Central', N'6')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (18, N'Louisiana', N'LA', N'USA', N'State', 10, N'current', N'Occupied', N'', N'22', N'La.', N'VI', N'3', N'South', N'7', N'West South Central', N'5')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (19, N'Maine', N'ME', N'USA', N'State', 10, N'current', N'Occupied', N'', N'23', N'Maine', N'I', N'1', N'Northeast', N'1', N'New England', N'1')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (20, N'Maryland', N'MD', N'USA', N'State', 10, N'current', N'Occupied', N'', N'24', N'Md.', N'III', N'3', N'South', N'5', N'South Atlantic', N'4')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (21, N'Massachusetts', N'MA', N'USA', N'State', 10, N'current', N'Occupied', N'', N'25', N'Mass.', N'I', N'1', N'Northeast', N'1', N'New England', N'1')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (22, N'Michigan', N'MI', N'USA', N'State', 10, N'current', N'Occupied', N'', N'26', N'Mich.', N'V', N'2', N'MStateIdwest', N'3', N'East North Central', N'6')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (23, N'Minnesota', N'MN', N'USA', N'State', 10, N'current', N'Occupied', N'', N'27', N'Minn.', N'V', N'2', N'MStateIdwest', N'4', N'West North Central', N'8')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (24, N'Mississippi', N'MS', N'USA', N'State', 10, N'current', N'Occupied', N'', N'28', N'Miss.', N'IV', N'3', N'South', N'6', N'East South Central', N'5')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (25, N'Missouri', N'MO', N'USA', N'State', 10, N'current', N'Occupied', N'', N'29', N'Mo.', N'VII', N'2', N'MStateIdwest', N'4', N'West North Central', N'8')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (26, N'Montana', N'MT', N'USA', N'State', 10, N'current', N'Occupied', N'', N'30', N'Mont.', N'VIII', N'4', N'West', N'8', N'Mountain', N'9')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (27, N'Nebraska', N'NE', N'USA', N'State', 10, N'current', N'Occupied', N'', N'31', N'Neb.', N'VII', N'2', N'MStateIdwest', N'4', N'West North Central', N'8')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (28, N'Nevada', N'NV', N'USA', N'State', 10, N'current', N'Occupied', N'', N'32', N'Nev.', N'IX', N'4', N'West', N'8', N'Mountain', N'9')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (29, N'New Hampshire', N'NH', N'USA', N'State', 10, N'current', N'Occupied', N'', N'33', N'N.H.', N'I', N'1', N'Northeast', N'1', N'New England', N'1')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (30, N'New Jersey', N'NJ', N'USA', N'State', 10, N'current', N'Occupied', N'', N'34', N'N.J.', N'II', N'1', N'Northeast', N'2', N'MStateId-Atlantic', N'3')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (31, N'New Mexico', N'NM', N'USA', N'State', 10, N'current', N'Occupied', N'', N'35', N'N.M.', N'VI', N'4', N'West', N'8', N'Mountain', N'10')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (32, N'New York', N'NY', N'USA', N'State', 10, N'current', N'Occupied', N'', N'36', N'N.Y.', N'II', N'1', N'Northeast', N'2', N'MStateId-Atlantic', N'2')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (33, N'North Carolina', N'NC', N'USA', N'State', 10, N'current', N'Occupied', N'', N'37', N'N.C.', N'IV', N'3', N'South', N'5', N'South Atlantic', N'4')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (34, N'North Dakota', N'ND', N'USA', N'State', 10, N'current', N'Occupied', N'', N'38', N'N.D.', N'VIII', N'2', N'MStateIdwest', N'4', N'West North Central', N'8')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (35, N'Ohio', N'OH', N'USA', N'State', 10, N'current', N'Occupied', N'', N'39', N'Ohio', N'V', N'2', N'MStateIdwest', N'3', N'East North Central', N'6')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (36, N'Oklahoma', N'OK', N'USA', N'State', 10, N'current', N'Occupied', N'', N'40', N'Okla.', N'VI', N'3', N'South', N'7', N'West South Central', N'10')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (37, N'Oregon', N'OR', N'USA', N'State', 10, N'current', N'Occupied', N'', N'41', N'Ore.', N'X', N'4', N'West', N'9', N'Pacific', N'9')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (38, N'Pennsylvania', N'PA', N'USA', N'State', 10, N'current', N'Occupied', N'', N'42', N'Pa.', N'III', N'1', N'Northeast', N'2', N'MStateId-Atlantic', N'3')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (39, N'Rhode Island', N'RI', N'USA', N'State', 10, N'current', N'Occupied', N'', N'44', N'R.I.', N'I', N'1', N'Northeast', N'1', N'New England', N'1')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (40, N'South Carolina', N'SC', N'USA', N'State', 10, N'current', N'Occupied', N'', N'45', N'S.C.', N'IV', N'3', N'South', N'5', N'South Atlantic', N'4')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (41, N'South Dakota', N'SD', N'USA', N'State', 10, N'current', N'Occupied', N'', N'46', N'S.D.', N'VIII', N'2', N'MStateIdwest', N'4', N'West North Central', N'8')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (42, N'Tennessee', N'TN', N'USA', N'State', 10, N'current', N'Occupied', N'', N'47', N'Tenn.', N'IV', N'3', N'South', N'6', N'East South Central', N'6')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (43, N'Texas', N'TX', N'USA', N'State', 10, N'current', N'Occupied', N'', N'48', N'Texas', N'VI', N'3', N'South', N'7', N'West South Central', N'5')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (44, N'Utah', N'UT', N'USA', N'State', 10, N'current', N'Occupied', N'', N'49', N'Utah', N'VIII', N'4', N'West', N'8', N'Mountain', N'10')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (45, N'Vermont', N'VT', N'USA', N'State', 10, N'current', N'Occupied', N'', N'50', N'Vt.', N'I', N'1', N'Northeast', N'1', N'New England', N'2')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (46, N'Virginia', N'VA', N'USA', N'State', 10, N'current', N'Occupied', N'', N'51', N'Va.', N'III', N'3', N'South', N'5', N'South Atlantic', N'4')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (47, N'Washington', N'WA', N'USA', N'State', 10, N'current', N'Occupied', N'', N'53', N'Wash.', N'X', N'4', N'West', N'9', N'Pacific', N'9')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (48, N'West Virginia', N'WV', N'USA', N'State', 10, N'current', N'Occupied', N'', N'54', N'W.Va.', N'III', N'3', N'South', N'5', N'South Atlantic', N'4')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (49, N'Wisconsin', N'WI', N'USA', N'State', 10, N'current', N'Occupied', N'', N'55', N'Wis.', N'V', N'2', N'MStateIdwest', N'3', N'East North Central', N'7')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (50, N'Wyoming', N'WY', N'USA', N'State', 10, N'current', N'Occupied', N'', N'56', N'Wyo.', N'VIII', N'4', N'West', N'8', N'Mountain', N'10')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (51, N'Washington DC', N'DC', N'USA', N'capitol', 10, N'current', N'Occupied', N'', N'11', N'', N'III', N'3', N'South', N'5', N'South Atlantic', N'D.C.')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (52, N'Puerto Rico', N'PR', N'USA', N'commonwealth', 20, N'current', N'Occupied', N'', N'72', N'', N'II', N'', N'', N'', N'', N'1')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (53, N'U.S. Virgin Islands', N'VI', N'USA', N'territory', 20, N'current', N'Occupied', N'', N'78', N'', N'II', N'', N'', N'', N'', N'3')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (54, N'American Samoa', N'AS', N'USA', N'territory', 20, N'current', N'Occupied', N'', N'60', N'', N'IX', N'', N'', N'', N'', N'')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (55, N'Guam', N'GU', N'USA', N'territory', 20, N'current', N'Occupied', N'', N'66', N'', N'IX', N'', N'', N'', N'', N'9')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (56, N'Northern Mariana Islands', N'MP', N'USA', N'commonwealth', 20, N'current', N'Occupied', N'', N'69', N'', N'IX', N'', N'', N'', N'', N'9')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (84, N'Armed Forces Americas', N'AA', N'USA', N'military', 15, N'current', N'Occupied', N'Serves all of the Americas except for Canada.', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (85, N'Armed Forces Europe', N'AE', N'USA', N'military', 15, N'current', N'Occupied', N'Serves Europe, Canada, Africa and the MStateIddle East', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[State] ([StateId], [Name], [Abbreviation], [Country], [Type], [Sort], [Status], [Occupied], [Notes], [FipsState], [AssocPress], [StandardFederalRegion], [CensusRegion], [CensusRegionName], [CensusDivision], [CensusDivisionName], [CircuitCourt]) VALUES (86, N'Armed Forces Pacific', N'AP', N'USA', N'military', 15, N'current', N'Occupied', N'Serves Asia and the Pacific', N'', N'', N'', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[State] OFF
INSERT [dbo].[TransmissionType] ([TransmissionTypeID], [TransmissionType]) VALUES (1, N'Automatic')
INSERT [dbo].[TransmissionType] ([TransmissionTypeID], [TransmissionType]) VALUES (2, N'Manual')
INSERT [dbo].[TransmissionType] ([TransmissionTypeID], [TransmissionType]) VALUES (3, N'CVT')
SET IDENTITY_INSERT [dbo].[Vehicle] ON 

INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (1, 1993, 1117, 1, 3, 1, 1, 125000, N'4S3BJ6332P6953766', 14324.0000, 18550.0000, 0, 1, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (2, 1993, 818, 2, 3, 2, 2, 243560, N'JH4DB1671PS002584', 13234.0000, 17820.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (3, 2005, 843, 2, 3, 3, 3, 83466, N'1B3ES56C55D137449', 12342.0000, 15070.0000, 1, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (4, 2002, 1094, 2, 2, 4, 4, 123120, N'KNAFB121625150469', 6554.0000, 10995.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (5, 2012, 886, 3, 1, 4, 5, 63567, N'JN8AZ1MU4CW113789', 25432.0000, 32860.0000, 0, 1, NULL, 1)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (6, 2001, 394, 3, 2, 4, 6, 93261, N'1GNDT13W012105424', 22456.0000, 26905.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (7, 2011, 1089, 3, 3, 5, 7, 45003, N'5XYKU4A12BG001739', 21456.0000, 24595.0000, 1, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (8, 2011, 939, 2, 2, 6, 8, 56245, N'JN1BY1AR3BM374797', 35689.0000, 48400.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (9, 2008, 1199, 4, 3, 5, 9, 75369, N'1G8MF35X68Y131819', 26896.0000, 29785.0000, 0, 1, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (10, 2012, 932, 3, 1, 6, 10, 69524, N'JN8AS1MU0CM120061', 35678.0000, 43450.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (11, 2011, 530, 3, 1, 7, 11, 56239, N'5J6RE4H48BL023237', 19569.0000, 23645.0000, 0, 1, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (12, 2007, 814, 3, 2, 3, 12, 89647, N'2HNYD28377H522352', 36523.0000, 43495.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (13, 2005, 979, 2, 2, 8, 13, 113258, N'WVWAF93D258002461', 45367.0000, 66950.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (14, 2011, 187, 4, 2, 9, 14, 89652, N'WMWZN3C51BT133317', 19675.0000, 24850.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (15, 2013, 1061, 2, 3, 10, 15, 65951, N'5NPEC4ABXDH539433', 22543.0000, 25845.0000, 1, 0, NULL, 1)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (16, 2010, 510, 3, 1, 5, 16, 73652, N'JM3TB2MA5A0235007', 28795.0000, 32645.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (17, 2011, 835, 5, 3, 11, 17, 58963, N'3D7UT2CL2BG587350', 38765.0000, 44980.0000, 0, 1, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (18, 2012, 1175, 6, 3, 5, 18, 45321, N'WAUYGAFC6CN174200', 49654.0000, 59250.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (19, 2010, 460, 3, 3, 5, 19, 65963, N'1FMEU7DE5AUA72472', 27890.0000, 31200.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (20, 2001, 955, 2, 1, 12, 20, 259654, N'4A3AA46G11E035323', 15432.0000, 18407.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (21, 2002, 528, 2, 3, 12, 21, 129562, N'2HGES26772H566107', 15345.0000, 17010.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (22, 2011, 15, 2, 3, 13, 22, 63215, N'SAJWA2GEXBMV00832', 78543.0000, 86650.0000, 0, 1, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (23, 2005, 447, 3, 3, 14, 23, 89562, N'1GKDT13S852309288', 27654.0000, 30775.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (24, 2013, 1120, 6, 1, 1, 25, 42358, N'JF1GPAD60D1803590', 29950.0000, 35965.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (25, 2006, 840, 1, 3, 16, 3, 89541, N'2D4FV47V46H368760', 7990.0000, 26570.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (26, 2013, 1085, 2, 2, 17, 3, 45357, N'KNAFT4A22D5675895', 13540.0000, 15400.0000, 0, 1, NULL, 1)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (27, 2007, 1018, 2, 3, 8, 26, 68529, N'YV1AH852071023377', 39867.0000, 47350.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (28, 2010, 1105, 4, 3, 5, 27, 55987, N'JTHFE2C24A2504933', 19480.0000, 43940.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (29, 2007, 28, 3, 2, 4, 28, 84652, N'5UXFE83507LZ40758', 16500.0000, 54500.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (30, 2001, 373, 4, 1, 17, 17, 12345, N'abcdefghijklmnopq', 1234.0000, 2345.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (31, 2011, 1163, 4, 1, 17, 11, 12345, N'A1234B5678C90    ', 23456.0000, 35123.0000, 0, 0, NULL, 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (32, 2013, 822, 2, 1, 17, 11, 12332, N'123ABC1234       ', 1234.0000, 2345.0000, 0, 0, N'<p>test</p>', 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (33, 2014, 822, 4, 1, 17, 17, 12456, N'ABCEFG1234       ', 1234.0000, 2345.0000, 0, 0, N'<p>This is a test.</p><p>Test 2</p><p>Test 3</p>', 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (34, 2014, 274, 4, 1, 17, 11, 12345, N'A1923B1723       ', 1234.0000, 2345.0000, 0, 0, N'<p>test</p>', 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (35, 2011, 819, 4, 1, 17, 11, 12345, N'VIN12345         ', 1234.0000, 2345.0000, 0, 0, N'<p>test</p><p>test</p><p>test</p><p>&nbsp;</p>', 0)
INSERT [dbo].[Vehicle] ([VehicleID], [Year], [MakeModelID], [BodyStyleID], [TransmissionTypeID], [InteriorColorID], [ExteriorColorID], [Mileage], [VINumber], [SalesPrice], [MSRPrice], [Sold], [Featured], [Description], [Type]) VALUES (36, 2015, 661, 4, 1, 17, 11, 52014, N'UHJIKL12345      ', 3564.0000, 12345.0000, 0, 0, N'<p>this</p><p>is</p><p>a</p><p>test</p>', 0)
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND name = N'RoleNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND name = N'UserNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[BodyStyle]') AND name = N'IX_BodyStyle')
CREATE UNIQUE NONCLUSTERED INDEX [IX_BodyStyle] ON [dbo].[BodyStyle]
(
	[BodyStyle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ExteriorColor]') AND name = N'IX_ExteriorColor')
CREATE UNIQUE NONCLUSTERED INDEX [IX_ExteriorColor] ON [dbo].[ExteriorColor]
(
	[ExteriorColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[MakeModel]') AND name = N'IX_MakeModel')
CREATE UNIQUE NONCLUSTERED INDEX [IX_MakeModel] ON [dbo].[MakeModel]
(
	[MakeID] ASC,
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Vehicle__Type__214BF109]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vehicle] ADD  DEFAULT ((0)) FOR [Type]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MakeModel_Make]') AND parent_object_id = OBJECT_ID(N'[dbo].[MakeModel]'))
ALTER TABLE [dbo].[MakeModel]  WITH CHECK ADD  CONSTRAINT [FK_MakeModel_Make] FOREIGN KEY([MakeID])
REFERENCES [dbo].[Make] ([MakeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MakeModel_Make]') AND parent_object_id = OBJECT_ID(N'[dbo].[MakeModel]'))
ALTER TABLE [dbo].[MakeModel] CHECK CONSTRAINT [FK_MakeModel_Make]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MakeModel_Model]') AND parent_object_id = OBJECT_ID(N'[dbo].[MakeModel]'))
ALTER TABLE [dbo].[MakeModel]  WITH CHECK ADD  CONSTRAINT [FK_MakeModel_Model] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Model] ([ModelID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MakeModel_Model]') AND parent_object_id = OBJECT_ID(N'[dbo].[MakeModel]'))
ALTER TABLE [dbo].[MakeModel] CHECK CONSTRAINT [FK_MakeModel_Model]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_BodyStyle]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_BodyStyle] FOREIGN KEY([BodyStyleID])
REFERENCES [dbo].[BodyStyle] ([BodyStyleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_BodyStyle]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_BodyStyle]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_ExteriorColor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_ExteriorColor] FOREIGN KEY([ExteriorColorID])
REFERENCES [dbo].[ExteriorColor] ([ExteriorColorID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_ExteriorColor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_ExteriorColor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_InteriorColor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_InteriorColor] FOREIGN KEY([InteriorColorID])
REFERENCES [dbo].[InteriorColor] ([InteriorColorID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_InteriorColor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_InteriorColor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_MakeModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_MakeModel] FOREIGN KEY([MakeModelID])
REFERENCES [dbo].[MakeModel] ([MakeModelID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_MakeModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_MakeModel]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_TransmissionType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_TransmissionType] FOREIGN KEY([TransmissionTypeID])
REFERENCES [dbo].[TransmissionType] ([TransmissionTypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehicle_TransmissionType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehicle]'))
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_TransmissionType]
GO
USE [master]
GO
ALTER DATABASE [GuildCars] SET  READ_WRITE 
GO
