using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
using System.Net;

namespace CPS_Solution.Controllers
{
    public class ProductController : Controller
    {
        private CPS_SolutionEntities db = new CPS_SolutionEntities();

        //
        // GET: /Product/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult SearchForProduct(string productName)
        {
            var products = db.Products.ToList();

            if (!String.IsNullOrEmpty(productName))
            {
                var listP = new List<Product>();
                foreach (var p in products)
                {
                    if (p.Name.ToUpper().Contains(productName.ToUpper()))
                    {
                        listP.Add(p);
                    }
                }
                return View(listP); ;

            }

            return View(products);
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
        public ActionResult Details(int id = 0)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        //
        // GET: /Test/Create

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
                return Json(1);
            }
            else 
            {
                return Json(0);
            }
        }
        private bool IsUrl(string URL)
        {
            HttpWebResponse response = null;
            if (URL.Equals(""))
            {
                return false;
            }
            var request = (HttpWebRequest)WebRequest.Create(URL);
            request.Method = "HEAD";
            try
            {
                response = (HttpWebResponse)request.GetResponse();
                return true;
            }
            catch (WebException ex)
            {
                /* A WebException will be thrown if the status of the response is not `200 OK` */
                return false;
            }
            finally
            {
                // Don't forget to close your response.
                if (response != null)
                {
                    response.Close();
                }
            }
        }
        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}