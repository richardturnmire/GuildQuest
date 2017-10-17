//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GuildQuest.UI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Vehicle
    {
        public int VehicleID { get; set; }
        public int MakeModelID { get; set; }
        public int BodyStyleID { get; set; }
        public int TransmissionTypeID { get; set; }
        public int InteriorColorID { get; set; }
        public int ExteriorColorID { get; set; }
        public int Mileage { get; set; }
        public string VINumber { get; set; }
        public decimal SalesPrice { get; set; }
        public decimal MSRPrice { get; set; }
        public bool Sold { get; set; }
        public bool Featured { get; set; }
        public short Year { get; set; }
        public string Description { get; set; }
        public short Type { get; set; }
    
        public virtual BodyStyle BodyStyle { get; set; }
        public virtual ExteriorColor ExteriorColor { get; set; }
        public virtual InteriorColor InteriorColor { get; set; }
        public virtual MakeModel MakeModel { get; set; }
        public virtual TransmissionType TransmissionType { get; set; }
    }
}
