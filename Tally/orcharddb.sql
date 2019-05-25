/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1601)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [orcharddb]
GO
/****** Object:  Table [dbo].[default_Orchard_Users_UserPartRecord]    Script Date: 03/09/2017 14:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[default_Orchard_Users_UserPartRecord](
	[Id] [int] NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[NormalizedUserName] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[PasswordFormat] [nvarchar](255) NULL,
	[HashAlgorithm] [nvarchar](255) NULL,
	[PasswordSalt] [nvarchar](255) NULL,
	[RegistrationStatus] [nvarchar](255) NULL,
	[EmailStatus] [nvarchar](255) NULL,
	[EmailChallengeToken] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[default_Orchard_Users_UserPartRecord] ([Id], [UserName], [Email], [NormalizedUserName], [Password], [PasswordFormat], [HashAlgorithm], [PasswordSalt], [RegistrationStatus], [EmailStatus], [EmailChallengeToken]) VALUES (2, N'admin', N'', N'admin', N'Finance2', N'Clear', N'SHA1', N's2Ieb5Pn7Vwf+X6JEXJitg==', N'Approved', N'Approved', NULL)
ALTER TABLE [dbo].[default_Orchard_Users_UserPartRecord] ADD  DEFAULT ('Approved') FOR [RegistrationStatus]
GO
ALTER TABLE [dbo].[default_Orchard_Users_UserPartRecord] ADD  DEFAULT ('Approved') FOR [EmailStatus]
GO
