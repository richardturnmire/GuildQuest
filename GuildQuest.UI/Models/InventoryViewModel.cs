using System.Collections.Generic;
using GuildQuest.Data.EF;

namespace GuildQuest.UI.Models
{
    public class InventoryViewModel
    {
        public List<VehicleViewModel> Vehicles { get; set; }

        public SearchViewModel SearchParms { get; set; }

        public Sale SaleInfo { get; set; }
    }
}