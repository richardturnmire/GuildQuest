using System.Web.Configuration;

namespace GuildQuest.UI.Helpers.Twilio
{
    public class Credentials
    {
        public static string TwilioAccountSid = WebConfigurationManager.AppSettings["TwilioAccountSid"];
        public static string TwilioAuthToken = WebConfigurationManager.AppSettings["TwilioAuthToken"];
        public static string TwilioPhoneNumber = WebConfigurationManager.AppSettings["TwilioPhoneNumber"];
    }
}