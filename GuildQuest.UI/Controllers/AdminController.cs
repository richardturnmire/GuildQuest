using GuildQuest.UI.Helpers.Enums;
using GuildQuest.UI.Models;
using ImageProcessor;
using ImageProcessor.Imaging.Formats;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using GuildQuest.Data.EF;
using GuildQuest.Data.Helpers.Enums;
using GuildQuest.Data.Interfaces;
using GuildQuest.Data.Repositories;

namespace GuildQuest.UI.Controllers
{
    public class AdminController : Controller
    {
        private IRepository repository = null;

        public AdminController()
        {
            this.repository = new EfRepository();
        }

        public AdminController(IRepository repository)
        {
            this.repository = repository;
        }

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

            vm.SearchParms.SearchType = VehicleTypeEnum.Undefined;
            ViewBag.SearchType = vm.SearchParms.SearchType;

            

            foreach (Vehicle vehicle in repository.GetAllVehicles())
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

             
            Vehicle vehicle = repository.GetVehicleById(id);
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
             

            var vm = new VehicleViewModel()
            {
                MakeId = -1,
                ModelId = -1,
                MakeModelId = -1,
                BodyStyleID = -1,
                TransmissionTypeID = -1,
                InteriorColorID = -1,
                ExteriorColorID = -1,
                BodyStyleIDs = new SelectList(repository.GetBodyStyles(), "BodyStyleID", "BodyStyle1"),
                ExteriorColorIDs = new SelectList(repository.GetExteriorColors(), "ExteriorColorID", "ExteriorColor1"),
                InteriorColorIDs = new SelectList(repository.GetInteriorColors(), "InteriorColorID", "InteriorColor1"),
                MakeModelIDs = new SelectList(repository.GetMakeModels(), "MakeModelID", "MakeName"),
                TransmissionTypeIDs = new SelectList(repository.GetTransmissionTypes(), "TransmissionTypeID", "TransmissionType1"),
                MakeIds = new SelectList(repository.GetMakes().OrderBy(d => d.Make_Name), "MakeId", "Make_Name"),
                ModelIds = new SelectList(repository.GetMakeModels().Take(1), "ModelId", "ModelName")
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
            

            vehicle.BodyStyleIDs = new SelectList(repository.GetBodyStyles(), "BodyStyleID", "BodyStyle1");
            vehicle.ExteriorColorIDs = new SelectList(repository.GetExteriorColors(), "ExteriorColorID", "ExteriorColor1");
            vehicle.InteriorColorIDs = new SelectList(repository.GetInteriorColors(), "InteriorColorID", "InteriorColor1");
            vehicle.MakeModelIDs = new SelectList(repository.GetMakeModels(), "MakeModelID", "MakeName");
            vehicle.TransmissionTypeIDs = new SelectList(repository.GetTransmissionTypes(), "TransmissionTypeID", "TransmissionType1");
            vehicle.MakeIds = new SelectList(repository.GetMakes(), "MakeId", "Make_Name");
            vehicle.ModelIds = new SelectList(repository.GetMakeModels().Take(1), "ModelId", "ModelName");

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

                    Year = vehicle.Year,
                    MakeModelID = vehicle.MakeModelId,
                    BodyStyleID = vehicle.BodyStyleID,
                    TransmissionTypeID = vehicle.TransmissionTypeID,
                    InteriorColorID = vehicle.InteriorColorID,
                    ExteriorColorID = vehicle.ExteriorColorID,
                    Mileage = int.Parse(vehicle.Mileage),
                    VINumber = vehicle.VINumber,
                    SalesPrice = decimal.Parse(vehicle.SalesPrice),
                    MSRPrice = decimal.Parse(vehicle.MSRPrice),
                    Sold = vehicle.Sold,
                    Featured = vehicle.Featured,
                    Description = vehicle.Description,
                    Type = 0
                };
                repository.AddVehicle(tVehicle);

                return RedirectToAction("Vehicles");
            }

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
            
            Vehicle vehicle = repository.GetVehicleById(id);
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
                ExteriorColorID = vehicle.ExteriorColorID,
                BodyStyleIDs = new SelectList(repository.GetBodyStyles(), "BodyStyleID", "BodyStyle1"),
                ExteriorColorIDs = new SelectList(repository.GetExteriorColors(), "ExteriorColorID", "ExteriorColor1"),
                InteriorColorIDs = new SelectList(repository.GetInteriorColors(), "InteriorColorID", "InteriorColor1"),
                MakeModelIDs = new SelectList(repository.GetMakeModels(), "MakeModelID", "MakeName"),
                TransmissionTypeIDs = new SelectList(repository.GetTransmissionTypes(), "TransmissionTypeID", "TransmissionType1"),
                MakeIds = new SelectList(repository.GetMakes().OrderBy(d => d.Make_Name), "MakeId", "Make_Name"),
                ModelIds = new SelectList(repository.GetMakeModels().Where(d => d.MakeID == vehicle.MakeModel.MakeID), "ModelId", "ModelName")
            };

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
                var tVehicle = new Vehicle()
                {

                    Year = vehicle.Year,
                    MakeModelID = vehicle.MakeModelId,
                    BodyStyleID = vehicle.BodyStyleID,
                    TransmissionTypeID = vehicle.TransmissionTypeID,
                    InteriorColorID = vehicle.InteriorColorID,
                    ExteriorColorID = vehicle.ExteriorColorID,
                    Mileage = int.Parse(vehicle.Mileage),
                    VINumber = vehicle.VINumber,
                    SalesPrice = decimal.Parse(vehicle.SalesPrice),
                    MSRPrice = decimal.Parse(vehicle.MSRPrice),
                    Sold = vehicle.Sold,
                    Featured = vehicle.Featured,
                    Description = vehicle.Description,
                    Type = 0
                };
                repository.EditVehicle(tVehicle);

                return RedirectToAction("Index");
            }



            vehicle.BodyStyleIDs = new SelectList(repository.GetBodyStyles(), "BodyStyleID", "BodyStyle1");
            vehicle.ExteriorColorIDs = new SelectList(repository.GetExteriorColors(), "ExteriorColorID", "ExteriorColor1");
            vehicle.InteriorColorIDs = new SelectList(repository.GetInteriorColors(), "InteriorColorID", "InteriorColor1");
            vehicle.MakeModelIDs = new SelectList(repository.GetMakeModels(), "MakeModelID", "MakeName");
            vehicle.TransmissionTypeIDs = new SelectList(repository.GetTransmissionTypes(), "TransmissionTypeID", "TransmissionType1");
            vehicle.MakeIds = new SelectList(repository.GetMakes().OrderBy(d => d.Make_Name), "MakeId", "Make_Name");
            vehicle.ModelIds = new SelectList(repository.GetMakeModels().Where(d => d.MakeID == vehicle.MakeId), "ModelId", "ModelName");

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
            
            Vehicle vehicle = repository.GetVehicleById(id);
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
           
            repository.RemoveVehicle(id);

            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}
