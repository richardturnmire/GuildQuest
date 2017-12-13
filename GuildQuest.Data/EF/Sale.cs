//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GuildQuest.Data.EF
{
    public partial class Sale
    {
        public int SaleId { get; set; }
        public int VehicleId { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Street1 { get; set; }
        public string Street2 { get; set; }
        public string City { get; set; }
        public int StateId { get; set; }
        public string ZipCode { get; set; }
        public decimal PurchasePrice { get; set; }
        public int PurchaseTypeId { get; set; }
    
        public virtual PurchaseType PurchaseType { get; set; }
        public virtual State State { get; set; }
        public virtual Vehicle Vehicle { get; set; }
    }
}