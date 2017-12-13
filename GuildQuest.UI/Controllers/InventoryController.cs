using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using GuildQuest.Data.EF;
using GuildQuest.Data.Interfaces;
using GuildQuest.Data.Repositories;
using GuildQuest.UI.Helpers.Enums;
using GuildQuest.UI.Models;

namespace GuildQuest.UI.Controllers
{
    public class InventoryController : Controller
    {
        private IRepository repository = null;

        public InventoryController()
        {
            this.repository = new EfRepository();
        }

        public InventoryController(IRepository repository)
        {
            this.repository = repository;
        }
        // GET: Inventory
        //public ActionResult Index()
        //{
        //    var vehicles = db.Vehicles.Include(v => v.BodyStyle).Include(v => v.ExteriorColor).Include(v => v.InteriorColor).Include(v => v.MakeModel).Include(v => v.TransmissionType);
        //    return View(vehicles.ToList());
        //}

        // GET: Inventory/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vehicle vehicle = repository.GetVehicleById(id);
            if (vehicle == null)
            {
                return HttpNotFound();
            }

            InventoryViewModel ivm = new InventoryViewModel()
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

            InventoryViewModel vm = new InventoryViewModel()
            {
                Vehicles = new List<VehicleViewModel>(),
                SearchParms = new SearchViewModel()
            };

            vm.SearchParms.SearchType = VehicleTypeEnum.New;
            ViewBag.SearchType = vm.SearchParms.SearchType;

            
                IEnumerable<Vehicle> vehicles = repository.GetNewInventory();
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
                        Status = "New",
                        Mileage =  "New",
                        VINumber = vehicle.VINumber,
                        SalesPrice = vehicle.SalesPrice.ToString("C0"),
                        MSRPrice = vehicle.MSRPrice.ToString("C0"),
                        Sold = vehicle.Sold,
                        Featured = vehicle.Featured 
                    });
                }
           

            return View("Inventory", vm);
        }
 
        [HttpGet, ActionName("Used")]
        public ActionResult UsedInventory()
        {
            ViewBag.Message = "Used Inventory";

            InventoryViewModel vm = new InventoryViewModel()
            {
                Vehicles = new List<VehicleViewModel>(),
                SearchParms = new SearchViewModel()
            };

            vm.SearchParms.SearchType = VehicleTypeEnum.Used;
            ViewBag.SearchType = vm.SearchParms.SearchType;

            
                IEnumerable<Vehicle> vehicles = repository.GetUsedInventory();
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
                        Status =  "Used",
                        Mileage = "Used",
                        VINumber = vehicle.VINumber,
                        SalesPrice = vehicle.SalesPrice.ToString("C0"),
                        MSRPrice = vehicle.MSRPrice.ToString("C0"),
                        Sold = vehicle.Sold ,
                        Featured = 
                        vehicle.Featured 
                    });
                }

            return View("Inventory", vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SearchInventory(SearchViewModel model)
        {

            if (ModelState.IsValid)
            {
                VehicleTypeEnum searchType = model.SearchType;
                string searchArg = (model.SearchArg ?? String.Empty).ToLower();

                InventoryViewModel vm = new InventoryViewModel()
                {
                    Vehicles = new List<VehicleViewModel>(),
                    SearchParms = new SearchViewModel()
                };

                vm.SearchParms.SearchType = model.SearchType;
                ViewBag.SearchType = model.SearchType;

                int minYear;
                int maxYear;
                int minPrice;
                int maxPrice;

                if (!int.TryParse(model.SearchMinYear, out minYear))
                {
                    minYear = 1990;
                }
                if (!int.TryParse(model.SearchMaxYear, out maxYear))
                {
                    maxYear = DateTime.Today.Year + 1;
                }
               
                if (!int.TryParse(model.SearchMinPrice.Trim(), out minPrice))
                {
                    minPrice = 0;
                }
                if (!int.TryParse(model.SearchMaxPrice.Trim(), out maxPrice))
                {
                    maxPrice = int.MaxValue;
                }
                
                IEnumerable<Vehicle> vehicles;
                switch (searchType)
                {
                    case VehicleTypeEnum.New:
                        vehicles = repository.SearchNewInventoryByYearPriceModel(minYear, maxYear, minPrice, maxPrice, searchArg);
                        break;
                    case VehicleTypeEnum.Used:
                        vehicles = repository.SearchUsedInventoryByYearPriceModel(minYear, maxYear, minPrice, maxPrice, searchArg);
                        break;
                    default:
                        vehicles = repository.SearchAllInventoryByYearPriceModel(minYear, maxYear, minPrice, maxPrice, searchArg);
                        break;
                }

                foreach (Vehicle vehicle in vehicles)
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
                return PartialView("_InventoryPartial", vm);
            }

            return View(model);
        }
    }
    
}
