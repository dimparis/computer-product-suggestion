using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;

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

        [HttpPost]
        public ActionResult Compare(int varX, int varY)
        {
            int x=1; int y=2; int z=3;
            int[] vals = new int[] { x, y, z };

            var products = from p in db.Products
                           select p;
            products = products.Where(c => vals.Contains(c.ID));

            return View(products);
            
            
        }

        //
        // GET: /Product/Details/5

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
        // GET: /Product/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Product/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(product);
        }

        //
        // GET: /Product/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        //
        // POST: /Product/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(product);
        }

        //
        // GET: /Product/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        //
        // POST: /Product/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult SearchForProduct(string productName)
        {
            var products = from p in db.Products
                          select p;
            if (!String.IsNullOrEmpty(productName))
            {
                products = products.Where(c => c.Name.Contains(productName));
            }
            
            return View(products);
        }
        
        [HttpPost]
        public ActionResult ViewCart(string lstInt)
        {
            //int[] vals = new int[] { 4, 9, 10 };
            //products = products.where(entity => vals.contains(entity.id));

            var myIntArray = lstInt.Split(',').Select(x => Int32.Parse(x)).ToArray();
            int[] vals = myIntArray;
            string temp = "";
            var products = from p in db.Products
                           select p;
            products = products.Where(c => vals.Contains(c.ID));
            
            return View(products);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}