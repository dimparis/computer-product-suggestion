using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
namespace CPS_Solution.Areas.Admin.Controllers
{
    public class LogFileController : Controller
    {
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        //
        // GET: /Admin/LogFile/
        public ActionResult Index()
        {
            var logfiles = context.LogFiles.Where(x => x.IsActive).ToList();
            return View(logfiles);
        }
        protected override void Dispose(bool disposing)
        {
            context.Dispose();
            base.Dispose(disposing);
        }
    }
}
