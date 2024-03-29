USE [master]
GO
/****** Object:  Database [CommunityShed]    Script Date: 9/5/2019 11:31:14 AM ******/
CREATE DATABASE [CommunityShed]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CommunityShed', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CommunityShed.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CommunityShed_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CommunityShed_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CommunityShed] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CommunityShed].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CommunityShed] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CommunityShed] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CommunityShed] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CommunityShed] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CommunityShed] SET ARITHABORT OFF 
GO
ALTER DATABASE [CommunityShed] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CommunityShed] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CommunityShed] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CommunityShed] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CommunityShed] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CommunityShed] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CommunityShed] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CommunityShed] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CommunityShed] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CommunityShed] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CommunityShed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CommunityShed] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CommunityShed] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CommunityShed] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CommunityShed] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CommunityShed] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CommunityShed] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CommunityShed] SET RECOVERY FULL 
GO
ALTER DATABASE [CommunityShed] SET  MULTI_USER 
GO
ALTER DATABASE [CommunityShed] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CommunityShed] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CommunityShed] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CommunityShed] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CommunityShed] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CommunityShed', N'ON'
GO
ALTER DATABASE [CommunityShed] SET QUERY_STORE = OFF
GO
USE [CommunityShed]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/5/2019 11:31:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Community]    Script Date: 9/5/2019 11:31:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Community](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Availability] [bit] NOT NULL,
 CONSTRAINT [PK_Community] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommunityPerson]    Script Date: 9/5/2019 11:31:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunityPerson](
	[Id] [int] NOT NULL,
	[CommunityId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CommunityPerson] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[CommunityId] ASC,
	[PersonId] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 9/5/2019 11:31:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Use] [nvarchar](50) NOT NULL,
	[Age] [nvarchar](50) NOT NULL,
	[Warnings] [nvarchar](50) NOT NULL,
	[CommunityPersonId] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/5/2019 11:31:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[HashedPasswod] [nvarchar](200) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shed]    Script Date: 9/5/2019 11:31:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shed](
	[Id] [int] NOT NULL,
	[CommunityId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
 CONSTRAINT [PK_Shed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Type]) VALUES (1, N'Hand Tools')
INSERT [dbo].[Categories] ([Id], [Type]) VALUES (2, N'Power Tools')
INSERT [dbo].[Categories] ([Id], [Type]) VALUES (3, N'Fasteners')
INSERT [dbo].[Categories] ([Id], [Type]) VALUES (4, N'Gardening')
INSERT [dbo].[Categories] ([Id], [Type]) VALUES (5, N'Other')
INSERT [dbo].[Categories] ([Id], [Type]) VALUES (6, N'Snow Tools')
SET IDENTITY_INSERT [dbo].[Categories] OFF
ALTER TABLE [dbo].[CommunityPerson]  WITH CHECK ADD  CONSTRAINT [FK_CommunityPerson_Community] FOREIGN KEY([CommunityId])
REFERENCES [dbo].[Community] ([Id])
GO
ALTER TABLE [dbo].[CommunityPerson] CHECK CONSTRAINT [FK_CommunityPerson_Community]
GO
ALTER TABLE [dbo].[CommunityPerson]  WITH CHECK ADD  CONSTRAINT [FK_CommunityPerson_Item] FOREIGN KEY([Id])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[CommunityPerson] CHECK CONSTRAINT [FK_CommunityPerson_Item]
GO
ALTER TABLE [dbo].[CommunityPerson]  WITH CHECK ADD  CONSTRAINT [FK_CommunityPerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[CommunityPerson] CHECK CONSTRAINT [FK_CommunityPerson_Person]
GO
ALTER TABLE [dbo].[Shed]  WITH CHECK ADD  CONSTRAINT [FK_Shed_Community] FOREIGN KEY([CommunityId])
REFERENCES [dbo].[Community] ([Id])
GO
ALTER TABLE [dbo].[Shed] CHECK CONSTRAINT [FK_Shed_Community]
GO
ALTER TABLE [dbo].[Shed]  WITH CHECK ADD  CONSTRAINT [FK_Shed_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Shed] CHECK CONSTRAINT [FK_Shed_Item]
GO
USE [master]
GO
ALTER DATABASE [CommunityShed] SET  READ_WRITE 
GO
