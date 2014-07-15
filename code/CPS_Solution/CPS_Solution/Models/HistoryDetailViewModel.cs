using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CPS_Solution.EntityFramework;

namespace CPS_Solution.Models
{
    public class HistoryDetailViewModel
    {
        public IEnumerable<ProductAttribute> ProductAttributes { get; set; }
        public History History { get; set; }

    }
}
