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
using System.IO;
using ImageProcessor.Imaging.Formats;
using System.Drawing;
using ImageProcessor;

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

            vm.SearchParms.SearchType = SearchTypeEnum.Undefined;
            ViewBag.SearchType = vm.SearchParms.SearchType;

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
                        Status = (vehicle.Type == (short)VehicleType.Used ? "Used" : "New"),
                        Mileage = vehicle.Mileage.ToString("###,###"),
                        VINumber = vehicle.VINumber,
                        SalesPrice = vehicle.SalesPrice.ToString("C0"),
                        MSRPrice = vehicle.MSRPrice.ToString("C0"),
                        Sold = vehicle.Sold,
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
        [HttpGet]
        [ActionName("AddVehicle")]
        public ActionResult Add()
        {
            ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1");
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1");
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1");
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName");
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1");
            ViewBag.MakeId = new SelectList(db.Makes.OrderBy(d => d.Make_Name), "MakeId", "Make_Name");
            ViewBag.ModelId = new SelectList(db.MakeModels.Take(1), "ModelId", "ModelName");

            var vm = new VehicleViewModel()
            {
                MakeId = -1,
                ModelId = -1,
                MakeModelId = -1,
                BodyStyleID = -1,
                TransmissionTypeID = -1,
                InteriorColorID = -1,
                ExteriorColorID = -1
            };

            return View(vm);
        }

        // POST: Admin/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ActionName("AddVehicle")]
        public ActionResult Add([Bind(Include = "VehicleID,MakeId,ModelId,BodyStyleID,TransmissionTypeID,InteriorColorID,ExteriorColorID,Mileage,VINumber,SalesPrice,MSRPrice,Sold,Featured,Year,Description,FileUpload")] VehicleViewModel vehicle)
        {
            if (ModelState.IsValid)
            {
                if (vehicle.FileUpload.ContentLength > 0)
                {
                    var path = Path.Combine(Server.MapPath("~/Content/Images"), vehicle.VINumber + ".jpg");

                    // Format is automatically detected though can be changed.
                    ISupportedImageFormat format = new JpegFormat { Quality = 70 };
                    Size size = new Size(540, 360);
                    using (Stream inStream = vehicle.FileUpload.InputStream)
                    {
                        // Initialize the ImageFactory using the overload to preserve EXIF metadata.
                        using (ImageFactory imageFactory = new ImageFactory(preserveExifData: true))
                        {
                            // Load, resize, set the format and quality and save an image.
                            imageFactory.Load(inStream)
                                       .Resize(size)
                                       .GaussianSharpen(10)
                                       .Format(format)
                                       .Save(path);
                        }
                    }
                }

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
                Description = vehicle.Description,

                MakeModelId = vehicle.MakeModelID,
                MakeId = vehicle.MakeModel.MakeID,
                ModelId = vehicle.MakeModel.ModelID,
                BodyStyleID = vehicle.BodyStyleID,
                TransmissionTypeID = vehicle.TransmissionTypeID,
                InteriorColorID = vehicle.InteriorColorID,
                ExteriorColorID = vehicle.ExteriorColorID
            };

            ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1");
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1");
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1");
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName");
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1");
            ViewBag.MakeId = new SelectList(db.Makes.OrderBy(d => d.Make_Name), "MakeId", "Make_Name");
            ViewBag.ModelId = new SelectList(db.MakeModels.Where(d => d.MakeID == vm.MakeId), "ModelId", "ModelName");

            return View(vm);
        }

        // POST: Admin/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ActionName("EditVehicle")]
        public ActionResult Edit([Bind(Include = "VehicleID,MakeID,ModelID,BodyStyleID,TransmissionTypeID,InteriorColorID,ExteriorColorID,Mileage,VINumber,SalesPrice,MSRPrice,Sold,Featured,Year,Description")] VehicleViewModel vehicle)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vehicle).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1");
            ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1");
            ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1");
            ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName");
            ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1");
            ViewBag.MakeId = new SelectList(db.Makes.OrderBy(d => d.Make_Name), "MakeId", "Make_Name");
            ViewBag.ModelId = new SelectList(db.MakeModels.Where(d => d.MakeID == vehicle.MakeId), "ModelId", "ModelName");

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
