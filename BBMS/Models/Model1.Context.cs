﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BBMS.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BBMSdbEntities : DbContext
    {
        public BBMSdbEntities()
            : base("name=BBMSdbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Blood_Type> Blood_Type { get; set; }
        public virtual DbSet<Collected_Blood> Collected_Blood { get; set; }
        public virtual DbSet<Donor_Information> Donor_Information { get; set; }
        public virtual DbSet<Donor> Donors { get; set; }
        public virtual DbSet<Incoming_Blood> Incoming_Blood { get; set; }
        public virtual DbSet<Outgoing_Blood> Outgoing_Blood { get; set; }
        public virtual DbSet<Patient_Relation> Patient_Relation { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<User_Type> User_Type { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Virus> Viruses { get; set; }
        public virtual DbSet<vwIncomingInfo> vwIncomingInfoes { get; set; }
        public virtual DbSet<vwOutgoingInfo> vwOutgoingInfoes { get; set; }
        public virtual DbSet<vwRegisteredDonor> vwRegisteredDonors { get; set; }
        public virtual DbSet<vwStatusInfo> vwStatusInfoes { get; set; }
        public virtual DbSet<vwUserEntry> vwUserEntries { get; set; }
        public virtual DbSet<vwVisursInfo> vwVisursInfoes { get; set; }
    }
}
