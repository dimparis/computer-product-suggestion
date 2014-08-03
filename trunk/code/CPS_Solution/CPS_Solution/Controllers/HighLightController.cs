using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.Areas.Admin.Models;
using CPS_Solution.CommonClass;
using CPS_Solution.EntityFramework;
using CPS_Solution.Models;
namespace CPS_Solution.Controllers
{
    public class HighLightController : Controller
    {
        //
        // GET: /HighLight/
        private DataManager dataManager = new DataManager();
        private const int takeItem = 6;
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        public ActionResult Index()
        {         
            // All Product
            var products = dataManager.Check5AttributeLoad(context.Products.Where(x => x.IsActive == true).ToList());
            // Highlight Model 
            HighlightModel model = new HighlightModel() {
                mostbyRatingProducts = MostRating(takeItem),
                mostbyNewProducts = MostNew(products,takeItem),
                mostbyCompareProducts = MostCompare(takeItem),
                mostbyTotalPointProducts = MostTotalWeight(products,takeItem),
                mostbyViewProducts = MostView(takeItem),
            };
            return View(model);
        }
        public List<Product> MostRating (int takeItem)
        {
            List<int> idList = new List<int>();
            List<Product> ListOfProducts = new List<Product>();
            using (var context = new CPS_SolutionEntities()) 
            {
                var mostRatingProducts = context.RatingProducts.OrderByDescending(x => x.Point).ToList().Take(takeItem);
                foreach (var item in mostRatingProducts) 
                {
                    idList.Add(item.ProductID);
                }
                foreach (var i in idList)
                {
                    var product = context.Products.FirstOrDefault(x => x.ID == i);
                    ListOfProducts.Add(product);
                }
            }
            return ListOfProducts;
        }
        public List<Product> MostTotalWeight(List<Product> products, int takeItem)
        {
            List<int> idList = new List<int>();
            List<Product> ListOfProducts = new List<Product>();
            using (var context = new CPS_SolutionEntities())
            {
                var productsByTotalWeight = products.OrderByDescending(x => x.TotalWeightPoint).ToList().Take(takeItem);
                ListOfProducts = productsByTotalWeight.ToList();
            }
            return ListOfProducts;
        }
        public List<Product> MostView(int takeItem)
        {
            List<int> idList = new List<int>();
            List<Product> ListOfProducts = new List<Product>();
            using (var context = new CPS_SolutionEntities())
            {
                var mostViewProducts = context.MostViewProducts.OrderByDescending(x => x.ViewTime).ToList().Take(takeItem);
                foreach (var item in mostViewProducts)
                {
                    idList.Add(item.ProductID);
                }
                foreach (var i in idList)
                {
                    var product = context.Products.FirstOrDefault(x => x.ID == i);
                    ListOfProducts.Add(product);
                }
            }
            return ListOfProducts;
        }
        public List<Product> MostNew(List<Product> products, int takeItem)
        {
            List<int> idList = new List<int>();
            List<Product> ListOfProducts = new List<Product>();
            using (var context = new CPS_SolutionEntities())
            {
                var newProducts = products.OrderByDescending(x => x.ID).ToList().Take(takeItem);
                ListOfProducts = newProducts.ToList();
            }
            return ListOfProducts;
        }
        public List<Product> MostCompare(int takeItem)
        {
            List<int> idList = new List<int>();
            List<Product> ListOfProducts = new List<Product>();
            using (var context = new CPS_SolutionEntities())
            {
                var mostCompareProducts = context.HistoryDetails.Select(x => new { x.ProductID}).GroupBy(x => x.ProductID).OrderByDescending(x => x.Count()).ToList();
                foreach (var item in mostCompareProducts)
                {
                    idList.Add(item.First().ProductID);
                }
                foreach (var i in idList)
                {
                    var product = context.Products.FirstOrDefault(x => x.ID == i);
                    ListOfProducts.Add(product);
                }
            }
            return ListOfProducts;
        }
    }
}
