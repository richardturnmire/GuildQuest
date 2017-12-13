using GuildQuest.UI.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using GuildQuest.Data.EF;
using GuildQuest.Data.Interfaces;
using GuildQuest.Data.Repositories;
using GuildQuest.UI.Helpers.Twilio;


namespace GuildQuest.UI.Controllers
{
    public class HomeController : Controller
    {
        private IRepository repository = null;

        public HomeController()
        {
            this.repository = new EfRepository();
        }

        public HomeController(IRepository repository)
        {
            this.repository = repository;
        }
        public ActionResult Index()
        {
            var vm = new MainPageViewModel();
           
           
                var vehicles = repository.GetFeaturedVehicles();
                    
                vm.Featured = new List<VehicleViewModel>();
                foreach (Vehicle vehicle in vehicles)
                {
                    vm.Specials = repository.GetSpecials().ToList();
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
                        Sold = vehicle.Sold,
                        Featured = vehicle.Featured
                    });
                }
          

            return View(vm);
        }

        public ActionResult Specials()
        {
            ViewBag.Message = "Specials";

            return View(repository.GetSpecials().ToList());
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
                
                    var contact = new Contact()
                    {
                        ContactEmail = model.Email,
                        ContactMessage = model.Message,
                        ContactName = model.Name,
                        ContactPhone = model.Phone,
                        ContactSubject = model.Subject
                    };
                
                    repository.AddContact(contact);
                    
                    var ts = new TwilioRestClient.RestClient();
                    var tt = ts.SendMessage(model.Phone, model.Subject);
                    var tu = tt.Result;
               

                return RedirectToAction("Index");
            }

            return View(model);
        }
    }
}