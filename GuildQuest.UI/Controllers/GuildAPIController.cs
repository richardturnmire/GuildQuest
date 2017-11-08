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
using System.Web.Helpers;
using System.Web.Hosting;
using System.Web.Http;
using System.Web.Http.Results;
// using System.Web.Mvc;
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

       
        [Route("api/getmodelsbymakeid/{id}")]
        [AcceptVerbs("GET")]
        public IHttpActionResult GetModelsByMakeId(int id)
        {
            var db = new GuildCarsEntities();
           
            var models = db.MakeModels.Where(d => d.MakeID == id).OrderBy(d => d.ModelName)
                       .Select(r => new { value = r.ModelID, text = r.ModelName });

            return Json(models);

        }

        //[HttpPost, Route("api/SearchInventory")]
        //public IHttpActionResult SearchInventory(SearchViewModel model)
        //{
        //    var vm = new InventoryViewModel()
        //    {
        //        SearchParms = model,
        //        Vehicles = new List<VehicleViewModel>()
        //    };

        //    if (ModelState.IsValid)
        //    {
        //        var searchType = model.SearchType;
                
        //        var vehicles = new List<Vehicle>();

        //        using (var db = new Models.GuildCarsEntities())
        //        {
        //            switch (searchType)
        //            {

        //                case SearchTypeEnum.New:
        //                    vehicles = db.Vehicles.Where(v => v.Type == 1).ToList();
        //                    break;
        //                case SearchTypeEnum.Used:
        //                    vehicles = db.Vehicles.Where(v => v.Type == 0).ToList();
        //                    break;
        //                default:
        //                    Console.WriteLine("Invalid selection. Please select 1, 2, or 3.");
        //                    break;
        //            }
               

        //        foreach (Vehicle vehicle in vehicles)
        //            {
        //                vm.Vehicles.Add(new VehicleViewModel()
        //                {
        //                    VehicleID = vehicle.VehicleID,
        //                    YearMakeModel =
        //                        $"{vehicle.Year} {vehicle.MakeModel.MakeName} {vehicle.MakeModel.ModelName}",
        //                    BodyStyle = vehicle.BodyStyle.BodyStyle1,
        //                    TransmissionType = vehicle.TransmissionType.TransmissionType1,
        //                    InteriorColor = vehicle.InteriorColor.InteriorColor1,
        //                    ExteriorColor = vehicle.ExteriorColor.ExteriorColor1,
        //                    Status = (vehicle.Type == 0 ? "Used" : "New"),
        //                    Mileage = (vehicle.Type == 0 ? "Used" : "New"),
        //                    VINumber = vehicle.VINumber,
        //                    SalesPrice = vehicle.SalesPrice.ToString("C0"),
        //                    MSRPrice = vehicle.MSRPrice.ToString("C0"),
        //                    Sold = vehicle.Sold,
        //                    Featured = vehicle.Featured
        //                });
        //            }
        //        }
        //    }

        //    return PartialView("_InventoryPartialView", vm);

        //}
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