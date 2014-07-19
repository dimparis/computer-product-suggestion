using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
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
                var approveRecommendProduct = context.RecommendProducts.Where(x => x.Username == username && x.IsSeen == false && x.IsApprove == true).ToList();
                List<RecommendProduct> data = new List<RecommendProduct>();

                foreach (var a in approveRecommendProduct)
                {
                    data.Add(a);
                        a.IsSeen = true;
                }
                context.SaveChanges();
                if (data.Count > 0)
                {
                    return Json(data.Select(product => new { name = product.Name, parseLink = product.Parselink}).ToList(), JsonRequestBehavior.AllowGet);
                }
            }
            return Json("NoneData", JsonRequestBehavior.AllowGet);
        }
    }
}
