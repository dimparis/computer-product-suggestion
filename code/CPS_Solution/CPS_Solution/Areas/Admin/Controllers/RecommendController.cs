using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
using CPS_Solution.Areas.Admin.Models;
using CPS_Solution.Areas.Admin.Helpers;
using System.Threading.Tasks;
namespace CPS_Solution.Areas.Admin.Controllers
{
    public class RecommendController : Controller
    {
        //
        // GET: /Admin/Recommend/
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        public ActionResult Index()
        {
            var recommendProduct = context.RecommendProducts.Where(x => x.IsApprove == false);

            return View(recommendProduct);
        }
        public RedirectToRouteResult LoadWebProduct(int id)
        {
            var ParseProductLink = context.RecommendProducts.Where(x => x.ID == id).Select(x => x.Parselink).FirstOrDefault().ToString();
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
            var productInfo = new ParseInfo
            {
                Name = model.ProductNameXpath,
                Parselink = model.ParseProductLink,
                CPUXPath = model.CPUXpath,
                DisplayXPath = model.DisplayXpath,
                HDDXPath = model.HDDXpath,
                RAMXPath = model.RAMXpath,
                VGAXPath = model.VGAXpath,
                IsActive = true,

            };
            context.ParseInfoes.Add(productInfo);
            context.SaveChanges();
            Task.Factory.StartNew(() => ParserHelper.ParseProductData(model));
            int  rcmId= Int32.Parse(model.RecommendProductId);
            var recommendProduct = context.RecommendProducts.Where(x => x.ID == rcmId).FirstOrDefault();
            recommendProduct.IsApprove = true;
            context.SaveChanges();

            TempData["createbyRecommendProduct"] = "success";
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
                    recommendProduct.IsApprove = true;
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
    }
}
