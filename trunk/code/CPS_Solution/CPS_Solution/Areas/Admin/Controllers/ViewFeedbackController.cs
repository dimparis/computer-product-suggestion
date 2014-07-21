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
    public class ViewFeedbackController : Controller
    {
        //
        // GET: /Admin/ViewFeedback/

        public ActionResult Index()
        {
            List<feedbackinfo> listfeedback = new List<feedbackinfo>();
            // lấy dữ liệu trong file text traning ra LogFileReportLaptop;
            string path = Server.MapPath("/Areas/Admin/LogFiles/LogFileReportLaptop.txt");
            if (System.IO.File.Exists(path))
            {   // lấy hết dòng trong file txt ra.
                string[] lines = System.IO.File.ReadAllLines(path);
                // tảo mảng mới chứa dữ dữ liệu trùng.
                foreach (string line in lines)
                {
                     String[] fb = line.Split('|');
                    feedbackinfo feedback = new feedbackinfo();
                    feedback.teLaptop =fb[0];
                    feedback.noidung =fb[1];
                    feedback.ngaythang = fb[2];
                    listfeedback.Add(feedback);
                }
            }
            ViewBag.listfeedback = listfeedback;
            return View();
        }

    }
}
