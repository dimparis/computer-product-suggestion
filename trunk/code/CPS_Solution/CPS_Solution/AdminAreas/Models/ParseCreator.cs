﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace CPS_Solution.AdminAreas.Models
{
    public class ParseCreator
    {
        [Display(Name = "Link cần lấy")]
        public string ParseLink { get; set; }

        [Display(Name = "Tên sản phẩm")]
        public string ProductNameXpath { get; set; }

        [Display(Name = "Phân trang")]
        public string PagingXpath { get; set; }

        public int CodetypeId { get; set; }
    }
}