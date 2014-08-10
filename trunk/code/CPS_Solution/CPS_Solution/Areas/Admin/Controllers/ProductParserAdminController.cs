using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
using CPS_Solution.CommonClass;
using CPS_Solution.Areas.Admin.Helpers;
using HtmlAgilityPack;
using CPS_Solution.Areas.Admin.Models;
using System.Threading.Tasks;
namespace CPS_Solution.Areas.Admin.Controllers
{
    [MyAuthorize(Roles = "staff")]
    public class ProductParserAdminController : Controller
    {
        //
        // GET: /Admin/ProductParserAdmin/
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        public ActionResult Index()
        {
            var parseInfoes = context.ParseInfoes.OrderBy(x => x.Parselink).ToList();

            return View(parseInfoes);
        }
        [HttpPost]
        public RedirectToRouteResult LoadWebProduct(string ParseProductLink)
        {
            HtmlNode.ElementsFlags.Remove("form");
            ParserHelper.LoadWebProduct(ParseProductLink);
            TempData["link"] = ParseProductLink;
            return RedirectToAction("CreateProductParserAdmin");
        }
        [HttpPost]
        public RedirectToRouteResult LoadWebProductEdit(string Parselink)
        {
            HtmlNode.ElementsFlags.Remove("form");
            ParserHelper.LoadWebProduct(Parselink);
            TempData["link"] = Parselink;
            return RedirectToAction("CreateProductParserAdmin");
        }
        public ActionResult CreateProductParserAdmin()
        {
            return View("~/Areas/Admin/Views/ProductParserAdmin/CreateProductParserAdmin.cshtml");
        }
        [HttpPost]
        public RedirectToRouteResult CreateProductParserAdmin(ProductParserCreator model)
        {
            var parser = new ParseInfo
            {
                Name = model.ProductNameXpath,
                PriceXPath = model.PriceXpath,
                ImageXpath = model.ImageXpath,
                Parselink = model.ParseProductLink,
                CPUXPath = model.CPUXpath,
                VGAXPath = model.VGAXpath,
                HDDXPath = model.HDDXpath,
                DisplayXPath = model.DisplayXpath,
                RAMXPath = model.RAMXpath
            };
            context.ParseInfoes.Add(parser);
            context.SaveChanges();
            TempData["create"] = "Success";
            return RedirectToAction("Index");
        }
        public ActionResult EditProductParserAdmin(int id)
        {
            var parser = context.ParseInfoes.FirstOrDefault(p => p.ID == id);
            if (parser != null)
            {
                ParserHelper.LoadWebProduct(parser.Parselink);
                TempData["link"] = parser.Parselink;
            }
            return View(parser);
        }
        [HttpPost]
        public RedirectToRouteResult EditProductParserAdmin(ParseInfo model)
        {
            var parser = context.ParseInfoes.FirstOrDefault(p => p.ID == model.ID);
            string message = "";
            if (parser != null)
            {
                parser.Name = model.Name;
                parser.PriceXPath = model.PriceXPath;
                parser.ImageXpath = model.ImageXpath;
                parser.Parselink = model.Parselink;
                parser.CPUXPath = model.CPUXPath;
                parser.VGAXPath = model.VGAXPath;
                parser.HDDXPath = model.HDDXPath;
                parser.DisplayXPath = model.DisplayXPath;
                parser.RAMXPath = model.RAMXPath;
                parser.Parselink = model.Parselink;
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

        protected override void Dispose(bool disposing)
        {
            context.Dispose();
            base.Dispose(disposing);
        }
        [HttpPost]
        public ActionResult SetActive(int id)
        {
            var parser = context.ParseInfoes.FirstOrDefault(x => x.ID == id);
            bool statusFlag = false;
            if (ModelState.IsValid)
            {
                if (parser.IsActive)
                {
                    parser.IsActive = false;
                    statusFlag = false;
                }
                else
                {
                    parser.IsActive = true;
                    statusFlag = true;
                }
                context.SaveChanges();
            }

            // Display the confirmation message
            var results = new ParseInfo
            {
                IsActive = statusFlag
            };
            return Json(results);
        }
    }
}
