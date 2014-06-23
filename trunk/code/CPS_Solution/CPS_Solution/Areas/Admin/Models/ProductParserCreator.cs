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
        public string ProductName { get; set; }

        public string Username { get; set; }

        public DateTime Recommendtime { get; set; }

        public bool IsActive { get; set; }

        public string RecommendProductId { get; set; }
    }
}