using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web.Hosting;
using System.Web.Http;
using System.Web.Http.Results;
using System.Web.Mvc;
using GuildQuest.UI.Helpers.Enums;
using GuildQuest.UI.Models;
using Newtonsoft.Json;


namespace GuildQuest.UI.Controllers
{
    public class GuildApiController : ApiController
    {
        // private GuildCarsEntities _db = new GuildCarsEntities();
        //// GET api/<controller>
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

       
        [System.Web.Http.Route("api/getmodelsbymakeid/{id}")]
        [System.Web.Http.AcceptVerbs("GET")]
        public IHttpActionResult GetModelsByMakeId(int id)
        {
            var db = new GuildCarsEntities();
           
            var models = db.MakeModels.Where(d => d.MakeID == id).OrderBy(d => d.ModelName)
                       .Select(r => new { value = r.ModelID, text = r.ModelName });

            return Json(models);

        }

        //// POST api/<controller>
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT api/<controller>/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE api/<controller>/5
        //public void Delete(int id)
        //{
        //}
    }
}