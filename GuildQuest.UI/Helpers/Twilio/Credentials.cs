using System.Collections.Generic;
using System.IO;
using System.Web.Configuration;
using System.Web.Mvc;
using Newtonsoft.Json;
using System;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Web.Hosting;

namespace GuildQuest.UI.Helpers.Twilio
{
    public static class Credentials
    {
        public static string AccountSid {get; set;}
        public static string AuthToken {get;set;}
        public static string PhoneNumber {get;set;}
        
         static Credentials()
        {
            var myfile = HostingEnvironment.MapPath(@"/App_Data/mysecured.json");
            if (myfile != null)
            {
                JsonSerializer se = new JsonSerializer();

                StreamReader re = new StreamReader(myfile);
                JsonTextReader reader = new JsonTextReader(re);
               
               var obj = se.Deserialize<Twilio>(reader);
                AccountSid = obj.TwilioAccountSid;
                AuthToken = obj.TwilioAuthToken;
                PhoneNumber = obj.TwilioPhoneNumber;
              
            } 
            else
            {
                throw new Exception("Twilio setting file not available");
            }
        }
        public class Twilio
        {
             public  string TwilioAccountSid {get; set;}
             public  string TwilioAuthToken {get;set;}
             public  string TwilioPhoneNumber {get;set;}
            
        }
        public class Collections
        {
            public List<CollectionProperty> CollectionProperty = new List<CollectionProperty>();
            public string Property1;
        }

        public class CollectionProperty
        {
            public  string TwilioAccountSid {get; set;}
            public  string TwilioAuthToken {get;set;}
            public  string TwilioPhoneNumber {get;set;}
        }

    }
    
    
}