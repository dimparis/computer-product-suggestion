using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CPS_Solution.Areas.Admin.Models
{
    public class HardwareConfirm
    {
        public int IdHardware { get; set; }
        public string CodetypeHardware { get; set; }
        public string NameHardware { get; set; }
        public double WeightHardware { get; set; }
        public bool IsActive {get;set;}
        public int IdProduct { get; set; }
        public string NameProduct { get; set; }
    }
}