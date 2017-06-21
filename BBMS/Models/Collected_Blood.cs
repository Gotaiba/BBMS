//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    public partial class Collected_Blood
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Collected_Blood()
        {
            this.Blood_Stock = new HashSet<Blood_Stock>();
            this.Incoming_Blood = new HashSet<Incoming_Blood>();
            this.Outgoing_Blood = new HashSet<Outgoing_Blood>();
            this.Viruses = new HashSet<Virus>();
        }
    
        public int ColIection_Id { get; set; }
        public int Donor_No { get; set; }
        [Required]
        public int Blood_Type_No { get; set; }
        [Required]
        public bool Blood_Status_No { get; set; }
        public string Reason { get; set; }
        [Required]
        [Range(12,17.5)]
        public double Hemo { get; set; }
        public int User_No { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Blood_Stock> Blood_Stock { get; set; }
        public virtual Blood_Type Blood_Type { get; set; }
        public virtual Donor Donor { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Incoming_Blood> Incoming_Blood { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Outgoing_Blood> Outgoing_Blood { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Virus> Viruses { get; set; }
    }
}
