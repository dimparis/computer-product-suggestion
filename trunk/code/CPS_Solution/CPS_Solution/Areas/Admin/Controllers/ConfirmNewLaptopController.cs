using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.Areas.Admin.Models;
using CPS_Solution.EntityFramework;
using System.IO;
using LinqToExcel;
using LinqToExcel.Query;
using CPS_Solution.Areas.Admin.Helpers;

namespace CPS_Solution.Areas.Admin.Controllers
{
    public class ConfirmNewLaptopController : Controller
    {
        //
        // GET: /Admin/ConfirmNewLaptop/
        CPS_SolutionEntities db = new CPS_SolutionEntities();
        public ActionResult Index()
        {
            List<Product> listproconfirm = ProductNotConfirm();
            ViewBag.listproconfirm = listproconfirm;
            return View();
        }
        public List<Product> ProductNotConfirm()
        {
            // lấy tất cả hardware có isactive là false
            var ProductNotConfirm = db.Products.Where(x => x.IsActive == false).ToList();                   
            return ProductNotConfirm;
        }
    }
}


