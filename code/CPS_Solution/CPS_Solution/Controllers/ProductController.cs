﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
using System.Net;
using HtmlAgilityPack;
using System.IO;
using CPS_Solution.Models;
namespace CPS_Solution.Controllers
{
    public class ProductController : Controller
    {
        private CPS_SolutionEntities db = new CPS_SolutionEntities();
        private string title = "";
        //
        // GET: /Product/

        public ActionResult Index()
        {
            DataManager manager = new DataManager();
            int BlockSize = 4;
            var products = manager.GetProducts(1, BlockSize);
            return View(products);
        }
        public ActionResult SearchForProduct()
        {
            DataManager manager = new DataManager();
            int BlockSize = 4;
            var products = manager.GetProducts(1, BlockSize);
            return View(products);
        }
        [HttpPost]
        public ActionResult SearchForProduct(string productName)
        {
            DataManager manager = new DataManager();
            int BlockSize = 4;
            var products = manager.GetProducts(1, BlockSize);
            var listP = new List<Product>();
            if (!String.IsNullOrEmpty(productName))
            {
                foreach (var p in products)
                {
                    if (p.Name.ToUpper().Contains(productName.ToUpper()))
                    {
                        listP.Add(p);
                    }
                }
                return View(listP); ;

            }
            return View(listP);
        }

        public ActionResult Compare(int p1, int p2, int p3)
        {
            int[] vals = new int[] { p1, p2, p3 };

            var products = from p in db.Products
                           select p;
            products = products.Where(c => vals.Contains(c.ID));

            var bestProducts = products.OrderByDescending(p => p.TotalWeightPoint).ToList();

            //Move down the first
            var temp = bestProducts[0];
            bestProducts[0] = bestProducts[1];
            bestProducts[1] = temp;

            return View(bestProducts);
        }

        public ActionResult CompareDetail(int p1, int p2, int p3)
        {
            int[] vals = new int[] { p1, p2, p3 };

            var products = from p in db.Products
                           select p;
            products = products.Where(c => vals.Contains(c.ID));

            var bestProducts = products.OrderByDescending(p => p.TotalWeightPoint).ToList();

            //Move down the first
            var temp = bestProducts[0];
            bestProducts[0] = bestProducts[1];
            bestProducts[1] = temp;

            return View(products);
        }

        //
        // GET: /Product/Details/{ID}
        public ActionResult Details(int id)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
             product.AliasProducts = db.AliasProducts.Where(x => x.IsActive == true && x.IsMain == false).ToList();
            // lấy point Rating của product
            double point = 0;
            double allpoint = 0;
            var Allrating = db.RatingProducts.Where(x => x.ProductID.Equals(id)).ToList();
            if (Allrating.Count == 0)
            {
                point = 0;
            }
            else
            {
               foreach(RatingProduct r in Allrating){
                   allpoint += r.Point;
               }
               point = allpoint / Allrating.Count;
            }
            string name = User.Identity.Name;
             double pointLogint =0;
             if (name != "")
             {
                 var pointUserLogin = db.RatingProducts.Where(x => x.ProductID.Equals(id) && x.Username.Equals(name)).SingleOrDefault();
                 if (pointUserLogin != null)
                 {
                     pointLogint = pointUserLogin.Point;
                 }
             }
             else
             {
                 pointLogint = -1;
             }
            Session["IdDetail"] = id;
            ViewBag.pointLogin = pointLogint;
            ViewBag.point = point;
            //lấy rating của product trong db ra
            return View(product);
        }

        public string AddNewRating(string RatingPoint)
        {
           int id =  (int)Session["IdDetail"];
            RatingProduct rating = new RatingProduct();
            string name = User.Identity.Name;
            rating.Point = Convert.ToInt32(RatingPoint);
            rating.ProductID = id;
            rating.Username = name;
            db.RatingProducts.Add(rating);
            db.SaveChanges();
            Session["IdDetail"] = null;
            return "";
           
        }

        public ActionResult Recommend()
        {
            ViewBag.Username = new SelectList(db.Accounts, "member1", "123456");
            return View();
        }

        //
        // POST: /Test/Create

        [HttpPost]
        public ActionResult Recommend(RecommendProduct recommendproduct)
        {
            recommendproduct.RecommendTime = DateTime.Now;
            recommendproduct.Username = "member1";
            if (ModelState.IsValid)
            {
                db.RecommendProducts.Add(recommendproduct);
                db.SaveChanges();
                return RedirectToAction("SearchForProduct");
            }

            ViewBag.Username = new SelectList(db.Accounts, "member1", "123456", recommendproduct.Username);
            return View(recommendproduct);
        }
        public JsonResult checkLink(string link)
        {
            System.Threading.Thread.Sleep(1500);
            //string name = form["link"];
            if (IsUrl(link))
            {
                return Json(title);
            }
            else
            {
                return Json(0);
            }
        }
        private bool IsUrl(string URL)
        {
            //Load website
            try
            {
                var web = new HtmlWeb { UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:26.0) Gecko/20100101 Firefox/26.0" };
                 var document = web.Load(URL);
                if (web.StatusCode == HttpStatusCode.OK)
                {

                    title = document.DocumentNode.SelectSingleNode("//title").InnerText;
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            return false;
        }
        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        public string Feedback(string FeedbackInfo)
        {
            String[] info = FeedbackInfo.Trim().Split('|');
            string Ten = info[0];
            string Noidung = info[1];
            DateTime now = DateTime.Now;
            string Time = now.ToShortDateString();
            SaveLogReportLaptop(Ten, Noidung, Time);
            return "";
        }

        public void SaveLogReportLaptop(string Ten, string Noidung, string Time)
        {
            // lấy dữ liệu trong file text traning ra LogFileReportLaptop;
            string path = Server.MapPath("/Areas/Admin/LogFiles/LogFileReportLaptop.txt");
            if (System.IO.File.Exists(path))
            {   // lấy hết dòng trong file txt ra.
                string[] lines = System.IO.File.ReadAllLines(path);
                // tảo mảng mới chứa dữ dữ liệu trùng.
                string[] newlines = new string[1];
                string newline = Ten + '|' + Noidung + '|' + Time;
                newlines[0] = newline;
                //Gộp hai bảng thành mảng mới và lưu vào txt lại
                string[] save = new string[lines.Length + newlines.Length];
                for (int i = 0; i < lines.Length; i++)
                {
                    save[i] = lines[i];
                }
                for (int i = 0; i < newlines.Length; i++)
                {
                    save[i + lines.Length] = newlines[i];
                }
                // ghi lại vào txt
                System.IO.File.WriteAllLines(path, save);
            }
        }

        [ChildActionOnly]
        public ActionResult ProductList(List<Product> Model)
        {
            return PartialView(Model);
        }
        protected string RenderPartialViewToString(string viewName, object model)
        {
            if (string.IsNullOrEmpty(viewName))
                viewName = ControllerContext.RouteData.GetRequiredString("action");

            ViewData.Model = model;

            using (StringWriter sw = new StringWriter())
            {
                ViewEngineResult viewResult =
                ViewEngines.Engines.FindPartialView(ControllerContext, viewName);
                ViewContext viewContext = new ViewContext
                (ControllerContext, viewResult.View, ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);

                return sw.GetStringBuilder().ToString();
            }
        }
        [HttpPost]
        public ActionResult InfinateScroll(int BlockNumber)
        {
            //////////////// THis line of code only for demo. Needs to be removed ////
            System.Threading.Thread.Sleep(2000);
            //////////////////////////////////////////////////////////////////////////
            int BlockSize = 4;
            DataManager manager = new DataManager();
            var products = manager.GetProducts(BlockNumber, BlockSize);
            CPS_Solution.Models.DataManager.JsonModel jsonModel = new CPS_Solution.Models.DataManager.JsonModel();
            jsonModel.NoMoreData = products.Count < BlockSize;
            jsonModel.HTMLString = RenderPartialViewToString("ProductList", products);
            return Json(jsonModel);
        } 
    }
}