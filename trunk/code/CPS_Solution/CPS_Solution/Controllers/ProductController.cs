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
using System.IO;
using CPS_Solution.Models;
using CPS_Solution.CommonClass;

namespace CPS_Solution.Controllers
{
    public class ProductController : Controller
    {
        private CPS_SolutionEntities db = new CPS_SolutionEntities();
        private readonly DataManager _dataManager = new DataManager();
        private string email = "";
        private double BestRatioScore = 100 / ConstantManager.BestScore;
       
        //public ActionResult Index()
        //{
        //    DataManager manager = new DataManager();
        //    int BlockSize = 4;
        //    var products = manager.GetProducts(1, BlockSize);
        //    LoadDropDownList();

        //    return View(products);
        //}

        public ActionResult SearchForProduct()
        {
            DataManager manager = new DataManager();
            int BlockSize = 10;
            var products = manager.GetProducts(1, BlockSize).OrderBy(x => x.TotalWeightPoint).ToList();
            LoadDropDownList();
            return View(products);
        }
        [HttpPost]
        public ActionResult SearchForProduct(string productName)
        {
            LoadDropDownList();
            DataManager manager = new DataManager();
            int BlockSize = 8;

            var products = manager.GetProductsByName(1, BlockSize, productName).ToList();
            return View(products);
        }
        [HttpPost]
        public ActionResult SearchByPriceAndBrand(string brands, string prices)
        {
            int brandInt = 13;// load tat ca  cac thuong hieu
            int priceInt = 8;// load tat ca cac loai gia
            LoadDropDownList();
            if (!String.IsNullOrEmpty(brands))
            {
                brandInt = Int32.Parse(brands);
            }
            if (!String.IsNullOrEmpty(prices))
            {
                priceInt = Int32.Parse(prices);
            }
            if (String.IsNullOrEmpty(prices) && String.IsNullOrEmpty(brands))
            {
                brandInt = 13;
                priceInt = 8;
            }
            var listOFProducts = new List<Product>();
            var brandLaptop = db.Brands.FirstOrDefault(x => x.ID == brandInt);
            var manager = new DataManager();
            int BlockSize = 8;
            if (brandLaptop != null)
            {
                listOFProducts = manager.GetProductsByPrice(1, BlockSize, brandInt, priceInt);
            }
            TempData["brandInt"] = brands;
            TempData["priceInt"] = prices;
            return View(listOFProducts);

        }

        public ActionResult SearchByPriceAndBrandTop3(string brands, string prices)
        {
            int brandInt = 13;// load tat ca  cac thuong hieu
            int priceInt = 8;// load tat ca cac loai gia
            LoadDropDownList();
            if (!String.IsNullOrEmpty(brands))
            {
                brandInt = Int32.Parse(brands);
            }
            if (!String.IsNullOrEmpty(prices))
            {
                priceInt = Int32.Parse(prices);
            }
            if (String.IsNullOrEmpty(prices) && String.IsNullOrEmpty(brands))
            {
                brandInt = 13;
                priceInt = 8;
            }

            var products = _dataManager.ListOfTop3ProductbyPrice(brandInt, priceInt).OrderByDescending(x => x.TotalWeightPoint).Take(3);
            TempData["brandInt"] = brandInt;
            TempData["priceInt"] = priceInt;

            return View(products);

        }

        [HttpPost]
        public ActionResult Compare(int p1, int p2, int p3)
        {
            int[] vals = new int[] { p1, p2, p3 };

            var products = from p in db.Products
                           select p;
            var histories = from h in db.Histories
                            select h;
            var listHistory = histories.ToList();

            var historyDetails = from d in db.HistoryDetails
                                 select d;
            var listHistoryDetail = historyDetails.ToList();

            products = products.Where(c => vals.Contains(c.ID));

            var listProduct = products.ToList();
            
            if (p3 == -1){
                if (User.Identity.IsAuthenticated) {
                    int[] lp = new int[] { p1, p2 };
                    if (ModelState.IsValid)
                    {
                        var now = DateTime.Now.Date;
                        var newHistory = new History();
                        newHistory.Username = User.Identity.Name;
                        newHistory.CompareTime = now;
                        db.Histories.Add(newHistory);
                        foreach (var product in lp)
                        {
                            var newHisDetail = new HistoryDetail();
                            newHisDetail.History = newHistory;
                            newHisDetail.ProductID = product;
                            newHisDetail.isWinner = false;
                            db.HistoryDetails.Add(newHisDetail);
                            db.SaveChanges();
                        }
                    }
                }
                listProduct[0].TotalWeightPoint = Math.Round((BestRatioScore * listProduct[0].TotalWeightPoint), 2);
                listProduct[1].TotalWeightPoint = Math.Round((BestRatioScore * listProduct[1].TotalWeightPoint), 2);
                
            } else {
                if (User.Identity.IsAuthenticated) {
                    int[] lp = new int[] { p1, p2, p3 };
                    if (ModelState.IsValid)
                    {
                        var now = DateTime.Now.Date;
                        var newHistory = new History();
                        newHistory.Username = User.Identity.Name;
                        newHistory.CompareTime = now;
                        db.Histories.Add(newHistory);
                        foreach (var product in lp)
                        {
                            var newHisDetail = new HistoryDetail();
                            newHisDetail.History = newHistory;
                            newHisDetail.ProductID = product;
                            newHisDetail.isWinner = false;
                            db.HistoryDetails.Add(newHisDetail);
                            db.SaveChanges();
                        }

                    }
                }
                listProduct[0].TotalWeightPoint = Math.Round((BestRatioScore * listProduct[0].TotalWeightPoint), 2);
                listProduct[1].TotalWeightPoint = Math.Round((BestRatioScore * listProduct[1].TotalWeightPoint), 2);
                listProduct[2].TotalWeightPoint = Math.Round((BestRatioScore * listProduct[2].TotalWeightPoint), 2);
            }
            return View(listProduct);
        }
        [HttpPost]
        public ActionResult CompareDetail(int p1, int p2, int p3)
        {
            int[] vals = new int[] { p1, p2, p3 };
            var products = from p in db.Products
                           select p;
            products = products.Where(c => vals.Contains(c.ID));
            var listProduct = products.ToList();

            if (p3 == -1)
            {
                
                listProduct[0].TotalWeightPoint = Math.Round((BestRatioScore * listProduct[0].TotalWeightPoint), 2);
                listProduct[1].TotalWeightPoint = Math.Round((BestRatioScore * listProduct[1].TotalWeightPoint), 2);
            }
            else
            {
                listProduct[0].TotalWeightPoint = Math.Round((BestRatioScore * listProduct[0].TotalWeightPoint), 2);
                listProduct[1].TotalWeightPoint = Math.Round((BestRatioScore * listProduct[1].TotalWeightPoint), 2);
                listProduct[2].TotalWeightPoint = Math.Round((BestRatioScore * listProduct[2].TotalWeightPoint), 2);
            }
            return View(listProduct);
        }

        public ActionResult Details(int id)
        {
            Product product = db.Products.FirstOrDefault(x=>x.ID ==id);
            if (product == null)
            {
                return HttpNotFound();
            }
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
                foreach (RatingProduct r in Allrating)
                {
                    allpoint += r.Point;
                }
                point = allpoint / Allrating.Count;
            }
            string name = User.Identity.Name;
            double pointLogint = 0;
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

            // insert vao bang most view 

            var viewProduct = db.MostViewProducts.FirstOrDefault(x => x.ProductID == id);
            if (viewProduct != null)
            {
                viewProduct.ViewTime += 1;
                db.SaveChanges();
            }
            else
            {
                var viewItem = new MostViewProduct()
                {
                    ProductID = id,
                    ViewTime = 1
                };
                db.MostViewProducts.Add(viewItem);
                db.SaveChanges();
            }

            return View(product);
        }

        public string AddNewRating(string RatingPoint)
        {
            int id = (int)Session["IdDetail"];
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
            return View();
        }

        [HttpPost]
        public ActionResult Recommend(RecommendProduct recommendproduct)
        {
            recommendproduct.RecommendTime = DateTime.Now;

            recommendproduct.IsApprove = null;
            recommendproduct.IsTrue = false;
            if (User.Identity.IsAuthenticated == true)
            {
                recommendproduct.Username = User.Identity.Name;
            }
            else
            {
                recommendproduct.Username = "Guest";
            }
            db.RecommendProducts.Add(recommendproduct);
            db.SaveChanges();
            return RedirectToAction("ThanksForRecommend"); ;
        }

        public ActionResult ThanksForRecommend()
        {
            return View();
        }

        public JsonResult checkLink(string link)
        {
            System.Threading.Thread.Sleep(1500);
            //string name = form["link"];
            if (IsUrl(link))
            {
                if (User.Identity.IsAuthenticated == true)
                {
                    var account = db.Accounts.Select(x => new { x.Username, x.Email }).Where(x => x.Username == User.Identity.Name).FirstOrDefault();
                    return Json(account.Email);
                }
                else
                {
                    return Json(2);
                }

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
        public ActionResult ProductList(List<Product> model)
        {
            return PartialView(model);
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
        public ActionResult InfinateScrollSearchByName(int BlockNumber, string searchValue)
        {
            //////////////// THis line of code only for demo. Needs to be removed ////
            System.Threading.Thread.Sleep(800);
            //////////////////////////////////////////////////////////////////////////
            int BlockSize = 8;
            var manager = new DataManager();
            var products = manager.GetProductsByName(BlockNumber, BlockSize, searchValue);
            var jsonModel = new DataManager.JsonModel
                                {
                                    NoMoreData = products.Count < BlockSize,
                                    HTMLString = RenderPartialViewToString("ProductList", products)
                                };
            return Json(jsonModel);
        }

        [HttpPost]
        public ActionResult InfinateScrollSearchByPrice(int BlockNumber, int brandID, int priceID)
        {
            //////////////// THis line of code only for demo. Needs to be removed ////
            System.Threading.Thread.Sleep(800);
            //////////////////////////////////////////////////////////////////////////
            int BlockSize = 8;
            var manager = new DataManager();
            var products = manager.GetProductsByPrice(BlockNumber, BlockSize, brandID, priceID);
            var jsonModel = new DataManager.JsonModel
                                {
                                    NoMoreData = products.Count < BlockSize,
                                    HTMLString = RenderPartialViewToString("ProductList", products)
                                };
            return Json(jsonModel);
        }

        public ActionResult SamePriceProduct(int id)
        {
            double minPrice = 0;
            double maxPrice = 0;
            var product = db.Products.Where(x => x.ID == id).FirstOrDefault();
            if (product != null)
            {
                minPrice = product.Price - 1000000;
                maxPrice = product.Price + 1000000;
            }
            else
            {
                minPrice = 0;
                maxPrice = 0;
            }
            var samePriceProducts = db.Products.Where(x => x.IsActive == true).ToList();
            samePriceProducts.Remove(product);
            var top3SameProduct = samePriceProducts.Where(x => x.Price <= maxPrice && x.Price >= minPrice).Take(4);
            return PartialView(top3SameProduct);
        }

        public ActionResult LoadProductByPoint(int id)
        {
            double minPoint = 0;
            double maxPoint = 0;
            var product = db.Products.Where(x => x.ID == id).FirstOrDefault();
            if (product != null)
            {
                minPoint = product.TotalWeightPoint - 10;
                maxPoint = product.TotalWeightPoint + 10;
            }
            else
            {
                minPoint = 0;
                maxPoint = 0;
            }
            var samePointProducts = db.Products.Where(x => x.IsActive == true).ToList();
            samePointProducts.Remove(product);
            var top3SameProduct = samePointProducts.Where(x => x.TotalWeightPoint <= maxPoint && x.Price >= minPoint).Take(4);

            return PartialView(top3SameProduct);
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

        private void LoadDropDownList()
        {
            List<SelectListItem> ListBrand = new List<SelectListItem>();
            var brands = db.Brands.ToList();
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

        public JsonResult SuggestProductName(string term)
        {

            var filter = _dataManager.Check5AttributeLoadTrueName(db.AliasProducts.Where(x => x.IsActive == true && x.IsMain !=null).OrderBy(x=>x.ProductID).ToList());
            var listOfAliasProduct = new List<AliasProduct>();
            List<int> idList = new List<int>();
            foreach (var item in filter) 
            {
                foreach (var name in item.AliasProducts.Where(x => x.IsActive == true && x.IsMain != null)) 
                {
                    var alias = db.AliasProducts.FirstOrDefault(x => x.ID == name.ID);
                    listOfAliasProduct.Add(alias);
                }
            }
            var result = (from r in listOfAliasProduct
                          where r.Name.ToLower().Contains(term.ToLower()) 
                          select new { r.Name }).Distinct();
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}