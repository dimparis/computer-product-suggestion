using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
using CPS_Solution.CommonClass;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
namespace CPS_Solution.Controllers
{
    public class NotifierController : Controller
    {
        //
        // GET: /Notifier/
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetNotify(string username)
        {

            var account = context.Accounts.Select(x => new { x.Username }).Where(x => x.Username == username).FirstOrDefault();
            if (account != null)
            {
                // get aprrove Recommend
                var approveRecommendProduct = context.RecommendProducts.Where(x => x.Username == username && x.IsSeen == false && x.IsApprove == true).ToList();
                List<AliasProduct> products = new List<AliasProduct>();
                int countAtt = 0;
                //if have rcmd
                if (approveRecommendProduct.Count > 0)
                {
                    foreach (var item in approveRecommendProduct)
                    {
                        countAtt = 0;
                        // take rcmd
                        var newItem = context.AliasProducts.Where(x => x.URL.Contains(item.Parselink) && x.IsActive == true).FirstOrDefault();
                        if (newItem != null)
                        {
                            //check if confirmed
                            var newProduct = context.Products.FirstOrDefault(x => x.IsActive == true && x.ID == newItem.ProductID && x.TotalWeightPoint > 0);
                            if (newProduct != null)
                            {
                                //check 5 att have
                                var newProductAttribute = context.ProductAttributes.Where(x => x.ProductID == newItem.ProductID).ToList();
                                if (newProductAttribute != null)
                                {
                                    // check if have 5 point of att
                                    if (newProductAttribute.Count() >= 5)
                                    {
                                        foreach (var itemHardware in newProductAttribute)
                                        {
                                            if (itemHardware.Hardware.WeightCriteraPoint > 0)
                                            {
                                                countAtt++;
                                            }
                                        }
                                        if (countAtt >= 5)
                                        {
                                            products.Add(newItem);
                                            item.IsSeen = true;
                                            context.SaveChanges();
                                            if (item.IsReceive == true && item.IsMailSent == false)
                                            {
                                                AutoSendMail sendMail = new AutoSendMail();
                                                Task.Factory.StartNew(() => sendMail.AutoSendMailforProduct(item));
                                                return Json(products.Select(product => new { name = product.Name, id = product.ProductID }).ToList(), JsonRequestBehavior.AllowGet);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    return Json(products.Select(product => new { name = product.Name, id = product.ProductID }).ToList(), JsonRequestBehavior.AllowGet);
                }
            }
            return Json("NoneData", JsonRequestBehavior.AllowGet);
        }
        public JsonResult LoadNotification(string username)
        {

            var account = context.Accounts.Select(x => new { x.Username }).Where(x => x.Username == username).FirstOrDefault();
            if (account != null)
            {
                var approveRecommendProduct = context.RecommendProducts.Where(x => x.Username == username && x.IsSeen == true && x.IsApprove == true).OrderByDescending(x => x.RecommendTime).ToList();
                List<AliasProduct> products = new List<AliasProduct>();
                foreach (var item in approveRecommendProduct)
                {
                    if (approveRecommendProduct.Count > 0)
                    {
                        var newItem = context.AliasProducts.Where(x => x.URL.Contains(item.Parselink) && x.IsActive == true && x.IsMain == true).FirstOrDefault();
                        if (newItem != null)
                        {
                            products.Add(newItem);
                        }
                    }
                }
                return Json(products.Select(product => new { name = product.Name, id = product.ProductID }).ToList(), JsonRequestBehavior.AllowGet);
            }
            return Json("NoneData", JsonRequestBehavior.AllowGet);
        }
    }
}
