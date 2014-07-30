using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CPS_Solution.Areas.Admin.Models
{
    public class ConfigurationModel
    {
        public int LimitRequestPerDay { get; set; }
        public double TotalPoint { get; set; }
        public string ParseTime{ get; set; }
        public string UpdateTimePrice { get; set; }
        public int TimeoutTime { get; set; }
    }
}