﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace GuildQuest.Data.EF
{
    public partial class GuildCarsEntities : DbContext
    {
        public GuildCarsEntities()
            : base("name=GuildCarsEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<BodyStyle> BodyStyles { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<ExteriorColor> ExteriorColors { get; set; }
        public virtual DbSet<InteriorColor> InteriorColors { get; set; }
        public virtual DbSet<Make> Makes { get; set; }
        public virtual DbSet<MakeModel> MakeModels { get; set; }
        public virtual DbSet<Model> Models { get; set; }
        public virtual DbSet<PurchaseType> PurchaseTypes { get; set; }
        public virtual DbSet<Sale> Sales { get; set; }
        public virtual DbSet<Special> Specials { get; set; }
        public virtual DbSet<State> States { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TransmissionType> TransmissionTypes { get; set; }
        public virtual DbSet<Vehicle> Vehicles { get; set; }
    }
}
