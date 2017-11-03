using System;
using System.Collections.Generic;
using System.Configuration;
using System.Threading.Tasks;
using Twilio;
using Twilio.Clients;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace GuildQuest.UI.Helpers.Twilio
{

    public class TwilioRestClient
    {
        public interface IRestClient
        {
            Task<MessageResource> SendMessage(string to, string body);
        }

        public class RestClient : IRestClient
        {
            private readonly ITwilioRestClient _client;

            public RestClient()
            {
                _client = new global::Twilio.Clients.TwilioRestClient(
                    Credentials.TwilioAccountSid,
                    Credentials.TwilioAuthToken
                );
            }

            public RestClient(ITwilioRestClient client)
            {
                _client = client;
            }

            public async Task<MessageResource> SendMessage(string to, string body)
            {
                var result =
                    await MessageResource.CreateAsync(
                        new PhoneNumber(to),
                        from: new PhoneNumber(Credentials.TwilioPhoneNumber),
                        body: body,
                        client: _client);
                return result;
            }
        }

    }



    public interface ITwilioMessageSender
    {
        Task SendMessageAsync(string to, string from, string body);
    }
    public class TwilioMessageSender : ITwilioMessageSender
    {
        public TwilioMessageSender()
        {
            TwilioClient.Init(Credentials.TwilioAccountSid, Credentials.TwilioAuthToken);
        }

        public async Task SendMessageAsync(string to, string from, string body)
        {
            await MessageResource.CreateAsync(new PhoneNumber(to),
                from: new PhoneNumber(from),
                body: body);
        }
    }


}