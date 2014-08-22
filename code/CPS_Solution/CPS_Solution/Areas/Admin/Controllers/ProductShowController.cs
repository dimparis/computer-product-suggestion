using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
namespace CPS_Solution.Areas.Admin.Controllers
{
    public class ProductShowController : Controller
    {
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        //
        // GET: /Admin/ProductShow/

        public ActionResult Index(int id1)
        {

            var listAlias = context.AliasProducts.Where(x => x.ProductID == id1 && x.IsActive == true).ToList();
            ViewBag.listAlias = listAlias; 

            //var alias = context.AliasProducts.Where(x => x.IsMain==true && x.IsActive==true).ToList();
            //var listId =  new List<int>();
            //foreach (var a in alias) 
            //{
            //    int id = a.ProductID;
            //    listId.Add(id);                
            //}
            //List<Product> listPro= new List<Product>();
            //foreach (var id in listId) 
            //{
            //    var pro = context.Products.Where(x => x.ID == id).FirstOrDefault();
            //    listPro.Add(pro);
            //}
            //return View(listPro);
            return View();
        }
         [HttpPost]
        public String ActiveAlias(string id)
        {
            int AliD = Convert.ToInt32(id);

            var listAlias = context.AliasProducts.Where(x => x.ID == AliD).SingleOrDefault();

            if (listAlias.IsActive == true)
            {
                listAlias.IsActive = false;
                context.SaveChanges();
                return "no";
            }
            else
            {
                listAlias.IsActive = true;
                context.SaveChanges();
                return "ok";
            }
         

           
        }

         [HttpPost]
         public String mainName(string id)
         {
             int AliD = Convert.ToInt32(id);

             var Alias = context.AliasProducts.Where(x => x.ID == AliD).SingleOrDefault();

             int productId = Alias.ProductID;

             var listName = context.AliasProducts.Where(x => x.ProductID == productId).ToList();

             foreach (AliasProduct name in listName)
             {
                 name.IsMain = false;
                 context.SaveChanges();
             }            
                 Alias.IsMain = true;
                 context.SaveChanges();
                 return "ok";

         }


        public ActionResult EditProduct(int id)
        {
            var product = context.AliasProducts.FirstOrDefault(p => p.ProductID == id);
            if (product != null)
            {
                var aliasNames = context.AliasProducts.Where(x=>x.ProductID ==id)
                .OrderBy(x => x.Name)
                .ToList();
                var productList = new List<SelectListItem>();
                foreach (var alias in aliasNames)
                {
                    var item = new SelectListItem
                    {
                        Selected = alias.IsMain.Value,
                        Text = alias.Name,
                        Value = alias.ID.ToString()
                    };
                    productList.Add(item);
                }
                ViewBag.MainAliasID = productList;
            }
            return View(product);
        }

    




        [HttpPost]
        public RedirectToRouteResult EditProductName(int MainAliasID)
        {
            var alias = context.AliasProducts.Where(pa => pa.ID == MainAliasID).FirstOrDefault();
            var product = context.Products.Where(p => p.ID == alias.ProductID).FirstOrDefault();
            foreach (var aliass in product.AliasProducts)
            {
                if (aliass.ID == MainAliasID)
                {
                    aliass.IsMain = true;
                }
                else
                {
                    aliass.IsMain = false;
                }
            }

            context.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}
