using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CPS_Solution.AdminAreas.Models
{
    public class LogInfo
    {
        public string Link { get; set; }
        public int TotalItems { get; set; }
        public int ElapsedTime { get; set; }
        public int ToDatabase { get; set; }
    }
}