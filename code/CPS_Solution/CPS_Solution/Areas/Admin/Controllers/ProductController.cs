using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
using CPS_Solution.Areas.Admin.Models;
namespace CPS_Solution.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        //
        // GET: /Admin/Product/
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        public ActionResult Index()
        {
            var product = context.Products.ToList();
            return View(product);
        }
        //[HttpPost, ActionName("setStatus")]
        //public JsonResult setStatus(string[] idList)
        //{
        //    bool check = false;
        //    string message = "";
        //    try
        //    {
        //        foreach (string id in idList)
        //        {
        //            int i = Int32.Parse(id);
        //            var recommendProduct = context.RecommendProducts.Where(x => x.ID == i).FirstOrDefault();
        //            recommendProduct.IsApprove = true;
        //        }
        //        context.SaveChanges();
        //        check = true;
        //        message = "Success";
        //        TempData["updateStatus"] = message;
        //        return Json(check, JsonRequestBehavior.AllowGet);
        //    }
        //    catch
        //    {
        //        check = false;
        //        message = "Failed";
        //        TempData["updateStatus"] = message;
        //        return Json(check, JsonRequestBehavior.AllowGet);
        //    }
        //}
        
        [HttpPost]
        public ActionResult SetActive(int id)
        {
            var product = context.Products.FirstOrDefault(x => x.ID == id);
            bool statusFlag = false;
            if (ModelState.IsValid)
            {
                if (product.IsActive)
                {
                    product.IsActive = false;
                    statusFlag = false;
                }
                else
                {
                    product.IsActive = true;
                    statusFlag = true;
                }
                context.SaveChanges();
            }

            // Display the confirmation message
            var results = new Product
            {
                IsActive = statusFlag
            };
            return Json(results);
        }
        public ActionResult CreateProductTest() 
        {
            var cpus = context.AttributeDictionaries.Where(x=>x.CodetypeID == "C")
                .OrderBy(x=>x.Name)
                .ToList();
            var cpuList = new List<SelectListItem>();
            foreach (var cpu in cpus) 
            {
                var item = new SelectListItem
                {
                    Text = cpu.Name,
                    Value = cpu.ID.ToString()
                };
                cpuList.Add(item);
            }
            return View("CreateProductTest");
        }
        [HttpPost]
        public RedirectToRouteResult CreateProductTest(ProductCreateAttribute model) 
        {
            // TO DO HERE 
           return RedirectToAction("Index");
        }

    }
}
