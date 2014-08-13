using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.Areas.Admin.Helpers;
using CPS_Solution.Areas.Admin.Models;
using CPS_Solution.EntityFramework;
using CPS_Solution.CommonClass;
namespace CPS_Solution.Areas.Admin.Controllers
{
    public class SystemController : Controller
    {
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        //
        // GET: /Admin/System/
        /// <summary>
        /// Check Role and return page 
        /// </summary>
        /// <returns></returns>
        public RedirectToRouteResult WelcomeAreasAdmin()
        {
            if (User.IsInRole("staff"))
            {
                var recommendProducts = context.RecommendProducts.Where(x => x.IsMailSent == false &&
                x.IsReceive == true && x.IsApprove == true).ToList();
                AutoSendMail auto = new AutoSendMail();
                auto.AutoSendMailforUser(recommendProducts);
                return RedirectToAction("Index", "TrainingProduct");
            }
            if (User.IsInRole("Administrator"))
            {
                return RedirectToAction("Index", "ManagerUser");
            }
            return null;
        }
        /// <summary>
        /// Load Model from xML file
        /// </summary>
        /// <returns></returns>
        public ActionResult ConfigureSystem()
        {
            var helper = new ConfigureHelper();
            var model = helper.CreateNewModel();
            return View(model);
        }
        [HttpPost]
        public ActionResult UpdateConfigureSystem(ConfigurationModel model)
        {
            var helper = new ConfigureHelper();
            helper.UpdateModel(model);
            TempData["edit"] = "Success";
            return RedirectToAction("ConfigureSystem");
        }

    }
}
