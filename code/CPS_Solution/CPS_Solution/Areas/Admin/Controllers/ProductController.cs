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
using HtmlAgilityPack;
using System.Net;
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
            // Load Store list
            var stores = context.Stores.Where(x => x.IsActive == true)
                .OrderBy(x => x.StoreName)
                .ToList();
            var storeList = new List<SelectListItem>();
            foreach (var s in stores)
            {
                var item = new SelectListItem
                {
                    Text = s.StoreName,
                    Value = s.ID.ToString()
                };
                storeList.Add(item);
            }
            var itemAll = new SelectListItem
            {
                Text = "Tất cả",
                Value = "1000",
                Selected = true
            };
            storeList.Add(itemAll);
            ViewBag.storeList = storeList;
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

            // Load Store
            var Stores = context.Stores.OrderBy(x => x.StoreName).ToList();
            var StoreList = new List<SelectListItem>();
            foreach (var store in Stores)
            {
                var item = new SelectListItem
                {
                    Text = store.StoreName,
                    Value = store.ID.ToString()
                };
                StoreList.Add(item);
            }
            ViewBag.StoreList = StoreList;

            // Load Brand
            var Brands = context.Brands.OrderBy(x => x.BrandName).ToList();
            var BrandList = new List<SelectListItem>();
            foreach (var brand in Brands)
            {
                var item = new SelectListItem
                {
                    Text = brand.BrandName,
                    Value = brand.ID.ToString()
                };
                BrandList.Add(item);
            }
            ViewBag.BrandList = BrandList;

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
                    fileName = DateTime.Now.ToString("yyyyMMdd-HHmmss") + fileName;
                    var path = Path.Combine(Server.MapPath("~/Images/StoreLogo/"), fileName);
                    file.SaveAs(path);
                    model.ImageURL = "Images/StoreLogo/" + fileName;
                }
            }
            //Add item product
            var product = new Product
            {
                Price = model.Price,
                IsActive = true,
                ImageURL = model.ImageURL,
                URL = model.Parselink,
                Description = model.Description,
                TotalWeightPoint = 0,
            };
            product.AliasProducts.Add(new AliasProduct() { Name = model.Name, IsMain = true, IsActive = true, Price = model.Price, URL = model.Parselink, UpdateTime = DateTime.Now, StoreID = model.StoreId, BrandID = model.BrandId });
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
                   IsActive = true
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


            //Lấy tên phụ sản phẩm
            var listAlias = context.AliasProducts.Where(x => x.ProductID == id && x.IsMain == false && x.IsActive== true).ToList();
            ViewBag.listAlias = listAlias;
            var completeAlias = new List<SelectListItem>();
            foreach (var a in listAlias)
            {
                var item = new SelectListItem
                {
                    Text = a.Name,
                    Value = a.ID.ToString()
                };
                completeAlias.Add(item);
            }
            ViewBag.completeAlias = completeAlias;

            // Lấy store 
            var listStore = context.Stores.ToList();

            ViewBag.listStore = listStore;
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
        public RedirectToRouteResult UpdatePrice(string StoreList)
        {
            int id = Int32.Parse(StoreList);
            var store = context.Stores.Where(x => x.ID == id && x.IsActive ==true).FirstOrDefault();
            if (id != 1000 && store !=null)
            {
                // Auto Parser Product
                var parseInfoes = context.ParseInfoes.Where(x => x.IsActive == true && x.Parselink.Contains(store.StoreUrl)).ToList();
                var aliasproduct = context.AliasProducts.Where(x => x.IsActive == true && x.URL.Contains(store.StoreUrl)).ToList();
                AutoUpdatePrice job = new AutoUpdatePrice();
                Task.Factory.StartNew(() => job.AutoUpdatePriceTask(aliasproduct, parseInfoes));
            }
            else
            {
                // Auto Parser Product
                var parseInfoes = context.ParseInfoes.Where(x => x.IsActive == true).OrderBy(x => x.Parselink).ToList();
                var aliasproduct = context.AliasProducts.Where(x => x.IsActive == true).ToList();
                AutoUpdatePrice job = new AutoUpdatePrice();
                Task.Factory.StartNew(() => job.AutoUpdatePriceTask(aliasproduct, parseInfoes));
            }
            return RedirectToAction("Index");
        }
        public ActionResult TakeSummary()
        {
            ShowInfoRepository show = new ShowInfoRepository();
            ShowInfo info = show.GetNewInfo();
            return PartialView(info);
        }
        public JsonResult GetNotifyForAdmin(string username)
        {
            ShowInfoRepository show = new ShowInfoRepository();
            ShowInfo info = show.GetNewInfo();
            if (info != null)
            {
                return Json(info, JsonRequestBehavior.AllowGet);
            }
            return Json("NoneData", JsonRequestBehavior.AllowGet);
        }

        // tạo mới 1 alias
        public string CreateNewAlias(string newAliasname)
        {
            String[] info = newAliasname.ToString().Split('|');

            string aliasName = info[0].Trim();
            string url = info[1].Trim();
            string price = info[2].Trim();
            string storeid = info[3];
            string brandid = info[4];
            string lapid = info[5];

            if (IsUrl(url) == false)
            {
                return "NotUrl";
            }
            else
            {
                AliasProduct ali = new AliasProduct();
                ali.ProductID = Convert.ToInt32(lapid);
                ali.Name = aliasName;
                ali.URL = url;
                ali.Price = Convert.ToDouble(price);
                ali.StoreID = Convert.ToInt32(storeid);
                ali.BrandID = Convert.ToInt32(brandid);
                ali.UpdateTime = DateTime.Now;
                ali.IsMain = false;
                ali.IsActive = true;
                context.AliasProducts.Add(ali);
                context.SaveChanges();
                TempData["CreateNewAlias"] = "success";
                return "";
            }
        }

        // update 1 alias
        public string UpdateNewAlias(string newAliasname)
        {
            String[] info = newAliasname.ToString().Split('|');

            string aliasName = info[0].Trim();
            string url = info[1].Trim();
            string price = info[2].Trim();
            string storeid = info[3];
            int id = Convert.ToInt32(info[4]);

            if (IsUrl(url) == false)
            {
                return "NotUrl";
            }
            else
            {
                var ali = context.AliasProducts.Where(x => x.ID == id).FirstOrDefault();
                ali.Name = aliasName;
                ali.URL = url;
                ali.Price = Convert.ToDouble(price);
                ali.StoreID = Convert.ToInt32(storeid);
                ali.UpdateTime = DateTime.Now;
                context.SaveChanges();
                TempData["UpdateNewAlias"] = "success";
                return "";
            }
        }

        public ActionResult loadPopupAjac(string idN)
        {
            int id = Convert.ToInt32(idN);
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


            //Lấy tên phụ sản phẩm
            var listAlias = context.AliasProducts.Where(x => x.ProductID == id && x.IsMain == false).ToList();
            ViewBag.listAlias = listAlias;
            var completeAlias = new List<SelectListItem>();
            foreach (var a in listAlias)
            {
                var item = new SelectListItem
                {
                    Text = a.Name,
                    Value = a.ID.ToString()
                };
                completeAlias.Add(item);
            }
            ViewBag.completeAlias = completeAlias;

            // Lấy store 
            var listStore = context.Stores.ToList();

            ViewBag.listStore = listStore;
            return View(product);
        }

        /// <summary>
        /// Kiểm tra url có tồn tại không.
        /// </summary>
        /// <param name="URL"></param>
        /// <returns></returns>
        #region Kiểm tra url  có tồn tại không.
        bool IsUrl(string URL)
        {
            //Load website
            try
            {
                var web = new HtmlWeb { UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:26.0) Gecko/20100101 Firefox/26.0" };
                var document = web.Load(URL);
                if (web.StatusCode == HttpStatusCode.OK)
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            return false;
            //HttpWebResponse response = null;
            //if (URL.Equals(""))
            //{
            //    return false;
            //}
            //var request = (HttpWebRequest)WebRequest.Create(URL);
            //request.Method = "HEAD";         
            //try
            //{               
            //    response = (HttpWebResponse)request.GetResponse();
            //    return true;
            //}
            //catch (WebException ex)
            //{
            //    /* A WebException will be thrown if the status of the response is not `200 OK` */
            //    return false;
            //}
            //finally
            //{
            //    // Don't forget to close your response.
            //    if (response != null)
            //    {
            //        response.Close();
            //    }
            //}
        }
        #endregion
    }
}
