using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.EntityFramework;
namespace CPS_Solution.Areas.Admin.Models
{
    public class ProductCreateAttribute
    {
        public string Name { get; set; }
        public double Price { get; set; }
        public string ImageURL { get; set; }
        public string Parselink { get; set; }
        public string Description { get; set; }
        public int CpuId { get; set; }
        public int RamId { get; set; }
        public int HddId { get; set; }
        public int VgaId { get; set; }
        public int DisplayId { get; set; }
        public int BrandId { get; set; }
        public int StoreId { get; set; }
    }
}