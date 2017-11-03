using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GuildQuest.UI.Helpers.Enums;
using GuildQuest.UI.Models;

namespace GuildQuest.UI.Controllers
{
    public class InventoryController : Controller
    {
        private GuildCarsEntities db = new GuildCarsEntities();

        // GET: Inventory
        public ActionResult Index()
        {
            var vehicles = db.Vehicles.Include(v => v.BodyStyle).Include(v => v.ExteriorColor).Include(v => v.InteriorColor).Include(v => v.MakeModel).Include(v => v.TransmissionType);
            return View(vehicles.ToList());
        }

        // GET: Inventory/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vehicle vehicle = db.Vehicles.Find(id);
            if (vehicle == null)
            {
                return HttpNotFound();
            }

            var vm = new VehicleViewModel()
            {
                VehicleID = vehicle.VehicleID,
                YearMakeModel = $"{vehicle.Year} {vehicle.MakeModel.MakeName} {vehicle.MakeModel.ModelName}",
                BodyStyle = vehicle.BodyStyle.BodyStyle1,
                TransmissionType = vehicle.TransmissionType.TransmissionType1,
                InteriorColor = vehicle.InteriorColor.InteriorColor1,
                ExteriorColor = vehicle.ExteriorColor.ExteriorColor1,
                Status = (vehicle.Type == 0 ? "Used" : "New"),
                Mileage = (vehicle.Type == 0 ? "Used" : "New"),
                VINumber = vehicle.VINumber,
                SalesPrice = vehicle.SalesPrice.ToString("C0"),
                MSRPrice = vehicle.MSRPrice.ToString("C0"),
                Sold = vehicle.Sold,
                Featured = vehicle.Featured ,
                Description = vehicle.Description ?? "No Description"
            };
            return View(vm);
        }

        [HttpGet, ActionName("New")]
       public ActionResult NewInventory()
        {
            ViewBag.Message = "New Inventory";

            var vm = new InventoryViewModel()
            {
                Vehicles = new List<VehicleViewModel>(),
                SearchParms = new SearchViewModel()
            };

            vm.SearchParms.SearchType = SearchTypeEnum.New;

            using (var db = new Models.GuildCarsEntities())
            {
                var vehicles = db.Vehicles.Where(v => v.Type == 1).ToList();
                foreach (Vehicle vehicle in vehicles)
                {
                    vm.Vehicles.Add(new VehicleViewModel()
                    {
                        VehicleID = vehicle.VehicleID,
                        YearMakeModel = $"{vehicle.Year} {vehicle.MakeModel.MakeName} {vehicle.MakeModel.ModelName}",
                        BodyStyle = vehicle.BodyStyle.BodyStyle1,
                        TransmissionType = vehicle.TransmissionType.TransmissionType1,
                        InteriorColor = vehicle.InteriorColor.InteriorColor1,
                        ExteriorColor = vehicle.ExteriorColor.ExteriorColor1,
                        Status = (vehicle.Type == 0 ? "Used" : "New"),
                        Mileage = (vehicle.Type == 0 ? "Used" : "New"),
                        VINumber = vehicle.VINumber,
                        SalesPrice = vehicle.SalesPrice.ToString("C0"),
                        MSRPrice = vehicle.MSRPrice.ToString("C0"),
                        Sold = vehicle.Sold,
                        Featured = vehicle.Featured 
                    });
                }
            };

            return View("Inventory", vm);
        }

       


        [HttpGet, ActionName("Used")]
        public ActionResult UsedInventory()
        {
            ViewBag.Message = "Used Inventory";

            var vm = new InventoryViewModel()
            {
                Vehicles = new List<VehicleViewModel>(),
                SearchParms = new SearchViewModel()
            };

            using (var db = new Models.GuildCarsEntities())
            {
                var vehicles = db.Vehicles.Where(v => v.Type == 0).ToList();
                foreach (Vehicle vehicle in vehicles)
                {
                    vm.Vehicles.Add(new VehicleViewModel()
                    {
                        VehicleID = vehicle.VehicleID,
                        YearMakeModel = $"{vehicle.Year} {vehicle.MakeModel.MakeName} {vehicle.MakeModel.ModelName}",
                        BodyStyle = vehicle.BodyStyle.BodyStyle1,
                        TransmissionType = vehicle.TransmissionType.TransmissionType1,
                        InteriorColor = vehicle.InteriorColor.InteriorColor1,
                        ExteriorColor = vehicle.ExteriorColor.ExteriorColor1,
                        Status = (vehicle.Type == 0 ? "Used" : "New"),
                        Mileage = (vehicle.Type == 0 ? "Used" : "New"),
                        VINumber = vehicle.VINumber,
                        SalesPrice = vehicle.SalesPrice.ToString("C0"),
                        MSRPrice = vehicle.MSRPrice.ToString("C0"),
                        Sold = vehicle.Sold ,
                        Featured = 
                        vehicle.Featured 
                    });
                }
            };

            return View("Inventory", vm);
        }

        [System.Web.Http.HttpPost, System.Web.Http.Route("api/SearchInventory")]
        [ValidateAntiForgeryToken]
        public ActionResult SearchInventory(SearchViewModel model)
        {
            if (ModelState.IsValid)
            {
                var searchType = model.SearchType;

                var vm = new InventoryViewModel()
                {
                    Vehicles = new List<VehicleViewModel>(),
                    SearchParms = new SearchViewModel()

                };

                vm.SearchParms.SearchType = model.SearchType;

                using (var db = new Models.GuildCarsEntities())
                {
                    var vehicles = new List<Vehicle>();
                    switch (searchType)
                    {

                        case SearchTypeEnum.New:
                            vehicles = db.Vehicles.Where(v => v.Type == 1).ToList();
                            break;
                        case SearchTypeEnum.Used:
                            vehicles = db.Vehicles.Where(v => v.Type == 0).ToList();
                            break;
                        default:
                            Console.WriteLine("Invalid selection. Please select 1, 2, or 3.");
                            break;
                    }

                    foreach (Vehicle vehicle in vehicles)
                    {
                        vm.Vehicles.Add(new VehicleViewModel()
                        {
                            VehicleID = vehicle.VehicleID,
                            YearMakeModel = $"{vehicle.Year} {vehicle.MakeModel.MakeName} {vehicle.MakeModel.ModelName}",
                            BodyStyle = vehicle.BodyStyle.BodyStyle1,
                            TransmissionType = vehicle.TransmissionType.TransmissionType1,
                            InteriorColor = vehicle.InteriorColor.InteriorColor1,
                            ExteriorColor = vehicle.ExteriorColor.ExteriorColor1,
                            Status = (vehicle.Type == 0 ? "Used" : "New"),
                            Mileage = (vehicle.Type == 0 ? "Used" : "New"),
                            VINumber = vehicle.VINumber,
                            SalesPrice = vehicle.SalesPrice.ToString("C0"),
                            MSRPrice = vehicle.MSRPrice.ToString("C0"),
                            Sold = vehicle.Sold,
                            Featured = vehicle.Featured
                        });
                    }
                };

                switch (searchType)
                {
                    case SearchTypeEnum.New:
                        return PartialView("_InventoryPartial",vm);

                    case SearchTypeEnum.Used:
                        return PartialView("_InventoryPartial", vm);

                    default:
                        Console.WriteLine("Invalid selection. Please select 1, 2, or 3.");
                        return new HttpNotFoundResult();
                       
                }

            }

            return View(model);
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

    }
}
