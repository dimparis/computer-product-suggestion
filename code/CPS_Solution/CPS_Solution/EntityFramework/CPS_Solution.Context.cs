﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CPS_Solution.EntityFramework
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CPS_SolutionEntities : DbContext
    {
        public CPS_SolutionEntities()
            : base("name=CPS_SolutionEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Account> Accounts { get; set; }
        public DbSet<AliasProduct> AliasProducts { get; set; }
        public DbSet<Brand> Brands { get; set; }
        public DbSet<Codetype> Codetypes { get; set; }
        public DbSet<Dictionary> Dictionaries { get; set; }
        public DbSet<Hardware> Hardwares { get; set; }
        public DbSet<History> Histories { get; set; }
        public DbSet<HistoryDetail> HistoryDetails { get; set; }
        public DbSet<LogFile> LogFiles { get; set; }
        public DbSet<ParseAttribute> ParseAttributes { get; set; }
        public DbSet<ParseInfo> ParseInfoes { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductAttribute> ProductAttributes { get; set; }
        public DbSet<RatingProduct> RatingProducts { get; set; }
        public DbSet<RecommendProduct> RecommendProducts { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Store> Stores { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
    }
}
