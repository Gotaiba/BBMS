USE [BBMSdb]
GO
/****** Object:  View [dbo].[vwIncomingInfo]    Script Date: 7/16/2017 12:59:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwIncomingInfo]
AS
SELECT        dbo.Incoming_Blood.Date AS IncomingDate, dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Donors.Donate_Type, dbo.Donors.National_ID, dbo.Donors.Date AS DonatingDate, dbo.Blood_Type.Type_Name, 
                         dbo.Collected_Blood.Hemo, dbo.Users.Username, dbo.Incoming_Blood.IsUsed, dbo.Donors.Donar_Id, dbo.Donors.Date_of_Birth, dbo.Donors.Gender, dbo.Donors.Address, dbo.Donors.Telephone, dbo.Donors.Email, 
                         dbo.Patients.Patiant_Name, dbo.Patient_Relation.Patient_Relation_Name
FROM            dbo.Patient_Relation INNER JOIN
                         dbo.Patients ON dbo.Patient_Relation.Patient_Relation_Id = dbo.Patients.Patient_Relation_No RIGHT OUTER JOIN
                         dbo.Incoming_Blood INNER JOIN
                         dbo.Collected_Blood ON dbo.Incoming_Blood.Collection_No = dbo.Collected_Blood.ColIection_Id INNER JOIN
                         dbo.Donors ON dbo.Collected_Blood.Donor_No = dbo.Donors.Donar_Id INNER JOIN
                         dbo.Users ON dbo.Donors.User_No = dbo.Users.Id INNER JOIN
                         dbo.Blood_Type ON dbo.Collected_Blood.Blood_Type_No = dbo.Blood_Type.Blood_Type_Id ON dbo.Patients.Patiant_Id = dbo.Donors.Patient_No

GO
/****** Object:  View [dbo].[vwOutgoingInfo]    Script Date: 7/16/2017 12:59:18 AM ******/
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
/****** Object:  View [dbo].[vwRegisteredDonors]    Script Date: 7/16/2017 12:59:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwRegisteredDonors]
AS
SELECT        dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Donors.Gender, dbo.Donors.Telephone, dbo.Donors.Donate_Type, dbo.Donors.Date, dbo.Donors.CanDonate, dbo.Patients.Patiant_Name, 
                         dbo.Patient_Relation.Patient_Relation_Name, dbo.Patients.Patiant_Id, dbo.Donors.Date_of_Birth, dbo.Donors.Donar_Id, dbo.Donors.User_No, dbo.Donors.National_ID
FROM            dbo.Patient_Relation INNER JOIN
                         dbo.Patients ON dbo.Patient_Relation.Patient_Relation_Id = dbo.Patients.Patient_Relation_No RIGHT OUTER JOIN
                         dbo.Donors ON dbo.Patients.Patiant_Id = dbo.Donors.Patient_No

GO
/****** Object:  View [dbo].[vwStatusInfo]    Script Date: 7/16/2017 12:59:18 AM ******/
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
/****** Object:  View [dbo].[vwUserEntries]    Script Date: 7/16/2017 12:59:18 AM ******/
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
/****** Object:  View [dbo].[vwVisursInfo]    Script Date: 7/16/2017 12:59:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwVisursInfo]
AS
SELECT        dbo.Viruses.VDRL, dbo.Viruses.Virus_Id, dbo.Viruses.HCV, dbo.Viruses.HBV, dbo.Viruses.HIV, dbo.Collected_Blood.ColIection_Id, dbo.Blood_Type.Type_Name, dbo.Collected_Blood.Blood_Status_No, 
                         dbo.Collected_Blood.Reason, dbo.Collected_Blood.Hemo, dbo.Collected_Blood.Date, dbo.Donors.Donar_Id, dbo.Donors.First_Name, dbo.Donors.Last_Name, dbo.Donors.Date_of_Birth, dbo.Donors.Gender, dbo.Donors.Address, 
                         dbo.Donors.Telephone, dbo.Donors.National_ID, dbo.Donors.Email, dbo.Donors.Donate_Type, dbo.Donors.Date AS Expr1, dbo.Donors.CanDonate, dbo.Patient_Relation.Patient_Relation_Name, dbo.Patients.Patiant_Name
FROM            dbo.Patient_Relation INNER JOIN
                         dbo.Patients ON dbo.Patient_Relation.Patient_Relation_Id = dbo.Patients.Patient_Relation_No RIGHT OUTER JOIN
                         dbo.Viruses INNER JOIN
                         dbo.Collected_Blood ON dbo.Viruses.Collection_No = dbo.Collected_Blood.ColIection_Id INNER JOIN
                         dbo.Donors ON dbo.Collected_Blood.Donor_No = dbo.Donors.Donar_Id INNER JOIN
                         dbo.Blood_Type ON dbo.Collected_Blood.Blood_Type_No = dbo.Blood_Type.Blood_Type_Id ON dbo.Patients.Patiant_Id = dbo.Donors.Patient_No

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[67] 4[7] 2[5] 3) )"
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
         Begin Table = "Patient_Relation"
            Begin Extent = 
               Top = 337
               Left = 528
               Bottom = 433
               Right = 739
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
               Top = 165
               Left = 30
               Bottom = 295
               Right = 200
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
         Configuration = "(H (1[59] 4[5] 3[31] 2) )"
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
         Begin Table = "Patients"
            Begin Extent = 
               Top = 137
               Left = 302
               Bottom = 250
               Right = 497
            End
            DisplayFlags = 280
            TopColumn = 0
         End
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
               Top = 135
               Left = 83
               Bottom = 265
               Right = 253
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
               Top = 209
               Left = 348
               Bottom = 305
               Right = 559
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
      Begin ColumnWidths = 25
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
         Configuration = "(H (1[53] 4[11] 2[7] 3) )"
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
               Top = 0
               Left = 46
               Bottom = 130
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Collected_Blood"
            Begin Extent = 
               Top = 0
               Left = 310
               Bottom = 130
               Right = 488
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Donors"
            Begin Extent = 
               Top = 0
               Left = 551
               Bottom = 130
               Right = 746
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Blood_Type"
            Begin Extent = 
               Top = 166
               Left = 35
               Bottom = 262
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patients"
            Begin Extent = 
               Top = 164
               Left = 521
               Bottom = 277
               Right = 716
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Patient_Relation"
            Begin Extent = 
               Top = 174
               Left = 261
               Bottom = 270
               Right = 472
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
      Begin ColumnWidths = 26
         Width = 284
         Width = 1500
         W' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwVisursInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'idth = 1500
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
