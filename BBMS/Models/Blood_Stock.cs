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
    
    public partial class Blood_Stock
    {
        public int Storage_Id { get; set; }
        public int Collection_No { get; set; }
        public int Blood_Type_No { get; set; }
        public System.DateTime Expiration_Date { get; set; }
    
        public virtual Blood_Type Blood_Type { get; set; }
        public virtual Collected_Blood Collected_Blood { get; set; }
    }
}
