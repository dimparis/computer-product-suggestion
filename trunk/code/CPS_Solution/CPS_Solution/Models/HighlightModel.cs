using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.EntityFramework;
using CPS_Solution.CommonClass;
namespace CPS_Solution.Models
{
    public class HighlightModel
    {
        public List<Product> mostbyTotalPointProducts { get; set; }
        public List<Product> mostbyRatingProducts { get; set; }
        public List<Product> mostbyCompareProducts { get; set; }
        public List<Product> mostbyViewProducts { get; set; }
        public List<Product> mostbyNewProducts { get; set; }
    }
}
