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
    public class ViewSearchNotFoundController : Controller
    {
        //
        // GET: /Admin/ViewSearchNotFound/

        public ActionResult Index()
        {
            List<ProductNotFound> listPro = new List<ProductNotFound>();
            // lấy dữ liệu trong file text traning ra LogFileReportLaptop;
            string path = Server.MapPath("/Areas/Admin/LogFiles/NoResult/result.txt");
            if (System.IO.File.Exists(path))
            {   // lấy hết dòng trong file txt ra.
                string[] lines = System.IO.File.ReadAllLines(path);
                // tảo mảng mới chứa dữ dữ liệu trùng.
                int i = 0;
                foreach (string line in lines)
                {
                    if (!String.IsNullOrWhiteSpace(line.Trim()))
                    {
                        i++;
                        String[] fb = line.Split('|');
                        ProductNotFound pro = new ProductNotFound();
                        pro.id = i.ToString();
                        String[] tukhoa = fb[1].Split(':');
                        pro.NamePro = tukhoa[1];
                        pro.Date = fb[0];
                        pro.Time = "1";
                        listPro.Add(pro);
                    }
                }
            }           
            listPro.Reverse();
            int a = 0;
            int id = 0;
            for (int i = 0; i < listPro.Count; i++)
            {
                RatingPro ra = new RatingPro();
                a++;
                id++;
                for (int j = i + 1; j < listPro.Count; j++)
                {
                    if (listPro[i].NamePro.Trim().Equals(listPro[j].NamePro.Trim()))
                    {
                        listPro.Remove(listPro[j]);
                        a++;
                        j--;                      
                    }
                }
                listPro[i].Time = a.ToString();
                listPro[i].id = id.ToString();
                a = 0;
            }

            ViewBag.listPro = listPro;
            return View();
        }

    }
}
