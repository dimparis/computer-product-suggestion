using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
using System.Net;
using HtmlAgilityPack;

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
            return View();
        }
        public ActionResult SearchForProduct()
        {
            var products = db.Products.Where(x => x.IsActive == true).ToList();
            return View(products);
        }
        [HttpPost]
        public ActionResult SearchForProduct(string productName)
        {

            var listP = new List<Product>();
            if (!String.IsNullOrEmpty(productName))
            {
                var products = db.Products.Where(x => x.IsActive == true).ToList();
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
            return View(product);
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

            //HttpWebResponse response = null;
            //if (URL.Equals(""))
            //{
            //    return false;
            //}
            //var request = (HttpWebRequest)WebRequest.Create(URL);
            //request.Method = "HEAD";

            //request.Accept = "text/html";
            //request.UserAgent = "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.157 CoRom/35.0.1916.157 Safari/537.36";
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
        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

    }
}