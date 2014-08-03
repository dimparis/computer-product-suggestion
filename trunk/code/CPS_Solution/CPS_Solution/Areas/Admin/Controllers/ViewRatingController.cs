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
using System.Text.RegularExpressions;


namespace CPS_Solution.Areas.Admin.Controllers
{
    public class ViewRatingController : Controller
    {
        //
        // GET: /Admin/ViewRating/
        CPS_SolutionEntities db = new CPS_SolutionEntities();

        public ActionResult Index()
        {
            var Allrating = db.RatingProducts.ToList();
            List<RatingPro> listRating = new List<RatingPro>();

            int id = 0;
            int a =0;
            for(int i =0; i<Allrating.Count; i++)
            {
                RatingPro ra = new RatingPro();
                a ++;
                id++;
                double pointR = Allrating[i].Point;
                for (int j = i+1; j < Allrating.Count; j++)
                {
                    if (Allrating[i].ProductID == Allrating[j].ProductID)
                    {
                        pointR += Allrating[j].Point;
                        a++;
                    }
                }
                pointR = pointR / a;
                ra.id = id.ToString();
                ra.PointRaing = pointR.ToString();
                ra.timeRaing = a.ToString();
                ra.productname = Allrating[i].Product.Name;
                listRating.Add(ra);
                a = 0;
            }
            ViewBag.listRating = listRating;               
            return View();
        }

    }
}
