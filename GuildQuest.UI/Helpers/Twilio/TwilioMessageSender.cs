using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;
using System.Configuration;

namespace GuildQuest.UI.Helpers.Twilio
{
    
    public class TwilioMessageSender // : ITwilioMessageSender
    {
        public TwilioMessageSender()
        {
            TwilioClient.Init(ConfigurationManager.AppSettings["AccountSID"].ToString(), ConfigurationManager.AppSettings["AuthToken"].ToString());
        }

        public async Task SendMessageAsync(string to, string from, string body)
        {
            await MessageResource.CreateAsync(new PhoneNumber(to),
                from: new PhoneNumber(from),
                body: body);
        }
    }
}