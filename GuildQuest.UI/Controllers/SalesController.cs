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
    public class SalesController : Controller
    {
        private GuildCarsEntities db = new GuildCarsEntities();

        // GET: Sales
        public ActionResult Index()
        {
            ViewBag.Message = "Sales";

            var vm = new InventoryViewModel()
            {
                Vehicles = new List<VehicleViewModel>(),
                SearchParms = new SearchViewModel()
            };

            vm.SearchParms.SearchType = SearchTypeEnum.Undefined;
            ViewBag.SearchType = vm.SearchParms.SearchType;

            using (var db = new Models.GuildCarsEntities())
            {
                
                foreach (Vehicle vehicle in db.Vehicles)
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

            return View("Index", vm);
        }
        // GET: Sales/Purchase
        [HttpGet]
        [ActionName("Purchase")]
        public ActionResult Purchase(int? id)
        {
            
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.Source = "Purchase";
           

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
            
        ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1");
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1");
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1");
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName");
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1");
            ViewBag.MakeId = new SelectList(db.Makes.OrderBy(d => d.Make_Name), "MakeId", "Make_Name");
            ViewBag.ModelId = new SelectList(db.MakeModels.Take(1), "ModelId", "ModelName");
            ViewBag.StateId = new SelectList(db.States, "StateId", "Name");
            ViewBag.PurchaseTypeId = new SelectList(db.PurchaseTypes, "PurchaseTypeId", "Description");

            return View(ivm);
        }

        // POST: Admin/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ActionName("Purchase")]
        public ActionResult Add([Bind(Include = "VehicleID,MakeId,ModelId,BodyStyleID,TransmissionTypeID,InteriorColorID,ExteriorColorID,Mileage,VINumber,SalesPrice,MSRPrice,Sold,Featured,Year,Description,FileUpload")] VehicleViewModel vehicle)
        {
            if (ModelState.IsValid)
            {
                var tVehicle = new Vehicle()
                {
                    BodyStyleID = vehicle.BodyStyleID,
                    Description = vehicle.Description,
                    ExteriorColorID = vehicle.ExteriorColorID,
                    InteriorColorID = vehicle.InteriorColorID,
                    Mileage = int.Parse(vehicle.Mileage),
                    MakeModelID = db.MakeModels.FirstOrDefault(m => m.MakeID == vehicle.MakeId && m.ModelID == vehicle.ModelId).MakeModelID,
                    MSRPrice = Decimal.Parse(vehicle.MSRPrice),
                    SalesPrice = Decimal.Parse(vehicle.SalesPrice),
                    TransmissionTypeID = vehicle.TransmissionTypeID,
                    VINumber = vehicle.VINumber,
                    Year = vehicle.Year,
                    Sold = false,
                    Featured = false,
                    Type = 0
                };

                db.Vehicles.Add(tVehicle);
                db.SaveChanges();

                return RedirectToAction("Vehicles");
            }

            ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1");
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1");
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1");
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName");
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1");
            ViewBag.MakeId = new SelectList(db.Makes.OrderBy(d => d.Make_Name), "MakeId", "Make_Name");
            ViewBag.ModelId = new SelectList(db.MakeModels.Take(1), "ModelId", "ModelName");

            return View(vehicle);
        }

        // GET: Sales/Details/5
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
            return View(vehicle);
        }

        // GET: Sales/Create
        public ActionResult Create()
        {
            ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1");
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1");
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1");
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName");
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1");
            return View();
        }

        // POST: Sales/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "VehicleID,MakeModelID,BodyStyleID,TransmissionTypeID,InteriorColorID,ExteriorColorID,Mileage,VINumber,SalesPrice,MSRPrice,Sold,Featured,Year,Description,Type")] Vehicle vehicle)
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

        // GET: Sales/Edit/5
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

        // POST: Sales/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "VehicleID,MakeModelID,BodyStyleID,TransmissionTypeID,InteriorColorID,ExteriorColorID,Mileage,VINumber,SalesPrice,MSRPrice,Sold,Featured,Year,Description,Type")] Vehicle vehicle)
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

        // GET: Sales/Delete/5
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

        // POST: Sales/Delete/5
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
    }
}
