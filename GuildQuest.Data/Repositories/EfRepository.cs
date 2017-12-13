using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using GuildQuest.Data.EF;
using GuildQuest.Data.Helpers.Enums;
using GuildQuest.Data.Interfaces;

namespace GuildQuest.Data.Repositories
{
    public class EfRepository : IRepository
    {
        private GuildCarsEntities db = null;
 
        public EfRepository()
        {
            this.db = new GuildCarsEntities();
        }
 
        public EfRepository(GuildCarsEntities db)
        {
            this.db = db;
        }
       
        public IQueryable GetModelsforMakeId(int makeid)
        {
            return db.MakeModels.Where(d => d.MakeID == makeid).OrderBy(d => d.ModelName)
                       .Select(r => new { value = r.ModelID, text = r.ModelName });
        }

        public IQueryable<Vehicle> GetAllVehicles()
        {
            return db.Vehicles;
        }

        public Vehicle GetVehicleById(int? id)
        {
            return db.Vehicles.Find(id);
        }

        public void AddVehicle(Vehicle vehicle)
        {
            db.Vehicles.Add(vehicle);
            db.SaveChanges();
        }
        
        public IEnumerable<BodyStyle> GetBodyStyles()
        {
            return db.BodyStyles;
        }
        
        public IEnumerable<ExteriorColor> GetExteriorColors()
        {
            return db.ExteriorColors;
        }
        public IEnumerable<InteriorColor> GetInteriorColors()
        {
            return db.InteriorColors;
        }
        public IEnumerable<MakeModel> GetMakeModels()
        {
            return db.MakeModels.ToList();
        } 
        public IEnumerable<TransmissionType> GetTransmissionTypes()
        {
            return db.TransmissionTypes;
        }
        public IEnumerable<Make> GetMakes()
        {
            return db.Makes;
        }
        public IEnumerable<Special> GetSpecials()
        {
            return db.Specials;
        }
        public IEnumerable<State> GetStates()
        {
            return db.States;
        }
        public IEnumerable<PurchaseType> GetPurchaseTypes()
        {
            return db.PurchaseTypes;
        }
        public void RemoveVehicle(int? id)
        {
            Vehicle vehicle = db.Vehicles.Find(id);
            if (vehicle != null)
            {
                db.Vehicles.Remove(vehicle);
                db.SaveChanges();
            }
        }
        public void EditVehicle(Vehicle vehicle)
        {
            db.Entry(vehicle).State = EntityState.Modified;
            db.SaveChanges();
        }
        public IEnumerable<Vehicle> GetNewInventory()
        {
            return db.Vehicles.Where(v => v.Type == (short)VehicleType.New);
        }
        public IEnumerable<Vehicle> GetUsedInventory()
        {
            return db.Vehicles.Where(v => v.Type == (short)VehicleType.Used);
        }
        public IEnumerable<Vehicle> SearchUsedInventoryByYearPriceModel(int minYear, int maxYear, decimal minPrice, decimal maxPrice, string searchArg)
        {
            var checkMakeModel = !String.IsNullOrWhiteSpace(searchArg);
           
                if (checkMakeModel)
                {return db.Vehicles
                            .Include("MakeModel")
                        .Where(v => v.Type == (short)VehicleType.Used)
                        .Where(v => (v.Year >= minYear && v.Year <= maxYear))
                        .Where(v => v.SalesPrice >= minPrice && v.SalesPrice <= maxPrice)
                        .Where(v => v.MakeModel.MakeName.ToLower().Contains(searchArg) || v.MakeModel.ModelName.ToLower().Contains(searchArg));
                                   
                }
            else
                {
                    return db.Vehicles
                        .Where(v => v.Type == (short)VehicleType.Used)
                        .Where(v => (v.Year >= minYear && v.Year <= maxYear))
                        .Where(v => v.SalesPrice >= minPrice && v.SalesPrice <= maxPrice);
                }
            
        }
        public IEnumerable<Vehicle> SearchNewInventoryByYearPriceModel(int minYear, int maxYear, decimal minPrice, decimal maxPrice, string searchArg)
        {
            var checkMakeModel = !String.IsNullOrWhiteSpace(searchArg);
           
            if (checkMakeModel)
            {return db.Vehicles
                .Include("MakeModel")
                .Where(v => v.Type == (short)VehicleType.New)
                .Where(v => (v.Year >= minYear && v.Year <= maxYear))
                .Where(v => v.SalesPrice >= minPrice && v.SalesPrice <= maxPrice)
                .Where(v => v.MakeModel.MakeName.ToLower().Contains(searchArg) || v.MakeModel.ModelName.ToLower().Contains(searchArg));
                                   
            }
            else
            {
                return db.Vehicles
                    .Where(v => v.Type == (short)VehicleType.New)
                    .Where(v => (v.Year >= minYear && v.Year <= maxYear))
                    .Where(v => v.SalesPrice >= minPrice && v.SalesPrice <= maxPrice);
            }
            
        }
        public IEnumerable<Vehicle> SearchAllInventoryByYearPriceModel(int minYear, int maxYear, decimal minPrice, decimal maxPrice, string searchArg)
        {
            var checkMakeModel = !String.IsNullOrWhiteSpace(searchArg);
           
            if (checkMakeModel)
            {return db.Vehicles
                .Include("MakeModel")
                .Where(v => (v.Year >= minYear && v.Year <= maxYear))
                .Where(v => v.SalesPrice >= minPrice && v.SalesPrice <= maxPrice)
                .Where(v => v.MakeModel.MakeName.ToLower().Contains(searchArg) || v.MakeModel.ModelName.ToLower().Contains(searchArg));
                                   
            }
            else
            {
                return db.Vehicles
                   .Where(v => (v.Year >= minYear && v.Year <= maxYear))
                    .Where(v => v.SalesPrice >= minPrice && v.SalesPrice <= maxPrice);
            }
            
        }
        public IEnumerable<Vehicle> GetFeaturedVehicles()
        {
            return db.Vehicles.Where(v => v.Featured == true);
        }
        public void AddContact(Contact contact)
        {
            db.Contacts.Add(contact);
            db.SaveChanges();
        }
        public void AddSale(Sale sale)
        {
            db.Sales.Add(sale);
            db.SaveChanges();
        }
    }
}
