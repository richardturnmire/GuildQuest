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
    public class SalesController : Controller
    {
        private IRepository repository = null;
        private GuildCarsEntities db = new GuildCarsEntities();
        public SalesController()
        {
            this.repository = new EfRepository();
        }

        public SalesController(IRepository repository)
        {
            this.repository = repository;
        }
        
        // GET: Sales
        public ActionResult Index()
        {
            ViewBag.Message = "Sales";

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
                        Status = (vehicle.Type == 0 ? "Used" : "New"),
                        Mileage = (vehicle.Type == 0 ? "Used" : "New"),
                        VINumber = vehicle.VINumber,
                        SalesPrice = vehicle.SalesPrice.ToString("C0"),
                        MSRPrice = vehicle.MSRPrice.ToString("C0"),
                        Sold = vehicle.Sold,
                        Featured = vehicle.Featured
                    });
                }
            

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
           

            Vehicle vehicle = repository.GetVehicleById(id);
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
                Description = vehicle.Description ?? "No Description",
                BodyStyleIDs = new SelectList(repository.GetBodyStyles(), "BodyStyleID", "BodyStyle1"),
                ExteriorColorIDs = new SelectList(repository.GetExteriorColors(), "ExteriorColorID", "ExteriorColor1"),
                InteriorColorIDs = new SelectList(repository.GetInteriorColors(), "InteriorColorID", "InteriorColor1"),
                MakeModelIDs = new SelectList(repository.GetMakeModels(), "MakeModelID", "MakeName"),
                TransmissionTypeIDs = new SelectList(repository.GetTransmissionTypes(), "TransmissionTypeID", "TransmissionType1"),
                MakeIds = new SelectList(repository.GetMakes(), "MakeId", "Make_Name"),
                ModelIds = new SelectList(repository.GetMakeModels().Take(1), "ModelId", "ModelName"),
                StateIds = new SelectList(repository.GetStates(), "StateId", "Name"),
                PurchaseTypeIds = new SelectList(repository.GetPurchaseTypes(), "PurchaseTypeId", "Description")
            });
            
             
            

            return View(ivm);
        }

        // POST: Admin/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        // [Bind(Include = "VehicleID,StateId,City,ZipCode,Street1,Street2,Email,Name,Phone,PurchasePrice,PurchaseTypeId")] 
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ActionName("Purchase")]
        public ActionResult Add(InventoryViewModel vm)
        {
            if (ModelState.IsValid)
            {
                var sInfo = vm.SaleInfo;
                var tSale = new Sale()
                {
                    StateId = sInfo.StateId,
                    City = sInfo.City,
                    ZipCode = sInfo.ZipCode,
                    Street1 = sInfo.Street1,
                    Street2 = sInfo.Street2,
                    Email = sInfo.Email,
                    VehicleId = sInfo.VehicleId,
                    Name = sInfo.Name,
                    Phone = sInfo.Phone,
                    PurchasePrice = sInfo.PurchasePrice,
                    PurchaseTypeId = sInfo.PurchaseTypeId
                };

                repository.AddSale(tSale);
               

                return RedirectToAction("Index");
            }

            //vm.BodyStyleIDs = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1");
            //ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1");
            //ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1");
            //ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName");
            //ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1");
            //ViewBag.MakeId = new SelectList(db.Makes.OrderBy(d => d.Make_Name), "MakeId", "Make_Name");
            //ViewBag.ModelId = new SelectList(db.MakeModels.Take(1), "ModelId", "ModelName");

            return View(vm);
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
            //ViewBag.BodyStyleID = new SelectList(db.BodyStyles, "BodyStyleID", "BodyStyle1");
            //ViewBag.ExteriorColorID = new SelectList(db.ExteriorColors, "ExteriorColorID", "ExteriorColor1");
            //ViewBag.InteriorColorID = new SelectList(db.InteriorColors, "InteriorColorID", "InteriorColor1");
            //ViewBag.MakeModelID = new SelectList(db.MakeModels, "MakeModelID", "MakeName");
            //ViewBag.TransmissionTypeID = new SelectList(db.TransmissionTypes, "TransmissionTypeID", "TransmissionType1");
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

    }
}
