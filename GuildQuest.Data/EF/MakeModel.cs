//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Collections.Generic;

namespace GuildQuest.Data.EF
{
    public partial class MakeModel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MakeModel()
        {
            this.Vehicles = new HashSet<Vehicle>();
        }
    
        public int MakeModelID { get; set; }
        public int MakeID { get; set; }
        public int ModelID { get; set; }
        public string MakeName { get; set; }
        public string ModelName { get; set; }
    
        public virtual Make Make { get; set; }
        public virtual Model Model { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Vehicle> Vehicles { get; set; }
    }
}
