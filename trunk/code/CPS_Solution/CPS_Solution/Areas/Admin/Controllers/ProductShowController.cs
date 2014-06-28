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

        public ActionResult Index()
        {
            var listOfProduct = context.Products.Where(x => x.IsActive).ToList();
            return View(listOfProduct);
        }
        public ActionResult EditProduct(int id)
        {
            var product = context.ProductAlias.FirstOrDefault(p => p.ProductID == id);
            if (product != null)
            {
                var aliasNames = context.ProductAlias
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
            var alias = context.ProductAlias.Where(pa => pa.ID == MainAliasID).FirstOrDefault();
            var product = context.Products.Where(p => p.ID == alias.ProductID).FirstOrDefault();
            foreach (var aliass in product.ProductAlias)
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
