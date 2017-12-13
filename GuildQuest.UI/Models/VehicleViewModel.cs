using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Mvc;

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

        [DataType(DataType.MultilineText), AllowHtml]
        public string Description { get; set; }
        public HttpPostedFileBase FileUpload { get; set; }


        public int MakeId { get; set; }
        public int ModelId { get; set; }
        public int MakeModelId { get; set; }
        public int BodyStyleID { get; set; }
        public int TransmissionTypeID { get; set; }
        public int InteriorColorID { get; set; }
        public int ExteriorColorID { get; set; }

        public SelectList BodyStyleIDs { get; set; }
        public SelectList ExteriorColorIDs { get; set; }
        public SelectList InteriorColorIDs { get; set; }
        public SelectList MakeModelIDs { get; set; }
        public SelectList TransmissionTypeIDs { get; set; }
        public SelectList MakeIds { get; set; }
        public SelectList ModelIds { get; set; }
        public SelectList StateIds { get; set; }
        public SelectList PurchaseTypeIds { get; set; }



    }
}