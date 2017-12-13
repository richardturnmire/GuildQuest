using System.Linq;
using System.Web.Http;
using GuildQuest.Data.Repositories;
// using System.Web.Mvc;


namespace GuildQuest.UI.Controllers
{
    public class GuildApiController : ApiController
    {
        //// GET api/<controller>
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

       
        [Route("api/getmodelsbymakeid/{id}")]
        [AcceptVerbs("GET")]
        public IHttpActionResult GetModelsByMakeId(int id)
        {
            var repo = new EfRepository();
            var models = repo.GetModelsforMakeId(id);

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