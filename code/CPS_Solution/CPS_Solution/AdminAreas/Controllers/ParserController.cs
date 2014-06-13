using CPS_Solution.CommonClass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using CPS_Solution.AdminAreas.Helpers;
using CPS_Solution.EntityFramework;
using CPS_Solution.AdminAreas.Models;
using System.Threading.Tasks;
namespace CPS_Solution.AdminAreas.Controllers
{
     [MyAuthorize(Roles = "staff")]
    public class ParserController : Controller
    {
         private CPS_SolutionEntities context = new CPS_SolutionEntities();
        //
        // GET: /Parser/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public RedirectToRouteResult LoadWeb(string parseLink)
        {
            ParserHelper.LoadWeb(parseLink);
            TempData["link"] = parseLink;
            return RedirectToAction("CreateParser");
        }
        public ActionResult CreateParser()
        {
            var codetypes = context.Codetypes
                .OrderBy(x => x.Name)
                .ToList();
            var codetypeList = new List<SelectListItem>();
            foreach (var codetype in codetypes)
            {
                var item = new SelectListItem
                {
                    Text = codetype.Name,
                    Value = codetype.ID.ToString()
                };
                codetypeList.Add(item);
            }

            ViewBag.Codetypes = codetypeList;
            return View();
        }
        [HttpPost]
        public RedirectToRouteResult CreateParser(ParseCreator model)
        {
            var parser = new ParseAttribute
            {
                CodetypeID = model.CodetypeId.ToString(),
                ParseAttributelink = model.ParseLink,
                NameXPath = model.ProductNameXpath,
                PagingXPath = model.PagingXpath,
                
                IsActive = true
            };
            context.ParseAttributes.Add(parser);
            context.SaveChanges();
            TempData["create"] = "Success";
            return RedirectToAction("Index");
        }
        public ActionResult EditParser(int id) 
        {
            var parser = context.ParseAttributes.FirstOrDefault(p =>p.ID==id);
            if (parser != null) 
            {
             var codetypes = context.Codetypes
             .OrderBy(x => x.Name)
             .ToList();
                var codetypeList = new List<SelectListItem>();
                foreach (var codetype in codetypes)
                {
                    var item = new SelectListItem
                    {
                        Text = codetype.Name,
                        Value = codetype.ID.ToString()
                    };
                    codetypeList.Add(item);
                }
                ViewBag.Codetypes = codetypeList;
                ParserHelper.LoadWeb(parser.ParseAttributelink);
                TempData["link"] = parser.ParseAttributelink;
            }
            return View(parser);
        }
        [HttpPost]
        public RedirectToRouteResult EditParser(ParseAttribute model) 
        {
            var parser = context.ParseAttributes.FirstOrDefault(p => p.ID == model.ID);
            string message = "";
            if (parser != null)
            {
                parser.NameXPath = model.NameXPath;
                parser.PagingXPath = model.PagingXPath;
                parser.ParseAttributelink = model.ParseAttributelink;
                parser.IsActive = model.IsActive;
                parser.CodetypeID = model.CodetypeID;

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
        public RedirectToRouteResult DeleteParser(int[] ids)
        {
            foreach (int id in ids)
            {
                var parser = context.ProductAttributes.FirstOrDefault(x => x.ID == id);
                if (parser != null)
                {
                    //parser.IsActive = false;
                }
            }
            context.SaveChanges();
            TempData["delete"] = "Done";
            return RedirectToAction("Index");
        }
        [HttpPost]
        public RedirectToRouteResult ParseData()
        {
            Task.Factory.StartNew(ParserHelper.ParseData);
            return RedirectToAction("Index");
        }
        protected override void Dispose(bool disposing)
        {
            context.Dispose();
            base.Dispose(disposing);
        }
        //[HttpPost]
        //public ActionResult SetActive(int id)
        //{
        //    var parser = context.ProductAttributes.FirstOrDefault(x => x.ID == id);
        //    bool statusFlag = false;
        //    if (ModelState.IsValid)
        //    {
        //        if (parser.IsActive = true)
        //        {
        //            parser.IsActive = false;
        //            statusFlag = false;
        //        }
        //        else
        //        {
        //            parser.IsActive = true;
        //            statusFlag = true;
        //        }
        //        context.SaveChanges();
        //    }

        //    // Display the confirmation message
        //    var results = new ParseInfo
        //    {
        //        IsActive = statusFlag
        //    };

        //    return Json(results);
        //}
    }
}
