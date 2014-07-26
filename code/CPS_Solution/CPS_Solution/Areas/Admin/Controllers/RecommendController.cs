using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
using CPS_Solution.Areas.Admin.Models;
using CPS_Solution.Areas.Admin.Helpers;
using System.Threading.Tasks;
using CPS_Solution.CommonClass;
using HtmlAgilityPack;
namespace CPS_Solution.Areas.Admin.Controllers
{
    public class RecommendController : Controller
    {
        //
        // GET: /Admin/Recommend/
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        public ActionResult Index()
        {
            var recommendProduct = context.RecommendProducts.Where(x => x.IsApprove == null && x.IsTrue == false);

            return View(recommendProduct);
        }
        public RedirectToRouteResult LoadWebProduct(int id)
        {
            var ParseProductLink = context.RecommendProducts.Where(x => x.ID == id).Select(x => x.Parselink).FirstOrDefault().ToString();
            HtmlNode.ElementsFlags.Remove("form");
            ParserHelper.LoadWebProduct(ParseProductLink);
            TempData["existed"] = "false";
            var uri = new Uri(ParseProductLink);
            string host = uri.GetLeftPart(UriPartial.Authority);
            var parseInfo = context.ParseInfoes.FirstOrDefault(info => info.Parselink.Contains(host));
            if (parseInfo != null)
            {
                TempData["existed"] = "true";
                TempData["parseInfo"] = parseInfo;
            }

            TempData["link"] = ParseProductLink;
            TempData["idRecommendProduct"] = id;
            return RedirectToAction("CreateProductParser");
        }
        [HttpPost, ValidateInput(false)]
        public RedirectToRouteResult CreateProductParser(ProductParserCreator model)
        {

            var uri = new Uri(model.ParseProductLink);
            string host = uri.GetLeftPart(UriPartial.Authority);
            var parseInfo = context.ParseInfoes.FirstOrDefault(info => info.Parselink.Contains(host));
            if (parseInfo == null)
            {
                var productInfo = new ParseInfo
                    {
                        Name = model.ProductNameXpath,
                        PriceXPath = model.PriceXpath,
                        ImageXpath = model.ImageXpath,
                        Parselink = model.ParseProductLink,
                        CPUXPath = model.CPUXpath,
                        DisplayXPath = model.DisplayXpath,
                        HDDXPath = model.HDDXpath,
                        RAMXPath = model.RAMXpath,
                        VGAXPath = model.VGAXpath,
                        IsActive = true,

                    };
                //Create parser if not exist
                context.ParseInfoes.Add(productInfo);
                context.SaveChanges();
            }
            else
            {
                //If exist Update Parser
                parseInfo.Name = model.ProductNameXpath;
                parseInfo.PriceXPath = model.PriceXpath;
                parseInfo.ImageXpath = model.ImageXpath;
                parseInfo.Parselink = model.ParseProductLink;
                parseInfo.CPUXPath = model.CPUXpath;
                parseInfo.DisplayXPath = model.DisplayXpath;
                parseInfo.HDDXPath = model.HDDXpath;
                parseInfo.RAMXPath = model.RAMXpath;
                parseInfo.VGAXPath = model.VGAXpath;
                parseInfo.IsActive = true;
                context.SaveChanges();
            }
            Task.Factory.StartNew(() => ParserHelper.ParseProductData(model));
            int rcmId = Int32.Parse(model.RecommendProductId);
            var recommendProduct = context.RecommendProducts.Where(x => x.ID == rcmId).FirstOrDefault();
            recommendProduct.IsApprove = true;
            context.SaveChanges();

            TempData["createbyRecommendProduct"] = "success";

            System.Threading.Thread.Sleep(5000);

            return RedirectToAction("Index");
        }
        public ActionResult CreateProductParser()
        {
            return View();
        }
        [HttpPost, ActionName("setStatus")]
        public JsonResult setStatus(string[] idList)
        {
            bool check = false;
            string message = "";
            try
            {
                foreach (string id in idList)
                {
                    int i = Int32.Parse(id);
                    var recommendProduct = context.RecommendProducts.Where(x => x.ID == i).FirstOrDefault();
                    recommendProduct.IsApprove = false;
                }
                context.SaveChanges();
                check = true;
                message = "Success";
                TempData["updateStatus"] = message;
                return Json(check, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                check = false;
                message = "Failed";
                TempData["updateStatus"] = message;
                return Json(check, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost, ActionName("setStatusAuto")]
        public JsonResult setStatusAuto(string[] idListAuto)
        {
            bool check = false;
            string message = "";
            try
            {
                foreach (string id in idListAuto)
                {
                    int i = Int32.Parse(id);
                    var recommendProduct = context.RecommendProducts.Where(x => x.ID == i).FirstOrDefault();
                    recommendProduct.IsApprove = null;
                    recommendProduct.IsTrue = true;
                }
                context.SaveChanges();
                check = true;
                message = "Success";
                TempData["updateStatus"] = message;
                return Json(check, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                check = false;
                message = "Failed";
                TempData["updateStatus"] = message;
                return Json(check, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult ConfirmTrueLink()
        {
            var recommends = context.RecommendProducts.Where(x => x.IsApprove == null && x.IsTrue == false).ToList();
            return View(recommends);
        }
        [HttpPost]
        public ActionResult SetIsTrue(int id)
        {
            var recommend = context.RecommendProducts.FirstOrDefault(x => x.ID == id && x.IsApprove == null);
            if (ModelState.IsValid)
            {
                recommend.IsTrue = true;
                TempData["SetIsTrue"] = "success";
                context.SaveChanges();
            }
            // Display the confirmation message
            var results = new RecommendProduct
            {
                IsTrue = true
            };
            return Json(results);
        }
        [HttpPost]
        public ActionResult SetIsFalse(int id)
        {
            var recommend = context.RecommendProducts.FirstOrDefault(x => x.ID == id && x.IsApprove == null);
            if (ModelState.IsValid)
            {
                recommend.IsApprove = false;
                TempData["SetIsFalse"] = "success";
                context.SaveChanges();
            }
            // Display the confirmation message
            var results = new RecommendProduct
            {
                IsApprove = false
            };
            return Json(results);
        }

        [HttpPost]
        public RedirectToRouteResult ParseRecommend()
        {
            var parseInfoes = context.ParseInfoes.Where(x => x.IsActive == true).OrderBy(x => x.Parselink).ToList();
            var rcmdProduct = context.RecommendProducts.Where(x => x.IsApprove == null && x.IsTrue == true).OrderBy(x => x.Parselink).ToList();
            AutoParseJob job = new AutoParseJob();
            Task.Factory.StartNew(() => job.DoTask(rcmdProduct, parseInfoes));
            return RedirectToAction("Index");
        }
        [HttpPost]
        public PartialViewResult LoadPreview(string parseLink,string name,string price,string hdd, string vga,string ram,string cpu,string display, string image)
        {
            var model = new ProductParserCreator
            {
                ParseProductLink = parseLink,
                ProductNameXpath = name,
                PriceXpath = price,
                ImageXpath = image,
                HDDXpath =hdd,
                VGAXpath = vga,
                CPUXpath = cpu,
                RAMXpath =ram,
                DisplayXpath = display
            };

            ProductData data = new ProductData();
            try
            {            // Create Firefox browser
                var web = new HtmlWeb { UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:26.0) Gecko/20100101 Firefox/26.0" };
                //do more to get data
                var uri = new Uri(model.ParseProductLink);
                string host = uri.GetLeftPart(UriPartial.Authority);
                //load page
                System.Net.ServicePointManager.Expect100Continue = false;
                HtmlNode.ElementsFlags.Remove("form");
                var doc = web.Load(model.ParseProductLink);

                data = ParserHelper.MatchingProductDataPreview(host, doc, model.ProductNameXpath, model.PriceXpath, model.ImageXpath, model.CPUXpath, model.VGAXpath, model.HDDXpath, model.RAMXpath, model.DisplayXpath);
                
                return PartialView(data);
            }
            catch (System.Net.WebException ex)
            {
                LoadPreview(parseLink, name, price, hdd, vga, ram, cpu, display, image);
            }
            catch (HtmlWebException ex)
            {
                LoadPreview(parseLink, name, price, hdd, vga, ram, cpu, display, image);
            }
            return PartialView();
        }
    }
}
