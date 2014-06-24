using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace CPS_Solution.Areas.Admin.Models
{
    public class ParseCreator
    {
        [Display(Name = "Link cần lấy")]
        public string ParseAttributelink { get; set; }

        [Display(Name = "Tên sản phẩm")]
        public string ProductNameXpath { get; set; }

        [Display(Name = "Điểm sản phẩm")]
        public string ProductPointXpath { get; set; }

        [Display(Name = "Phân trang")]
        public string PagingXpath { get; set; }

        public string CodetypeId { get; set; }
    }
}