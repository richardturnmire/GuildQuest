using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GuildQuest.UI.Startup))]
namespace GuildQuest.UI
{
    public partial class Startup
    {
       
        public void Configuration(IAppBuilder app)         
        {
            ConfigureAuth(app);
        }
    }
}
