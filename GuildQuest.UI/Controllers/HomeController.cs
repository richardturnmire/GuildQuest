﻿using GuildQuest.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Formatting;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace GuildQuest.UI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var vm = new MainPageViewModel();
           
            using (var db = new Models.GuildCarsEntities())
            {
                var vehicles = db.Vehicles.Where(v => v.Featured == true);
                vm.Featured = new List<VehicleViewModel>();
                foreach (Vehicle vehicle in vehicles)
                {
                    vm.Specials = db.Specials.ToList();
                    vm.Featured.Add(new VehicleViewModel()
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

            return View(vm);
        }

        public ActionResult Specials()
        {
            ViewBag.Message = "Specials";

            var vm = new List<Special>();
            using (var db = new Models.GuildCarsEntities())
            {
                vm = db.Specials.ToList();
            };

            return View(vm);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        [System.Web.Mvc.HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            var vm = new ContactViewModel();
            return View(vm);
        }
       
        [System.Web.Mvc.HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel model)
        {
            if (ModelState.IsValid)
            {
                using (var db = new Models.GuildCarsEntities())
                {
                    var contact = new Contact()
                    {
                        ContactEmail = model.Email,
                        ContactMessage = model.Message,
                        ContactName = model.Name,
                        ContactPhone = model.Phone,
                        ContactSubject = model.Subject
                    };
                    db.Contacts.Add(contact);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }

            return View(model);
        }
    }
}