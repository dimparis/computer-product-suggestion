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
    
    public partial class HistoryDetail
    {
        public int ID { get; set; }
        public int HistoryID { get; set; }
        public int ProductID { get; set; }
    
        public virtual History History { get; set; }
        public virtual Product Product { get; set; }
    }
}
