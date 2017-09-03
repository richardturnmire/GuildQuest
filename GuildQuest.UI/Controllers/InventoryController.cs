using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
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
        public ActionResult NewInventory()
        {
            ViewBag.Message = "New Inventory";

            var vm = new List<VehicleViewModel>();
            using (var db = new Models.GuildCarsEntities())
            {
                var vehicles = db.Vehicles.Where(v => v.Mileage <= 1000).ToList();
                foreach (Vehicle vehicle in vehicles)
                {
                    vm.Add(new VehicleViewModel()
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

        [HttpGet, ActionName("Used")]
        public ActionResult UsedInventory()
        {
            ViewBag.Message = "Used Inventory";

            var vm = new List<VehicleViewModel>();
            using (var db = new Models.GuildCarsEntities())
            {
                var vehicles = db.Vehicles.Where(v => v.Mileage > 1000).ToList();
                foreach (Vehicle vehicle in vehicles)
                {
                    vm.Add(new VehicleViewModel()
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

    }
}
