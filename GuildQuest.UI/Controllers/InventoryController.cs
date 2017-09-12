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
                Status = (vehicle.Mileage > 1000 ? "Used" : "New"),
                Mileage = (vehicle.Mileage > 1000 ? "Used" : "New"),
                VINumber = vehicle.VINumber,
                SalesPrice = vehicle.SalesPrice.ToString("C0"),
                MSRPrice = vehicle.MSRPrice.ToString("C0"),
                Sold = (vehicle.Sold ?? false),
                Featured = (vehicle.Featured ?? false),
                Description = vehicle.Description ?? "No Description"
            };
            return View(vm);
        }

        // GET: Inventory/Create
        public ActionResult Create()
        {
            ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1");
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1");
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1");
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName");
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1");
            return View();
        }

        // POST: Inventory/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "VehicleID,MakeModelID,BodyStyleID,TransmissionTypeID,InteriorColorID,ExteriorColorID,Mileage,VINumber,SalesPrice,MSRPrice,Sold,Featured,Year")] Vehicle vehicle)
        {
            if (ModelState.IsValid)
            {
                db.Vehicles.Add(vehicle);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1", vehicle.BodyStyleID);
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1", vehicle.ExteriorColorID);
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1", vehicle.InteriorColorID);
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName", vehicle.MakeModelID);
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1", vehicle.TransmissionTypeID);
            return View(vehicle);
        }

        // GET: Inventory/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1", vehicle.BodyStyleID);
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1", vehicle.ExteriorColorID);
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1", vehicle.InteriorColorID);
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName", vehicle.MakeModelID);
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1", vehicle.TransmissionTypeID);
            return View(vehicle);
        }

        // POST: Inventory/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "VehicleID,MakeModelID,BodyStyleID,TransmissionTypeID,InteriorColorID,ExteriorColorID,Mileage,VINumber,SalesPrice,MSRPrice,Sold,Featured,Year")] Vehicle vehicle)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vehicle).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1", vehicle.BodyStyleID);
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1", vehicle.ExteriorColorID);
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1", vehicle.InteriorColorID);
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName", vehicle.MakeModelID);
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1", vehicle.TransmissionTypeID);
            return View(vehicle);
        }

        // GET: Inventory/Delete/5
        public ActionResult Delete(int? id)
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
            return View(vehicle);
        }

        // POST: Inventory/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Vehicle vehicle = db.Vehicles.Find(id);
            db.Vehicles.Remove(vehicle);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        [HttpGet, ActionName("New")]
        [ValidateAntiForgeryToken]
        public ActionResult NewInventory()
        {
            ViewBag.Message = "New Inventory";

            var vm = new InventoryViewModel()
            {
                Vehicles = new List<VehicleViewModel>(),
                SearchParms = SetupSearchParms(),
            };

            vm.SearchParms.SearchType = SearchTypeEnum.New;

            using (var db = new Models.GuildCarsEntities())
            {
                var vehicles = db.Vehicles.Where(v => v.Mileage <= 1000).ToList();
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
                        Status = (vehicle.Mileage > 1000 ? "Used" : "New"),
                        Mileage = (vehicle.Mileage > 1000 ? "Used" : "New"),
                        VINumber = vehicle.VINumber,
                        SalesPrice = vehicle.SalesPrice.ToString("C0"),
                        MSRPrice = vehicle.MSRPrice.ToString("C0"),
                        Sold = (vehicle.Sold ?? false),
                        Featured = (vehicle.Featured ?? false)
                    });
                }
            };

            return View("Inventory", vm);
        }

        [System.Web.Mvc.HttpPost, ActionName("SearchInventory")]
        [ValidateAntiForgeryToken]
        public ActionResult SearchInventory(SearchViewModel model)
        {
            if (ModelState.IsValid)
            {
                var searchType = model.SearchType;

                var vm = new InventoryViewModel()
                {
                    Vehicles = new List<VehicleViewModel>(),
                    SearchParms = SetupSearchParms()
                };

                vm.SearchParms.SearchType = model.SearchType;

                using (var db = new Models.GuildCarsEntities())
                {
                    var vehicles = new List<Vehicle>();
                    switch (searchType)
                    {
                            
                        case SearchTypeEnum.New:
                            vehicles = db.Vehicles.Where(v => v.Mileage <= 1000).ToList();
                            break;
                        case SearchTypeEnum.Used:
                            vehicles = db.Vehicles.Where(v => v.Mileage > 1000).ToList();
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
                            Status = (vehicle.Mileage > 1000 ? "Used" : "New"),
                            Mileage = (vehicle.Mileage > 1000 ? "Used" : "New"),
                            VINumber = vehicle.VINumber,
                            SalesPrice = vehicle.SalesPrice.ToString("C0"),
                            MSRPrice = vehicle.MSRPrice.ToString("C0"),
                            Sold = (vehicle.Sold ?? false),
                            Featured = (vehicle.Featured ?? false)
                        });
                    }
                };
                
                switch (searchType)
                {
                    case SearchTypeEnum.New:
                        return RedirectToAction("New", "Inventory", vm);
                       
                    case SearchTypeEnum.Used:
                        return RedirectToAction("Used", "Inventory", vm);
                   
                    default:
                        Console.WriteLine("Invalid selection. Please select 1, 2, or 3.");
                        break;
                }

                

            }

            return View(model);
        }


        [HttpGet, ActionName("Used")]
        public ActionResult UsedInventory()
        {
            ViewBag.Message = "Used Inventory";

            var vm = new InventoryViewModel()
            {
                Vehicles = new List<VehicleViewModel>(),
                SearchParms = SetupSearchParms()
            };

            using (var db = new Models.GuildCarsEntities())
            {
                var vehicles = db.Vehicles.Where(v => v.Mileage > 1000).ToList();
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
                        Status = (vehicle.Mileage > 1000 ? "Used" : "New"),
                        Mileage = (vehicle.Mileage > 1000 ? "Used" : "New"),
                        VINumber = vehicle.VINumber,
                        SalesPrice = vehicle.SalesPrice.ToString("C0"),
                        MSRPrice = vehicle.MSRPrice.ToString("C0"),
                        Sold = (vehicle.Sold ?? false),
                        Featured = (vehicle.Featured ?? false)
                    });
                }
            };

            return View("Inventory", vm);
        }

        private SearchViewModel SetupSearchParms()
        {
            var vm = new SearchViewModel {SearchArg = string.Empty};

            var yearsMin = new List<SelectListItem>();
            var pricesMin = new List<SelectListItem>();
            var yearsMax = new List<SelectListItem>();
            var pricesMax = new List<SelectListItem>();

            SelectListItem i1 = new SelectListItem()
            {
                Text = "No Min",
                Value = "1900"
            };
            yearsMin.Add(i1);

            SelectListItem i2 = new SelectListItem()
            {
                Text = "No Max",
                Value = "9999"
            };
            yearsMax.Add(i2);

            for (int i = 1990; i <= DateTime.Today.Year + 1; i++)
            {
                SelectListItem it = new SelectListItem()
                {
                    Text = i.ToString(),
                    Value = i.ToString()
                };
                yearsMin.Add(it);
                yearsMax.Add(it);
            }

            SelectListItem i3 = new SelectListItem()
            {
                Text = "No Min",
                Value = "0"
            };

            pricesMin.Add(i3);

            SelectListItem i4 = new SelectListItem()
            {
                Text = "No Max",
                Value = "999999999"
            };

            pricesMax.Add(i4);

            for (int i = 0; i < 100000; i = i + 10000)
            {
                SelectListItem it = new SelectListItem()
                {
                    Text = i.ToString(),
                    Value = i.ToString()
                };

                pricesMin.Add(it);
                pricesMax.Add(it);
            }

            vm.MinYears = new SelectList(yearsMin, "Value", "Text");
            vm.MaxYears = new SelectList(yearsMax, "Value", "Text"); ;
            vm.MinPrices = new SelectList(pricesMin, "Value", "Text");
            vm.MaxPrices = new SelectList(pricesMax, "Value", "Text");

            return vm;
        }

        //[System.Web.Mvc.HttpPost, ActionName("Used")]
        //public ActionResult UsedInventory(SearchViewModel model)
        //{
        //    ViewBag.Message = "Used vehicles";
        //    if (ModelState.IsValid)
        //    {
        //        var vm = new InventoryViewModel()
        //        {
        //            Vehicles = new List<VehicleViewModel>(),
        //            SearchParms = SetupSearchParms()
        //        };

        //        using (var db = new Models.GuildCarsEntities())
        //        {
        //            var vehicles = db.Vehicles.Where(v => v.Mileage <= 1000).ToList();
        //            foreach (Vehicle vehicle in vehicles)
        //            {
        //                vm.Vehicles.Add(new VehicleViewModel()
        //                {
        //                    VehicleID = vehicle.VehicleID,
        //                    YearMakeModel = $"{vehicle.Year} {vehicle.MakeModel.MakeName} {vehicle.MakeModel.ModelName}",
        //                    BodyStyle = vehicle.BodyStyle.BodyStyle1,
        //                    TransmissionType = vehicle.TransmissionType.TransmissionType1,
        //                    InteriorColor = vehicle.InteriorColor.InteriorColor1,
        //                    ExteriorColor = vehicle.ExteriorColor.ExteriorColor1,
        //                    Status = (vehicle.Mileage > 1000 ? "Used" : "New"),
        //                    Mileage = (vehicle.Mileage > 1000 ? "Used" : "New"),
        //                    VINumber = vehicle.VINumber,
        //                    SalesPrice = vehicle.SalesPrice.ToString("C0"),
        //                    MSRPrice = vehicle.MSRPrice.ToString("C0"),
        //                    Sold = (vehicle.Sold ?? false),
        //                    Featured = (vehicle.Featured ?? false)
        //                });

        //            }
        //        };
        //        var frmName = model.SearchArg;
        //        return RedirectToAction("Used", "Inventory");

        //    }

        //    return View(model);
        //}
    }
}
