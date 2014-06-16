using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CPS_Solution.Areas.Admin.Models
{
    public class ProductParserCreator
    {
        [Display(Name = "Link cần lấy")]
        public string ParseProductLink { get; set; }

        [Display(Name = "Tên sản phẩm")]
        public string ProductNameXpath { get; set; }

        public string CPUXpath { get; set; }

        public string HDDXpath { get; set; }

        public string VGAXpath { get; set; }

        public string DisplayXpath { get; set; }

        public string RAMXpath { get; set; } 

        public string RecommendProductId { get; set; }
    }
}