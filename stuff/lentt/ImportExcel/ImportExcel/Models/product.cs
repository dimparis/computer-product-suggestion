//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ImportExcel.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class product
    {
        public product()
        {
            this.aliases = new HashSet<alias>();
        }
    
        public int id { get; set; }
        public string ten { get; set; }
        public Nullable<int> trongso { get; set; }
        public string loai { get; set; }
    
        public virtual ICollection<alias> aliases { get; set; }
    }
}
