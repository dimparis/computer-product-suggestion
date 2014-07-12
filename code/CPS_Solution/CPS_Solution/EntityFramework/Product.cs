//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Product
    {
        public Product()
        {
            this.AliasProducts = new HashSet<AliasProduct>();
            this.HistoryDetails = new HashSet<HistoryDetail>();
            this.ProductAttributes = new HashSet<ProductAttribute>();
            this.RatingProducts = new HashSet<RatingProduct>();
        }
    
        public int ID { get; set; }
        public string Description { get; set; }
        public string ImageURL { get; set; }
        public double TotalWeightPoint { get; set; }
        public bool IsActive { get; set; }
    
        public virtual ICollection<AliasProduct> AliasProducts { get; set; }
        public virtual ICollection<HistoryDetail> HistoryDetails { get; set; }
        public virtual ICollection<ProductAttribute> ProductAttributes { get; set; }
        public virtual ICollection<RatingProduct> RatingProducts { get; set; }
    }
}
