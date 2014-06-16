using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
using CPS_Solution.Areas.Admin.Models;
using CPS_Solution.Areas.Admin.Helpers;
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
            ParserHelper.LoadWeb(ParseProductLink);
            TempData["link"] = ParseProductLink;
            return RedirectToAction("CreateProductParser");
        }
        [HttpPost]
        public RedirectToRouteResult CreateProductParser(ProductParserCreator model)
        {
            var productInfo = new ParseInfo
            {
                Name = model.ProductNameXpath,
                Parselink = model.ParseProductLink,
                CPUXPath = model.CPUXpath,
                HDDXPath = model.HDDXpath,
                RAMXPath = model.RAMXpath,
                VGAXPath = model.VGAXpath,
                IsActive = "true",

            };
            context.ParseInfoes.Add(productInfo);
            context.SaveChanges();
            TempData["createProduct"] = "success";
            return RedirectToAction("Index");
        }
        public ActionResult CreateProductParser()
        {
            return View();
        }
    }
}
