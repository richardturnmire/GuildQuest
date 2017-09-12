using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GuildQuest.UI.Models
{
    public class InventoryViewModel
    {
        public List<VehicleViewModel> Vehicles { get; set; }

        public SearchViewModel SearchParms { get; set; }
    }
}