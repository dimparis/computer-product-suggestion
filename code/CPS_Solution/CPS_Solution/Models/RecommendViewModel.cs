using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CPS_Solution.Models
{
    public class RecommendViewModel
    {
        [Display(Name = "Email address")]
        [Required(ErrorMessage = "Email không được trống")]
        [EmailAddress(ErrorMessage = "Email không hợp lệ")]
        public string Email { get; set; }
        public string ParseLink { get; set; }
    }
}