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
        public int CpuId { get; set; }
        public List<AttributeDictionary> listOfCPU { get; set; }
        public int RamId { get; set; }
        public List<AttributeDictionary> listOfRAM { get; set; }
        public int HddId { get; set; }
        public List<AttributeDictionary> listOfHdd { get; set; }
        public int VgaId { get; set; }
        public List<AttributeDictionary> listOfVga { get; set; }
        public int DisplayId { get; set; }
        public List<AttributeDictionary> listOfDisplay { get; set; }
    }
}