using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Core.Mapping;
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

            var ivm = new InventoryViewModel()
            {
                Vehicles = new List<VehicleViewModel>()
            };
            ivm.Vehicles.Add(new VehicleViewModel()
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
                Featured = vehicle.Featured,
                Description = vehicle.Description ?? "No Description"
            });               
            return View(ivm);
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
            ViewBag.SearchType = vm.SearchParms.SearchType;



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

            vm.SearchParms.SearchType = SearchTypeEnum.Used;
            ViewBag.SearchType = vm.SearchParms.SearchType;

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

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SearchInventory(SearchViewModel model)
        {
            if (ModelState.IsValid)
            {
                var searchType = model.SearchType;
                var searchArg = (model.SearchArg  ??  String.Empty).ToLower();

                var vm = new InventoryViewModel()
                {
                    Vehicles = new List<VehicleViewModel>(),
                    SearchParms = new SearchViewModel()

                };

                vm.SearchParms.SearchType = model.SearchType;
                ViewBag.SearchType = model.SearchType;

                int minYear;  
                int maxYear; 

                if (!int.TryParse(model.SearchMinYear, out minYear))
                {
                    minYear = 1990;
                }
                if (!int.TryParse(model.SearchMaxYear, out maxYear))
                {
                    maxYear = DateTime.Today.Year + 1;
                }

                int minPrice;
                int maxPrice;

                if (!int.TryParse(model.SearchMinPrice.Trim(), out minPrice))
                {
                    minPrice = 0;
                }
                if (!int.TryParse(model.SearchMaxPrice.Trim(), out maxPrice))
                {
                    maxPrice = int.MaxValue;
                }

                using (var db = new Models.GuildCarsEntities())
                {
                    
                    var vehicle2 =
                        db.Vehicles
                        .Where(v => (v.Year >= minYear && v.Year <= maxYear))
                        .Where(v => v.SalesPrice >= minPrice && v.SalesPrice <= maxPrice);

                    var vehicles = new List<Vehicle>();
                    switch (searchType)
                    {
                        case SearchTypeEnum.New:
                            vehicles = vehicle2.Where(t => t.Type == 1).ToList();
                            break;
                        case SearchTypeEnum.Used:
                            vehicles = vehicle2.Where(t => t.Type == 0).ToList();
                            break;
                        default:
                            vehicles = vehicle2.ToList();
                            break;
                    }
                    var checkMakeModel = !String.IsNullOrWhiteSpace(searchArg);
                    foreach (Vehicle vehicle in vehicles)
                    {
                        bool selectVehicle = false;
                        if (checkMakeModel)
                        {
                            selectVehicle = vehicle.MakeModel.MakeName.ToLower().Contains(searchArg)
                                        || vehicle.MakeModel.ModelName.ToLower().Contains(searchArg);
                        }
                        else
                        {
                            selectVehicle = true;
                        }
                        if (selectVehicle)
                        {
                            vm.Vehicles.Add(new VehicleViewModel()
                            {
                                VehicleID = vehicle.VehicleID,
                                YearMakeModel =
                                    $"{vehicle.Year} {vehicle.MakeModel.MakeName} {vehicle.MakeModel.ModelName}",
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
                    }
                };

                return PartialView("_InventoryPartial", vm);

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
