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
        private const int takeItem = 4;
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        private void LoadDropDownList()
        {
            List<SelectListItem> ListBrand = new List<SelectListItem>();
            var brands = context.Brands.ToList();
            List<Product> ListOfProduct = new List<Product>();
            foreach (var item in brands)
            {
                SelectListItem avaiableItem = new SelectListItem
                {
                    Text = item.BrandName,
                    Value = item.ID.ToString(),
                };
                ListBrand.Add(avaiableItem);
            }
            ViewBag.ListBrands = ListBrand;
            ViewBag.ListPrices = CreateDropDownBoxPrive();
        }
        private List<SelectListItem> CreateDropDownBoxPrive()
        {
            List<SelectListItem> ListPrice = new List<SelectListItem>();
            SelectListItem value1 = new SelectListItem { Text = " Dưới 8 triệu", Value = "1" };
            SelectListItem value2 = new SelectListItem { Text = " 8 triệu - 10 triệu ", Value = "2" };
            SelectListItem value3 = new SelectListItem { Text = " 10 triệu - 13 triệu ", Value = "3" };
            SelectListItem value4 = new SelectListItem { Text = " 13 triệu - 16 triệu ", Value = "4" };
            SelectListItem value5 = new SelectListItem { Text = " 16 triệu - 20 triệu ", Value = "5" };
            SelectListItem value6 = new SelectListItem { Text = " 20 triệu - 25triệu ", Value = "6" };
            SelectListItem value7 = new SelectListItem { Text = " Trên 25 triệu", Value = "7" };
            SelectListItem value8 = new SelectListItem { Text = " Tất Cả", Value = "8" };
            ListPrice.Add(value1); ListPrice.Add(value2); ListPrice.Add(value3); ListPrice.Add(value4);
            ListPrice.Add(value5); ListPrice.Add(value6); ListPrice.Add(value7); ListPrice.Add(value8);
            return ListPrice;
        }
        public ActionResult Index()
        {
            LoadDropDownList();
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
            var mostCompareProducts = context.RatingProducts.Select(x => new { x.ProductID }).GroupBy(x => x.ProductID).OrderByDescending(x => x.Count()).ToList().Take(4);
            foreach (var item in mostCompareProducts)
            {
                idList.Add(item.First().ProductID);
            }
            foreach (var i in idList)
            {
                var product = context.Products.FirstOrDefault(x => x.ID == i);
                ListOfProducts.Add(product);
            }
            return ListOfProducts;
        }
        public List<Product> MostTotalWeight(List<Product> products, int takeItem)
        {
            List<int> idList = new List<int>();
            List<Product> ListOfProducts = new List<Product>();
                var productsByTotalWeight = products.OrderByDescending(x => x.TotalWeightPoint).ToList().Take(takeItem);
                ListOfProducts = productsByTotalWeight.ToList();

            return ListOfProducts;
        }
        public List<Product> MostView(int takeItem)
        {
            List<int> idList = new List<int>();
            List<Product> ListOfProducts = new List<Product>();
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
            return ListOfProducts;
        }
        public List<Product> MostNew(List<Product> products, int takeItem)
        {
            List<int> idList = new List<int>();
            List<Product> ListOfProducts = new List<Product>();
                var newProducts = products.OrderByDescending(x => x.ID).ToList().Take(takeItem);
                ListOfProducts = newProducts.ToList();
            return ListOfProducts;
        }
        public List<Product> MostCompare(int takeItem)
        {
            List<int> idList = new List<int>();
            List<Product> ListOfProducts = new List<Product>();
                var mostCompareProducts = context.HistoryDetails.Select(x => new { x.ProductID}).GroupBy(x => x.ProductID).OrderByDescending(x => x.Count()).ToList().Take(4);
                foreach (var item in mostCompareProducts)
                {
                    idList.Add(item.First().ProductID);
                }
                foreach (var i in idList)
                {
                    var product = context.Products.FirstOrDefault(x => x.ID == i);
                    ListOfProducts.Add(product);
                }
            return ListOfProducts;
        }
    }
}
