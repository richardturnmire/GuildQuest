using System.Collections.Generic;
using System.Linq;
using GuildQuest.Data.EF;

namespace GuildQuest.Data.Interfaces
{
    public interface IRepository
    {
        IQueryable GetModelsforMakeId(int makeid);
        IQueryable<Vehicle> GetAllVehicles();
        Vehicle GetVehicleById(int? id);
        void AddVehicle(Vehicle vehicle);
        void EditVehicle(Vehicle vehicle);
        void RemoveVehicle(int? id);
        void AddContact(Contact contact);
        void AddSale(Sale sale);
        
        IEnumerable<Vehicle> GetNewInventory();
        IEnumerable<Vehicle> GetUsedInventory();
        IEnumerable<Vehicle> GetFeaturedVehicles();
        
        IEnumerable<Vehicle> SearchUsedInventoryByYearPriceModel(int minYear, int maxYear, decimal minPrice, decimal maxPrice, string searchArg);
        IEnumerable<Vehicle> SearchNewInventoryByYearPriceModel(int minYear, int maxYear, decimal minPrice, decimal maxPrice, string searchArg);
        IEnumerable<Vehicle> SearchAllInventoryByYearPriceModel(int minYear, int maxYear, decimal minPrice, decimal maxPrice, string searchArg);
        
        IEnumerable<BodyStyle> GetBodyStyles();
        IEnumerable<ExteriorColor> GetExteriorColors();
        IEnumerable<InteriorColor> GetInteriorColors();
        IEnumerable<MakeModel> GetMakeModels(); 
        IEnumerable<TransmissionType> GetTransmissionTypes();
        IEnumerable<Make> GetMakes();
        IEnumerable<Special> GetSpecials();
        IEnumerable<State> GetStates();
        IEnumerable<PurchaseType> GetPurchaseTypes();
        
        
    }
}
