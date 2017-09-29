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
    public class AdminController : Controller
    {
        private GuildCarsEntities db = new GuildCarsEntities();

        // GET: Admin
        [ActionName("Vehicles")]
        public ActionResult Index()
        {
            ViewBag.Message = "Admin";
            ViewBag.Source = "Admin";

            var vm = new InventoryViewModel()
            {
                Vehicles = new List<VehicleViewModel>(),
               SearchParms = new SearchViewModel()
            };
            
            vm.SearchParms.SearchType = SearchTypeEnum.New;

            using (var db = new Models.GuildCarsEntities())
            {
                var vehicles = db.Vehicles;
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
                        Sold = vehicle.Sold ,
                        Featured = vehicle.Featured 
                    });
                }
            };

            return View("Vehicles", vm);
        }

        // GET: Admin/Details/5
        [ActionName("Details")]
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

        // GET: Admin/Create
        [ActionName("AddVehicle")]
        public ActionResult Add()
        {
            ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1");
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1");
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1");
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName");
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1");
            ViewBag.MakeId = new SelectList(db.Makes.OrderBy(d => d.Make_Name), "MakeId", "Make_Name");

            return View(new VehicleViewModel());
        }

        // POST: Admin/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ActionName("AddVehicle")]
        public ActionResult Add([Bind(Include = "VehicleID,MakeModelID,BodyStyleID,TransmissionTypeID,InteriorColorID,ExteriorColorID,Mileage,VINumber,SalesPrice,MSRPrice,Sold,Featured,Year,Description")] VehicleViewModel vehicle)
        {
            if (ModelState.IsValid)
            {
               // db.Vehicles.Add(vehicle);
                db.SaveChanges();
                return RedirectToAction("Admin");
            }

            ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1" );
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1" );
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1" );
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName" );
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1" );
            ViewBag.MakeId = new SelectList(db.Makes.OrderBy(d => d.Make_Name), "MakeId", "Make_Name" );
            // ViewBag.ModelId = new SelectList(db.MakeModels.Where(d => d.MakeID == vehicle.MakeModel.MakeID).OrderBy(d => d.ModelName), "ModelId", "ModelName", vehicle.MakeModel.ModelID); return View(vehicle);
            return View();
        }

        // GET: Admin/Edit/5
        [ActionName("EditVehicle")]
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
            var vm = new VehicleViewModel()
            {
                VehicleID = vehicle.VehicleID,
                YearMakeModel = $"{vehicle.Year} {vehicle.MakeModel.MakeName} {vehicle.MakeModel.ModelName}",
                BodyStyle = vehicle.BodyStyle.BodyStyle1,
                TransmissionType = vehicle.TransmissionType.TransmissionType1,
                InteriorColor = vehicle.InteriorColor.InteriorColor1,
                ExteriorColor = vehicle.ExteriorColor.ExteriorColor1,
                Status = (vehicle.Mileage > 1000 ? "Used" : "New"),
                Mileage = vehicle.Mileage.ToString(),
                VINumber = vehicle.VINumber,
                SalesPrice = vehicle.SalesPrice.ToString("C0"),
                MSRPrice = vehicle.MSRPrice.ToString("C0"),
                Sold = vehicle.Sold,
                Featured = vehicle.Featured,
                Year = vehicle.Year,

                MakeModelId = vehicle.MakeModelID,
                BodyStyleID = vehicle.BodyStyleID,
                TransmissionTypeID = vehicle.TransmissionTypeID,
                InteriorColorID = vehicle.InteriorColorID,
                ExteriorColorID = vehicle.ExteriorColorID
            };

            ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1", vehicle.BodyStyleID);
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1", vehicle.ExteriorColorID);
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1", vehicle.InteriorColorID);
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName", vehicle.MakeModelID);
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1", vehicle.TransmissionTypeID);
            ViewBag.MakeId = new SelectList(db.Makes.OrderBy(d=>d.Make_Name), "MakeId", "Make_Name", vehicle.MakeModel.MakeID);
            ViewBag.ModelId = new SelectList(db.MakeModels.Where(d => d.MakeID == vehicle.MakeModel.MakeID).OrderBy(d=>d.ModelName), "ModelId", "ModelName", vehicle.MakeModel.ModelID);
            return View(vm);
        }

        // POST: Admin/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ActionName("EditVehicle")]
        public ActionResult Edit([Bind(Include = "VehicleID,MakeModelID,BodyStyleID,TransmissionTypeID,InteriorColorID,ExteriorColorID,Mileage,VINumber,SalesPrice,MSRPrice,Sold,Featured,Year,Description")] Vehicle vehicle)
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

        // GET: Admin/Delete/5
        [ActionName("DeleteVehicle")]
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

        // POST: Admin/Delete/5
        [HttpPost, ActionName("DeleteVehicle")]
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
