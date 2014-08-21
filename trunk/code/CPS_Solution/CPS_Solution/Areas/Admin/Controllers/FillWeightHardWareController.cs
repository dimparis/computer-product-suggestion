using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.Areas.Admin.Models;
using CPS_Solution.EntityFramework;
using System.IO;
using LinqToExcel;
using LinqToExcel.Query;
using CPS_Solution.Areas.Admin.Helpers;
using System.Net;
using System.Globalization;


namespace CPS_Solution.Areas.Admin.Controllers
{
    public class FillWeightHardWareController : Controller
    {
        CPS_SolutionEntities db = new CPS_SolutionEntities();
        //
        // GET: /Admin/FillWeightHardWare/

        public ActionResult Index()
        {

            List<Hardware> ListHardNoPoint = db.Hardwares.Where(x => x.IsActive == true && x.WeightCriteraPoint == 0).ToList();
            ViewBag.ListHardNoPoint = ListHardNoPoint;
            return View();
        }



        public string UpdateAll(string stringpro)
        {
            String[] Allinfo = stringpro.Trim().Split('@');
            for (int i = 0; i < Allinfo.Length - 1; i++)
            {
                string[] info = Allinfo[i].Trim().Split('|');
                int id = Convert.ToInt32(info[0]);
                int trongso = Convert.ToInt32(info[1]);
                var hardware = db.Hardwares.Where(x => x.ID == id).SingleOrDefault();
                hardware.WeightCriteraPoint = trongso;
                db.SaveChanges();
            }
            return "";
        }
        public string UpdateTrongso(string trongsolinhkien)
        {
            String[] info = trongsolinhkien.Trim().Split('|');
            int id = Convert.ToInt32(info[0]);
            int trongso = Convert.ToInt32(info[1]);
            var hardware = db.Hardwares.Where(x => x.ID == id).SingleOrDefault();
            hardware.WeightCriteraPoint = trongso;
            db.SaveChanges();

            return "";
        }
    }
}
