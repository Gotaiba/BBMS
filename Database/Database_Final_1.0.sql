USE [BBMSdb]
GO
/****** Object:  Table [dbo].[Blood_Type]    Script Date: 7/14/2017 6:07:10 PM ******/
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
/****** Object:  Table [dbo].[Collected_Blood]    Script Date: 7/14/2017 6:07:10 PM ******/
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
/****** Object:  Table [dbo].[Donor_Information]    Script Date: 7/14/2017 6:07:10 PM ******/
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
/****** Object:  Table [dbo].[Donors]    Script Date: 7/14/2017 6:07:10 PM ******/
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
	[Patient_No] [int] NULL,
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
/****** Object:  Table [dbo].[Incoming_Blood]    Script Date: 7/14/2017 6:07:10 PM ******/
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
/****** Object:  Table [dbo].[Outgoing_Blood]    Script Date: 7/14/2017 6:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outgoing_Blood](
	[Outgoing_Id] [int] IDENTITY(1,1) NOT NULL,
	[Collection_No] [int] NOT NULL,
	[Patient_No] [int] NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Outgoing_Blood] PRIMARY KEY CLUSTERED 
(
	[Outgoing_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient_Relation]    Script Date: 7/14/2017 6:07:10 PM ******/
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
/****** Object:  Table [dbo].[Patients]    Script Date: 7/14/2017 6:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Patiant_Id] [int] IDENTITY(1,1) NOT NULL,
	[Patiant_Name] [nvarchar](50) NULL,
	[Patient_Relation_No] [int] NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Patiant_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User_Type]    Script Date: 7/14/2017 6:07:10 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 7/14/2017 6:07:10 PM ******/
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
/****** Object:  Table [dbo].[Viruses]    Script Date: 7/14/2017 6:07:10 PM ******/
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
/****** Object:  View [dbo].[vwIncomingInfo]    Script Date: 7/14/2017 6:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwIncomingInfo]
AS
SELECT        dbo.Incoming_Blood.Date AS IncomingDate, dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Donors.Donate_Type, dbo.Donors.National_ID, dbo.Donors.Date AS DonatingDate, dbo.Blood_Type.Type_Name, 
                         dbo.Collected_Blood.Hemo, dbo.Users.Username, dbo.Incoming_Blood.IsUsed, dbo.Donors.Donar_Id, dbo.Donors.Date_of_Birth, dbo.Donors.Gender, dbo.Donors.Address, dbo.Donors.Telephone, dbo.Donors.Email, 
                         dbo.Patients.Patiant_Name, dbo.Patient_Relation.Patient_Relation_Name
FROM            dbo.Incoming_Blood INNER JOIN
                         dbo.Collected_Blood ON dbo.Incoming_Blood.Collection_No = dbo.Collected_Blood.ColIection_Id INNER JOIN
                         dbo.Donors ON dbo.Collected_Blood.Donor_No = dbo.Donors.Donar_Id INNER JOIN
                         dbo.Users ON dbo.Donors.User_No = dbo.Users.Id INNER JOIN
                         dbo.Blood_Type ON dbo.Collected_Blood.Blood_Type_No = dbo.Blood_Type.Blood_Type_Id INNER JOIN
                         dbo.Patients ON dbo.Donors.Patient_No = dbo.Patients.Patiant_Id INNER JOIN
                         dbo.Patient_Relation ON dbo.Patients.Patient_Relation_No = dbo.Patient_Relation.Patient_Relation_Id

GO
/****** Object:  View [dbo].[vwOutgoingInfo]    Script Date: 7/14/2017 6:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwOutgoingInfo]
AS
SELECT        dbo.Outgoing_Blood.Outgoing_Id, dbo.Outgoing_Blood.Patient_No, dbo.Donors.Donar_Id, dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Donors.Date_of_Birth, dbo.Donors.Gender, dbo.Donors.National_ID, 
                         dbo.Donors.Date, dbo.Collected_Blood.ColIection_Id, dbo.Blood_Type.Type_Name, dbo.Outgoing_Blood.Date AS Expr1, dbo.Collected_Blood.Hemo, dbo.Patients.Patiant_Name, dbo.Patient_Relation.Patient_Relation_Name, 
                         dbo.Donors.CanDonate, dbo.Donors.Donate_Type, dbo.Donors.Email, dbo.Collected_Blood.Blood_Type_No, dbo.Collected_Blood.Blood_Status_No, dbo.Collected_Blood.Reason, dbo.Collected_Blood.Date AS Expr2, 
                         Blood_Type_1.Type_Name AS Expr3
FROM            dbo.Outgoing_Blood INNER JOIN
                         dbo.Collected_Blood ON dbo.Outgoing_Blood.Collection_No = dbo.Collected_Blood.ColIection_Id INNER JOIN
                         dbo.Donors ON dbo.Collected_Blood.Donor_No = dbo.Donors.Donar_Id INNER JOIN
                         dbo.Blood_Type ON dbo.Collected_Blood.Blood_Type_No = dbo.Blood_Type.Blood_Type_Id INNER JOIN
                         dbo.Patients ON dbo.Outgoing_Blood.Patient_No = dbo.Patients.Patiant_Id AND dbo.Donors.Patient_No = dbo.Patients.Patiant_Id INNER JOIN
                         dbo.Patient_Relation ON dbo.Patients.Patient_Relation_No = dbo.Patient_Relation.Patient_Relation_Id INNER JOIN
                         dbo.Blood_Type AS Blood_Type_1 ON dbo.Collected_Blood.Blood_Type_No = Blood_Type_1.Blood_Type_Id

GO
/****** Object:  View [dbo].[vwRegisteredDonors]    Script Date: 7/14/2017 6:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwRegisteredDonors]
AS
SELECT        dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Donors.Gender, dbo.Donors.Telephone, dbo.Donors.Donate_Type, dbo.Donors.Date, dbo.Donors.CanDonate, dbo.Patients.Patiant_Name, 
                         dbo.Patient_Relation.Patient_Relation_Name, dbo.Patients.Patiant_Id, dbo.Donors.Date_of_Birth, dbo.Donors.Donar_Id, dbo.Donors.User_No
FROM            dbo.Donors INNER JOIN
                         dbo.Patients ON dbo.Donors.Patient_No = dbo.Patients.Patiant_Id INNER JOIN
                         dbo.Patient_Relation ON dbo.Patients.Patient_Relation_No = dbo.Patient_Relation.Patient_Relation_Id

GO
/****** Object:  View [dbo].[vwStatusInfo]    Script Date: 7/14/2017 6:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwStatusInfo]
AS
SELECT        dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Collected_Blood.Blood_Status_No, dbo.Collected_Blood.Reason, dbo.Blood_Type.Type_Name, dbo.Collected_Blood.Date, dbo.Donors.Date_of_Birth, dbo.Donors.Gender, 
                         dbo.Donors.Address, dbo.Donors.Telephone, dbo.Donors.National_ID, dbo.Donors.Email, dbo.Donors.Donate_Type, dbo.Donors.Donar_Id, dbo.Donors.CanDonate, dbo.Collected_Blood.ColIection_Id, 
                         dbo.Blood_Type.Blood_Type_Id, dbo.Patient_Relation.Patient_Relation_Name, dbo.Patients.Patiant_Name, dbo.Incoming_Blood.IsUsed, dbo.Incoming_Blood.Incoming_Id, dbo.Incoming_Blood.Date AS IncDate, 
                         dbo.Collected_Blood.Hemo, dbo.Donors.Date AS RegistrationDate
FROM            dbo.Incoming_Blood INNER JOIN
                         dbo.Collected_Blood INNER JOIN
                         dbo.Donors ON dbo.Collected_Blood.Donor_No = dbo.Donors.Donar_Id INNER JOIN
                         dbo.Blood_Type ON dbo.Collected_Blood.Blood_Type_No = dbo.Blood_Type.Blood_Type_Id ON dbo.Incoming_Blood.Collection_No = dbo.Collected_Blood.ColIection_Id LEFT OUTER JOIN
                         dbo.Patient_Relation INNER JOIN
                         dbo.Patients ON dbo.Patient_Relation.Patient_Relation_Id = dbo.Patients.Patient_Relation_No ON dbo.Donors.Patient_No = dbo.Patients.Patiant_Id

GO
/****** Object:  View [dbo].[vwUserEntries]    Script Date: 7/14/2017 6:07:10 PM ******/
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
/****** Object:  View [dbo].[vwVisursInfo]    Script Date: 7/14/2017 6:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwVisursInfo]
AS
SELECT        dbo.Viruses.VDRL, dbo.Viruses.Virus_Id, dbo.Viruses.HCV, dbo.Viruses.HBV, dbo.Viruses.HIV, dbo.Collected_Blood.ColIection_Id, dbo.Blood_Type.Type_Name, dbo.Collected_Blood.Blood_Status_No, 
                         dbo.Collected_Blood.Reason, dbo.Collected_Blood.Hemo, dbo.Collected_Blood.Date, dbo.Donors.Donar_Id, dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Donors.Date_of_Birth, dbo.Donors.Gender, dbo.Donors.Address, 
                         dbo.Donors.Telephone, dbo.Donors.National_ID, dbo.Donors.Email, dbo.Donors.Donate_Type, dbo.Donors.Date AS Expr1, dbo.Donors.CanDonate, dbo.Patient_Relation.Patient_Relation_Name, dbo.Patients.Patiant_Name
FROM            dbo.Viruses INNER JOIN
                         dbo.Collected_Blood ON dbo.Viruses.Collection_No = dbo.Collected_Blood.ColIection_Id INNER JOIN
                         dbo.Donors ON dbo.Collected_Blood.Donor_No = dbo.Donors.Donar_Id INNER JOIN
                         dbo.Blood_Type ON dbo.Collected_Blood.Blood_Type_No = dbo.Blood_Type.Blood_Type_Id INNER JOIN
                         dbo.Patients ON dbo.Donors.Patient_No = dbo.Patients.Patiant_Id INNER JOIN
                         dbo.Patient_Relation ON dbo.Patients.Patient_Relation_No = dbo.Patient_Relation.Patient_Relation_Id

GO
SET IDENTITY_INSERT [dbo].[Blood_Type] ON 

INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (1, N'A-')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (2, N'A+')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (3, N'B+')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (4, N'B-')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (5, N'O+')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (6, N'O-')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (7, N'AB+')
INSERT [dbo].[Blood_Type] ([Blood_Type_Id], [Type_Name]) VALUES (8, N'AB-')
SET IDENTITY_INSERT [dbo].[Blood_Type] OFF
SET IDENTITY_INSERT [dbo].[Collected_Blood] ON 

INSERT [dbo].[Collected_Blood] ([ColIection_Id], [Donor_No], [Blood_Type_No], [Blood_Status_No], [Reason], [Hemo], [User_No], [Date]) VALUES (16, 9, 3, 1, NULL, 13.8, 3, CAST(N'2017-07-14' AS Date))
INSERT [dbo].[Collected_Blood] ([ColIection_Id], [Donor_No], [Blood_Type_No], [Blood_Status_No], [Reason], [Hemo], [User_No], [Date]) VALUES (17, 10, 5, 1, NULL, 17, 3, CAST(N'2017-07-14' AS Date))
SET IDENTITY_INSERT [dbo].[Collected_Blood] OFF
SET IDENTITY_INSERT [dbo].[Donor_Information] ON 

INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (31, 9, 0, 0, 0, 0, 1, N'Panadol', 0, 0, NULL, 60, 3, CAST(N'2017-07-14' AS Date), 1)
INSERT [dbo].[Donor_Information] ([DonorInfo_Id], [Donor_No], [Surgery], [Blood_pressure], [Blood_Diabetes], [Heart_Disease], [Medicine], [Medicine_Text], [Smoker], [Other_Problems], [Other_Problems_Text], [Weight], [User_No], [Date], [IsDonate]) VALUES (32, 10, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 100, 3, CAST(N'2017-07-14' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Donor_Information] OFF
SET IDENTITY_INSERT [dbo].[Donors] ON 

INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_No], [Date], [User_No], [CanDonate]) VALUES (9, N'Ahmed', N'Baha', CAST(N'1990-09-08' AS Date), N'M ', N'Kafori', N'091233489', N'12637849098', N'ahmed@baha.com', N'V', 13, CAST(N'2017-07-14' AS Date), 4, 0)
INSERT [dbo].[Donors] ([Donar_Id], [First_Name], [Last_Name], [Date_of_Birth], [Gender], [Address], [Telephone], [National_ID], [Email], [Donate_Type], [Patient_No], [Date], [User_No], [CanDonate]) VALUES (10, N'Morgun', N'Mohammed', CAST(N'1991-01-01' AS Date), N'M ', N'Khartoum', N'091234578', N'87957849021', NULL, N'P', 14, CAST(N'2017-07-14' AS Date), 4, 0)
SET IDENTITY_INSERT [dbo].[Donors] OFF
SET IDENTITY_INSERT [dbo].[Incoming_Blood] ON 

INSERT [dbo].[Incoming_Blood] ([Incoming_Id], [Collection_No], [Date], [IsUsed], [User_No]) VALUES (7, 16, CAST(N'2017-07-14' AS Date), 1, 3)
INSERT [dbo].[Incoming_Blood] ([Incoming_Id], [Collection_No], [Date], [IsUsed], [User_No]) VALUES (8, 17, CAST(N'2017-07-14' AS Date), 1, 3)
SET IDENTITY_INSERT [dbo].[Incoming_Blood] OFF
SET IDENTITY_INSERT [dbo].[Outgoing_Blood] ON 

INSERT [dbo].[Outgoing_Blood] ([Outgoing_Id], [Collection_No], [Patient_No], [Date]) VALUES (3, 16, NULL, CAST(N'2017-07-14' AS Date))
INSERT [dbo].[Outgoing_Blood] ([Outgoing_Id], [Collection_No], [Patient_No], [Date]) VALUES (4, 17, 14, CAST(N'2017-07-14' AS Date))
SET IDENTITY_INSERT [dbo].[Outgoing_Blood] OFF
SET IDENTITY_INSERT [dbo].[Patient_Relation] ON 

INSERT [dbo].[Patient_Relation] ([Patient_Relation_Id], [Patient_Relation_Name]) VALUES (1, N'Father')
INSERT [dbo].[Patient_Relation] ([Patient_Relation_Id], [Patient_Relation_Name]) VALUES (2, N'Mother')
INSERT [dbo].[Patient_Relation] ([Patient_Relation_Id], [Patient_Relation_Name]) VALUES (3, N'Sibiling')
INSERT [dbo].[Patient_Relation] ([Patient_Relation_Id], [Patient_Relation_Name]) VALUES (4, N'Aunt')
INSERT [dbo].[Patient_Relation] ([Patient_Relation_Id], [Patient_Relation_Name]) VALUES (5, N'Uncle')
SET IDENTITY_INSERT [dbo].[Patient_Relation] OFF
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([Patiant_Id], [Patiant_Name], [Patient_Relation_No]) VALUES (13, NULL, NULL)
INSERT [dbo].[Patients] ([Patiant_Id], [Patiant_Name], [Patient_Relation_No]) VALUES (14, N'Omer Abbas', 3)
SET IDENTITY_INSERT [dbo].[Patients] OFF
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
ALTER TABLE [dbo].[Donors]  WITH CHECK ADD  CONSTRAINT [FK_Donors_Patients] FOREIGN KEY([Patient_No])
REFERENCES [dbo].[Patients] ([Patiant_Id])
GO
ALTER TABLE [dbo].[Donors] CHECK CONSTRAINT [FK_Donors_Patients]
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
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Patient_Relation] FOREIGN KEY([Patient_Relation_No])
REFERENCES [dbo].[Patient_Relation] ([Patient_Relation_Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Patient_Relation]
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
         Configuration = "(H (1[83] 4[5] 2[5] 3) )"
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
               Top = 202
               Left = 339
               Bottom = 298
               Right = 509
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patients"
            Begin Extent = 
               Top = 222
               Left = 586
               Bottom = 335
               Right = 781
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patient_Relation"
            Begin Extent = 
               Top = 337
               Left = 528
               Bottom = 433
               Right = 739
            End
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwIncomingInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwIncomingInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwIncomingInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[72] 4[5] 2[5] 3) )"
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
         Begin Table = "Donors"
            Begin Extent = 
               Top = 0
               Left = 597
               Bottom = 130
               Right = 792
            End
            DisplayFlags = 280
            TopColumn = 0
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
               Top = 176
               Left = 322
               Bottom = 289
               Right = 517
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patient_Relation"
            Begin Extent = 
               Top = 257
               Left = 539
               Bottom = 353
               Right = 750
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Blood_Type_1"
            Begin Extent = 
               Top = 132
               Left = 555
               Bottom = 228
               Right = 725
            End
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOutgoingInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'          DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOutgoingInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwOutgoingInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[69] 4[5] 2[0] 3) )"
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
            TopColumn = 10
         End
         Begin Table = "Patients"
            Begin Extent = 
               Top = 6
               Left = 271
               Bottom = 119
               Right = 466
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patient_Relation"
            Begin Extent = 
               Top = 6
               Left = 504
               Bottom = 102
               Right = 715
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
         Configuration = "(H (1[59] 4[5] 2[5] 3) )"
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
               Top = 64
               Left = 205
               Bottom = 194
               Right = 375
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Collected_Blood"
            Begin Extent = 
               Top = 0
               Left = 398
               Bottom = 130
               Right = 576
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Donors"
            Begin Extent = 
               Top = 0
               Left = 7
               Bottom = 130
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 10
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
         Begin Table = "Patient_Relation"
            Begin Extent = 
               Top = 234
               Left = 287
               Bottom = 330
               Right = 498
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patients"
            Begin Extent = 
               Top = 171
               Left = 605
               Bottom = 284
               Right = 800
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
      Begin ColumnWidths = 23
         Width = 284
         Width = 1500
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwStatusInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Width = 1500
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
         Configuration = "(H (1[30] 4[32] 2[21] 3) )"
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
               Top = 3
               Left = 48
               Bottom = 133
               Right = 218
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
            TopColumn = 0
         End
         Begin Table = "Donors"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 136
               Right = 657
            End
            DisplayFlags = 280
            TopColumn = 0
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
         Begin Table = "Patient_Relation"
            Begin Extent = 
               Top = 138
               Left = 252
               Bottom = 234
               Right = 463
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patients"
            Begin Extent = 
               Top = 138
               Left = 501
               Bottom = 251
               Right = 696
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
         Wi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwVisursInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'dth = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwVisursInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwVisursInfo'
GO
