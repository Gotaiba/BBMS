USE [BBMSdb]
GO
/****** Object:  Table [dbo].[Blood_Type]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blood_Type](
	[Blood_Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Type_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Blood_Type] PRIMARY KEY CLUSTERED 
(
	[Blood_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Collected_Blood]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collected_Blood](
	[ColIection_Id] [int] IDENTITY(1,1) NOT NULL,
	[Donor_No] [int] NOT NULL,
	[Blood_Type_No] [int] NOT NULL,
	[Blood_Status_No] [bit] NOT NULL,
	[Reason] [nvarchar](max) NULL,
	[Hemo] [float] NOT NULL,
	[User_No] [int] NOT NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Collected_Blood] PRIMARY KEY CLUSTERED 
(
	[ColIection_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donor_Information]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor_Information](
	[DonorInfo_Id] [int] IDENTITY(1,1) NOT NULL,
	[Donor_No] [int] NOT NULL,
	[Surgery] [bit] NULL,
	[Blood_pressure] [bit] NULL,
	[Blood_Diabetes] [bit] NULL,
	[Heart_Disease] [bit] NULL,
	[Medicine] [bit] NULL,
	[Medicine_Text] [nvarchar](50) NULL,
	[Smoker] [bit] NULL,
	[Other_Problems] [bit] NULL,
	[Other_Problems_Text] [nvarchar](50) NULL,
	[Weight] [int] NOT NULL,
	[User_No] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[IsDonate] [tinyint] NOT NULL CONSTRAINT [DF_Donor_Information_IsDonate]  DEFAULT ((0)),
 CONSTRAINT [PK_Donor_Information] PRIMARY KEY CLUSTERED 
(
	[DonorInfo_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donors]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Donors](
	[Donar_Id] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nvarchar](50) NOT NULL,
	[Last_Name] [nvarchar](50) NOT NULL,
	[Date_of_Birth] [date] NOT NULL,
	[Gender] [char](2) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Telephone] [nvarchar](15) NOT NULL,
	[National_ID] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Donate_Type] [char](1) NOT NULL,
	[Patient_Name] [nvarchar](50) NULL,
	[Patient_Relation_No] [int] NULL,
	[Date] [date] NULL,
	[User_No] [int] NOT NULL,
	[CanDonate] [tinyint] NULL CONSTRAINT [DF_Donors_CanDonate]  DEFAULT ((1)),
 CONSTRAINT [PK_Donors] PRIMARY KEY CLUSTERED 
(
	[Donar_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Incoming_Blood]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incoming_Blood](
	[Incoming_Id] [int] IDENTITY(1,1) NOT NULL,
	[Collection_No] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[IsUsed] [bit] NOT NULL CONSTRAINT [DF_Incoming_Blood_IsUsed]  DEFAULT ((0)),
	[User_No] [int] NOT NULL,
 CONSTRAINT [PK_Incoming_Blood] PRIMARY KEY CLUSTERED 
(
	[Incoming_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outgoing_Blood]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outgoing_Blood](
	[Outgoing_Id] [int] IDENTITY(1,1) NOT NULL,
	[Collection_No] [int] NOT NULL,
	[Patient_No] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Outgoing_Blood] PRIMARY KEY CLUSTERED 
(
	[Outgoing_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient_Relation]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Relation](
	[Patient_Relation_Id] [int] IDENTITY(1,1) NOT NULL,
	[Patient_Relation_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Patient_Relation] PRIMARY KEY CLUSTERED 
(
	[Patient_Relation_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patients]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Patiant_Id] [int] IDENTITY(1,1) NOT NULL,
	[Patiant_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Patiant_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Type]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Type_Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_User_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Authority] [int] NOT NULL,
	[User_Type_No] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Viruses]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viruses](
	[Virus_Id] [int] IDENTITY(1,1) NOT NULL,
	[Collection_No] [int] NOT NULL,
	[VDRL] [bit] NULL,
	[HCV] [bit] NULL,
	[HBV] [bit] NULL,
	[HIV] [bit] NULL,
	[User_No] [int] NOT NULL,
 CONSTRAINT [PK_Viruses] PRIMARY KEY CLUSTERED 
(
	[Virus_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwIncomingInfo]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwIncomingInfo]
AS
SELECT        dbo.Incoming_Blood.Date AS IncomingDate, dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Donors.Donate_Type, dbo.Donors.National_ID, dbo.Donors.Patient_Name, dbo.Donors.Date AS DonatingDate, 
                         dbo.Blood_Type.Type_Name, dbo.Collected_Blood.Hemo, dbo.Users.Username, dbo.Incoming_Blood.IsUsed, dbo.Donors.Donar_Id, dbo.Donors.Date_of_Birth, dbo.Donors.Gender, dbo.Donors.Address, dbo.Donors.Telephone, 
                         dbo.Donors.Email
FROM            dbo.Incoming_Blood INNER JOIN
                         dbo.Collected_Blood ON dbo.Incoming_Blood.Collection_No = dbo.Collected_Blood.ColIection_Id INNER JOIN
                         dbo.Donors ON dbo.Collected_Blood.Donor_No = dbo.Donors.Donar_Id INNER JOIN
                         dbo.Users ON dbo.Donors.User_No = dbo.Users.Id INNER JOIN
                         dbo.Blood_Type ON dbo.Collected_Blood.Blood_Type_No = dbo.Blood_Type.Blood_Type_Id

GO
/****** Object:  View [dbo].[vwOutgoingInfo]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwOutgoingInfo]
AS
SELECT        dbo.Outgoing_Blood.Outgoing_Id, dbo.Outgoing_Blood.Patient_No, dbo.Patients.Patiant_Name, dbo.Donors.Donar_Id, dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Donors.Date_of_Birth, dbo.Donors.Gender, 
                         dbo.Donors.National_ID, dbo.Donors.Date, dbo.Collected_Blood.ColIection_Id, dbo.Blood_Type.Type_Name, dbo.Outgoing_Blood.Date AS Expr1, dbo.Collected_Blood.Hemo
FROM            dbo.Outgoing_Blood INNER JOIN
                         dbo.Collected_Blood ON dbo.Outgoing_Blood.Collection_No = dbo.Collected_Blood.ColIection_Id INNER JOIN
                         dbo.Donors ON dbo.Collected_Blood.Donor_No = dbo.Donors.Donar_Id INNER JOIN
                         dbo.Blood_Type ON dbo.Collected_Blood.Blood_Type_No = dbo.Blood_Type.Blood_Type_Id INNER JOIN
                         dbo.Patients ON dbo.Outgoing_Blood.Patient_No = dbo.Patients.Patiant_Id

GO
/****** Object:  View [dbo].[vwRegisteredDonors]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwRegisteredDonors]
AS
SELECT        dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Donors.Gender, dbo.Donors.Telephone, dbo.Donors.Donate_Type, dbo.Donors.Patient_Name, dbo.Patient_Relation.Patient_Relation_Name, 
                         dbo.Donors.Date
FROM            dbo.Donors LEFT OUTER JOIN
                         dbo.Patient_Relation ON dbo.Donors.Patient_Relation_No = dbo.Patient_Relation.Patient_Relation_Id



GO
/****** Object:  View [dbo].[vwStatusInfo]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwStatusInfo]
AS
SELECT        dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Collected_Blood.Blood_Status_No, dbo.Collected_Blood.Reason, dbo.Blood_Type.Type_Name, dbo.Users.Username, dbo.Collected_Blood.Date, dbo.Donors.Date_of_Birth, 
                         dbo.Donors.Gender, dbo.Donors.Address, dbo.Donors.Telephone, dbo.Donors.National_ID, dbo.Donors.Email, dbo.Donors.Donate_Type, dbo.Donors.Patient_Name, dbo.Patient_Relation.Patient_Relation_Name, 
                         dbo.Donors.Donar_Id
FROM            dbo.Collected_Blood INNER JOIN
                         dbo.Donors ON dbo.Collected_Blood.Donor_No = dbo.Donors.Donar_Id INNER JOIN
                         dbo.Blood_Type ON dbo.Collected_Blood.Blood_Type_No = dbo.Blood_Type.Blood_Type_Id INNER JOIN
                         dbo.Users ON dbo.Collected_Blood.User_No = dbo.Users.Id AND dbo.Donors.User_No = dbo.Users.Id LEFT OUTER JOIN
                         dbo.Patient_Relation ON dbo.Donors.Patient_Relation_No = dbo.Patient_Relation.Patient_Relation_Id

GO
/****** Object:  View [dbo].[vwUserEntries]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwUserEntries]
AS
SELECT        dbo.Users.Username, dbo.Users.Authority, dbo.User_Type.User_Type_Name, dbo.Donors.Donar_Id, dbo.Collected_Blood.ColIection_Id, dbo.Donor_Information.DonorInfo_Id
FROM            dbo.Users INNER JOIN
                         dbo.Donors ON dbo.Users.Id = dbo.Donors.User_No INNER JOIN
                         dbo.Donor_Information ON dbo.Users.Id = dbo.Donor_Information.User_No AND dbo.Donors.Donar_Id = dbo.Donor_Information.Donor_No INNER JOIN
                         dbo.Collected_Blood ON dbo.Users.Id = dbo.Collected_Blood.User_No AND dbo.Donors.Donar_Id = dbo.Collected_Blood.Donor_No INNER JOIN
                         dbo.User_Type ON dbo.Users.User_Type_No = dbo.User_Type.Id

GO
/****** Object:  View [dbo].[vwVisursInfo]    Script Date: 6/28/2017 12:11:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwVisursInfo]
AS
SELECT        dbo.Viruses.VDRL, dbo.Viruses.Virus_Id, dbo.Viruses.HCV, dbo.Viruses.HBV, dbo.Viruses.HIV, dbo.Collected_Blood.ColIection_Id, dbo.Blood_Type.Type_Name, dbo.Collected_Blood.Blood_Status_No, 
                         dbo.Collected_Blood.Reason, dbo.Collected_Blood.Hemo, dbo.Collected_Blood.Date, dbo.Donors.Donar_Id, dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Donors.Date_of_Birth, dbo.Donors.Gender, dbo.Donors.Address, 
                         dbo.Donors.Telephone, dbo.Donors.National_ID, dbo.Donors.Email, dbo.Donors.Donate_Type, dbo.Donors.Patient_Name, dbo.Donors.Date AS Expr1
FROM            dbo.Viruses INNER JOIN
                         dbo.Collected_Blood ON dbo.Viruses.Collection_No = dbo.Collected_Blood.ColIection_Id INNER JOIN
                         dbo.Donors ON dbo.Collected_Blood.Donor_No = dbo.Donors.Donar_Id INNER JOIN
                         dbo.Blood_Type ON dbo.Collected_Blood.Blood_Type_No = dbo.Blood_Type.Blood_Type_Id

GO
SET IDENTITY_INSERT [dbo].[Blood_Type] ON 

INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (1, N'A-')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (2, N'A-')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (3, N'B+')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (4, N'B-')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (5, N'O+')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (6, N'O-')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (7, N'AB+')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (8, N'AB-')
SET IDENTITY_INSERT [dbo].[Blood_Type] OFF
SET IDENTITY_INSERT [dbo].[Collected_Blood] ON 

INSERT [dbo].[Collected_Blood] ([ColIection_Id], [Donor_No], [Blood_Type_No], [Blood_Status_No], [Reason], [Hemo], [User_No], [Date]) VALUES (2, 17, 1, 1, NULL, 12, 2, NULL)
INSERT [dbo].[Collected_Blood] ([ColIection_Id], [Donor_No], [Blood_Type_No], [Blood_Status_No], [Reason], [Hemo], [User_No], [Date]) VALUES (3, 16, 1, 1, NULL, 12, 2, NULL)
INSERT [dbo].[Collected_Blood] ([ColIection_Id], [Donor_No], [Blood_Type_No], [Blood_Status_No], [Reason], [Hemo], [User_No], [Date]) VALUES (4, 10, 7, 1, N'i dont know', 14, 2, NULL)
INSERT [dbo].[Collected_Blood] ([ColIection_Id], [Donor_No], [Blood_Type_No], [Blood_Status_No], [Reason], [Hemo], [User_No], [Date]) VALUES (5, 18, 7, 1, N'maaa', 14, 2, NULL)
INSERT [dbo].[Collected_Blood] ([ColIection_Id], [Donor_No], [Blood_Type_No], [Blood_Status_No], [Reason], [Hemo], [User_No], [Date]) VALUES (6, 19, 5, 1, NULL, 12.5, 2, NULL)
INSERT [dbo].[Collected_Blood] ([ColIection_Id], [Donor_No], [Blood_Type_No], [Blood_Status_No], [Reason], [Hemo], [User_No], [Date]) VALUES (7, 1, 1, 0, N'Have some issue', 17, 2, NULL)
INSERT [dbo].[Collected_Blood] ([ColIection_Id], [Donor_No], [Blood_Type_No], [Blood_Status_No], [Reason], [Hemo], [User_No], [Date]) VALUES (8, 1, 1, 0, N'Have some Issues', 17, 2, NULL)
SET IDENTITY_INSERT [dbo].[Collected_Blood] OFF
SET IDENTITY_INSERT [dbo].[Donor_Information] ON 

INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (6, 4, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 17, 2, CAST(N'2017-05-23' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (7, 2, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 34, 2, CAST(N'2017-06-20' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (9, 12, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 87, 6, CAST(N'2017-06-21' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (10, 12, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 66, 2, CAST(N'2017-06-21' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (11, 14, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 55, 2, CAST(N'2017-06-21' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (12, 13, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 64, 2, CAST(N'2017-06-21' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (13, 14, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 55, 2, CAST(N'2017-06-22' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (14, 15, 0, 0, 0, 0, 1, NULL, 0, 0, NULL, 55, 6, CAST(N'2017-06-22' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (15, 15, 0, 0, 0, 0, 0, NULL, 1, 0, NULL, 55, 6, CAST(N'2017-06-22' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (16, 15, 0, 0, 0, 0, 1, NULL, 0, 0, NULL, 55, 6, CAST(N'2017-06-22' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (17, 16, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 55, 2, CAST(N'2017-06-22' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (18, 17, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 66, 2, CAST(N'2017-06-22' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (19, 10, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 55, 2, CAST(N'2017-06-22' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (20, 18, 0, 0, 0, 0, 0, N'yes', 0, 0, NULL, 66, 2, CAST(N'2017-06-22' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (21, 19, 0, 0, 0, 0, 1, N'assfsdf', 0, 0, NULL, 55, 2, CAST(N'2017-06-27' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Donor_Information] OFF
SET IDENTITY_INSERT [dbo].[Donors] ON 

INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (1, N'Ali', N'Omer', CAST(N'1980-04-18' AS Date), N'M ', N'koiid, 1121', N'091212221', N'33377777878', N'ali@omer.com', N'V', NULL, NULL, CAST(N'2017-06-27' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (2, N'Abbas', N'Ahmed', CAST(N'1990-01-22' AS Date), N'M ', N'wwer, 98839', N'0912388932', N'33377777879', N'Abbas@hotmail.com', N'P', N'Omer', NULL, CAST(N'2017-06-11' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (3, N'ola', N'abbs', CAST(N'1991-04-29' AS Date), N'M ', N'khartoum, 117', N'0912332232', N'32423123212', N'ola@mail.com', N'P', NULL, NULL, CAST(N'2017-04-18' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (4, N'moh', N'jjf', CAST(N'1981-04-07' AS Date), N'M ', N'khartoum', N'0912323231', N'32423123245', N'moh@hotmail.com', N'P', NULL, NULL, CAST(N'2017-04-18' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (5, N'morgun', N'omer', CAST(N'1985-04-22' AS Date), N'F ', N'nowhere', N'0992938238', N'32423123213', N'morgun@g.com', N'V', NULL, NULL, CAST(N'2017-04-18' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (6, N'Ibrahim', N'Awad', CAST(N'1984-03-01' AS Date), N'M ', N'Khartoum', N'0912648138', N'32423123222', N'i.awad@gmail.com', N'V', NULL, NULL, CAST(N'2017-06-18' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (7, N'ahmed', N'bahaa', CAST(N'1987-05-06' AS Date), N'M ', N'khartoum', N'0962444445', N'32423123288', N'ahmadan2@gmail.com', N'V', NULL, NULL, CAST(N'2017-06-19' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (9, N'idjf', N'kdjf', CAST(N'1992-01-02' AS Date), N'M ', NULL, N'34545', N'34534533453', NULL, N'V', NULL, NULL, CAST(N'2017-06-20' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (10, N'Awad', N'B', CAST(N'1993-06-06' AS Date), N'M ', NULL, N'345', N'12345678901', NULL, N'P', N'ali', 3, CAST(N'2017-06-22' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (12, N'omer ', N'baha', CAST(N'1993-08-02' AS Date), N'M ', NULL, N'987', N'37485749382', NULL, N'V', NULL, NULL, CAST(N'2017-06-21' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (13, N'Gotyab', N'Kol', CAST(N'1989-09-22' AS Date), N'M ', NULL, N'234234', N'92837498289', NULL, N'V', NULL, 1, CAST(N'2017-04-18' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (14, N'Morgan', N'Morgan', CAST(N'1992-02-09' AS Date), N'M ', N'Omdur', N'2345', N'32423123235', NULL, N'V', NULL, NULL, CAST(N'2017-06-22' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (15, N'fasd', N'asdasd', CAST(N'1993-06-01' AS Date), N'M ', N'kh', N'34', N'23422342343', NULL, N'V', NULL, NULL, CAST(N'2017-06-22' AS Date), 6, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (16, N'ksl', N'skdfj', CAST(N'1995-03-24' AS Date), N'F ', NULL, N'345', N'32423123232', NULL, N'V', NULL, NULL, CAST(N'2017-06-22' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (17, N'Nimir', N'Babo', CAST(N'1993-02-18' AS Date), N'F ', NULL, N'23534', N'32423123233', NULL, N'V', NULL, NULL, CAST(N'2017-06-22' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (18, N'sf', N'fffff', CAST(N'1992-06-22' AS Date), N'M ', NULL, N'3e', N'34444444444', NULL, N'V', NULL, NULL, CAST(N'2017-06-22' AS Date), 2, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_Name], [Patient_Relation_No], [Date], [User_No], [CanDonate]) VALUES (19, N'James', N'Johan', CAST(N'1994-06-29' AS Date), N'M ', NULL, N'3453434', N'33377777877', NULL, N'V', NULL, NULL, CAST(N'2017-06-27' AS Date), 2, 0)
SET IDENTITY_INSERT [dbo].[Donors] OFF
SET IDENTITY_INSERT [dbo].[Incoming_Blood] ON 

INSERT [dbo].[Incoming_Blood] ([Incoming_Id], [Collection_No], [Date], [IsUsed], [User_No]) VALUES (1, 6, CAST(N'2017-06-27' AS Date), 0, 2)
SET IDENTITY_INSERT [dbo].[Incoming_Blood] OFF
SET IDENTITY_INSERT [dbo].[Patient_Relation] ON 

INSERT [dbo].[Patient_Relation] ([Patient_Relation_Id], [Patient_Relation_Name]) VALUES (1, N'Father')
INSERT [dbo].[Patient_Relation] ([Patient_Relation_Id], [Patient_Relation_Name]) VALUES (2, N'Mother')
INSERT [dbo].[Patient_Relation] ([Patient_Relation_Id], [Patient_Relation_Name]) VALUES (3, N'Sibiling')
INSERT [dbo].[Patient_Relation] ([Patient_Relation_Id], [Patient_Relation_Name]) VALUES (4, N'Aunt')
INSERT [dbo].[Patient_Relation] ([Patient_Relation_Id], [Patient_Relation_Name]) VALUES (5, N'Uncle')
SET IDENTITY_INSERT [dbo].[Patient_Relation] OFF
SET IDENTITY_INSERT [dbo].[User_Type] ON 

INSERT [dbo].[User_Type] ([Id], [User_Type_Name]) VALUES (1, N'Admin')
INSERT [dbo].[User_Type] ([Id], [User_Type_Name]) VALUES (2, N'Doctor')
INSERT [dbo].[User_Type] ([Id], [User_Type_Name]) VALUES (3, N'Nurse')
INSERT [dbo].[User_Type] ([Id], [User_Type_Name]) VALUES (4, N'Receptionist')
SET IDENTITY_INSERT [dbo].[User_Type] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [Authority], [User_Type_No]) VALUES (2, N'Admin', N'123', 1, 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [Authority], [User_Type_No]) VALUES (3, N'Dr_Test', N'123', 2, 2)
INSERT [dbo].[Users] ([Id], [Username], [Password], [Authority], [User_Type_No]) VALUES (4, N'Nurse_Test', N'123', 3, 3)
INSERT [dbo].[Users] ([Id], [Username], [Password], [Authority], [User_Type_No]) VALUES (5, N'Recp_Test', N'123', 3, 4)
INSERT [dbo].[Users] ([Id], [Username], [Password], [Authority], [User_Type_No]) VALUES (6, N'Ahmed', N'1', 1, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Viruses] ON 

INSERT [dbo].[Viruses] ([Virus_Id], [Collection_No], [VDRL], [HCV], [HBV], [HIV], [User_No]) VALUES (2, 3, 0, 0, 1, 1, 2)
INSERT [dbo].[Viruses] ([Virus_Id], [Collection_No], [VDRL], [HCV], [HBV], [HIV], [User_No]) VALUES (3, 4, 0, 0, 0, 1, 2)
INSERT [dbo].[Viruses] ([Virus_Id], [Collection_No], [VDRL], [HCV], [HBV], [HIV], [User_No]) VALUES (4, 2, 0, 1, 0, 0, 2)
INSERT [dbo].[Viruses] ([Virus_Id], [Collection_No], [VDRL], [HCV], [HBV], [HIV], [User_No]) VALUES (5, 5, 1, 0, 0, 0, 2)
SET IDENTITY_INSERT [dbo].[Viruses] OFF
ALTER TABLE [dbo].[Collected_Blood]  WITH CHECK ADD  CONSTRAINT [FK_Collected_Blood_Blood_Type] FOREIGN KEY([Blood_Type_No])
REFERENCES [dbo].[Blood_Type] ([Blood_Type_Id])
GO
ALTER TABLE [dbo].[Collected_Blood] CHECK CONSTRAINT [FK_Collected_Blood_Blood_Type]
GO
ALTER TABLE [dbo].[Collected_Blood]  WITH CHECK ADD  CONSTRAINT [FK_Collected_Blood_Donors] FOREIGN KEY([Donor_No])
REFERENCES [dbo].[Donors] ([Donar_Id])
GO
ALTER TABLE [dbo].[Collected_Blood] CHECK CONSTRAINT [FK_Collected_Blood_Donors]
GO
ALTER TABLE [dbo].[Collected_Blood]  WITH CHECK ADD  CONSTRAINT [FK_Collected_Blood_Users] FOREIGN KEY([User_No])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Collected_Blood] CHECK CONSTRAINT [FK_Collected_Blood_Users]
GO
ALTER TABLE [dbo].[Donor_Information]  WITH CHECK ADD  CONSTRAINT [FK_Donor_Information_Donors] FOREIGN KEY([Donor_No])
REFERENCES [dbo].[Donors] ([Donar_Id])
GO
ALTER TABLE [dbo].[Donor_Information] CHECK CONSTRAINT [FK_Donor_Information_Donors]
GO
ALTER TABLE [dbo].[Donor_Information]  WITH CHECK ADD  CONSTRAINT [FK_Donor_Information_Users] FOREIGN KEY([User_No])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Donor_Information] CHECK CONSTRAINT [FK_Donor_Information_Users]
GO
ALTER TABLE [dbo].[Donors]  WITH CHECK ADD  CONSTRAINT [FK_Donors_Patient_Relation] FOREIGN KEY([Patient_Relation_No])
REFERENCES [dbo].[Patient_Relation] ([Patient_Relation_Id])
GO
ALTER TABLE [dbo].[Donors] CHECK CONSTRAINT [FK_Donors_Patient_Relation]
GO
ALTER TABLE [dbo].[Donors]  WITH CHECK ADD  CONSTRAINT [FK_Donors_Users] FOREIGN KEY([User_No])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Donors] CHECK CONSTRAINT [FK_Donors_Users]
GO
ALTER TABLE [dbo].[Incoming_Blood]  WITH CHECK ADD  CONSTRAINT [FK_Incoming_Blood_Collected_Blood] FOREIGN KEY([Collection_No])
REFERENCES [dbo].[Collected_Blood] ([ColIection_Id])
GO
ALTER TABLE [dbo].[Incoming_Blood] CHECK CONSTRAINT [FK_Incoming_Blood_Collected_Blood]
GO
ALTER TABLE [dbo].[Outgoing_Blood]  WITH CHECK ADD  CONSTRAINT [FK_Outgoing_Blood_Collected_Blood] FOREIGN KEY([Collection_No])
REFERENCES [dbo].[Collected_Blood] ([ColIection_Id])
GO
ALTER TABLE [dbo].[Outgoing_Blood] CHECK CONSTRAINT [FK_Outgoing_Blood_Collected_Blood]
GO
ALTER TABLE [dbo].[Outgoing_Blood]  WITH CHECK ADD  CONSTRAINT [FK_Outgoing_Blood_Patients] FOREIGN KEY([Patient_No])
REFERENCES [dbo].[Patients] ([Patiant_Id])
GO
ALTER TABLE [dbo].[Outgoing_Blood] CHECK CONSTRAINT [FK_Outgoing_Blood_Patients]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_User_Type] FOREIGN KEY([User_Type_No])
REFERENCES [dbo].[User_Type] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_User_Type]
GO
ALTER TABLE [dbo].[Viruses]  WITH CHECK ADD  CONSTRAINT [FK_Viruses_Collected_Blood] FOREIGN KEY([Collection_No])
REFERENCES [dbo].[Collected_Blood] ([ColIection_Id])
GO
ALTER TABLE [dbo].[Viruses] CHECK CONSTRAINT [FK_Viruses_Collected_Blood]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[57] 4[13] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Incoming_Blood"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Collected_Blood"
            Begin Extent = 
               Top = 2
               Left = 300
               Bottom = 132
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Donors"
            Begin Extent = 
               Top = 10
               Left = 607
               Bottom = 140
               Right = 802
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 168
               Left = 36
               Bottom = 298
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Blood_Type"
            Begin Extent = 
               Top = 173
               Left = 469
               Bottom = 269
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidth' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwIncomingInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N's = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwIncomingInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwIncomingInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Outgoing_Blood"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Donors"
            Begin Extent = 
               Top = 0
               Left = 597
               Bottom = 130
               Right = 792
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "Collected_Blood"
            Begin Extent = 
               Top = 0
               Left = 359
               Bottom = 130
               Right = 537
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Blood_Type"
            Begin Extent = 
               Top = 125
               Left = 36
               Bottom = 221
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patients"
            Begin Extent = 
               Top = 128
               Left = 308
               Bottom = 224
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOutgoingInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOutgoingInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOutgoingInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Donors"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Patient_Relation"
            Begin Extent = 
               Top = 14
               Left = 320
               Bottom = 110
               Right = 531
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwRegisteredDonors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwRegisteredDonors'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Collected_Blood"
            Begin Extent = 
               Top = 0
               Left = 398
               Bottom = 130
               Right = 576
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Donors"
            Begin Extent = 
               Top = 5
               Left = 93
               Bottom = 135
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Blood_Type"
            Begin Extent = 
               Top = 12
               Left = 631
               Bottom = 108
               Right = 801
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 109
               Left = 223
               Bottom = 239
               Right = 393
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patient_Relation"
            Begin Extent = 
               Top = 119
               Left = 611
               Bottom = 215
               Right = 822
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 150' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwStatusInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'0
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwStatusInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwStatusInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[5] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Donors"
            Begin Extent = 
               Top = 0
               Left = 417
               Bottom = 130
               Right = 612
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Donor_Information"
            Begin Extent = 
               Top = 0
               Left = 646
               Bottom = 130
               Right = 847
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Collected_Blood"
            Begin Extent = 
               Top = 131
               Left = 255
               Bottom = 261
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User_Type"
            Begin Extent = 
               Top = 167
               Left = 0
               Bottom = 263
               Right = 180
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwUserEntries'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwUserEntries'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwUserEntries'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Viruses"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Collected_Blood"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Donors"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 657
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "Blood_Type"
            Begin Extent = 
               Top = 93
               Left = 44
               Bottom = 189
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwVisursInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwVisursInfo'
GO
