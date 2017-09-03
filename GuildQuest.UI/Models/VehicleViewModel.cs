using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GuildQuest.UI.Models
{
    public class VehicleViewModel
    {
        public int VehicleID { get; set; }
        public string YearMakeModel { get; set; }
        public string BodyStyle { get; set; }
        public string TransmissionType { get; set; }
        public string InteriorColor { get; set; }
        public string ExteriorColor { get; set; }
        public string Mileage { get; set; }
        public string VINumber { get; set; }
        public string SalesPrice { get; set; }
        public string MSRPrice { get; set; }
        public bool Sold { get; set; }
        public bool Featured { get; set; }
        public short Year { get; set; }
        public string Status { get; set; }
        public string Description { get; set; }
    }
}