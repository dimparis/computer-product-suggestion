using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CPS_Solution.Areas.Admin.Models
{
    public class Attribute
    {
        public int AttributeId { get; set; }
        public string Name { get; set; }
        public int WeightCriteriaPoint { get; set; }
    }
}