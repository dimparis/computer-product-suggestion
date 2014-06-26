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
            // Load CPU list
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
            ViewBag.cpuList = cpuList;

            // Load VGA list
            var vgas = context.AttributeDictionaries.Where(x => x.CodetypeID == "V")
                .OrderBy(x => x.Name)
                .ToList();
            var vgaList = new List<SelectListItem>();
            foreach (var vga in vgas)
            {
                var item = new SelectListItem
                {
                    Text = vga.Name,
                    Value = vga.ID.ToString()
                };
                vgaList.Add(item);
            }
            ViewBag.vgaList = vgaList;

            // Load HDD list
            var hdds = context.AttributeDictionaries.Where(x => x.CodetypeID == "H")
                .OrderBy(x => x.Name)
                .ToList();
            var hddList = new List<SelectListItem>();
            foreach (var hdd in hdds)
            {
                var item = new SelectListItem
                {
                    Text = hdd.Name,
                    Value = hdd.ID.ToString()
                };
                hddList.Add(item);
            }
            ViewBag.hddList = hddList;


            // Load Ram list
            var rams = context.AttributeDictionaries.Where(x => x.CodetypeID == "R")
                .OrderBy(x => x.Name)
                .ToList();
            var ramList = new List<SelectListItem>();
            foreach (var ram in rams)
            {
                var item = new SelectListItem
                {
                    Text = ram.Name,
                    Value = ram.ID.ToString()
                };
                ramList.Add(item);
            }
            ViewBag.ramList = ramList;

            // Load Display list
            var displays = context.AttributeDictionaries.Where(x => x.CodetypeID == "D")
                .OrderBy(x => x.Name)
                .ToList();
            var displayList = new List<SelectListItem>();
            foreach (var display in displays)
            {
                var item = new SelectListItem
                {
                    Text = display.Name,
                    Value = display.ID.ToString()
                };
                displayList.Add(item);
            }
            ViewBag.displayList = displayList;



            return View("CreateProductTest");
        }
        [HttpPost]
        public RedirectToRouteResult CreateProductTest(ProductCreateAttribute model) 
        {
            //Add item product
            var product = new Product
            {
                Name = "AK TEST HERE",
                Price = 1,
                IsActive = true,
                URL = "http test",
                TotalWeightPoint = 0,
            };
            context.Products.Add(product);
            context.SaveChanges();
            //Add item product Attribute
            var idList  =new List<int>() ;
            idList.Add(model.CpuId);
            idList.Add(model.RamId);
            idList.Add(model.HddId);
            idList.Add(model.DisplayId);
            idList.Add(model.VgaId);

            foreach (int id in idList) 
            {
                var productAtt = new ProductAttribute
               {
                   ProductID = product.ID,
                   AttributeID = id
               };
                context.ProductAttributes.Add(productAtt);
            }
            // Take list of point
            double total = 0;
            var attList= new List<AttributeDictionary>();
            foreach (int id in idList)
            {
                var attributes = context.AttributeDictionaries.Where(x=>x.ID == id).ToList(); 
                attList.AddRange(attributes);
            }
            foreach (var att in attList)
            {
                total += att.WeightCriteraPoint;
            }
            // Add total point
            var pro = context.Products.Where(x => x.ID == product.ID).FirstOrDefault();
            pro.TotalWeightPoint = total;
            TempData["create"] = "Success";
            context.SaveChanges();         
            // TO DO HERE 
           return RedirectToAction("Index");
        }

    }
}
