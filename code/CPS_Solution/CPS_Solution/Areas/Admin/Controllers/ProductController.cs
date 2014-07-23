using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
using CPS_Solution.Areas.Admin.Models;
using System.IO;
using CPS_Solution.CommonClass;
using System.Threading.Tasks;
namespace CPS_Solution.Areas.Admin.Controllers
{
    [Authorize(Roles = "staff")]
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
                if (product.IsActive.HasValue)
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
            var cpus = context.Hardwares.Where(x => x.CodetypeID == "C")
                .OrderBy(x => x.Name)
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
            var vgas = context.Hardwares.Where(x => x.CodetypeID == "V")
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
            var hdds = context.Hardwares.Where(x => x.CodetypeID == "H")
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
            var rams = context.Hardwares.Where(x => x.CodetypeID == "R")
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
            var displays = context.Hardwares.Where(x => x.CodetypeID == "D")
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
            if (Request.Files.Count > 0)
            {
                var file = Request.Files[0];

                if (file != null && file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images/"), fileName);
                    file.SaveAs(path);
                    model.ImageURL = path;
                }
            }
            //Add item product
            var product = new Product
            {
                Price = model.Price,
                IsActive = true,
                URL = model.Parselink,
                Description = model.Description,
                TotalWeightPoint = 0,
            };
            product.AliasProducts.Add(new AliasProduct() { Name = model.Name, IsMain = true });
            context.Products.Add(product);
            context.SaveChanges();
            //Add item product Attribute
            var idList = new List<int>();

            int cpuId = model.CpuId;
            int hddId = model.HddId;
            int vgaId = model.VgaId;
            int ramId = model.RamId;
            int displayId = model.DisplayId;
            idList.Add(cpuId);
            idList.Add(hddId);
            idList.Add(ramId);
            idList.Add(displayId);
            idList.Add(vgaId);

            foreach (var item in idList)
            {
                var productAtt = new ProductAttribute
               {
                   ProductID = product.ID,
                   AttributeID = item,       
               };
                context.ProductAttributes.Add(productAtt);
            }
            // Take list of point
            double total = 0;
            var attList = new List<Hardware>();
            foreach (var item in idList)
            {
                var attributes = context.Hardwares.Where(x => x.ID == item).ToList();
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

        public ActionResult EditProduct(int id) 
        {
            var product = context.Products.Where(x => x.ID == id).FirstOrDefault();
            TempData["id"] = id;

            // Load CPU list
            var cpus = context.Hardwares.Where(x => x.CodetypeID == "C")
                .OrderBy(x => x.Name)
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
            var vgas = context.Hardwares.Where(x => x.CodetypeID == "V")
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
            var hdds = context.Hardwares.Where(x => x.CodetypeID == "H")
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
            var rams = context.Hardwares.Where(x => x.CodetypeID == "R")
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
            var displays = context.Hardwares.Where(x => x.CodetypeID == "D")
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

            string name = product.Name;

            return View(product);

        }

        [HttpPost]
        public RedirectToRouteResult EditProduct(Product model)
        {
            var product = context.Products.Where(x => x.ID == model.ID).FirstOrDefault();
            string message = "";
            if (product != null) 
            {
                product.Description = model.Description;
                product.URL = model.URL;
                product.Price = model.Price;
                //product.ImageURL = model.ImageURL;
                var listOfAttribute = new List<int>();
                listOfAttribute.Add(model.CpuID);
                listOfAttribute.Add(model.HddID);
                listOfAttribute.Add(model.RamID);
                listOfAttribute.Add(model.VgaID);
                listOfAttribute.Add(model.DisplayID);

                var atts = context.ProductAttributes.Where(x => x.ProductID == model.ID).ToList();
                foreach (var att in atts) 
                {
                    foreach (var item in listOfAttribute) 
                    {
                        att.AttributeID = item;
                        context.SaveChanges();
                        listOfAttribute.Remove(item);
                        break;
                    }
  
                    continue;
                }
               
                context.SaveChanges();
                message = "success";
            }
            else
            {
                message = "failed";
            }
            TempData["edit"] = message;
            return RedirectToAction("Index");
        }
        [HttpPost]
        public RedirectToRouteResult UpdatePrice() 
        {
            // Auto Parser Product
            var parseInfoes = context.ParseInfoes.Where(x => x.IsActive == true).OrderBy(x => x.Parselink).ToList();
            var aliasproduct = context.AliasProducts.Where(x => x.IsActive == true).ToList();
            AutoUpdatePrice job = new AutoUpdatePrice();
            Task.Factory.StartNew(() => job.AutoUpdatePriceTask(aliasproduct, parseInfoes));
            return RedirectToAction("Index");
        }
    }
}
