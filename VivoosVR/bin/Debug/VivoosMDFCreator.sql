USE [master]
GO
/****** Object:  Database [Vivos]    Script Date: 06-Sep-18 2:17:59 PM ******/
CREATE DATABASE [Vivos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vivos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Vivos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Vivos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Vivos_log.ldf' , SIZE = 4224KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Vivos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vivos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vivos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vivos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vivos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vivos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vivos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vivos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vivos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vivos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vivos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vivos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vivos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vivos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vivos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vivos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vivos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Vivos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vivos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vivos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vivos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vivos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vivos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vivos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vivos] SET RECOVERY FULL 
GO
ALTER DATABASE [Vivos] SET  MULTI_USER 
GO
ALTER DATABASE [Vivos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vivos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vivos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vivos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Vivos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vivos] SET QUERY_STORE = OFF
GO
USE [Vivos]
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
USE [Vivos]
GO
/****** Object:  User [VivosServiceUser]    Script Date: 06-Sep-18 2:17:59 PM ******/
CREATE USER [VivosServiceUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [VivosServiceUser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [VivosServiceUser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [VivosServiceUser]
GO
/****** Object:  Schema [Core]    Script Date: 06-Sep-18 2:17:59 PM ******/
CREATE SCHEMA [Core]
GO
/****** Object:  Schema [Parameter]    Script Date: 06-Sep-18 2:17:59 PM ******/
CREATE SCHEMA [Parameter]
GO
/****** Object:  Schema [TeraSis]    Script Date: 06-Sep-18 2:17:59 PM ******/
CREATE SCHEMA [TeraSis]
GO
/****** Object:  Schema [Vivos]    Script Date: 06-Sep-18 2:17:59 PM ******/
CREATE SCHEMA [Vivos]
GO
/****** Object:  UserDefinedFunction [dbo].[blankid]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[blankid]()
RETURNS uniqueidentifier
AS
BEGIN
	return ('00000000-0000-0000-0000-000000000000')
END
GO
/****** Object:  Table [Core].[Branches]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Branches](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Claims]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Claims](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleCode] [nvarchar](100) NOT NULL,
	[Resource] [varchar](450) NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_Claims] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Claims]    Script Date: 06-Sep-18 2:17:59 PM ******/
CREATE CLUSTERED INDEX [IX_Claims] ON [Core].[Claims]
(
	[RoleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Companies]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Companies](
	[Id] [uniqueidentifier] NOT NULL,
	[Logo] [image] NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Core].[ConsumerProperties]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[ConsumerProperties](
	[Id] [uniqueidentifier] NOT NULL,
	[ConsumerId] [uniqueidentifier] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Available] [bit] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[TypeNo] [int] NOT NULL,
 CONSTRAINT [PK_ConsumerProperties] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_ConsumerProperties]    Script Date: 06-Sep-18 2:17:59 PM ******/
CREATE CLUSTERED INDEX [IX_ConsumerProperties] ON [Core].[ConsumerProperties]
(
	[ConsumerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Consumers]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Consumers](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[WindowsCode] [varchar](1000) NULL,
 CONSTRAINT [PK_Organizations] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrganizationCode]    Script Date: 06-Sep-18 2:17:59 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_OrganizationCode] ON [Core].[Consumers]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Groups]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Groups](
	[Id] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Roles]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Roles](
	[Code] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[RoleToUserMaps]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[RoleToUserMaps](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleCode] [nvarchar](100) NOT NULL,
	[ValidUntil] [datetime] NULL,
	[EntryDate] [datetime] NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_RoleToUserMaps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[Users]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
	[ExpireDate] [datetime] NULL,
	[Picture] [image] NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Parameter].[ConsumerPropertyTypes]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Parameter].[ConsumerPropertyTypes](
	[No] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
 CONSTRAINT [PK_ConsumerPropertyTypes_1] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vivos].[AssetCommands]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vivos].[AssetCommands](
	[Id] [uniqueidentifier] NOT NULL,
	[AssetId] [uniqueidentifier] NOT NULL,
	[CommandText] [varchar](100) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Step] [tinyint] NOT NULL,
	[EnDescription] [varchar](500) NULL,
	[ArabicDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_AssetCommands] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_AssetCommands]    Script Date: 06-Sep-18 2:17:59 PM ******/
CREATE CLUSTERED INDEX [IX_AssetCommands] ON [Vivos].[AssetCommands]
(
	[AssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Vivos].[AssetDefaults]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vivos].[AssetDefaults](
	[Id] [uniqueidentifier] NOT NULL,
	[AssetId] [uniqueidentifier] NOT NULL,
	[OnCommandText] [varchar](100) NOT NULL,
	[OnCommandName] [varchar](100) NOT NULL,
	[OffCommandText] [varchar](100) NOT NULL,
	[OffCommandName] [varchar](100) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Step] [tinyint] NOT NULL,
	[DefaultValue] [bit] NOT NULL,
 CONSTRAINT [PK_AssetDefaults] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_AssetDefaults]    Script Date: 06-Sep-18 2:17:59 PM ******/
CREATE CLUSTERED INDEX [IX_AssetDefaults] ON [Vivos].[AssetDefaults]
(
	[AssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Vivos].[AssetGroups]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vivos].[AssetGroups](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AssetGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vivos].[Assets]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vivos].[Assets](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Available] [bit] NOT NULL,
	[Url] [varchar](1000) NOT NULL,
	[Exe] [varchar](50) NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[ModifyDate] [datetime2](7) NOT NULL,
	[UpdateStamp] [uniqueidentifier] NOT NULL,
	[EnName] [varchar](100) NULL,
	[EnDescription] [varchar](500) NULL,
	[ArabicName] [nvarchar](100) NULL,
	[ArabicDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_Assets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vivos].[AssetThumbnails]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vivos].[AssetThumbnails](
	[AssetId] [uniqueidentifier] NOT NULL,
	[Thumbnail] [image] NULL,
 CONSTRAINT [PK_AssetThumbnails] PRIMARY KEY CLUSTERED 
(
	[AssetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Vivos].[Patients]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vivos].[Patients](
	[Id] [uniqueidentifier] NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[Code] [varchar](100) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Notes] [varchar](1000) NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Patients_DoctorAndCodeUniqueness] UNIQUE NONCLUSTERED 
(
	[DoctorId] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vivos].[Problems]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vivos].[Problems](
	[Id] [uniqueidentifier] NOT NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[Subject] [varchar](200) NOT NULL,
	[SymptomDescription] [varchar](max) NULL,
	[SymptomType] [varchar](100) NULL,
	[SymptomStartDate] [date] NULL,
	[SymptomResults] [varchar](max) NULL,
	[IGDPoints] [int] NULL,
	[Avoidance] [varchar](max) NULL,
	[Precaution] [varchar](max) NULL,
	[History] [varchar](max) NULL,
	[PlaceOfFullSecure] [varchar](200) NULL,
	[PlaceOfSecure] [varchar](200) NULL,
	[PlaceOfHesitant] [varchar](200) NULL,
	[PlaceOfUnsecure] [varchar](200) NULL,
	[PlaceOfFullUnsecure] [varchar](200) NULL,
	[EntryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Problems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Vivos].[Safes]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vivos].[Safes](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[AssetId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Safes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vivos].[Sessions]    Script Date: 06-Sep-18 2:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vivos].[Sessions](
	[Id] [uniqueidentifier] NOT NULL,
	[SessionDateTime] [datetime] NOT NULL,
	[Notes] [varchar](max) NULL,
	[SensorData] [varchar](max) NOT NULL,
	[AssetId] [uniqueidentifier] NOT NULL,
	[PatientId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Core].[Branches] ADD  CONSTRAINT [DF_Branches_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Core].[Claims] ADD  CONSTRAINT [DF_Securities_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Core].[Claims] ADD  CONSTRAINT [DF_Securities_CodeRole]  DEFAULT ('') FOR [RoleCode]
GO
ALTER TABLE [Core].[Claims] ADD  CONSTRAINT [DF_Securities_ResourceIdentifier]  DEFAULT ('') FOR [Resource]
GO
ALTER TABLE [Core].[Claims] ADD  CONSTRAINT [DF_Securities_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [Core].[ConsumerProperties] ADD  CONSTRAINT [DF_OrganizationProperties_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Core].[ConsumerProperties] ADD  CONSTRAINT [DF_OrganizationProperties_OIDOrganization]  DEFAULT ([dbo].[blankid]()) FOR [ConsumerId]
GO
ALTER TABLE [Core].[ConsumerProperties] ADD  CONSTRAINT [DF_OrganizationProperties_Value]  DEFAULT ('') FOR [Value]
GO
ALTER TABLE [Core].[ConsumerProperties] ADD  CONSTRAINT [DF_OrganizationProperties_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [Core].[ConsumerProperties] ADD  CONSTRAINT [DF_OrganizationProperties_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [Core].[Consumers] ADD  CONSTRAINT [DF_Organizations_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Core].[Consumers] ADD  CONSTRAINT [DF_Organizations_Identity]  DEFAULT ('') FOR [Code]
GO
ALTER TABLE [Core].[Consumers] ADD  CONSTRAINT [DF_Organizations_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [Core].[Consumers] ADD  CONSTRAINT [DF_Organizations_EMail]  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [Core].[Consumers] ADD  CONSTRAINT [DF_Organizations_EntryDate]  DEFAULT ('') FOR [EntryDate]
GO
ALTER TABLE [Core].[Groups] ADD  CONSTRAINT [DF_Groups_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Core].[RoleToUserMaps] ADD  CONSTRAINT [DF_RoleToUserMaps_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Core].[RoleToUserMaps] ADD  CONSTRAINT [DF_RoleToUserMaps_OIDOrganization]  DEFAULT ([dbo].[blankid]()) FOR [UserId]
GO
ALTER TABLE [Core].[RoleToUserMaps] ADD  CONSTRAINT [DF_RoleToUserMaps_RoleCode]  DEFAULT ('') FOR [RoleCode]
GO
ALTER TABLE [Core].[RoleToUserMaps] ADD  CONSTRAINT [DF_RoleToUserMaps_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [Core].[RoleToUserMaps] ADD  CONSTRAINT [DF_RoleToUserMaps_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [Core].[Users] ADD  CONSTRAINT [DF_Users_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Core].[Users] ADD  CONSTRAINT [DF_Users_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [Vivos].[AssetCommands] ADD  CONSTRAINT [DF_AssetCommands_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Vivos].[AssetCommands] ADD  CONSTRAINT [DF_AssetCommands_AssetId]  DEFAULT ('73f2c995-194d-4103-b197-00a490f10a52') FOR [AssetId]
GO
ALTER TABLE [Vivos].[AssetCommands] ADD  CONSTRAINT [DF_AssetCommands_CommandText]  DEFAULT ('') FOR [CommandText]
GO
ALTER TABLE [Vivos].[AssetCommands] ADD  CONSTRAINT [DF_AssetCommands_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [Vivos].[AssetCommands] ADD  CONSTRAINT [DF_AssetCommands_Step]  DEFAULT ((0)) FOR [Step]
GO
ALTER TABLE [Vivos].[AssetDefaults] ADD  CONSTRAINT [DF_AssetDefaults_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Vivos].[AssetDefaults] ADD  CONSTRAINT [DF_AssetDefaults_AssetId]  DEFAULT ('73f2c995-194d-4103-b197-00a490f10a52') FOR [AssetId]
GO
ALTER TABLE [Vivos].[AssetDefaults] ADD  CONSTRAINT [DF_AssetDefaults_OnCommandText]  DEFAULT ('') FOR [OnCommandText]
GO
ALTER TABLE [Vivos].[AssetDefaults] ADD  CONSTRAINT [DF_AssetDefaults_OnCommandName]  DEFAULT ('') FOR [OnCommandName]
GO
ALTER TABLE [Vivos].[AssetDefaults] ADD  CONSTRAINT [DF_AssetDefaults_OffCommandText]  DEFAULT ('') FOR [OffCommandText]
GO
ALTER TABLE [Vivos].[AssetDefaults] ADD  CONSTRAINT [DF_AssetDefaults_OffCommandName]  DEFAULT ('') FOR [OffCommandName]
GO
ALTER TABLE [Vivos].[AssetDefaults] ADD  CONSTRAINT [DF_AssetDefaults_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [Vivos].[AssetDefaults] ADD  CONSTRAINT [DF_AssetDefaults_Step]  DEFAULT ((0)) FOR [Step]
GO
ALTER TABLE [Vivos].[AssetDefaults] ADD  CONSTRAINT [DF_AssetDefaults_DefaultValue]  DEFAULT ((0)) FOR [DefaultValue]
GO
ALTER TABLE [Vivos].[AssetGroups] ADD  CONSTRAINT [DF_AssetGroups_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Vivos].[Assets] ADD  CONSTRAINT [DF_Assets_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Vivos].[Assets] ADD  CONSTRAINT [DF_Assets_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [Vivos].[Assets] ADD  CONSTRAINT [DF_Assets_Url]  DEFAULT ('') FOR [Url]
GO
ALTER TABLE [Vivos].[Assets] ADD  CONSTRAINT [DF_Assets_Exe]  DEFAULT ('') FOR [Exe]
GO
ALTER TABLE [Vivos].[Assets] ADD  CONSTRAINT [DF_Assets_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [Vivos].[Assets] ADD  CONSTRAINT [DF_Assets_ModifyDate]  DEFAULT (getdate()) FOR [ModifyDate]
GO
ALTER TABLE [Vivos].[Assets] ADD  CONSTRAINT [DF_Assets_UpdateStamp]  DEFAULT (newid()) FOR [UpdateStamp]
GO
ALTER TABLE [Vivos].[Patients] ADD  CONSTRAINT [DF_Patients_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Vivos].[Patients] ADD  CONSTRAINT [DF_Patients_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [Vivos].[Patients] ADD  CONSTRAINT [DF_Patients_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [Vivos].[Problems] ADD  CONSTRAINT [DF_Problems_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Vivos].[Safes] ADD  CONSTRAINT [DF_Safes_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Vivos].[Sessions] ADD  CONSTRAINT [DF_Sessions_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [Vivos].[Sessions] ADD  CONSTRAINT [DF_Sessions_SessionDateTime]  DEFAULT (getdate()) FOR [SessionDateTime]
GO
ALTER TABLE [Vivos].[Sessions] ADD  CONSTRAINT [DF_Sessions_Notes]  DEFAULT ('') FOR [Notes]
GO
ALTER TABLE [Core].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Companies] FOREIGN KEY([CompanyId])
REFERENCES [Core].[Companies] ([Id])
GO
ALTER TABLE [Core].[Branches] CHECK CONSTRAINT [FK_Branches_Companies]
GO
ALTER TABLE [Core].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Consumers] FOREIGN KEY([Id])
REFERENCES [Core].[Consumers] ([Id])
GO
ALTER TABLE [Core].[Branches] CHECK CONSTRAINT [FK_Branches_Consumers]
GO
ALTER TABLE [Core].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Claims_Roles] FOREIGN KEY([RoleCode])
REFERENCES [Core].[Roles] ([Code])
GO
ALTER TABLE [Core].[Claims] CHECK CONSTRAINT [FK_Claims_Roles]
GO
ALTER TABLE [Core].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Consumers] FOREIGN KEY([Id])
REFERENCES [Core].[Consumers] ([Id])
GO
ALTER TABLE [Core].[Companies] CHECK CONSTRAINT [FK_Companies_Consumers]
GO
ALTER TABLE [Core].[ConsumerProperties]  WITH CHECK ADD  CONSTRAINT [FK_ConsumerProperties_ConsumerPropertyTypes] FOREIGN KEY([TypeNo])
REFERENCES [Parameter].[ConsumerPropertyTypes] ([No])
GO
ALTER TABLE [Core].[ConsumerProperties] CHECK CONSTRAINT [FK_ConsumerProperties_ConsumerPropertyTypes]
GO
ALTER TABLE [Core].[ConsumerProperties]  WITH CHECK ADD  CONSTRAINT [FK_ConsumerProperties_Organizations] FOREIGN KEY([ConsumerId])
REFERENCES [Core].[Consumers] ([Id])
GO
ALTER TABLE [Core].[ConsumerProperties] CHECK CONSTRAINT [FK_ConsumerProperties_Organizations]
GO
ALTER TABLE [Core].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Branches] FOREIGN KEY([BranchId])
REFERENCES [Core].[Branches] ([Id])
GO
ALTER TABLE [Core].[Groups] CHECK CONSTRAINT [FK_Groups_Branches]
GO
ALTER TABLE [Core].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Consumers] FOREIGN KEY([Id])
REFERENCES [Core].[Consumers] ([Id])
GO
ALTER TABLE [Core].[Groups] CHECK CONSTRAINT [FK_Groups_Consumers]
GO
ALTER TABLE [Core].[RoleToUserMaps]  WITH CHECK ADD  CONSTRAINT [FK_RoleToUserMaps_Roles] FOREIGN KEY([RoleCode])
REFERENCES [Core].[Roles] ([Code])
GO
ALTER TABLE [Core].[RoleToUserMaps] CHECK CONSTRAINT [FK_RoleToUserMaps_Roles]
GO
ALTER TABLE [Core].[RoleToUserMaps]  WITH CHECK ADD  CONSTRAINT [FK_RoleToUserMaps_Users] FOREIGN KEY([UserId])
REFERENCES [Core].[Users] ([Id])
GO
ALTER TABLE [Core].[RoleToUserMaps] CHECK CONSTRAINT [FK_RoleToUserMaps_Users]
GO
ALTER TABLE [Core].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Consumers] FOREIGN KEY([Id])
REFERENCES [Core].[Consumers] ([Id])
GO
ALTER TABLE [Core].[Users] CHECK CONSTRAINT [FK_Users_Consumers]
GO
ALTER TABLE [Core].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Groups] FOREIGN KEY([GroupId])
REFERENCES [Core].[Groups] ([Id])
GO
ALTER TABLE [Core].[Users] CHECK CONSTRAINT [FK_Users_Groups]
GO
ALTER TABLE [Vivos].[AssetCommands]  WITH CHECK ADD  CONSTRAINT [FK_AssetCommands_Assets] FOREIGN KEY([AssetId])
REFERENCES [Vivos].[Assets] ([Id])
GO
ALTER TABLE [Vivos].[AssetCommands] CHECK CONSTRAINT [FK_AssetCommands_Assets]
GO
ALTER TABLE [Vivos].[AssetDefaults]  WITH CHECK ADD  CONSTRAINT [FK_AssetDefaults_Assets] FOREIGN KEY([AssetId])
REFERENCES [Vivos].[Assets] ([Id])
GO
ALTER TABLE [Vivos].[AssetDefaults] CHECK CONSTRAINT [FK_AssetDefaults_Assets]
GO
ALTER TABLE [Vivos].[AssetThumbnails]  WITH CHECK ADD  CONSTRAINT [FK_AssetThumbnails_Assets] FOREIGN KEY([AssetId])
REFERENCES [Vivos].[Assets] ([Id])
GO
ALTER TABLE [Vivos].[AssetThumbnails] CHECK CONSTRAINT [FK_AssetThumbnails_Assets]
GO
ALTER TABLE [Vivos].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Users] FOREIGN KEY([DoctorId])
REFERENCES [Core].[Users] ([Id])
GO
ALTER TABLE [Vivos].[Patients] CHECK CONSTRAINT [FK_Patients_Users]
GO
ALTER TABLE [Vivos].[Problems]  WITH CHECK ADD  CONSTRAINT [FK_Problems_Patients] FOREIGN KEY([PatientId])
REFERENCES [Vivos].[Patients] ([Id])
GO
ALTER TABLE [Vivos].[Problems] CHECK CONSTRAINT [FK_Problems_Patients]
GO
ALTER TABLE [Vivos].[Safes]  WITH CHECK ADD  CONSTRAINT [FK_Safes_Assets] FOREIGN KEY([AssetId])
REFERENCES [Vivos].[Assets] ([Id])
GO
ALTER TABLE [Vivos].[Safes] CHECK CONSTRAINT [FK_Safes_Assets]
GO
ALTER TABLE [Vivos].[Safes]  WITH CHECK ADD  CONSTRAINT [FK_Safes_Companies] FOREIGN KEY([CompanyId])
REFERENCES [Core].[Companies] ([Id])
GO
ALTER TABLE [Vivos].[Safes] CHECK CONSTRAINT [FK_Safes_Companies]
GO
ALTER TABLE [Vivos].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Assets] FOREIGN KEY([AssetId])
REFERENCES [Vivos].[Assets] ([Id])
GO
ALTER TABLE [Vivos].[Sessions] CHECK CONSTRAINT [FK_Sessions_Assets]
GO
ALTER TABLE [Vivos].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Patients] FOREIGN KEY([PatientId])
REFERENCES [Vivos].[Patients] ([Id])
GO
ALTER TABLE [Vivos].[Sessions] CHECK CONSTRAINT [FK_Sessions_Patients]
GO
USE [master]
GO
ALTER DATABASE [Vivos] SET  READ_WRITE 
GO
