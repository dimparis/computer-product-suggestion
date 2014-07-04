using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CPS_Solution.Areas.Admin.Controllers
{
    public class SystemController : Controller
    {
        //
        // GET: /Admin/System/

        public RedirectToRouteResult WelcomeAreasAdmin()
        {
            if (User.IsInRole("Admin"))
            {
                return RedirectToAction("Index", "Parser");
            }
            if (User.IsInRole("Staff"))
            {
                return RedirectToAction("Index", "Training");
            }
            if (User.IsInRole("Member"))
            {
                return RedirectToAction("Index", "Product");
            }
            return null;
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
