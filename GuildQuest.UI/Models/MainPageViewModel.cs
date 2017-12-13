using System.Collections.Generic;
using GuildQuest.Data.EF;


namespace GuildQuest.UI.Models
{
    public class MainPageViewModel
    {
       public IList<Special> Specials;
       public IList<VehicleViewModel> Featured;
    }
}