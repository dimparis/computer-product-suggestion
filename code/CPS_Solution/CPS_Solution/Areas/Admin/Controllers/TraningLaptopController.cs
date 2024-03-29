﻿using System;
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
using System.Text.RegularExpressions;
using System.Net;
using System.Globalization;

namespace CPS_Solution.Areas.Admin.Controllers
{
    public class TraningLaptopController : Controller
    {
        CPS_SolutionEntities db = new CPS_SolutionEntities();
        //
        // GET: /Admin/TraningLaptop/

        public ActionResult Index()
        {                   
            // list sản phẩm trùng
            Session["ListdupLaptraning"] = LoadListTrung();
            ViewBag.ListdupLaptraning = (List<List<LapData>>)Session["ListdupLaptraning"];
            ViewBag.listproduct = (List<LapData>)Session["listproductLapT"];
            ViewBag.listduplicatenewLap = (List<List<LapData>>)Session["listduplicatenewLapT"];
           
            LoadListLoi();
            ViewBag.errorLineLap1 = Session["errorLineLap1"];
            ViewBag.ListerrorTraning = (List<LapData>)Session["ListerrorTraning"];
           
            return View();
            // list sản phẩm trùng database
          //  Session["LapDatadbTraning"] = LapDatadbTraning;
        //    ViewBag.LapDatadbTraning = (List<List<LapData>>)Session["LapDatadbTraning"];
        }

        /// <summary>
        /// Load danh sách trùng từ file log txt
        /// </summary>
        /// <returns></returns>
        public List<List<LapData>> LoadListTrung()
        {
            // Sản phẩm trùng
            #region load sản phẩm trùng từ txt LapDataTraning
            string path = Server.MapPath("~/UploadedExcelFiles/LapDataTraning.txt");
            List<List<LapData>> ListdupLaptraning = new List<List<LapData>>();
            if (System.IO.File.Exists(path))
            {
                int h = 0;
                string[] lines = System.IO.File.ReadAllLines(path);
                for (int i = 0; i < lines.Length; i++)
                {
                    if (!String.IsNullOrWhiteSpace(lines[i].Trim()))
                    {
                        List<LapData> duppro = new List<LapData>();
                        String[] line = lines[i].Split('#');
                        for (int j = 0; j < line.Length; j++)
                        {
                            h++;
                            String[] Atrr = line[j].Split('|');
                            LapData pro = new LapData();
                            pro.stt = h.ToString();
                            pro.Name = Atrr[0];
                            pro.Imagelink = Atrr[1];
                            pro.CPU = Atrr[2];
                            pro.VGA = Atrr[3];
                            pro.HDD = Atrr[4];
                            pro.Display = Atrr[5];
                            pro.RAM = Atrr[6];
                            pro.Price = Atrr[7];
                            pro.Url = Atrr[8];
                            duppro.Add(pro);

                        }
                        ListdupLaptraning.Add(duppro);
                    }
                }
            }
            return ListdupLaptraning;
            #endregion
        }

     
        /// <summary>
        /// Ghi vào txt trùng lại
        /// </summary>
        /// <param name="linenews"></param>
        public void GhilaivaoTxt(List<List<LapData>> listduplicate)
        {
            // lấy dữ liệu trong file text traning ra LapDataTraning;
            string path = Server.MapPath("~/UploadedExcelFiles/LapDataTraning.txt");
            if (System.IO.File.Exists(path))
            { 
               // tảo mảng mới chứa dữ dữ liệu trùng.
                string[] newlines = new string[listduplicate.Count];
                for (int i = 0; i < listduplicate.Count; i++)
                {
                    string newline = "";
                    for (int j = 0; j < listduplicate[i].Count; j++)
                    {
                        newline += listduplicate[i][j].Name + "|" + listduplicate[i][j].Imagelink + "|" +
                                   listduplicate[i][j].CPU + "|" + listduplicate[i][j].VGA + "|" +
                                   listduplicate[i][j].HDD + "|" + listduplicate[i][j].Display + "|" +
                                   listduplicate[i][j].RAM + "|" + listduplicate[i][j].Price + "|" + listduplicate[i][j].Url + "#";
                    }
                    newline = newline.Substring(0, newline.Length - 1);
                    newlines[i] = newline;
                }
                //Ghi lại vào txt            
                System.IO.File.WriteAllLines(path, newlines);
            }
                  
        }


        /// <summary>
        /// Load danh sách lỗi từ ErrorLap.txt
        /// </summary>
        /// <returns></returns>
        public void LoadListLoi()
        {

            string path = Server.MapPath("~/UploadedExcelFiles/ErrorLap.txt");
            List<LapData> ListerrorTraning = new List<LapData>();

            if (System.IO.File.Exists(path))
            {
                int h = 0;
                string[] lines = System.IO.File.ReadAllLines(path);
                for (int i = 0; i < lines.Length; i++)
                {
                    if (!String.IsNullOrWhiteSpace(lines[i].Trim()))
                    {
                        h++;
                        String[] line = lines[i].Split('|');
                        LapData p = new LapData();
                        p.stt = h.ToString();
                        p.Name = line[0];
                        p.Imagelink = line[1];
                        p.CPU = line[2];
                        p.VGA = line[3];
                        p.HDD = line[4];
                        p.Display = line[5];
                        p.RAM = line[6];
                        p.Price = line[7];
                        p.Url = line[8];
                        ListerrorTraning.Add(p);
                    }
                }
            }
            List<LapData> errorlist = new List<LapData>();
            // quá nhiều lỗi
            List<String> errorLine = new List<String>();
            // list dòng lỗi 1 Name, 2 Linkimage, 3 Display, 4 CPU, 5 HDD, 6 VGA, 7 Ram
            for (int i = 0; i < 10; i++)
            {
                errorLine.Add("");
            }
             int count = 0;
             for (int i = 0; i < ListerrorTraning.Count; i++)
            {
                int loi = 0;

                // dòng lỗi tên Lap
                if (ListerrorTraning[i].Name.Length < 5 || ListerrorTraning[i].Name.Length > 100)
                {
                    errorLine[1] += (Convert.ToInt32(ListerrorTraning[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }

                // dòng lỗi link ảnh lap
                ListerrorTraning[i].Imagelink = ListerrorTraning[i].Imagelink.Trim();

                bool checkimage = IsImageUrl(ListerrorTraning[i].Imagelink);
                Uri myUri;
                if (!Uri.TryCreate(ListerrorTraning[i].Imagelink, UriKind.RelativeOrAbsolute, out myUri) || checkimage == false)
                {
                    errorLine[2] += (Convert.ToInt32(ListerrorTraning[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi Display
                if (ListerrorTraning[i].Display.Length < 1 || ListerrorTraning[i].Display.Length > 100)
                {
                    errorLine[3] += (Convert.ToInt32(ListerrorTraning[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }

                // dòng lỗi CPU
                if (ListerrorTraning[i].CPU.Length < 5 || ListerrorTraning[i].CPU.Length > 100)
                {
                    errorLine[4] += (Convert.ToInt32(ListerrorTraning[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi HDD
                //int distance;
                //if (!int.TryParse(list[i].HDD, out distance))
                //{
                if (ListerrorTraning[i].HDD.Length < 1 || ListerrorTraning[i].HDD.Length > 100)
                {
                    errorLine[5] += (Convert.ToInt32(ListerrorTraning[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi VGA
                if (ListerrorTraning[i].VGA.Length < 5 || ListerrorTraning[i].VGA.Length > 100)
                {
                    errorLine[6] += (Convert.ToInt32(ListerrorTraning[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi Ram
                    /*int distance1;
                    if (!int.TryParse(list[i].RAM, out distance1))
                    { */
                if (ListerrorTraning[i].RAM.Length < 1 || ListerrorTraning[i].RAM.Length > 100)
                {
                    errorLine[7] += (Convert.ToInt32(ListerrorTraning[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }


                // dòng lỗi Price
                double distance1;
                if (!double.TryParse(ListerrorTraning[i].Price, out distance1))
                {
                    errorLine[8] += (Convert.ToInt32(ListerrorTraning[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi URL
                ListerrorTraning[i].Url = ListerrorTraning[i].Url.Trim();
                bool checkURL = IsUrl(ListerrorTraning[i].Url);
                Uri myUri1;
                if (!Uri.TryCreate(ListerrorTraning[i].Url, UriKind.RelativeOrAbsolute, out myUri1) || checkURL == false)
                {
                    errorLine[9] += (Convert.ToInt32(ListerrorTraning[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // cho vào list lỗi @@
                if (loi > 0)
                {
                    errorlist.Add(ListerrorTraning[i]);
                    // thêm biến đếm số dòng lỗi được thêm vào.                   
                    ListerrorTraning.RemoveAt(i);
                    i = i - 1;
                }            
            }
            errorLine[0] = count.ToString();
            Session["errorLineLap1"] = errorLine;
            Session["ListerrorTraning"] = errorlist;
        }


        public void GhilaiTxtLoi(List<LapData> listerror)
        {
            // lấy dữ liệu trong file text traning ra LapDataTraning;
            string path2 = Server.MapPath("~/UploadedExcelFiles/ErrorLap.txt");
            if (System.IO.File.Exists(path2))
            {   
                // tảo mảng mới chứa dữ dữ liệu trùng.
                string[] newlines = new string[listerror.Count];
                for (int i = 0; i < listerror.Count; i++)
                {
                    string newline = "";
                    newline += listerror[i].Name + "|" + listerror[i].Imagelink + "|" +
                                   listerror[i].CPU + "|" + listerror[i].VGA + "|" +
                                   listerror[i].HDD + "|" + listerror[i].Display + "|" +
                                   listerror[i].RAM + "|" + listerror[i].Price + "|" + listerror[i].Url;
                    newline = newline.Substring(0, newline.Length - 1);
                    newlines[i] = newline;
                }
                //Gộp hai bảng thành mảng mới và lưu vào txt lại           
                // ghi lại vào txt
                System.IO.File.WriteAllLines(path2, newlines);
            }

        }

        /// <summary>
        /// Sản phẩm lỗi đã được sửa.
        /// </summary>
        /// <param name="delstt"></param>
        /// <returns></returns>
        public ActionResult fixedErrorProduct(String stringpro)
        {
            if (!stringpro.Equals("nothing"))
            {
                // get list product in session.
                List<LapData> listpro = (List<LapData>)Session["listproductLapT"];
                List<LapData> listerror = (List<LapData>)Session["ListerrorTraning"];
                // số sản phẩm lỗi trước khi được test
                int count1 = listerror.Count;
                List<List<LapData>> listduplicate = (List<List<LapData>>)Session["ListdupLaptraning"];

                if (listpro == null)
                {
                    listpro = new List<LapData>();
                }
                if (listduplicate == null)
                {
                    listduplicate = new List<List<LapData>>();
                }
                
                String[] info = stringpro.ToString().Split('@');
                string stt = info[0].Trim();
                string Name = info[1].Trim();
                string ImageLink = info[2].Trim();
                string CPU = info[3].Trim();
                string VGA = info[4].Trim();
                string HDD = info[5].Trim();
                string Display = info[6].Trim();
                string Ram = info[7].Trim();
                string Price = info[8].Trim();
                string Url = info[9].Trim();
                //gán vào list mới để kiểm tra
                List<LapData> newlisterror = listerror;
                foreach (LapData l in newlisterror)
                {
                    if (l.stt.Equals(stt))
                    {
                        l.Name = Name;
                        l.Imagelink = ImageLink;
                        l.CPU = CPU;
                        l.VGA = VGA;
                        l.HDD = HDD;
                        l.Display = Display;
                        l.RAM = Ram;
                        l.Price = Price;
                        l.Url = Url;
                        break;
                    }
                }
                List<LapData> newlisterror1 = ListErrorProduct(newlisterror);
                // gọi hàm kiểm tra lỗi và đếm xem có bao nhiêu sản phẩm lỗi
                int count2 = newlisterror1.Count;
                // nếu phát hiện số sản phẩm lỗi giảm đi 1 thì kiểm tra trùng với list pro và list dup, xóa trong list error
                if ((count1 - count2) == 1)
                {
                    // xóa sản phẩm trong list error và cập nhập vào session
                    LapData delpro = new LapData();
                    foreach (LapData p in newlisterror1)
                    {
                        if (p.stt.Equals(stt))
                        {
                            delpro = p;
                            break;
                        }
                    }
                    listerror.Remove(delpro);
                    Session["ListerrorTraning"] = newlisterror1;
                    // xử lý sản phẩm lỗi đã được update.
                    LapData update = new LapData();
                    update.stt = stt.Trim();
                    update.Name = Name.Trim();
                    update.Imagelink = ImageLink.Trim();
                    update.CPU = CPU.Trim();
                    update.VGA = VGA.Trim();
                    update.HDD = HDD.Trim();
                    update.Display = Display.Trim();
                    update.RAM = Ram.Trim();
                    update.Price = Price.Trim();
                    update.Url = Url.Trim();
                    // so trùng với correct list và duplicate list
                    List<LapData> listtam = new List<LapData>();
                    listtam.Add(update);

                    if (listpro != null)
                    {
                    
                    //Duyệt hết list correct
                    for (int i = 0; i < listpro.Count; i++)
                    {
                        // nếu phát hiện trùng
                        if (CompareStringHelper.CompareString(listpro[i].Name.ToString(), update.Name) >= 80)
                        {
                            listtam.Add(listpro[i]);
                            listpro.Remove(listpro[i]);
                            i--;
                        }
                    }
                    }
                    //Kiểm tra xem list tạm lớn hơn 1 tức là trong correct product có trùng.
                    if (listtam.Count > 1)
                    {
                        listduplicate.Add(listtam);
                    }
                    // trong correct ko trùng thì bay qua list duplicate tìm trùng.
                    else
                    {
                        if (listduplicate != null)
                        {
                            int count = 0;
                            for (int i = 0; i < listduplicate.Count; i++)
                            {
                                if (CompareStringHelper.CompareString(listduplicate[i][0].Name.ToString(), update.Name) >= 80)
                                {
                                    listduplicate[i].Add(update);
                                    count++;
                                    break;
                                }
                            }
                            if (count == 0)
                            {
                                listpro.Add(update);
                            }
                        }
                    }
                }
                // update listerrorLap
                if ((count1 - count2) == 0)
                {
                    Session["ListerrorTraning"] = newlisterror1;
                }
                //update listError and listDuplicate
                Session["listproductLapT"] = listpro;
                Session["ListdupLaptraning"] = listduplicate;
                GhilaiTxtLoi(newlisterror1);
            }

          
            ViewBag.listproduct = (List<LapData>)Session["listproductLapT"];
            ViewBag.listerror = (List<LapData>)Session["ListerrorTraning"];
      //      ViewBag.listduplicate = (List<List<LapData>>)Session["listduplicateLap"];
            // quá nhiều lỗi hiện thị ra dòng và sản phẩm bị lỗi.
        //    ViewBag.danhsachlaploi = (List<LapData>)Session["danhsachlaploi"];
            // dòng chứa lỗi
            ViewBag.errorLineLap = Session["errorLineLap1"];
            return View();
        }

        /// <summary>
        /// Get error product list
        /// </summary>
        /// <param name="list"></param>
        /// <returns></returns>
        public List<LapData> ListErrorProduct(List<LapData> list)
        {
            List<LapData> errorlist = new List<LapData>();
            // quá nhiều lỗi
            List<String> errorLine = new List<String>();
            // list dòng lỗi 1 Name, 2 Linkimage, 3 Display, 4 CPU, 5 HDD, 6 VGA, 7 Ram, 8 Price, 9 URL
            for (int i = 0; i < 10; i++)
            {
                errorLine.Add("");
            }
            int count = 0;
            for (int i = 0; i < list.Count; i++)
            {
                int loi = 0;

                // dòng lỗi tên Lap
                if (list[i].Name.Length < 5 || list[i].Name.Length > 100)
                {
                    errorLine[1] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }

                // dòng lỗi link ảnh lap
                list[i].Imagelink = list[i].Imagelink.Trim();

                bool checkimage = IsImageUrl(list[i].Imagelink);
                Uri myUri;
                if (!Uri.TryCreate(list[i].Imagelink, UriKind.RelativeOrAbsolute, out myUri) || checkimage == false)
                {
                    errorLine[2] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi Display
                if (list[i].Display.Length < 1 || list[i].Display.Length > 100)
                {
                    errorLine[3] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }

                // dòng lỗi CPU
                if (list[i].CPU.Length < 5 || list[i].CPU.Length > 100)
                {
                    errorLine[4] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi HDD
                //int distance;
                //if (!int.TryParse(list[i].HDD, out distance))
                //{
                if (list[i].HDD.Length < 1 || list[i].HDD.Length > 100)
                {
                    errorLine[5] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi VGA
                if (list[i].VGA.Length < 5 || list[i].VGA.Length > 100)
                {
                    errorLine[6] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi Ram
                /*int distance1;
                if (!int.TryParse(list[i].RAM, out distance1))
                { */
                if (list[i].RAM.Length < 1 || list[i].RAM.Length > 100)
                {
                    errorLine[7] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }


                // dòng lỗi Price
                double distance1;
                if (!double.TryParse(list[i].Price, out distance1))
                {
                    errorLine[8] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi URL
                list[i].Url = list[i].Url.Trim();
                bool checkURL = IsUrl(list[i].Url);
                Uri myUri1;
                if (!Uri.TryCreate(list[i].Url, UriKind.RelativeOrAbsolute, out myUri1) || checkURL == false)
                {
                    errorLine[9] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // cho vào list lỗi @@
                if (loi > 0)
                {
                    errorlist.Add(list[i]);
                    // thêm biến đếm số dòng lỗi được thêm vào.                   
                    list.RemoveAt(i);
                    i = i - 1;
                }
            }
            errorLine[0] = count.ToString();
            Session["errorLineLap1"] = errorLine;
            return errorlist;
        }

        /// <summary>
        /// Lưu dữ liệu đúng vào database
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult saveAllProduct(String checkval)
        {
            using (CPS_SolutionEntities db = new CPS_SolutionEntities())
            {
                // get list product in session.
                List<LapData> listpro = (List<LapData>)Session["listproductLapT"];
                List<LapData> listerror = (List<LapData>)Session["listerrorLapT"];
                List<List<LapData>> listduplicate = (List<List<LapData>>)Session["ListdupLaptraning"];
                //ghi logfile---------------------------------------------------------------------------------
                String[] ghilog = checkval.ToString().Split('@');

                // nếu có check  ghi log sản phẩm  Duplicate chờ traning sau
                #region ghilog Duplicate
                if (!ghilog[0].Equals("no"))
                {
                    // lấy dữ liệu trong file text traning ra LapDataTraning;
                    string path = Server.MapPath("~/UploadedExcelFiles/LapDataTraning.txt");
                    if (System.IO.File.Exists(path))
                    {   // lấy hết dòng trong file txt ra.
                        string[] lines = System.IO.File.ReadAllLines(path);
                        // tảo mảng mới chứa dữ dữ liệu trùng.
                        string[] newlines = new string[listduplicate.Count];
                        for (int i = 0; i < listduplicate.Count; i++)
                        {
                            string newline = "";
                            for (int j = 0; j < listduplicate[i].Count; j++)
                            {
                                newline += listduplicate[i][j].Name + "|" + listduplicate[i][j].Imagelink + "|" +
                                           listduplicate[i][j].CPU + "|" + listduplicate[i][j].VGA + "|" +
                                           listduplicate[i][j].HDD + "|" + listduplicate[i][j].Display + "|" +
                                           listduplicate[i][j].RAM + "|" + listduplicate[i][j].Price + "|" + listduplicate[i][j].Url + "#";
                            }
                            newline = newline.Substring(0, newline.Length - 1);
                            newlines[i] = newline;
                        }
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
                Session["ListdupLaptraning"] = null;
                #endregion
                // nếu có check ghilog Error
                #region ghilog ErrorProduct
                if (!ghilog[1].Equals("no"))
                {

                    // lấy dữ liệu trong file text traning ra LapDataTraning;
                    string path2 = Server.MapPath("~/UploadedExcelFiles/ErrorLap.txt");
                    if (System.IO.File.Exists(path2))
                    {   // lấy hết dòng trong file txt ra.
                        string[] lines = System.IO.File.ReadAllLines(path2);
                        // tảo mảng mới chứa dữ dữ liệu trùng.
                        string[] newlines = new string[listduplicate.Count];
                        for (int i = 0; i < listerror.Count; i++)
                        {
                            string newline = "";
                            newline += listerror[i].Name + "|" + listerror[i].Imagelink + "|" +
                                           listerror[i].CPU + "|" + listerror[i].VGA + "|" +
                                           listerror[i].HDD + "|" + listerror[i].Display + "|" +
                                           listerror[i].RAM;
                            newline = newline.Substring(0, newline.Length - 1);
                            newlines[i] = newline;
                        }
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
                        System.IO.File.WriteAllLines(path2, save);
                    }

                }
                #endregion
                Session["listerrorLapT"] = null;


                // Tạo listduplicate mới chứa trùng giữa listpro và trong database
                List<List<LapData>> listduplicatenew = new List<List<LapData>>();

                //lấy product trong database ra.
                List<Product> listproindatabase = new List<Product>();
                var liproduct = (from x in db.Products select x);
                listproindatabase = liproduct.ToList();

                // tìm sản phẩm trùng cho vào list trùng hoặc xóa đi :|
                #region so trùng trong database
                for (int j = 0; j < listproindatabase.Count; j++)
                {
                    List<LapData> duplicateProduct = new List<LapData>();
                    for (int i = 0; i < listpro.Count; i++)
                    {
                        String Name = "";
                        String[] mangten = listpro[i].Name.ToString().Split(';');
                        if (mangten.Length >= 2)
                        {
                            Name = mangten[0];
                        }
                        else
                        {
                            Name = listpro[i].Name;
                        }

                        // Nếu product trong database không có tên cũng bỏ qua.
                        if (listproindatabase[j].Name == null)
                        {
                            listproindatabase.RemoveAt(j);
                            j--;
                            break;
                        }
                        //nếu đã có trong database thì xóa đi.
                        if (listproindatabase[j].Name.ToString().Equals(Name))
                        {
                            listproindatabase.RemoveAt(j);
                            listpro.RemoveAt(i);
                            i--;
                            j--;
                            break;
                        }

                        //---- lấy sản phầm trùng cho vào list trùng với sản phẩm trong database------------------------------------------------------------
                        if (CompareStringHelper.CompareString(Name, listproindatabase[j].Name.ToString()) >= 80)
                        {
                            LapData pro = new LapData();
                            pro.stt = listproindatabase[j].ID.ToString();
                            int stt = listproindatabase[j].ID;
                            pro.Imagelink = listproindatabase[j].ImageURL;
                            pro.Name = listproindatabase[j].Name;
                            pro.Price = listproindatabase[j].Price.ToString();
                            pro.Url = listproindatabase[j].URL;
                            // lấy CPU của product ra
                            var idAttrC = (from a in db.ProductAttributes where a.Hardware.CodetypeID.Equals("C") && a.ProductID == stt select a.AttributeID).SingleOrDefault();
                            if (idAttrC == 0)
                            {
                                pro.CPU = "Đang chờ xử lý";
                            }
                            else
                            {
                                int idCPU = Convert.ToInt32(idAttrC.ToString());
                                var CPU = (from a in db.Hardwares where a.ID.Equals(idCPU) select a.Name).FirstOrDefault();
                                pro.CPU = CPU.ToString();
                            }
                            // lấy VGA của product ra
                            var idAttrV = (from a in db.ProductAttributes where a.Hardware.CodetypeID.Equals("V") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                            if (idAttrV == 0)
                            {
                                pro.VGA = "Đang chờ xử lý";
                            }
                            else
                            {
                                int idVGA = Convert.ToInt32(idAttrV.ToString());
                                var VGA = (from a in db.Hardwares where a.ID.Equals(idVGA) select a.Name).FirstOrDefault();
                                pro.VGA = VGA.ToString();

                            }
                            // lấy HDD của product ra
                            var idAttrH = (from a in db.ProductAttributes where a.Hardware.CodetypeID.Equals("H") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                            if (idAttrH == 0)
                            {
                                pro.HDD = "Đang chờ xử lý";
                            }
                            else
                            {
                                int idHDD = Convert.ToInt32(idAttrH.ToString());
                                var HDD = (from a in db.Hardwares where a.ID.Equals(idHDD) select a.Name).FirstOrDefault();
                                pro.HDD = HDD.ToString();

                            }
                            // lấy Display  của product ra
                            var idAttrD = (from a in db.ProductAttributes where a.Hardware.CodetypeID.Equals("D") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                            if (idAttrD == 0)
                            {
                                pro.Display = "Đang chờ xử lý";
                            }
                            else
                            {
                                int idDisplay = Convert.ToInt32(idAttrD.ToString());
                                var Display = (from a in db.Hardwares where a.ID.Equals(idDisplay) select a.Name).FirstOrDefault();
                                pro.Display = Display.ToString();
                            }
                            // lấy RAM   của product ra
                            var idAttrR = (from a in db.ProductAttributes where a.Hardware.CodetypeID.Equals("R") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                            if (idAttrR == 0)
                            {
                                pro.RAM = "Đang chờ xử lý";
                            }
                            else
                            {
                                int idRAM = Convert.ToInt32(idAttrR.ToString());
                                var RAM = (from a in db.Hardwares where a.ID.Equals(idRAM) select a.Name).FirstOrDefault();
                                pro.RAM = RAM.ToString();
                            }
                            // add list dup
                            duplicateProduct.Add(pro);
                            listpro[i].stt = "z" + listpro[i].stt;
                            duplicateProduct.Add(listpro[i]);
                            listpro.RemoveAt(i);
                            i--;
                            break;
                        }

                    }
                    if (duplicateProduct.Count >= 2)
                    {
                        listduplicatenew.Add(duplicateProduct);
                        Session["listduplicatenewLapT"] = listduplicatenew;
                    }
                }
                #endregion

                // lấy cái id mới nhất trong db ra để khi lưu atribute biết hard mới hay là dùng lại hard cũ lưu true false
                int idBig = 0;
                var listHar = db.Hardwares.ToList();
                if (listHar.Count > 0)
                {
                    var hddBig = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                    idBig = hddBig.ID;
                }
                // -----sản phẩm còn lại lưu vào database-------------------------------------------------------              
                for (int i = 0; i < listpro.Count; i++)
                {
                    //----------------------------- kiểm tra sản phẩm trong listpro có bị trùng linh kiện ko---------------------------
                    #region Lấy CPU VGA HDD Display Ram cho vào danh sách riêng để kiểm tra trùng linh kiện
                    // lấy hết CPU trong db ra
                    var listCPUdb = (from a in db.Hardwares where a.CodetypeID.Equals("C") && a.IsActive == true select a);
                    List<Hardware> listCPU = listCPUdb.ToList();
                    // lấy hết VGA trong db ra
                    var listVGAdb = (from a in db.Hardwares where a.CodetypeID.Equals("V") && a.IsActive == true select a);
                    List<Hardware> listVGA = listVGAdb.ToList();
                    // lấy hết HDD trong db ra
                    var listHDDdb = (from a in db.Hardwares where a.CodetypeID.Equals("H") && a.IsActive == true select a);
                    List<Hardware> listHDD = listHDDdb.ToList();
                    // lấy hết Display trong db ra
                    var listDisplaydb = (from a in db.Hardwares where a.CodetypeID.Equals("D") && a.IsActive == true select a);
                    List<Hardware> listDisplay = listDisplaydb.ToList();
                    // lấy hết Ram trong db ra
                    var listRamdb = (from a in db.Hardwares where a.CodetypeID.Equals("R") && a.IsActive == true select a);
                    List<Hardware> listRam = listRamdb.ToList();
                    #endregion
                    
                    #region Kiểm tra trùng link kiện để ghilog txt
                    string errorCPU = "";
                    Hardware CPU = new Hardware();
                    string errorVGA = "";
                    Hardware VGA = new Hardware();
                    string errorHDD = "";
                    Hardware HDD = new Hardware();
                    string errorDisplay = "";
                    Hardware Display = new Hardware();
                    string errorRam = "";
                    Hardware Ram = new Hardware();
                    int errorCount = 0;
                    // trùng CPU 1 
                    int c1 = 0;
                    var DictionaryC1 = (from a in db.Dictionaries where a.Hardware.CodetypeID == "C" select a);
                    List<Dictionary> listDicC1 = DictionaryC1.ToList();
                    for (int x = 0; x < listDicC1.Count; x++)
                    {
                        if (listpro[i].CPU.Trim().Equals(listDicC1[x].Name.Trim()))
                        {
                            c1++;
                            break;
                        }

                    }
                    if (c1 == 0)
                    {
                        for (int x = 0; x < listCPU.Count; x++)
                        {
                            if (CompareStringHelper.CompareString(listpro[i].CPU.Trim(), listCPU[x].Name.Trim()) >= 80)
                            {
                                CPU = listCPU[x];
                                errorCount++;
                                errorCPU = listCPU[x].Name;
                                break;
                            }
                        }
                    }

                    // trùng VGA 2
                    int v2 = 0;
                    var DictionaryV2 = (from a in db.Dictionaries where a.Hardware.CodetypeID == "V" select a);
                    List<Dictionary> listDicV2 = DictionaryV2.ToList();
                    for (int x = 0; x < listDicV2.Count; x++)
                    {
                        if (listpro[i].VGA.Trim().Equals(listDicV2[x].Name.Trim()))
                        {
                            v2++;
                            break;
                        }
                    }
                    if (v2 == 0)
                    {
                        for (int x = 0; x < listVGA.Count; x++)
                        {
                            if (CompareStringHelper.CompareString(listpro[i].VGA.Trim(), listVGA[x].Name.Trim()) >= 80)
                            {
                                VGA = listVGA[x];
                                errorCount++;
                                errorVGA = listVGA[x].Name;
                                break;
                            }
                        }
                    }
                    // trùng HDD 3
                    int h3 = 0;
                    var DictionaryH3 = (from a in db.Dictionaries where a.Hardware.CodetypeID == "H" select a);
                    List<Dictionary> listDicH3 = DictionaryH3.ToList();
                    for (int x = 0; x < listDicH3.Count; x++)
                    {
                        if (listpro[i].HDD.Trim().Equals(listDicH3[x].Name.Trim()))
                        {
                            h3++;
                            break;
                        }
                    }
                    if (h3 == 0)
                    {
                        for (int x = 0; x < listHDD.Count; x++)
                        {
                            if (CompareStringHelper.CompareString(listpro[i].HDD.Trim(), listHDD[x].Name.Trim()) >= 80)
                            {
                                HDD = listHDD[x];
                                errorCount++;
                                errorHDD = listHDD[x].Name;
                                break;
                            }
                        }
                    }
                    // trùng Display 4
                    int d4 = 0;
                    var DictionaryD4 = (from a in db.Dictionaries where a.Hardware.CodetypeID == "D" select a);
                    List<Dictionary> listDicD4 = DictionaryD4.ToList();
                    for (int x = 0; x < listDicD4.Count; x++)
                    {
                        if (listpro[i].Display.Trim().Equals(listDicD4[x].Name.Trim()))
                        {
                            d4++;
                            break;
                        }

                    }
                    if (d4 == 0)
                    {
                        for (int x = 0; x < listDisplay.Count; x++)
                        {
                            if (CompareStringHelper.CompareString(listpro[i].Display.Trim(), listDisplay[x].Name.Trim()) >= 80)
                            {
                                Display = listDisplay[x];
                                errorCount++;
                                errorDisplay = listDisplay[x].Name;
                                break;
                            }
                        }
                    }
                    // trùng Ram
                    int r5 = 0;
                    var DictionaryR5 = (from a in db.Dictionaries where a.Hardware.CodetypeID == "R" select a);
                    List<Dictionary> listDicR5 = DictionaryR5.ToList();
                    for (int x = 0; x < listDicR5.Count; x++)
                    {
                        if (listpro[i].RAM.Trim().Equals(listDicR5[x].Name.Trim()))
                        {
                            r5++;
                            break;
                        }

                    }
                    if (r5 == 0)
                    {
                        for (int x = 0; x < listRam.Count; x++)
                        {
                            if (CompareStringHelper.CompareString(listpro[i].RAM.Trim(), listRam[x].Name.Trim()) >= 80)
                            {
                                Ram = listRam[x];
                                errorCount++;
                                errorRam = listRam[x].Name;
                                break;
                            }
                        }
                    }

                    #endregion
                    //-----------------------------------------------------------------------------------------------------------------
                    //------- lưu những sản phẩm có linh kiện trùng và lưu linh kiện trùng với id sản phẩm vào logfile-----------------
                    if (errorCount > 0)
                    {
                        #region  lưu product và product alias
                        Product p = new Product();
                        string urlServer = urlImageServer(listpro[i].Imagelink);
                        p.ImageURL = urlServer;
                        p.Price = 0;
                        p.TotalWeightPoint = 0;
                     //   p.IsActive = false;

                        // lưu vào database
                        db.Products.Add(p);
                        db.SaveChanges();
                        #region lấy id store hoặc lưu mới cho laptop
                        string urlcontent = listpro[i].Url;
                        var store = db.Stores.Where(x => urlcontent.Contains(x.StoreUrl)).FirstOrDefault();
                        int StoreID = 1;
                        string patter = "://|/";
                        Regex reg = new Regex(patter);
                        string host = reg.Split(listpro[i].Url)[1];
                        if (store != null)
                        {
                            StoreID = store.ID;
                        }
                        else
                        {
                            var newStore = new Store
                            {
                                IsActive = false,
                                LogoImage = "default",
                                StoreUrl = host,
                                StoreName = "Chưa xác định",

                            };
                            db.Stores.Add(newStore);
                            db.SaveChanges();
                            StoreID = newStore.ID;
                        }
                        #endregion
                        // lấy id brand của Laptop
                        int brandID = BrandID(listpro[i].Name);
                        String[] mangten = listpro[i].Name.ToString().Split(';');
                        // nếu mảng tên >=2 thì lưu cái tên đầu tiên làm tên chính.
                        if (mangten.Length >= 2)
                        {
                            var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            int idinsert = Convert.ToInt32(pronew.ID);
                            AliasProduct proAli = new AliasProduct();
                            proAli.Name = mangten[0];
                            proAli.ProductID = idinsert;
                            proAli.Price = Convert.ToDouble(listpro[i].Price);
                            proAli.StoreID = StoreID;
                            proAli.UpdateTime = DateTime.Now;
                            if (brandID > 0)
                            {
                                proAli.BrandID = brandID;
                            }
                            proAli.URL = listpro[i].Url;
                            proAli.IsMain = true;
                            proAli.IsActive = true;
                            db.AliasProducts.Add(proAli);
                            db.SaveChanges();
                        }
                        // nếu không thì lưu làm tên chính luôn.
                        else
                        {
                            var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            int idinsert = Convert.ToInt32(pronew.ID);
                            AliasProduct proAli = new AliasProduct();
                            proAli.Name = mangten[0];
                            proAli.ProductID = idinsert;
                            proAli.Price = Convert.ToDouble(listpro[i].Price);
                            proAli.StoreID = StoreID;
                            proAli.UpdateTime = DateTime.Now;
                            if (brandID > 0)
                            {
                                proAli.BrandID = brandID;
                            }
                            proAli.URL = listpro[i].Url;
                            proAli.IsMain = true;
                            proAli.IsActive = true;
                            db.AliasProducts.Add(proAli);
                            db.SaveChanges();
                        }

                        // lấy max ID và thêm vào bảng alias tên phụ
                        if (mangten.Length >= 2)
                        {
                            // lấy id của sản phẩm mới được insert vào db
                            var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            int idinsert = Convert.ToInt32(pronew.ID);
                            // bỏ tên đầu tiên vì lưu làm tên chính rồi lưu tên phụ
                            for (int h = 1; h < mangten.Length; h++)
                            {
                                AliasProduct proAli = new AliasProduct();
                                proAli.Name = mangten[h];
                                proAli.ProductID = idinsert;
                                proAli.Price = Convert.ToDouble(listpro[i].Price);
                                proAli.StoreID = StoreID;
                                proAli.UpdateTime = DateTime.Now;
                                if (brandID > 0)
                                {
                                    proAli.BrandID = brandID;
                                }
                                proAli.URL = listpro[i].Url;
                                proAli.IsMain = false;
                                proAli.IsActive = true;
                                db.AliasProducts.Add(proAli);
                                db.SaveChanges();
                            }

                        }
                        #endregion
                        string[] lines = null;
                        // lấy txt ra
                        string path = Server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
                        if (System.IO.File.Exists(path))
                        {
                            lines = System.IO.File.ReadAllLines(path);
                        }
                        string[] newline = new string[errorCount];
                        // lấy id để lưu vào bảng productAtribute
                        int idCPU1 = 0;
                        int idVGA2 = 0;
                        int idHDD3 = 0;
                        int idDisplay4 = 0;
                        int idRam5 = 0;
                        // vị trí lưu trong mảng newline
                        int vitriluu = 0;
                        // id CPU 1
                        #region
                        // nếu có trong database rồi thì lấy ID sản phẩm có rồi
                        for (int x = 0; x < listCPU.Count; x++)
                        {
                            int dicID = listCPU[x].ID;
                            var DictionaryCPU = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                            List<Dictionary> listDicCPU = DictionaryCPU.ToList();
                            for (int z = 0; z < listDicCPU.Count; z++)
                            {
                                if (listpro[i].CPU.Trim().Equals(listDicCPU[z].Name.Trim()))
                                {
                                    idCPU1 = listCPU[x].ID;
                                    break;
                                }
                            }

                        }
                        // nếu chưa có
                        if (idCPU1 == 0)
                        {   // chưa có mà bị trùng trong database thì ghi log
                            if (!errorCPU.Equals(""))
                            {
                                var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                int idpro = Convert.ToInt32(pronew.ID);
                                newline[vitriluu] = idpro.ToString() + '~' + CPU.Name + '|' + CPU.CodetypeID.ToString() + '|' + CPU.WeightCriteraPoint + '|' + CPU.ID + '#' + listpro[i].CPU + '|' + '|' + '|';
                                vitriluu++;
                            }
                            else
                            {
                                // Lưu mới CPU và get ID mới lưu
                                Hardware atcpu = new Hardware();
                                atcpu.CodetypeID = "C";
                                atcpu.Name = listpro[i].CPU;
                                atcpu.WeightCriteraPoint = 0;
                          //      atcpu.IsActive = false;
                                db.Hardwares.Add(atcpu);
                                db.SaveChanges();
                                //get id vừa mới lưu

                                var cpunew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                idCPU1 = Convert.ToInt32(cpunew.ID);

                                // lưu name vào Attibute Alias và để isactive là false
                                Dictionary atcpuMap = new Dictionary();
                                atcpuMap.AttributeDicID = cpunew.ID;
                                atcpuMap.Name = listpro[i].CPU;
                                atcpuMap.IsActive = true;
                                db.Dictionaries.Add(atcpuMap);
                                db.SaveChanges();

                            }
                        }
                        #endregion
                        #region //nếu List CPU là rỗng code comment

                        //if (listCPU.Count == 0)
                        //{
                        //    if (!errorCPU.Equals(""))
                        //    {
                        //        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        //        int idpro = Convert.ToInt32(pronew.ID);
                        //        newline[0] = idpro.ToString() + '~' + errorCPU + ';' + listpro[i].CPU;
                        //        vitriluu++;
                        //    }
                        //    else
                        //    {
                        //        // Lưu mới CPU và get ID mới lưu
                        //        AttributeDictionary atcpu = new AttributeDictionary();
                        //        atcpu.CodetypeID = "C";
                        //        atcpu.Name = listpro[i].CPU;
                        //        atcpu.WeightCriteraPoint = 0;
                        //        db.AttributeDictionaries.Add(atcpu);
                        //        db.SaveChanges();
                        //        //get id vừa mới lưu
                        //        var cpunew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        //        idCPU1 = Convert.ToInt32(cpunew.ID);

                        //        // lưu name vào Attibute Alias và để isactive là false
                        //        AttributeMapping atcpuMap = new AttributeMapping();
                        //        atcpuMap.AttributeDicID = cpunew.ID;
                        //        atcpuMap.Name = listpro[i].CPU;
                        //        atcpuMap.IsActive = true;
                        //        db.AttributeMappings.Add(atcpuMap);
                        //        db.SaveChanges();
                        //    }
                        //}
                        #endregion
                        // id VGA 2
                        #region
                        // kiểm tra xem có trong database chưa có rồi thì lấy ID đã có
                        for (int x = 0; x < listVGA.Count; x++)
                        {

                            int dicID = listVGA[x].ID;
                            var DictionaryVGA = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                            List<Dictionary> listDicVGA = DictionaryVGA.ToList();
                            for (int z = 0; z < listDicVGA.Count; z++)
                            {
                                if (listpro[i].VGA.Trim().Equals(listDicVGA[z].Name.Trim()))
                                {
                                    idVGA2 = listVGA[x].ID;
                                    break;
                                }
                            }

                        }
                        // nếu chưa có trong database
                        if (idVGA2 == 0)
                        {
                            // nếu VGA là trùng
                            if (!errorVGA.Equals(""))
                            {
                                var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                int idpro = Convert.ToInt32(pronew.ID);
                                newline[vitriluu] = idpro.ToString() + '~' + VGA.Name + '|' + VGA.CodetypeID.ToString() + '|' + VGA.WeightCriteraPoint + '|' + VGA.ID + '#' + listpro[i].VGA + '|' + '|' + '|';
                                vitriluu++;
                            }
                            // ko trùng thì lưu VGA mới vào database và lấy ID
                            else
                            {
                                // lưu VGA mới và get id mới lưu
                                Hardware atvga = new Hardware();
                                atvga.CodetypeID = "V";
                                atvga.Name = listpro[i].VGA;
                                atvga.WeightCriteraPoint = 0;
                      //          atvga.IsActive = false;
                                db.Hardwares.Add(atvga);
                                db.SaveChanges();
                                var vganew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                idVGA2 = Convert.ToInt32(vganew.ID);

                                // lưu name vào Attibute Alias và để isactive là true
                                Dictionary atvgaMap = new Dictionary();
                                atvgaMap.AttributeDicID = vganew.ID;
                                atvgaMap.Name = listpro[i].VGA;
                                atvgaMap.IsActive = true;
                                db.Dictionaries.Add(atvgaMap);
                            }
                        }
                        #endregion
                        #region // nếu list VGA là rỗng code comment

                        // if (listVGA.Count == 0)
                        //{
                        //     // nếu VGA là trùng
                        //    if (!errorVGA.Equals(""))
                        //    {
                        //        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        //        int idpro = Convert.ToInt32(pronew.ID);
                        //        newline[vitriluu] = idpro.ToString() + '~' + errorVGA + ';' + listpro[i].VGA;
                        //        vitriluu++;
                        //    }
                        //    // ko trùng thì lưu VGA mới vào database và lấy ID
                        //    else
                        //    {
                        //        AttributeDictionary atvga = new AttributeDictionary();
                        //        atvga.CodetypeID = "V";
                        //        atvga.Name = listpro[i].VGA;
                        //        atvga.WeightCriteraPoint = 0;
                        //        db.AttributeDictionaries.Add(atvga);
                        //        db.SaveChanges();
                        //        var vganew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        //        idVGA2 = Convert.ToInt32(vganew.ID);

                        //        // lưu name vào Attibute Alias và để isactive là true
                        //        AttributeMapping atvgaMap = new AttributeMapping();
                        //        atvgaMap.AttributeDicID = vganew.ID;
                        //        atvgaMap.Name = listpro[i].VGA;
                        //        atvgaMap.IsActive = true;
                        //        db.AttributeMappings.Add(atvgaMap);
                        //        db.SaveChanges();
                        //    }
                        //}
                        #endregion
                        // id HDD 3
                        #region
                        // nếu có rồi trong database thì lấy ID ra
                        for (int x = 0; x < listHDD.Count; x++)
                        {
                            int dicID = listHDD[x].ID;
                            var DictionaryHDD = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                            List<Dictionary> listDicHDD = DictionaryHDD.ToList();
                            for (int z = 0; z < listDicHDD.Count; z++)
                            {
                                if (listpro[i].HDD.Trim().Equals(listDicHDD[z].Name.Trim()))
                                {
                                    idHDD3 = listHDD[x].ID;
                                    break;
                                }
                            }

                        }
                        // nếu chưa có trong database
                        if (idHDD3 == 0)
                        {
                            // nếu HDD là trùng
                            if (!errorHDD.Equals(""))
                            {
                                var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                int idpro = Convert.ToInt32(pronew.ID);
                                newline[vitriluu] = idpro.ToString() + '~' + HDD.Name + '|' + HDD.CodetypeID.ToString() + '|' + HDD.WeightCriteraPoint + '|' + HDD.ID + '#' + listpro[i].HDD + '|' + '|' + '|';
                                vitriluu++;
                            }
                            // ko trùng thì lưu HDD mới vào database và lấy ID
                            else
                            {
                                Hardware athddd = new Hardware();
                                athddd.CodetypeID = "H";
                                athddd.Name = listpro[i].HDD;
                                athddd.WeightCriteraPoint = 0;
                    //            athddd.IsActive = false;
                                db.Hardwares.Add(athddd);
                                db.SaveChanges();
                                var hddnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                idHDD3 = Convert.ToInt32(hddnew.ID);


                                // lưu name vào Attibute Alias và để isactive là true
                                Dictionary athdddMap = new Dictionary();
                                athdddMap.AttributeDicID = hddnew.ID;
                                athdddMap.Name = listpro[i].HDD;
                                athdddMap.IsActive = true;
                                db.Dictionaries.Add(athdddMap);
                            }
                        }
                        #endregion
                        #region   // nếu list HDD là rỗng code comment

                        // if (listHDD.Count == 0)
                        //{  
                        //    // nếu HDD là trùng
                        //    if (!errorHDD.Equals(""))
                        //    {
                        //        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        //        int idpro = Convert.ToInt32(pronew.ID);
                        //        newline[vitriluu] = idpro.ToString() + '~' + errorHDD + ';' + listpro[i].HDD;
                        //        vitriluu++;
                        //    }
                        //    // ko trùng thì lưu HDD mới vào database và lấy ID
                        //    else
                        //    {
                        //        AttributeDictionary athddd = new AttributeDictionary();
                        //        athddd.CodetypeID = "H";
                        //        athddd.Name = listpro[i].HDD;
                        //        athddd.WeightCriteraPoint = 0;
                        //        db.AttributeDictionaries.Add(athddd);
                        //        db.SaveChanges();
                        //        var hddnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        //        idHDD3 = Convert.ToInt32(hddnew.ID);
                        //        // lưu name vào Attibute Alias và để isactive là true
                        //        AttributeMapping athdddMap = new AttributeMapping();
                        //        athdddMap.AttributeDicID = hddnew.ID;
                        //        athdddMap.Name = listpro[i].HDD;
                        //        athdddMap.IsActive = true;
                        //        db.AttributeMappings.Add(athdddMap);
                        //        db.SaveChanges();

                        //    }
                        //}
                        #endregion
                        // id Display 4
                        #region
                        // nếu có rồi trong database thì lấy id ra
                        for (int x = 0; x < listDisplay.Count; x++)
                        {

                            int dicID = listDisplay[x].ID;
                            var DictionaryDisplay = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                            List<Dictionary> listDicDisplay = DictionaryDisplay.ToList();
                            for (int z = 0; z < listDicDisplay.Count; z++)
                            {
                                if (listpro[i].Display.Trim().Equals(listDicDisplay[z].Name.Trim()))
                                {
                                    idDisplay4 = listDisplay[x].ID;
                                    break;
                                }
                            }

                        }
                        // nếu chưa có trong database
                        if (idDisplay4 == 0)
                        {
                            {
                                // nếu Display là trùng
                                if (!errorDisplay.Equals(""))
                                {
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idpro = Convert.ToInt32(pronew.ID);
                                    newline[vitriluu] = idpro.ToString() + '~' + Display.Name + '|' + Display.CodetypeID.ToString() + '|' + Display.WeightCriteraPoint + '|' + Display.ID + '#' + listpro[i].Display + '|' + '|' + '|';
                                    vitriluu++;
                                }
                                // ko trùng thì lưu Display mới vào database và lấy ID
                                else
                                {
                                    Hardware athdisp = new Hardware();
                                    athdisp.CodetypeID = "D";
                                    athdisp.Name = listpro[i].Display;
                                    athdisp.WeightCriteraPoint = 0;
                            //        athdisp.IsActive = false;
                                    db.Hardwares.Add(athdisp);
                                    db.SaveChanges();
                                    var dispnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    idDisplay4 = Convert.ToInt32(dispnew.ID);

                                    // lưu name vào Attibute Alias và để isactive là true
                                    Dictionary athdispMap = new Dictionary();
                                    athdispMap.AttributeDicID = dispnew.ID;
                                    athdispMap.Name = listpro[i].Display;
                                    athdispMap.IsActive = true;
                                    db.Dictionaries.Add(athdispMap);
                                    db.SaveChanges();
                                }
                            }
                        }
                        #endregion
                        #region  // nếu list Display là rỗng code comment
                        //if (listDisplay.Count == 0)
                        //{
                        //       // nếu Display là trùng
                        //    if (!errorDisplay.Equals(""))
                        //    {
                        //        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        //        int idpro = Convert.ToInt32(pronew.ID);
                        //        newline[vitriluu] = idpro.ToString() + '~' + errorDisplay + ';' + listpro[i].Display;
                        //        vitriluu++;
                        //    }
                        //    // ko trùng thì lưu Display mới vào database và lấy ID
                        //    else
                        //    {
                        //        AttributeDictionary athdisp = new AttributeDictionary();
                        //        athdisp.CodetypeID = "D";
                        //        athdisp.Name = listpro[i].Display;
                        //        athdisp.WeightCriteraPoint = 0;
                        //        db.AttributeDictionaries.Add(athdisp);
                        //        db.SaveChanges();
                        //        var dispnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        //        idDisplay4 = Convert.ToInt32(dispnew.ID);

                        //        // lưu name vào Attibute Alias và để isactive là true
                        //        AttributeMapping athdispMap = new AttributeMapping();
                        //        athdispMap.AttributeDicID = dispnew.ID;
                        //        athdispMap.Name = listpro[i].Display;
                        //        athdispMap.IsActive = true;
                        //        db.AttributeMappings.Add(athdispMap);
                        //        db.SaveChanges();
                        //    }
                        //}
                        #endregion
                        // id Ram 5
                        #region
                        // nếu có rồi trong database thì lấy id ra
                        for (int x = 0; x < listRam.Count; x++)
                        {
                            int dicID = listRam[x].ID;
                            var DictionaryRam = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                            List<Dictionary> listDicRam = DictionaryRam.ToList();
                            for (int z = 0; z < listDicRam.Count; z++)
                            {
                                if (listpro[i].RAM.Trim().Equals(listDicRam[z].Name.Trim()))
                                {
                                    idRam5 = listRam[x].ID;
                                    break;
                                }
                            }
                        }
                        // nếu chưa có trong database
                        if (idRam5 == 0)
                        {
                            // nếu Ram là trùng ghi log
                            if (!errorRam.Equals(""))
                            {
                                var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                int idpro = Convert.ToInt32(pronew.ID);
                                newline[vitriluu] = idpro.ToString() + '~' + Ram.Name + '|' + Ram.CodetypeID.ToString() + '|' + Ram.WeightCriteraPoint + '|' + Ram.ID + '#' + listpro[i].RAM + '|' + '|' + '|';
                                vitriluu++;
                            }
                            // ko trùng thì lưu Ram mới vào database và lấy ID
                            else
                            {
                                Hardware athram = new Hardware();
                                athram.CodetypeID = "R";
                                athram.Name = listpro[i].RAM;
                                athram.WeightCriteraPoint = 0;
                     //           athram.IsActive = false;
                                db.Hardwares.Add(athram);
                                db.SaveChanges();
                                var ramnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                idRam5 = Convert.ToInt32(ramnew.ID);

                                // lưu name vào Attibute Alias và để isactive là true
                                Dictionary athramMap = new Dictionary();
                                athramMap.AttributeDicID = ramnew.ID;
                                athramMap.Name = listpro[i].RAM;
                                athramMap.IsActive = true;
                                db.Dictionaries.Add(athramMap);
                            }
                        }
                        #endregion
                        #region  // nếu list Ram là rỗng code comment

                        //if (listRam.Count == 0)
                        //{ 
                        //           // nếu Ram là trùng ghi log
                        //    if (!errorRam.Equals(""))
                        //    {
                        //        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        //        int idpro = Convert.ToInt32(pronew.ID);
                        //        newline[vitriluu] = idpro.ToString() + '~' + errorRam + ';' + listpro[i].RAM;
                        //        vitriluu++;
                        //    }
                        //    // ko trùng thì lưu Display mới vào database và lấy ID
                        //    else
                        //    {
                        //        AttributeDictionary athram = new AttributeDictionary();
                        //        athram.CodetypeID = "R";
                        //        athram.Name = listpro[i].RAM;
                        //        athram.WeightCriteraPoint = 0;
                        //        db.AttributeDictionaries.Add(athram);
                        //        db.SaveChanges();
                        //        var ramnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        //        idRam5 = Convert.ToInt32(ramnew.ID);
                        //        // lưu name vào Attibute Alias và để isactive là true
                        //        AttributeMapping athramMap = new AttributeMapping();
                        //        athramMap.AttributeDicID = ramnew.ID;
                        //        athramMap.Name = listpro[i].RAM;
                        //        athramMap.IsActive = true;
                        //        db.AttributeMappings.Add(athramMap);
                        //        db.SaveChanges();
                        //    }
                        //}
                        #endregion

                        #region  Gộp hai mảng lại thành một rồi ghi đè lại vào file txt
                        //Gộp hai bảng thành mảng mới và lưu vào txt lại
                        string[] save = new string[lines.Length + newline.Length];
                        for (int e = 0; e < lines.Length; e++)
                        {
                            save[e] = lines[e];
                        }
                        for (int e = 0; e < newline.Length; e++)
                        {
                            save[e + lines.Length] = newline[e];
                        }
                        // ghi lại vào txt
                        System.IO.File.WriteAllLines(path, save);
                        #endregion

                        #region Lưu vào bảng productAtribute
                        // lấy id của sản phẩm mới được insert vào db
                        var pronewinsert = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        int idinsertnew = Convert.ToInt32(pronewinsert.ID);

                        // nếu CPU không trùng database
                        if (errorCPU.Equals(""))
                        {
                            //1 lưu idcpu vào bảng ProductAttribute
                            ProductAttribute atProCPU = new ProductAttribute();
                            atProCPU.AttributeID = idCPU1;
                            atProCPU.ProductID = idinsertnew;
                            if (idCPU1 > idBig)
                            {
                                atProCPU.IsActive = false;
                            }
                            else
                            {
                                atProCPU.IsActive = true;
                            }
                            db.ProductAttributes.Add(atProCPU);
                            db.SaveChanges();
                        }
                        if (errorRam.Equals(""))
                        {
                            //2 lưu idRam vào bảng ProductAttribute
                            ProductAttribute atProRam = new ProductAttribute();
                            atProRam.AttributeID = idRam5;
                            if (idRam5 > idBig)
                            {
                                atProRam.IsActive = false;
                            }
                            else
                            {
                                atProRam.IsActive = true;
                            }
                            atProRam.ProductID = idinsertnew;
                            db.ProductAttributes.Add(atProRam);
                            db.SaveChanges();
                        }
                        if (errorHDD.Equals(""))
                        {
                            //3 lưu idhdd vào bảng ProductAttribute
                            ProductAttribute atProHDD = new ProductAttribute();
                            atProHDD.AttributeID = idHDD3;
                            if (idHDD3 > idBig)
                            {
                                atProHDD.IsActive = false;
                            }
                            else
                            {
                                atProHDD.IsActive = true;
                            }
                            atProHDD.ProductID = idinsertnew;
                            db.ProductAttributes.Add(atProHDD);
                            db.SaveChanges();
                        }
                        if (errorDisplay.Equals(""))
                        {
                            //4 lưu idDisplay vào bảng ProductAttribute
                            ProductAttribute atProDisp = new ProductAttribute();
                            atProDisp.AttributeID = idDisplay4;
                            if (idDisplay4 > idBig)
                            {
                                atProDisp.IsActive = false;
                            }
                            else
                            {
                                atProDisp.IsActive = true;
                            }
                            
                            atProDisp.ProductID = idinsertnew;
                            db.ProductAttributes.Add(atProDisp);
                            db.SaveChanges();
                        }
                        if (errorVGA.Equals(""))
                        {
                            //5 lưu idvag vào bảng ProductAttribute
                            ProductAttribute atProVAG = new ProductAttribute();
                            atProVAG.AttributeID = idVGA2;
                            if (idVGA2 > idBig)
                            {
                                atProVAG.IsActive = false;
                            }
                            else
                            {
                                atProVAG.IsActive = true;
                            }
                            atProVAG.ProductID = idinsertnew;
                            db.ProductAttributes.Add(atProVAG);
                            db.SaveChanges();
                        }

                        #endregion
                        // thêm biến đếm số dòng lỗi được thêm vào.                   
                        listpro.RemoveAt(i);
                        i = i - 1;
                    }
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------
                    //------------------ Nếu không phát hiện trùng linh kiện thì cho add mới sản phẩm -----------------------------------------------------------------------
                    #region Lưu sản phẩm không có linh kiện nào bị trùng
                    if (errorCount == 0)
                    {
                        Product p = new Product();

                        string urlServer = urlImageServer(listpro[i].Imagelink);
                        p.ImageURL = urlServer;
                        p.Price = 0;
                        p.TotalWeightPoint = 0;
                    //    p.IsActive = false;

                        // lưu vào database
                        db.Products.Add(p);
                        db.SaveChanges();
                        #region lấy id store hoặc lưu mới cho laptop
                        string urlcontent = listpro[i].Url;
                        var store = db.Stores.Where(x => urlcontent.Contains(x.StoreUrl)).FirstOrDefault();
                        int StoreID = 1;
                        string patter = "://|/";
                        Regex reg = new Regex(patter);
                        string host = reg.Split(listpro[i].Url)[1];
                        if (store != null)
                        {
                            StoreID = store.ID;
                        }
                        else
                        {
                            var newStore = new Store
                            {
                                IsActive = false,
                                LogoImage = "default",
                                StoreUrl = host,
                                StoreName = "Chưa xác định",

                            };
                            db.Stores.Add(newStore);
                            db.SaveChanges();
                            StoreID = newStore.ID;
                        }
                        #endregion
                        // lấy id brand của Laptop
                        int brandID = BrandID(listpro[i].Name);

                        String[] mangten = listpro[i].Name.ToString().Split(';');
                        if (mangten.Length >= 2)
                        {
                            var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            int idinsert = Convert.ToInt32(pronew.ID);
                            AliasProduct proAli = new AliasProduct();
                            proAli.Name = mangten[0];
                            proAli.ProductID = idinsert;
                            proAli.Price = Convert.ToDouble(listpro[i].Price);
                            proAli.StoreID = StoreID;
                            proAli.UpdateTime = DateTime.Now;
                            if (brandID > 0)
                            {
                                proAli.BrandID = brandID;
                            }
                            proAli.URL = listpro[i].Url;
                            proAli.IsMain = true;
                            proAli.IsActive = true;
                            db.AliasProducts.Add(proAli);
                            db.SaveChanges();
                        }
                        else
                        {
                            var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            int idinsert = Convert.ToInt32(pronew.ID);
                            AliasProduct proAli = new AliasProduct();
                            proAli.Name = mangten[i];
                            proAli.ProductID = idinsert;
                            proAli.Price = Convert.ToDouble(listpro[i].Price);
                            proAli.StoreID = StoreID;
                            proAli.UpdateTime = DateTime.Now;
                            if (brandID > 0)
                            {
                                proAli.BrandID = brandID;
                            }
                            proAli.URL = listpro[i].Url;
                            proAli.IsMain = true;
                            proAli.IsActive = true;
                            db.AliasProducts.Add(proAli);
                            db.SaveChanges();
                        }

                        // lấy max ID và thêm vào bảng alias
                        if (mangten.Length >= 2)
                        {
                            // lấy id của sản phẩm mới được insert vào db
                            var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            int idinsert = Convert.ToInt32(pronew.ID);

                            for (int h = 1; h < mangten.Length; h++)
                            {
                                AliasProduct proAli = new AliasProduct();
                                proAli.Name = mangten[h];
                                proAli.ProductID = idinsert;
                                proAli.Price = Convert.ToDouble(listpro[i].Price);
                                proAli.StoreID = StoreID;
                                proAli.UpdateTime = DateTime.Now;
                                if (brandID > 0)
                                {
                                    proAli.BrandID = brandID;
                                }
                                proAli.URL = listpro[i].Url;
                                proAli.IsMain = false;
                                proAli.IsActive = true;
                                db.AliasProducts.Add(proAli);
                                db.SaveChanges();
                            }

                        }


                        // lấy id để lưu vào bảng productAtribute
                        int idCPU1 = 0;
                        int idVGA2 = 0;
                        int idHDD3 = 0;
                        int idDisplay4 = 0;
                        int idRam5 = 0;
                        // id CPU 1
                        for (int x = 0; x < listCPU.Count; x++)
                        {
                            int dicID = listCPU[x].ID;
                            var DictionaryCPU = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                            List<Dictionary> listDicCPU = DictionaryCPU.ToList();
                            for (int z = 0; z < listDicCPU.Count; z++)
                            {
                                if (listpro[i].CPU.Trim().Equals(listDicCPU[z].Name.Trim()))
                                {
                                    idCPU1 = listCPU[x].ID;
                                    break;
                                }
                            }

                        }
                        if (idCPU1 == 0)
                        {
                            Hardware atcpu = new Hardware();
                            atcpu.CodetypeID = "C";
                            atcpu.Name = listpro[i].CPU;
                            atcpu.WeightCriteraPoint = 0;
                        //    atcpu.IsActive = false;
                            db.Hardwares.Add(atcpu);
                            db.SaveChanges();
                            var cpunew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idCPU1 = Convert.ToInt32(cpunew.ID);

                            // lưu name vào Attibute Alias và để isactive là false
                            Dictionary atcpuMap = new Dictionary();
                            atcpuMap.AttributeDicID = cpunew.ID;
                            atcpuMap.Name = listpro[i].CPU;
                            atcpuMap.IsActive = true;
                            db.Dictionaries.Add(atcpuMap);
                            db.SaveChanges();

                        }
                        //nếu List CPU là rỗng 
                        if (listCPU.Count == 0 && idCPU1 == 0)
                        {
                            Hardware atcpu = new Hardware();
                            atcpu.CodetypeID = "C";
                            atcpu.Name = listpro[i].CPU;
                         //   atcpu.IsActive = false;
                            atcpu.WeightCriteraPoint = 0;
                            db.Hardwares.Add(atcpu);
                            db.SaveChanges();
                            var cpunew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idCPU1 = Convert.ToInt32(cpunew.ID);

                            // lưu name vào Attibute Alias và để isactive là false
                            Dictionary atcpuMap = new Dictionary();
                            atcpuMap.AttributeDicID = cpunew.ID;
                            atcpuMap.Name = listpro[i].CPU;
                            atcpuMap.IsActive = true;
                            db.Dictionaries.Add(atcpuMap);
                            db.SaveChanges();

                        }
                        // id VGA 2
                        for (int x = 0; x < listVGA.Count; x++)
                        {
                            int dicID = listVGA[x].ID;
                            var DictionaryVGA = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                            List<Dictionary> listDicVGA = DictionaryVGA.ToList();
                            for (int z = 0; z < listDicVGA.Count; z++)
                            {
                                if (listpro[i].VGA.Trim().Equals(listDicVGA[z].Name.Trim()))
                                {
                                    idVGA2 = listVGA[x].ID;
                                    break;
                                }
                            }

                        }
                        if (idVGA2 == 0)
                        {
                            Hardware atvga = new Hardware();
                            atvga.CodetypeID = "V";
                            atvga.Name = listpro[i].VGA;
                       //     atvga.IsActive = false;
                            atvga.WeightCriteraPoint = 0;
                            db.Hardwares.Add(atvga);
                            db.SaveChanges();
                            var vganew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idVGA2 = Convert.ToInt32(vganew.ID);

                            // lưu name vào Attibute Alias và để isactive là true
                            Dictionary atvgaMap = new Dictionary();
                            atvgaMap.AttributeDicID = vganew.ID;
                            atvgaMap.Name = listpro[i].VGA;
                            atvgaMap.IsActive = true;
                            db.Dictionaries.Add(atvgaMap);

                        }
                        // nếu list VGA là rỗng
                        if (listVGA.Count == 0 && idVGA2 == 0)
                        {
                            Hardware atvga = new Hardware();
                            atvga.CodetypeID = "V";
                            atvga.Name = listpro[i].VGA;
                      //      atvga.IsActive = false;
                            atvga.WeightCriteraPoint = 0;
                            db.Hardwares.Add(atvga);
                            db.SaveChanges();
                            var vganew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idVGA2 = Convert.ToInt32(vganew.ID);

                            // lưu name vào Attibute Alias và để isactive là true
                            Dictionary atvgaMap = new Dictionary();
                            atvgaMap.AttributeDicID = vganew.ID;
                            atvgaMap.Name = listpro[i].VGA;
                            atvgaMap.IsActive = true;
                            db.Dictionaries.Add(atvgaMap);

                        }
                        // id HDD 3
                        for (int x = 0; x < listHDD.Count; x++)
                        {
                            int dicID = listHDD[x].ID;
                            var DictionaryHDD = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                            List<Dictionary> listDicHDD = DictionaryHDD.ToList();
                            for (int z = 0; z < listDicHDD.Count; z++)
                            {
                                if (listpro[i].HDD.Trim().Equals(listDicHDD[z].Name.Trim()))
                                {
                                    idHDD3 = listHDD[x].ID;
                                    break;
                                }
                            }

                        }
                        if (idHDD3 == 0)
                        {
                            Hardware athddd = new Hardware();
                            athddd.CodetypeID = "H";
                            athddd.Name = listpro[i].HDD;
                       //     athddd.IsActive = false;
                            athddd.WeightCriteraPoint = 0;
                            db.Hardwares.Add(athddd);
                            db.SaveChanges();
                            var hddnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idHDD3 = Convert.ToInt32(hddnew.ID);

                            // lưu name vào Attibute Alias và để isactive là true
                            Dictionary athdddMap = new Dictionary();
                            athdddMap.AttributeDicID = hddnew.ID;
                            athdddMap.Name = listpro[i].HDD;
                            athdddMap.IsActive = true;
                            db.Dictionaries.Add(athdddMap);

                        }
                        // nếu list HDD là rỗng 
                        if (listHDD.Count == 0 && idHDD3 == 0)
                        {
                            Hardware athddd = new Hardware();
                            athddd.CodetypeID = "H";
                            athddd.Name = listpro[i].HDD;
                            athddd.WeightCriteraPoint = 0;
                      //      athddd.IsActive = false;
                            db.Hardwares.Add(athddd);
                            db.SaveChanges();
                            var hddnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idHDD3 = Convert.ToInt32(hddnew.ID);

                            // lưu name vào Attibute Alias và để isactive là true
                            Dictionary athdddMap = new Dictionary();
                            athdddMap.AttributeDicID = hddnew.ID;
                            athdddMap.Name = listpro[i].HDD;
                            athdddMap.IsActive = true;
                            db.Dictionaries.Add(athdddMap);

                        }
                        // id Display 4
                        for (int x = 0; x < listDisplay.Count; x++)
                        {
                            int dicID = listDisplay[x].ID;
                            var DictionaryDisplay = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                            List<Dictionary> listDicDisplay = DictionaryDisplay.ToList();
                            for (int z = 0; z < listDicDisplay.Count; z++)
                            {
                                if (listpro[i].Display.Trim().Equals(listDicDisplay[z].Name.Trim()))
                                {
                                    idDisplay4 = listDisplay[x].ID;
                                    break;
                                }
                            }

                        }
                        if (idDisplay4 == 0)
                        {
                            Hardware athdisp = new Hardware();
                            athdisp.CodetypeID = "D";
                            athdisp.Name = listpro[i].Display;
                            athdisp.WeightCriteraPoint = 0;
                     //       athdisp.IsActive = false;
                            db.Hardwares.Add(athdisp);
                            db.SaveChanges();
                            var dispnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idDisplay4 = Convert.ToInt32(dispnew.ID);

                            // lưu name vào Attibute Alias và để isactive là true
                            Dictionary athdispMap = new Dictionary();
                            athdispMap.AttributeDicID = dispnew.ID;
                            athdispMap.Name = listpro[i].Display;
                            athdispMap.IsActive = true;
                            db.Dictionaries.Add(athdispMap);
                            db.SaveChanges();

                        }
                        // nếu list Display là rỗng
                        if (listDisplay.Count == 0 && idDisplay4 == 0)
                        {

                            Hardware athdisp = new Hardware();
                            athdisp.CodetypeID = "D";
                            athdisp.Name = listpro[i].Display;
                            athdisp.WeightCriteraPoint = 0;
                   //         athdisp.IsActive = false;
                            db.Hardwares.Add(athdisp);
                            db.SaveChanges();
                            var dispnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idDisplay4 = Convert.ToInt32(dispnew.ID);
                            // lưu name vào Attibute Alias và để isactive là true
                            Dictionary athdispMap = new Dictionary();
                            athdispMap.AttributeDicID = dispnew.ID;
                            athdispMap.Name = listpro[i].Display;
                            athdispMap.IsActive = true;
                            db.Dictionaries.Add(athdispMap);
                            db.SaveChanges();

                        }
                        // id Ram
                        for (int x = 0; x < listRam.Count; x++)
                        {
                            int dicID = listRam[x].ID;
                            var DictionaryRam = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                            List<Dictionary> listDicRam = DictionaryRam.ToList();
                            for (int z = 0; z < listDicRam.Count; z++)
                            {
                                if (listpro[i].RAM.Trim().Equals(listDicRam[z].Name.Trim()))
                                {
                                    idRam5 = listRam[x].ID;
                                    break;
                                }
                            }

                        }
                        if (idRam5 == 0)
                        {
                            Hardware athram = new Hardware();
                            athram.CodetypeID = "R";
                            athram.Name = listpro[i].RAM;
                            athram.WeightCriteraPoint = 0;
                  //          athram.IsActive = false;
                            db.Hardwares.Add(athram);
                            db.SaveChanges();
                            var ramnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idRam5 = Convert.ToInt32(ramnew.ID);
                            // lưu name vào Attibute Alias và để isactive là true
                            Dictionary athramMap = new Dictionary();
                            athramMap.AttributeDicID = ramnew.ID;
                            athramMap.Name = listpro[i].RAM;
                            athramMap.IsActive = true;
                            db.Dictionaries.Add(athramMap);

                        }
                        // nếu list Ram là rỗng 
                        if (listRam.Count == 0 && idRam5 == 0)
                        {
                            Hardware athram = new Hardware();
                            athram.CodetypeID = "R";
                            athram.Name = listpro[i].RAM;
                            athram.WeightCriteraPoint = 0;
                  //          athram.IsActive = false;
                            db.Hardwares.Add(athram);
                            db.SaveChanges();
                            var ramnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idRam5 = Convert.ToInt32(ramnew.ID);
                            // lưu name vào Attibute Alias và để isactive là true
                            Dictionary athramMap = new Dictionary();
                            athramMap.AttributeDicID = ramnew.ID;
                            athramMap.Name = listpro[i].RAM;
                            athramMap.IsActive = true;
                            db.Dictionaries.Add(athramMap);

                        }
                        // lấy id của sản phẩm mới được insert vào db
                        var pronewinsert = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        int idinsertnew = Convert.ToInt32(pronewinsert.ID);

                        //1 lưu idcpu vào bảng ProductAttribute
                        ProductAttribute atProCPU = new ProductAttribute();
                        atProCPU.AttributeID = idCPU1;
                        if (idCPU1 > idBig)
                        {
                            atProCPU.IsActive = false;
                        }
                        else
                        {
                            atProCPU.IsActive = true;
                        }
                        atProCPU.ProductID = idinsertnew;
                        db.ProductAttributes.Add(atProCPU);
                        db.SaveChanges();
                        //2 lưu idRam vào bảng ProductAttribute
                        ProductAttribute atProRam = new ProductAttribute();
                        atProRam.AttributeID = idRam5;
                        if (idRam5 > idBig)
                        {
                            atProRam.IsActive = false;
                        }
                        else
                        {
                            atProRam.IsActive = true;
                        }
                        atProRam.ProductID = idinsertnew;
                        db.ProductAttributes.Add(atProRam);
                        db.SaveChanges();
                        //3 lưu idhdd vào bảng ProductAttribute
                        ProductAttribute atProHDD = new ProductAttribute();
                        atProHDD.AttributeID = idHDD3;
                        if (idHDD3 > idBig)
                        {
                            atProHDD.IsActive = false;
                        }
                        else
                        {
                            atProHDD.IsActive = true;
                        }
                        atProHDD.ProductID = idinsertnew;
                        db.ProductAttributes.Add(atProHDD);
                        db.SaveChanges();
                        //4 lưu idDisplay vào bảng ProductAttribute
                        ProductAttribute atProDisp = new ProductAttribute();
                        atProDisp.AttributeID = idDisplay4;
                        if (idDisplay4 > idBig)
                        {
                            atProDisp.IsActive = false;
                        }
                        else
                        {
                            atProDisp.IsActive = true;
                        }
                        atProDisp.ProductID = idinsertnew;
                        db.ProductAttributes.Add(atProDisp);
                        db.SaveChanges();
                        //5 lưu idvag vào bảng ProductAttribute
                        ProductAttribute atProVAG = new ProductAttribute();
                        atProVAG.AttributeID = idVGA2;
                        if (idVGA2 > idBig)
                        {
                            atProVAG.IsActive = false;
                        }
                        else
                        {
                            atProVAG.IsActive = true;
                        }
                        atProVAG.ProductID = idinsertnew;
                        db.ProductAttributes.Add(atProVAG);
                        db.SaveChanges();

                        // xóa phần tử được add vào database ra khỏi list
                        listpro.Remove(listpro[i]);
                        i = i - 1;
                    }
                    #endregion
                }
                return RedirectToAction("index");
            }
        }

        /// <summary>
        /// Xóa một sản phẩm trong list đúng.
        /// </summary>
        /// <param name="delstt"></param>
        /// <returns></returns>
        public ActionResult deleteproduct(String sttproduct)
        {
            if (!sttproduct.Equals("nothing"))
            {
                // get list product in session.
                List<LapData> listpro = (List<LapData>)Session["listproductLapT"];
                List<LapData> listerror = (List<LapData>)Session["listerrorLapT"];
                List<List<LapData>> listduplicate = (List<List<LapData>>)Session["listduplicatenewLapT"];
                LapData delpro = new LapData();
                foreach (LapData p in listpro)
                {
                    if (p.stt.Equals(sttproduct))
                    {
                        delpro = p;
                        break;
                    }
                }
                listpro.Remove(delpro);
                Session["listproductLap"] = listpro;
            }
            ViewBag.listproduct = (List<LapData>)Session["listproductLapT"];
            ViewBag.listerror = (List<LapData>)Session["listerrorLapT"];
            ViewBag.listduplicate = (List<List<LapData>>)Session["listduplicatenewLapT"];
            return View();
        }

        /// <summary>
        /// Gộp 1 table trùng
        /// </summary>
        /// <param name="values"></param>
        /// <returns></returns>
        public ActionResult getGop(String valuest)
        {
            List<String> values = new List<String>();
            String[] value = valuest.ToString().Split('@');
            for (int j = 1; j < value.Length; j++)
            {
                values.Add(value[j]);
            }
            List<LapData> listpro = (List<LapData>)Session["listproductLapT"];
            if (listpro == null)
            {
                listpro = new List<LapData>();
            }
            List<LapData> listerror = (List<LapData>)Session["listerrorLapT"];
            List<List<LapData>> listduplicate = (List<List<LapData>>)Session["ListdupLaptraning"];

            // lấy tên chính ở cuối list ra và remove
            string sttTenchinh = values.Last();
            values.Remove(values.Last());


            // value chỉ chứa các giá trị khác ngoài tên chính
            for (int t = 0; t < values.Count; t++)
            {
                if (values[t].Trim().Equals(sttTenchinh.Trim()))
                {
                    values.RemoveAt(t);
                    break;
                }
            }

            // tên sản phẩm gộp
            string tenmoi = "";
            LapData sanphamgop = new LapData();

            int count = 0;
            for (int i = 0; i < listduplicate.Count; i++)
            {
                // duyệt list nhỏ
                for (int j = 0; j < listduplicate[i].Count; j++)
                {
                    // nếu stt của listdup = stt của tên chính thì cho nó thành sản phẩm gộp.                      
                    if (listduplicate[i][j].stt.ToString().Equals(sttTenchinh))
                    {
                        count++;
                        tenmoi = listduplicate[i][j].Name;
                        sanphamgop = listduplicate[i][j];
                        listduplicate[i].Remove(listduplicate[i][j]);
                    }
                    if (count > 0)
                    {

                        break;
                    }
                }
                if (count > 0)
                {

                    break;
                }
            }
            // duyệt để tim thấy list có chưa id tách được gửi về.
            for (int t = 0; t < values.Count; t++)
            {
                // duyệt list bự lấy tên phụ
                for (int i = 0; i < listduplicate.Count; i++)
                {
                    // duyệt list nhỏ
                    for (int j = 0; j < listduplicate[i].Count; j++)
                    {

                        // nếu stt của listdup = stt của tên chính thì cho nó thành sản phẩm gộp.                      
                        if (listduplicate[i][j].stt.ToString().Equals(values[t]))
                        {

                            tenmoi += ";" + listduplicate[i][j].Name;
                            listduplicate[i].Remove(listduplicate[i][j]);
                            break;
                        }
                    }
                }
            }
            // duyệt list bự xóa list rỗng hoặc list có 1 phần tử cho vào phần tử đúng
            for (int i = 0; i < listduplicate.Count; i++)
            {
                // kiểm tra trong list nhỏ còn có 1 phần tử thì tách nó luôn cho vào list correct
                if (listduplicate[i].Count == 1)
                {
                    listpro.Add(listduplicate[i].First());
                    listduplicate[i].Remove(listduplicate[i].First());
                    //Xóa list rỗng trong list bự duplicate 
                    listduplicate.Remove(listduplicate[i]);
                }
                else if (listduplicate[i].Count == 0)
                {
                    //Xóa list rỗng trong list bự duplicate 
                    listduplicate.Remove(listduplicate[i]);
                }
            }

            sanphamgop.Name = tenmoi;
            listpro.Add(sanphamgop);
            Session["listproductLapT"] = listpro;
            Session["listerrorLapT"] = listerror;
            Session["ListdupLaptraning"] = listduplicate;
            GhilaivaoTxt(listduplicate);
            ViewBag.listproduct = (List<LapData>)Session["listproductLapT"];
            ViewBag.listerror = (List<LapData>)Session["listerrorLap"];
            ViewBag.ListdupLaptraning = (List<List<LapData>>)Session["ListdupLaptraning"];
            return View();
        }

        /// <summary>
        /// Tách 1 table trùng
        /// </summary>
        /// <param name="values"></param>
        /// <returns></returns>
        public ActionResult getTach(String valuest)
        {
            if (!valuest.Equals("nothing"))
            {
                String[] tachdup = valuest.ToString().Split('*');
                if (tachdup.Length >= 3)
                {
                    tachdup = valuest.ToString().Split('@');
                    String[] tach1 = tachdup[0].Split('*');
                    List<String> valuesTach = new List<String>();
                    for (int j = 1; j < tach1.Length; j++)
                    {
                        valuesTach.Add(tach1[j]);
                    }

                    // get list product in session.
                    List<LapData> listpro = (List<LapData>)Session["listproductLapT"];
                    if (listpro == null)
                    {
                        listpro = new List<LapData>();
                    }
                    List<LapData> listerror = (List<LapData>)Session["listerrorLapT"];
                    List<List<LapData>> listduplicate = (List<List<LapData>>)Session["ListdupLaptraning"];
                    LapData duplicate = new LapData();
                    int count = 0;
                    for (int i = 0; i < listduplicate.Count; i++)
                    {
                        if (count > 0)
                        {
                            break;
                        }
                        for (int j = 0; j < listduplicate[i].Count; j++)
                        {
                            // duyệt để tim thấy list có chưa id tách được gửi về.
                            if (count > 0)
                            {
                                break;
                            }
                            List<LapData> duplicateProduct = new List<LapData>();
                            for (int t = 0; t < valuesTach.Count; t++)
                            {
                                if (listduplicate[i][j].stt.ToString().Equals(valuesTach[t].ToString()))
                                {
                                    duplicateProduct.Add(listduplicate[i][j]);
                                    listduplicate[i].Remove(listduplicate[i][j]);
                                    count++;
                                }
                            }
                            if (duplicateProduct.Count > 0)
                            {
                                listduplicate.Add(duplicateProduct);
                            }
                            // kiểm tra trong list nhỏ còn có 1 phần tử thì tách nó luôn cho vào list correct
                            if (listduplicate[i].Count == 1)
                            {
                                listpro.Add(listduplicate[i].First());
                                listduplicate[i].Remove(listduplicate[i].First());
                                //Xóa list rỗng trong list bự duplicate 
                                listduplicate.Remove(listduplicate[i]);
                                count++;
                                break;


                            }
                            else if (listduplicate[i].Count == 0)
                            {
                                //Xóa list rỗng trong list bự duplicate 
                                listduplicate.Remove(listduplicate[i]);
                                count++;
                                break;
                            }

                        }

                    }

                    Session["listerrorLapT"] = listerror;
                    Session["ListdupLaptraning"] = listduplicate;
                    GhilaivaoTxt(listduplicate);
                    Session["listproductLapT"] = listpro;
                }
                else
                {


                    List<String> valuesTach = new List<String>();
                    String[] value = tachdup[0].ToString().Split('@');
                    for (int j = 1; j < value.Length; j++)
                    {
                        valuesTach.Add(value[j]);
                    }

                    // get list product in session.
                    List<LapData> listpro = (List<LapData>)Session["listproductLapT"];
                    List<LapData> listerror = (List<LapData>)Session["listerrorLapT"];
                    if (listpro == null)
                    {
                        listpro = new List<LapData>();
                    }
                    List<List<LapData>> listduplicate = (List<List<LapData>>)Session["ListdupLaptraning"];
                    LapData duplicate = new LapData();
                    int count = 0;
                    for (int i = 0; i < listduplicate.Count; i++)
                    {
                        for (int j = 0; j < listduplicate[i].Count; j++)
                        {
                            // duyệt để tim thấy list có chưa id tách được gửi về.
                            for (int t = 0; t < valuesTach.Count; t++)
                            {
                                if (listduplicate[i][j].stt.ToString().Equals(valuesTach[t].ToString()))
                                {
                                    listpro.Add(listduplicate[i][j]);
                                    listduplicate[i].Remove(listduplicate[i][j]);

                                }
                            }

                            // kiểm tra trong list nhỏ còn có 1 phần tử thì tách nó luôn cho vào list correct
                            if (listduplicate[i].Count == 1)
                            {
                                listpro.Add(listduplicate[i].First());
                                listduplicate[i].Remove(listduplicate[i].First());
                                //Xóa list rỗng trong list bự duplicate 
                                listduplicate.Remove(listduplicate[i]);
                                count++;
                                break;


                            }
                            else if (listduplicate[i].Count == 0)
                            {
                                //Xóa list rỗng trong list bự duplicate 
                                listduplicate.Remove(listduplicate[i]);
                                count++;
                                break;
                            }
                        }
                        if (count > 0)
                        {
                            break;
                        }
                    }

                    Session["listerrorLapT"] = listerror;
                    Session["ListdupLaptraning"] = listduplicate;
                    GhilaivaoTxt(listduplicate);
                    Session["listproductLapT"] = listpro;
                }
            }
            //cho vào viewbag
            ViewBag.listproduct = (List<LapData>)Session["listproductLapT"];
            ViewBag.listerror = (List<LapData>)Session["listerrorLapT"];
            ViewBag.ListdupLaptraning = (List<List<LapData>>)Session["ListdupLaptraning"];
            return View();
        }

        /// <summary>
        /// Tách sản phẩm khi so trùng trong database
        /// </summary>
        /// <returns></returns>
        public ActionResult tachdatabase(String valuestach)
        {
            using (CPS_SolutionEntities db = new CPS_SolutionEntities())
            {
                List<List<LapData>> listduplicatenew = (List<List<LapData>>)Session["listduplicatenewLapT"];
                String[] tachdup = valuestach.ToString().Split('@');
            //    List<String> listtrunglinhkien = (List<String>)Session["listtrunglinhkienT"];
                List<LapData> danhsachLaptrunglinhkien = (List<LapData>)Session["danhsachLaptrunglinhkienT"];
                // lấy cái id mới nhất trong db ra để khi lưu atribute biết hard mới hay là dùng lại hard cũ lưu true false
                int idBig = 0;
                var listHar = db.Hardwares.ToList();
                if (listHar.Count > 0)
                {
                    var hddBig = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                    idBig = hddBig.ID;
                }
                // duyệt hết list duplicate lớn
                for (int i = 0; i < listduplicatenew.Count; i++)
                {
                    // duyệt từng listduplicate nhỏ 
                    for (int j = 0; j < listduplicatenew[i].Count; j++)
                    {
                        // nếu phát hiện list nào có chứa giá trị tách trả về
                        if (tachdup[2].Equals(listduplicatenew[i][j].stt))
                        {


                            //----------------------------- kiểm tra sản phẩm trong listpro có bị trùng linh kiện ko---------------------------
                            // lấy hết CPU trong db ra
                            var listCPUdb = (from a in db.Hardwares where a.CodetypeID.Equals("C") select a);
                            List<Hardware> listCPU = listCPUdb.ToList();
                            // lấy hết VGA trong db ra
                            var listVGAdb = (from a in db.Hardwares where a.CodetypeID.Equals("V") select a);
                            List<Hardware> listVGA = listVGAdb.ToList();
                            // lấy hết HDD trong db ra
                            var listHDDdb = (from a in db.Hardwares where a.CodetypeID.Equals("H") select a);
                            List<Hardware> listHDD = listHDDdb.ToList();
                            // lấy hết Display trong db ra
                            var listDisplaydb = (from a in db.Hardwares where a.CodetypeID.Equals("D") select a);
                            List<Hardware> listDisplay = listDisplaydb.ToList();
                            // lấy hết Ram trong db ra
                            var listRamdb = (from a in db.Hardwares where a.CodetypeID.Equals("R") select a);
                            List<Hardware> listRam = listRamdb.ToList();
                           
                            #region Kiểm tra trùng link kiện không ghi lại những linh kiện trùng để ghilog txt
                            string errorCPU = "";
                            Hardware CPU = new Hardware();
                            string errorVGA = "";
                            Hardware VGA = new Hardware();
                            string errorHDD = "";
                            Hardware HDD = new Hardware();
                            string errorDisplay = "";
                            Hardware Display = new Hardware();
                            string errorRam = "";
                            Hardware Ram = new Hardware();

                            int errorCount = 0;
                            // trùng CPU 1
                            int c1 = 0;
                            for (int x = 0; x < listCPU.Count; x++)
                            {
                                if (listduplicatenew[i][j].CPU.Trim().Equals(listCPU[x].Name.Trim()))
                                {
                                    c1++;
                                    break;
                                }

                            }
                            if (c1 == 0)
                            {
                                for (int x = 0; x < listCPU.Count; x++)
                                {
                                    if (CompareStringHelper.CompareString(listduplicatenew[i][j].CPU.Trim(), listCPU[x].Name.Trim()) > 80)
                                    {
                                        CPU = listCPU[x];
                                        //listtrunglinhkien[1] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                        errorCount++;
                                        errorCPU = listCPU[x].Name;
                                        break;
                                    }
                                }
                            }
                            // trùng VGA 2
                            int v2 = 0;
                            for (int x = 0; x < listVGA.Count; x++)
                            {
                                if (listduplicatenew[i][j].VGA.Trim().Equals(listVGA[x].Name.Trim()))
                                {
                                    v2++;
                                    break;
                                }

                            }
                            if (v2 == 0)
                            {
                                for (int x = 0; x < listVGA.Count; x++)
                                {
                                    if (CompareStringHelper.CompareString(listduplicatenew[i][j].VGA.Trim(), listVGA[x].Name.Trim()) > 80)
                                    {
                                        VGA = listVGA[x];
                                        //  listtrunglinhkien[2] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                        errorCount++;
                                        errorVGA = listVGA[x].Name;
                                        break;
                                    }
                                }
                            }
                            // trùng HDD 3
                            int h3 = 0;
                            for (int x = 0; x < listHDD.Count; x++)
                            {
                                if (listduplicatenew[i][j].HDD.Trim().Equals(listHDD[x].Name.Trim()))
                                {
                                    h3++;
                                    break;
                                }

                            }
                            if (h3 == 0)
                            {
                                for (int x = 0; x < listHDD.Count; x++)
                                {
                                    if (CompareStringHelper.CompareString(listduplicatenew[i][j].HDD.Trim(), listHDD[x].Name.Trim()) > 80)
                                    {
                                        HDD = listHDD[x];
                                        //   listtrunglinhkien[3] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                        errorCount++;
                                        errorHDD = listHDD[x].Name;
                                        break;
                                    }
                                }
                            }
                            // trùng Display 4
                            int d4 = 0;
                            for (int x = 0; x < listDisplay.Count; x++)
                            {
                                if (listduplicatenew[i][j].Display.Trim().Equals(listDisplay[x].Name.Trim()))
                                {
                                    d4++;
                                    break;
                                }

                            }
                            if (d4 == 0)
                            {
                                for (int x = 0; x < listDisplay.Count; x++)
                                {
                                    if (CompareStringHelper.CompareString(listduplicatenew[i][j].Display.Trim(), listDisplay[x].Name.Trim()) > 80)
                                    {
                                        Display = listDisplay[x];
                                        //   listtrunglinhkien[4] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                        errorCount++;
                                        errorDisplay = listDisplay[x].Name;
                                        break;
                                    }
                                }
                            }
                            // trùng Ram
                            int r5 = 0;
                            for (int x = 0; x < listRam.Count; x++)
                            {
                                if (listduplicatenew[i][j].RAM.Trim().Equals(listRam[x].Name.Trim()))
                                {
                                    r5++;
                                    break;
                                }

                            }
                            if (r5 == 0)
                            {
                                for (int x = 0; x < listRam.Count; x++)
                                {
                                    if (CompareStringHelper.CompareString(listduplicatenew[i][j].RAM.Trim(), listRam[x].Name.Trim()) > 80)
                                    {
                                        Ram = listRam[x];
                                        //    listtrunglinhkien[5] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                        errorCount++;
                                        errorRam = listRam[x].Name;
                                        break;
                                    }
                                }
                            }
                            #endregion
                            //-----------------------------------------------------------------------------------------------------------------
                            //------- lưu những sản phẩm có linh kiện trùng và lưu linh kiện trùng với id sản phẩm vào logfile-----------------
                            if (errorCount > 0)
                            {
                                #region  lưu product và product alias
                                Product p = new Product();
                                string urlServer = urlImageServer(listduplicatenew[i][j].Imagelink);
                                p.ImageURL = urlServer;
                                p.Price = 0;
                                p.TotalWeightPoint = 0;
                        //        p.IsActive = false;

                                // lưu vào database
                                db.Products.Add(p);
                                db.SaveChanges();
                                #region lấy id store hoặc lưu mới cho laptop
                                string urlcontent = listduplicatenew[i][j].Url;
                                var store = db.Stores.Where(x => urlcontent.Contains(x.StoreUrl)).FirstOrDefault();
                                int StoreID = 1;
                                string patter = "://|/";
                                Regex reg = new Regex(patter);
                                string host = reg.Split(listduplicatenew[i][j].Url)[1];
                                if (store != null)
                                {
                                    StoreID = store.ID;
                                }
                                else
                                {
                                    var newStore = new Store
                                    {
                                        IsActive = false,
                                        LogoImage = "default",
                                        StoreUrl = host,
                                        StoreName = "Chưa xác định",

                                    };
                                    db.Stores.Add(newStore);
                                    db.SaveChanges();
                                    StoreID = newStore.ID;
                                }
                                #endregion
                                // lấy id brand của Laptop
                                int brandID = BrandID(listduplicatenew[i][j].Name);

                                String[] mangten = listduplicatenew[i][j].Name.ToString().Split(';');
                                // nếu mảng tên >=2 thì lưu cái tên đầu tiên làm tên chính.
                                if (mangten.Length >= 2)
                                {
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idinsert = Convert.ToInt32(pronew.ID);
                                    AliasProduct proAli = new AliasProduct();
                                    proAli.Name = mangten[0];
                                    proAli.ProductID = idinsert;
                                    proAli.Price = Convert.ToDouble(listduplicatenew[i][j].Price);
                                    proAli.StoreID = StoreID;
                                    proAli.UpdateTime = DateTime.Now;
                                    if (brandID > 0)
                                    {
                                        proAli.BrandID = brandID;
                                    }
                                    proAli.URL = listduplicatenew[i][j].Url;
                                    proAli.IsMain = true;
                                    proAli.IsActive = true;
                                    db.AliasProducts.Add(proAli);
                                    db.SaveChanges();
                                }
                                // nếu không thì lưu làm tên chính luôn.
                                else
                                {
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idinsert = Convert.ToInt32(pronew.ID);
                                    AliasProduct proAli = new AliasProduct();
                                    proAli.Name = mangten[i];
                                    proAli.ProductID = idinsert;
                                    proAli.Price = Convert.ToDouble(listduplicatenew[i][j].Price);
                                    proAli.StoreID = StoreID;
                                    proAli.UpdateTime = DateTime.Now;
                                    if (brandID > 0)
                                    {
                                        proAli.BrandID = brandID;
                                    }
                                    proAli.URL = listduplicatenew[i][j].Url;
                                    proAli.IsMain = true;
                                    proAli.IsActive = true;
                                    db.AliasProducts.Add(proAli);
                                    db.SaveChanges();
                                }

                                // lấy max ID và thêm vào bảng alias tên phụ
                                if (mangten.Length >= 2)
                                {
                                    // lấy id của sản phẩm mới được insert vào db
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idinsert = Convert.ToInt32(pronew.ID);
                                    // bỏ tên đầu tiên vì lưu làm tên chính rồi lưu tên phụ
                                    for (int h = 1; h < mangten.Length; h++)
                                    {
                                        AliasProduct proAli = new AliasProduct();
                                        proAli.Name = mangten[h];
                                        proAli.ProductID = idinsert;
                                        proAli.Price = Convert.ToDouble(listduplicatenew[i][j].Price);
                                        proAli.StoreID = StoreID;
                                        proAli.UpdateTime = DateTime.Now;
                                        if (brandID > 0)
                                        {
                                            proAli.BrandID = brandID;
                                        }
                                        proAli.URL = listduplicatenew[i][j].Url;
                                        proAli.IsMain = false;
                                        proAli.IsActive = true;
                                        db.AliasProducts.Add(proAli);
                                        db.SaveChanges();
                                    }

                                }
                                #endregion
                                string[] lines = null;
                                // lấy txt ra
                                string path = Server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
                                if (System.IO.File.Exists(path))
                                {
                                    lines = System.IO.File.ReadAllLines(path);
                                }
                                string[] newline = new string[errorCount];
                                // lấy id để lưu vào bảng productAtribute
                                int idCPU1 = 0;
                                int idVGA2 = 0;
                                int idHDD3 = 0;
                                int idDisplay4 = 0;
                                int idRam5 = 0;
                                // vị trí lưu trong mảng newline
                                int vitriluu = 0;
                                // id CPU 1
                                #region
                                for (int x = 0; x < listCPU.Count; x++)
                                {
                                    int dicID = listCPU[x].ID;
                                    var DictionaryCPU = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                                    List<Dictionary> listDicCPU = DictionaryCPU.ToList();
                                    for (int z = 0; z < listDicCPU.Count; z++)
                                    {
                                        if (listduplicatenew[i][j].CPU.Equals(listDicCPU[z].Name))
                                        {
                                            idCPU1 = listCPU[x].ID;
                                            break;
                                        }
                                    }

                                    
                                }

                                if (idCPU1 == 0)
                                {   // nếu trùng CPU thì ghi log CPU cùng với ID product
                                    if (!errorCPU.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '~' + CPU.Name + '|' + CPU.CodetypeID.ToString() + '|' + CPU.WeightCriteraPoint + '|' + CPU.ID + '#' + listduplicatenew[i][j].CPU + '|' + '|' + '|';
                                        vitriluu++;
                                      
                                    }
                                    else
                                    {
                                        // Lưu mới CPU và get ID mới lưu
                                        Hardware atcpu = new Hardware();
                                        atcpu.CodetypeID = "C";
                                        atcpu.Name = listduplicatenew[i][j].CPU;
                                        atcpu.WeightCriteraPoint = 0;
                                        db.Hardwares.Add(atcpu);
                                        db.SaveChanges();
                                        var cpunew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idCPU1 = Convert.ToInt32(cpunew.ID);
                                        // lưu name vào Attibute Alias và để isactive là false
                                        Dictionary atcpuMap = new Dictionary();
                                        atcpuMap.AttributeDicID = cpunew.ID;
                                        atcpuMap.Name = listduplicatenew[i][j].CPU;
                                        atcpuMap.IsActive = true;
                                        db.Dictionaries.Add(atcpuMap);
                                        db.SaveChanges();

                                     
                                    }
                                }
                                //nếu List CPU là rỗng 
                                if (listCPU.Count == 0)
                                {
                                    if (!errorCPU.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[0] = idpro.ToString() + '~' + CPU.Name + '|' + CPU.CodetypeID.ToString() + '|' + CPU.WeightCriteraPoint + '|' + CPU.ID + '#' + listduplicatenew[i][j].CPU + '|' + '|' + '|';
                                        vitriluu++;
                                    }
                                    else
                                    {
                                        Hardware atcpu = new Hardware();
                                        atcpu.CodetypeID = "C";
                                        atcpu.Name = listduplicatenew[i][j].CPU;
                                        atcpu.WeightCriteraPoint = 0;
                                        db.Hardwares.Add(atcpu);
                                        db.SaveChanges();
                                        var cpunew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idCPU1 = Convert.ToInt32(cpunew.ID);
                                        // lưu name vào Attibute Alias và để isactive là false
                                        Dictionary atcpuMap = new Dictionary();
                                        atcpuMap.AttributeDicID = cpunew.ID;
                                        atcpuMap.Name = listduplicatenew[i][j].CPU;
                                        atcpuMap.IsActive = true;
                                        db.Dictionaries.Add(atcpuMap);
                                        db.SaveChanges();

                                    }
                                }
                                #endregion
                                // id VGA 2
                                #region
                                for (int x = 0; x < listVGA.Count; x++)
                                {
                                    int dicID = listVGA[x].ID;
                                    var DictionaryVGA = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                                    List<Dictionary> listDicVGA = DictionaryVGA.ToList();
                                    for (int z = 0; z < listDicVGA.Count; z++)
                                    {
                                        if (listduplicatenew[i][j].VGA.Equals(listDicVGA[z].Name))
                                        {
                                            idVGA2 = listVGA[x].ID;
                                            break;
                                        }
                                    }

                                    
                                }
                                if (idVGA2 == 0)
                                {
                                    // nếu VGA là trùng
                                    if (!errorVGA.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '~' + VGA.Name + '|' + VGA.CodetypeID.ToString() + '|' + VGA.WeightCriteraPoint + '|' + VGA.ID + '#' + listduplicatenew[i][j].VGA + '|' + '|' + '|';
                                        vitriluu++;
                                
                                    }
                                    // ko trùng thì lưu VGA mới vào database và lấy ID
                                    else
                                    {

                                        Hardware atvga = new Hardware();
                                        atvga.CodetypeID = "V";
                                        atvga.Name = listduplicatenew[i][j].VGA;
                                        atvga.WeightCriteraPoint = 0;
                                        db.Hardwares.Add(atvga);
                                        db.SaveChanges();
                                        var vganew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idVGA2 = Convert.ToInt32(vganew.ID);

                                        // lưu name vào Attibute Alias và để isactive là true
                                        Dictionary atvgaMap = new Dictionary();
                                        atvgaMap.AttributeDicID = vganew.ID;
                                        atvgaMap.Name = listduplicatenew[i][j].VGA;
                                        atvgaMap.IsActive = true;
                                        db.Dictionaries.Add(atvgaMap);

                                    }
                                }
                                // nếu list VGA là rỗng
                                if (listVGA.Count == 0)
                                {
                                    // nếu VGA là trùng
                                    if (!errorVGA.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '~' + VGA.Name + '|' + VGA.CodetypeID.ToString() + '|' + VGA.WeightCriteraPoint + '|' + VGA.ID + '#' + listduplicatenew[i][j].VGA + '|' + '|' + '|';
                                        vitriluu++;
                                    }
                                    // ko trùng thì lưu VGA mới vào database và lấy ID
                                    else
                                    {
                                        Hardware atvga = new Hardware();
                                        atvga.CodetypeID = "V";
                                        atvga.Name = listduplicatenew[i][j].VGA;
                                        atvga.WeightCriteraPoint = 0;
                                        db.Hardwares.Add(atvga);
                                        db.SaveChanges();
                                        var vganew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idVGA2 = Convert.ToInt32(vganew.ID);
                                        // lưu name vào Attibute Alias và để isactive là true
                                        Dictionary atvgaMap = new Dictionary();
                                        atvgaMap.AttributeDicID = vganew.ID;
                                        atvgaMap.Name = listduplicatenew[i][j].VGA;
                                        atvgaMap.IsActive = true;
                                        db.Dictionaries.Add(atvgaMap);
                                    }
                                }
                                #endregion
                                // id HDD 3
                                #region
                                for (int x = 0; x < listHDD.Count; x++)
                                {
                                    int dicID = listHDD[x].ID;
                                    var DictionaryHDD = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                                    List<Dictionary> listDicHDD = DictionaryHDD.ToList();
                                    for (int z = 0; z < listDicHDD.Count; z++)
                                    {
                                        if (listduplicatenew[i][j].HDD.Equals(listDicHDD[z].Name))
                                        {
                                            idHDD3 = listHDD[x].ID;
                                            break;
                                        }
                                    }

                                   
                                }
                                if (idHDD3 == 0)
                                {
                                    {
                                        // nếu HDD là trùng
                                        if (!errorHDD.Equals(""))
                                        {
                                            var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                            int idpro = Convert.ToInt32(pronew.ID);
                                            newline[vitriluu] = idpro.ToString() + '~' + HDD.Name + '|' + HDD.CodetypeID.ToString() + '|' + HDD.WeightCriteraPoint + '|' + HDD.ID + '#' + listduplicatenew[i][j].HDD + '|' + '|' + '|';
                                            vitriluu++;
                                        
                                        }
                                        // ko trùng thì lưu HDD mới vào database và lấy ID
                                        else
                                        {
                                            Hardware athddd = new Hardware();
                                            athddd.CodetypeID = "H";
                                            athddd.Name = listduplicatenew[i][j].HDD;
                                            athddd.WeightCriteraPoint = 0;
                                            db.Hardwares.Add(athddd);
                                            db.SaveChanges();
                                            var hddnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                            idHDD3 = Convert.ToInt32(hddnew.ID);

                                            // lưu name vào Attibute Alias và để isactive là true
                                            Dictionary athdddMap = new Dictionary();
                                            athdddMap.AttributeDicID = hddnew.ID;
                                            athdddMap.Name = listduplicatenew[i][j].HDD;
                                            athdddMap.IsActive = true;
                                            db.Dictionaries.Add(athdddMap);

                                        }
                                    }
                                }
                                // nếu list HDD là rỗng 
                                if (listHDD.Count == 0)
                                {
                                    // nếu HDD là trùng
                                    if (!errorHDD.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '~' + HDD.Name + '|' + HDD.CodetypeID.ToString() + '|' + HDD.WeightCriteraPoint + '|' + HDD.ID + '#' + listduplicatenew[i][j].HDD + '|' + '|' + '|';
                                        vitriluu++;
                                    }
                                    // ko trùng thì lưu HDD mới vào database và lấy ID
                                    else
                                    {
                                        Hardware athddd = new Hardware();
                                        athddd.CodetypeID = "H";
                                        athddd.Name = listduplicatenew[i][j].HDD;
                                        athddd.WeightCriteraPoint = 0;
                                        db.Hardwares.Add(athddd);
                                        db.SaveChanges();
                                        var hddnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idHDD3 = Convert.ToInt32(hddnew.ID);
                                        // lưu name vào Attibute Alias và để isactive là true
                                        Dictionary athdddMap = new Dictionary();
                                        athdddMap.AttributeDicID = hddnew.ID;
                                        athdddMap.Name = listduplicatenew[i][j].HDD;
                                        athdddMap.IsActive = true;
                                        db.Dictionaries.Add(athdddMap);
                                    }
                                }
                                #endregion
                                // id Display 4
                                #region
                                for (int x = 0; x < listDisplay.Count; x++)
                                {

                                    int dicID = listDisplay[x].ID;
                                    var DictionaryDisplay = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                                    List<Dictionary> listDicDisplay = DictionaryDisplay.ToList();
                                    for (int z = 0; z < listDicDisplay.Count; z++)
                                    {
                                        if (listduplicatenew[i][j].Display.Equals(listDicDisplay[z].Name))
                                        {
                                            idDisplay4 = listDisplay[x].ID;
                                            break;
                                        }
                                    }

                                   
                                }
                                if (idDisplay4 == 0)
                                {
                                    // nếu Display là trùng
                                    if (!errorDisplay.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '~' + Display.Name + '|' + Display.CodetypeID.ToString() + '|' + Display.WeightCriteraPoint + '|' + Display.ID + '#' + listduplicatenew[i][j].Display + '|' + '|' + '|';
                                        vitriluu++;
                                  
                                    }
                                    // ko trùng thì lưu Display mới vào database và lấy ID
                                    else
                                    {
                                        Hardware athdisp = new Hardware();
                                        athdisp.CodetypeID = "D";
                                        athdisp.Name = listduplicatenew[i][j].Display;
                                        athdisp.WeightCriteraPoint = 0;
                                        db.Hardwares.Add(athdisp);
                                        db.SaveChanges();
                                        var dispnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idDisplay4 = Convert.ToInt32(dispnew.ID);

                                        // lưu name vào Attibute Alias và để isactive là true
                                        Dictionary athdispMap = new Dictionary();
                                        athdispMap.AttributeDicID = dispnew.ID;
                                        athdispMap.Name = listduplicatenew[i][j].Display;
                                        athdispMap.IsActive = true;
                                        db.Dictionaries.Add(athdispMap);
                                        db.SaveChanges();

                                    }
                                }
                                // nếu list Display là rỗng
                                if (listDisplay.Count == 0)
                                {
                                    // nếu Display là trùng
                                    if (!errorDisplay.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '~' + Display.Name + '|' + Display.CodetypeID.ToString() + '|' + Display.WeightCriteraPoint + '|' + Display.ID + '#' + listduplicatenew[i][j].Display + '|' + '|' + '|';
                                        vitriluu++;
                                    }
                                    // ko trùng thì lưu Display mới vào database và lấy ID
                                    else
                                    {
                                        Hardware athdisp = new Hardware();
                                        athdisp.CodetypeID = "D";
                                        athdisp.Name = listduplicatenew[i][j].Display;
                                        athdisp.WeightCriteraPoint = 0;
                                        db.Hardwares.Add(athdisp);
                                        db.SaveChanges();
                                        var dispnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idDisplay4 = Convert.ToInt32(dispnew.ID);
                                        // lưu name vào Attibute Alias và để isactive là true
                                        Dictionary athdispMap = new Dictionary();
                                        athdispMap.AttributeDicID = dispnew.ID;
                                        athdispMap.Name = listduplicatenew[i][j].Display;
                                        athdispMap.IsActive = true;
                                        db.Dictionaries.Add(athdispMap);
                                        db.SaveChanges();
                                    }
                                }
                                #endregion
                                // id Ram
                                #region
                                for (int x = 0; x < listRam.Count; x++)
                                {
                                    int dicID = listRam[x].ID;
                                    var DictionaryRam = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                                    List<Dictionary> listDicRam = DictionaryRam.ToList();
                                    for (int z = 0; z < listDicRam.Count; z++)
                                    {
                                        if (listduplicatenew[i][j].RAM.Equals(listDicRam[z].Name))
                                        {
                                            idRam5 = listRam[x].ID;
                                            break;
                                        }
                                    }

                                   
                                }
                                if (idRam5 == 0)
                                {
                                    // nếu Ram là trùng ghi log
                                    if (!errorRam.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '~' + Ram.Name + '|' + Ram.CodetypeID.ToString() + '|' + Ram.WeightCriteraPoint + '|' + Ram.ID + '#' + listduplicatenew[i][j].RAM + '|' + '|' + '|';
                                        vitriluu++;
                                       
                                    }
                                    // ko trùng thì lưu Ram mới vào database và lấy ID
                                    else
                                    {
                                        Hardware athram = new Hardware();
                                        athram.CodetypeID = "R";
                                        athram.Name = listduplicatenew[i][j].RAM;
                                        athram.WeightCriteraPoint = 0;
                                        db.Hardwares.Add(athram);
                                        db.SaveChanges();
                                        var ramnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idRam5 = Convert.ToInt32(ramnew.ID);
                                        // lưu name vào Attibute Alias và để isactive là true
                                        Dictionary athramMap = new Dictionary();
                                        athramMap.AttributeDicID = ramnew.ID;
                                        athramMap.Name = listduplicatenew[i][j].RAM;
                                        athramMap.IsActive = true;
                                        db.Dictionaries.Add(athramMap);

                                    }
                                }

                                // nếu list Ram là rỗng 
                                if (listRam.Count == 0)
                                {
                                    // nếu Ram là trùng ghi log
                                    if (!errorRam.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '~' + Ram.Name + '|' + Ram.CodetypeID.ToString() + '|' + Ram.WeightCriteraPoint + '|' + Ram.ID + '#' + listduplicatenew[i][j].RAM + '|' + '|' + '|';
                                        vitriluu++;
                                    }
                                    // ko trùng thì lưu Display mới vào database và lấy ID
                                    else
                                    {
                                        Hardware athram = new Hardware();
                                        athram.CodetypeID = "R";
                                        athram.Name = listduplicatenew[i][j].RAM;
                                        athram.WeightCriteraPoint = 0;
                                        db.Hardwares.Add(athram);
                                        db.SaveChanges();
                                        var ramnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idRam5 = Convert.ToInt32(ramnew.ID);
                                        // lưu name vào Attibute Alias và để isactive là true
                                        Dictionary athramMap = new Dictionary();
                                        athramMap.AttributeDicID = ramnew.ID;
                                        athramMap.Name = listduplicatenew[i][j].RAM;
                                        athramMap.IsActive = true;
                                        db.Dictionaries.Add(athramMap);
                                    }
                                }
                                #endregion

                                #region  Gộp hai mảng lại thành một rồi ghi đè lại vào file txt
                                //Gộp hai bảng thành mảng mới và lưu vào txt lại
                                string[] save = new string[lines.Length + newline.Length];
                                for (int e = 0; e < lines.Length; e++)
                                {
                                    save[e] = lines[e];
                                }
                                for (int e = 0; e < newline.Length; e++)
                                {
                                    save[e + lines.Length] = newline[e];
                                }
                                // ghi lại vào txt
                                System.IO.File.WriteAllLines(path, save);
                                #endregion

                                #region Lưu vào bảng productAtribute
                                // lấy id của sản phẩm mới được insert vào db
                                var pronewinsert = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                int idinsertnew = Convert.ToInt32(pronewinsert.ID);

                                // nếu CPU không trùng database
                                if (errorCPU.Equals(""))
                                {
                                    //1 lưu idcpu vào bảng ProductAttribute
                                    ProductAttribute atProCPU = new ProductAttribute();
                                    atProCPU.AttributeID = idCPU1;
                                    if (idCPU1 > idBig)
                                    {
                                        atProCPU.IsActive = false;
                                    }
                                    else
                                    {
                                        atProCPU.IsActive = true;
                                    }
                                    atProCPU.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProCPU);
                                    db.SaveChanges();
                                }
                                if (errorRam.Equals(""))
                                {
                                    //2 lưu idRam vào bảng ProductAttribute
                                    ProductAttribute atProRam = new ProductAttribute();
                                    atProRam.AttributeID = idRam5;
                                    if (idRam5 > idBig)
                                    {
                                        atProRam.IsActive = false;
                                    }
                                    else
                                    {
                                        atProRam.IsActive = true;
                                    }
                                    atProRam.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProRam);
                                    db.SaveChanges();
                                }
                                if (errorHDD.Equals(""))
                                {
                                    //3 lưu idhdd vào bảng ProductAttribute
                                    ProductAttribute atProHDD = new ProductAttribute();
                                    atProHDD.AttributeID = idHDD3;
                                    if (idHDD3 > idBig)
                                    {
                                        atProHDD.IsActive = false;
                                    }
                                    else
                                    {
                                        atProHDD.IsActive = true;
                                    }
                                    atProHDD.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProHDD);
                                    db.SaveChanges();
                                }
                                if (errorDisplay.Equals(""))
                                {
                                    //4 lưu idDisplay vào bảng ProductAttribute
                                    ProductAttribute atProDisp = new ProductAttribute();
                                    atProDisp.AttributeID = idDisplay4;
                                    if (idDisplay4 > idBig)
                                    {
                                        atProDisp.IsActive = false;
                                    }
                                    else
                                    {
                                        atProDisp.IsActive = true;
                                    }
                                    atProDisp.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProDisp);
                                    db.SaveChanges();
                                }
                                if (errorVGA.Equals(""))
                                {
                                    //5 lưu idvag vào bảng ProductAttribute
                                    ProductAttribute atProVAG = new ProductAttribute();
                                    atProVAG.AttributeID = idVGA2;
                                    if (idVGA2 > idBig)
                                    {
                                        atProVAG.IsActive = false;
                                    }
                                    else
                                    {
                                        atProVAG.IsActive = true;
                                    }
                                    atProVAG.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProVAG);
                                    db.SaveChanges();
                                }

                                #endregion
                                // thêm biến đếm số dòng lỗi được thêm vào.                   
                                listduplicatenew[i].RemoveAt(j);
                                j = j - 1;
                                if (listduplicatenew[i].Count < 2)
                                {
                                    listduplicatenew.RemoveAt(i);
                                    i = i--;
                                }
                            }
                            if (errorCount == 0)
                            {
                                //-------------- nếu không phát hiện trùng linh kiện thì cho add mới sản phẩm ---------------------------
                                Product p = new Product();

                                string urlServer = urlImageServer(listduplicatenew[i][j].Imagelink);
                                p.ImageURL = urlServer;
                                p.Price = 0;
                                p.TotalWeightPoint = 0;
                                p.IsActive = false;

                                // lưu vào database
                                db.Products.Add(p);
                                db.SaveChanges();
                                #region lấy id store hoặc lưu mới cho laptop
                                string urlcontent = listduplicatenew[i][j].Url;
                                var store = db.Stores.Where(x => urlcontent.Contains(x.StoreUrl)).FirstOrDefault();
                                int StoreID = 1;
                                string patter = "://|/";
                                Regex reg = new Regex(patter);
                                string host = reg.Split(listduplicatenew[i][j].Url)[1];
                                if (store != null)
                                {
                                    StoreID = store.ID;
                                }
                                else
                                {
                                    var newStore = new Store
                                    {
                                        IsActive = false,
                                        LogoImage = "default",
                                        StoreUrl = host,
                                        StoreName = "Chưa xác định",

                                    };
                                    db.Stores.Add(newStore);
                                    db.SaveChanges();
                                    StoreID = newStore.ID;
                                }
                                #endregion
                                // lấy id brand của Laptop
                                int brandID = BrandID(listduplicatenew[i][j].Name);

                                String[] mangten = listduplicatenew[i][j].Name.ToString().Split(';');
                                if (mangten.Length >= 2)
                                {
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idinsert = Convert.ToInt32(pronew.ID);
                                    AliasProduct proAli = new AliasProduct();
                                    proAli.Name = mangten[0];
                                    proAli.ProductID = idinsert;
                                    proAli.Price = Convert.ToDouble(listduplicatenew[i][j].Price);
                                    proAli.StoreID = StoreID;
                                    proAli.UpdateTime = DateTime.Now;
                                    if (brandID > 0)
                                    {
                                        proAli.BrandID = brandID;
                                    }
                                    proAli.URL = listduplicatenew[i][j].Url;
                                    proAli.IsMain = true;
                                    proAli.IsActive = true;
                                    db.AliasProducts.Add(proAli);
                                    db.SaveChanges();
                                }
                                else
                                {
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idinsert = Convert.ToInt32(pronew.ID);
                                    AliasProduct proAli = new AliasProduct();
                                    proAli.Name = mangten[i];
                                    proAli.ProductID = idinsert;
                                    proAli.Price = Convert.ToDouble(listduplicatenew[i][j].Price);
                                    proAli.StoreID = StoreID;
                                    proAli.UpdateTime = DateTime.Now;
                                    if (brandID > 0)
                                    {
                                        proAli.BrandID = brandID;
                                    }
                                    proAli.URL = listduplicatenew[i][j].Url;
                                    proAli.IsMain = true;
                                    proAli.IsActive = true;
                                    db.AliasProducts.Add(proAli);
                                    db.SaveChanges();
                                }

                                // lấy max ID và thêm vào bảng alias
                                if (mangten.Length >= 2)
                                {
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idinsert = Convert.ToInt32(pronew.ID);

                                    for (int h = 1; h < mangten.Length; h++)
                                    {
                                        AliasProduct proAli = new AliasProduct();
                                        proAli.Name = mangten[h];
                                        proAli.ProductID = idinsert;
                                        proAli.Price = Convert.ToDouble(listduplicatenew[i][j].Price);
                                        proAli.StoreID = StoreID;
                                        if (brandID > 0)
                                        {
                                            proAli.BrandID = brandID;
                                        }
                                        proAli.URL = listduplicatenew[i][j].Url;
                                        proAli.IsMain = false;
                                        proAli.IsActive = true;
                                        db.AliasProducts.Add(proAli);
                                        db.SaveChanges();
                                    }

                                }

                                // lấy id để lưu vào bảng productAtribute
                                int idCPU1 = 0;
                                int idVGA2 = 0;
                                int idHDD3 = 0;
                                int idDisplay4 = 0;
                                int idRam5 = 0;
                                // id CPU 1
                                for (int x = 0; x < listCPU.Count; x++)
                                {
                                    int dicID = listCPU[x].ID;
                                    var DictionaryCPU = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                                    List<Dictionary> listDicCPU = DictionaryCPU.ToList();
                                    for (int z = 0; z < listDicCPU.Count; z++)
                                    {
                                        if (listduplicatenew[i][j].CPU.Equals(listDicCPU[z].Name))
                                        {
                                            idCPU1 = listCPU[x].ID;
                                            break;
                                        }
                                    }

                                   
                                }
                                if (idCPU1 == 0)
                                {
                                    Hardware atcpu = new Hardware();
                                    atcpu.CodetypeID = "C";
                                    atcpu.Name = listduplicatenew[i][j].CPU;
                                    atcpu.WeightCriteraPoint = 0;
                                    db.Hardwares.Add(atcpu);
                                    db.SaveChanges();
                                    var cpunew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    idCPU1 = Convert.ToInt32(cpunew.ID);

                                    // lưu name vào Attibute Alias và để isactive là false
                                    Dictionary atcpuMap = new Dictionary();
                                    atcpuMap.AttributeDicID = cpunew.ID;
                                    atcpuMap.Name = listduplicatenew[i][j].CPU;
                                    atcpuMap.IsActive = true;
                                    db.Dictionaries.Add(atcpuMap);
                                    db.SaveChanges();

                                }
                                // id VGA 2
                                for (int x = 0; x < listVGA.Count; x++)
                                {
                                    int dicID = listVGA[x].ID;
                                    var DictionaryVGA = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                                    List<Dictionary> listDicVGA = DictionaryVGA.ToList();
                                    for (int z = 0; z < listDicVGA.Count; z++)
                                    {
                                        if (listduplicatenew[i][j].VGA.Equals(listDicVGA[z].Name))
                                        {
                                            idVGA2 = listVGA[x].ID;
                                            break;
                                        }
                                    }

                                   
                                }
                                if (idVGA2 == 0)
                                {
                                    Hardware atvga = new Hardware();
                                    atvga.CodetypeID = "V";
                                    atvga.Name = listduplicatenew[i][j].VGA;
                                    atvga.WeightCriteraPoint = 0;
                                    db.Hardwares.Add(atvga);
                                    db.SaveChanges();
                                    var vganew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    idVGA2 = Convert.ToInt32(vganew.ID);

                                    // lưu name vào Attibute Alias và để isactive là true
                                    Dictionary atvgaMap = new Dictionary();
                                    atvgaMap.AttributeDicID = vganew.ID;
                                    atvgaMap.Name = listduplicatenew[i][j].VGA;
                                    atvgaMap.IsActive = true;
                                    db.Dictionaries.Add(atvgaMap);

                                }
                                // id HDD 3
                                for (int x = 0; x < listHDD.Count; x++)
                                {
                                    int dicID = listHDD[x].ID;
                                    var DictionaryHDD = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                                    List<Dictionary> listDicHDD = DictionaryHDD.ToList();
                                    for (int z = 0; z < listDicHDD.Count; z++)
                                    {
                                        if (listduplicatenew[i][j].HDD.Equals(listDicHDD[z].Name))
                                        {
                                            idHDD3 = listHDD[x].ID;
                                            break;
                                        }
                                    }

                                    
                                }
                                if (idHDD3 == 0)
                                {
                                    Hardware athddd = new Hardware();
                                    athddd.CodetypeID = "H";
                                    athddd.Name = listduplicatenew[i][j].HDD;
                                    athddd.WeightCriteraPoint = 0;
                                    db.Hardwares.Add(athddd);
                                    db.SaveChanges();
                                    var hddnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    idHDD3 = Convert.ToInt32(hddnew.ID);
                                    // lưu name vào Attibute Alias và để isactive là true
                                    Dictionary athdddMap = new Dictionary();
                                    athdddMap.AttributeDicID = hddnew.ID;
                                    athdddMap.Name = listduplicatenew[i][j].HDD;
                                    athdddMap.IsActive = true;
                                    db.Dictionaries.Add(athdddMap);

                                }
                                // id Display 4
                                for (int x = 0; x < listDisplay.Count; x++)
                                {
                                    int dicID = listDisplay[x].ID;
                                    var DictionaryDisplay = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                                    List<Dictionary> listDicDisplay = DictionaryDisplay.ToList();
                                    for (int z = 0; z < listDicDisplay.Count; z++)
                                    {
                                        if (listduplicatenew[i][j].Display.Equals(listDicDisplay[z].Name))
                                        {
                                            idDisplay4 = listDisplay[x].ID;
                                            break;
                                        }
                                    }

                                  
                                }
                                if (idDisplay4 == 0)
                                {
                                    Hardware athdisp = new Hardware();
                                    athdisp.CodetypeID = "D";
                                    athdisp.Name = listduplicatenew[i][j].Display;
                                    athdisp.WeightCriteraPoint = 0;
                                    db.Hardwares.Add(athdisp);
                                    db.SaveChanges();
                                    var dispnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    idDisplay4 = Convert.ToInt32(dispnew.ID);

                                    // lưu name vào Attibute Alias và để isactive là true
                                    Dictionary athdispMap = new Dictionary();
                                    athdispMap.AttributeDicID = dispnew.ID;
                                    athdispMap.Name = listduplicatenew[i][j].Display;
                                    athdispMap.IsActive = true;
                                    db.Dictionaries.Add(athdispMap);
                                    db.SaveChanges();

                                }
                                // id Ram
                                for (int x = 0; x < listRam.Count; x++)
                                {
                                    int dicID = listRam[x].ID;
                                    var DictionaryRam = (from a in db.Dictionaries where a.AttributeDicID == dicID select a);
                                    List<Dictionary> listDicRam = DictionaryRam.ToList();
                                    for (int z = 0; z < listDicRam.Count; z++)
                                    {
                                        if (listduplicatenew[i][j].RAM.Equals(listDicRam[z].Name))
                                        {
                                            idRam5 = listRam[x].ID;
                                            break;
                                        }
                                    }

                                   
                                }
                                if (idRam5 == 0)
                                {
                                    Hardware athram = new Hardware();
                                    athram.CodetypeID = "R";
                                    athram.Name = listduplicatenew[i][j].RAM;
                                    athram.WeightCriteraPoint = 0;
                                    db.Hardwares.Add(athram);
                                    db.SaveChanges();
                                    var ramnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    idRam5 = Convert.ToInt32(ramnew.ID);

                                    // lưu name vào Attibute Alias và để isactive là true
                                    Dictionary athramMap = new Dictionary();
                                    athramMap.AttributeDicID = ramnew.ID;
                                    athramMap.Name = listduplicatenew[i][j].RAM;
                                    athramMap.IsActive = true;
                                    db.Dictionaries.Add(athramMap);

                                }
                                // lấy id của sản phẩm mới được insert vào db
                                var pronewinsert = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                int idinsertnew = Convert.ToInt32(pronewinsert.ID);

                                //1 lưu idcpu vào bảng ProductAttribute
                                ProductAttribute atProCPU = new ProductAttribute();
                                atProCPU.AttributeID = idCPU1;
                                if (idCPU1 > idBig)
                                {
                                    atProCPU.IsActive = false;
                                }
                                else
                                {
                                    atProCPU.IsActive = true;
                                }
                                atProCPU.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProCPU);
                                db.SaveChanges();
                                //2 lưu idRam vào bảng ProductAttribute
                                ProductAttribute atProRam = new ProductAttribute();
                                atProRam.AttributeID = idRam5;
                                if (idRam5 > idBig)
                                {
                                    atProRam.IsActive = false;
                                }
                                else
                                {
                                    atProRam.IsActive = true;
                                }
                                atProRam.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProRam);
                                db.SaveChanges();
                                //3 lưu idhdd vào bảng ProductAttribute
                                ProductAttribute atProHDD = new ProductAttribute();
                                atProHDD.AttributeID = idHDD3;
                                if (idHDD3 > idBig)
                                {
                                    atProHDD.IsActive = false;
                                }
                                else
                                {
                                    atProHDD.IsActive = true;
                                }
                                atProHDD.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProHDD);
                                db.SaveChanges();
                                //4 lưu idDisplay vào bảng ProductAttribute
                                ProductAttribute atProDisp = new ProductAttribute();
                                atProDisp.AttributeID = idDisplay4;
                                if (idDisplay4 > idBig)
                                {
                                    atProDisp.IsActive = false;
                                }
                                else
                                {
                                    atProDisp.IsActive = true;
                                }
                                atProDisp.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProDisp);
                                db.SaveChanges();
                                //5 lưu idvag vào bảng ProductAttribute
                                ProductAttribute atProVAG = new ProductAttribute();
                                atProVAG.AttributeID = idVGA2;
                                if (idVGA2 > idBig)
                                {
                                    atProVAG.IsActive = false;
                                }
                                else
                                {
                                    atProVAG.IsActive = true;
                                }
                                atProVAG.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProVAG);
                                db.SaveChanges();
                                listduplicatenew[i].RemoveAt(j);
                                j = j - 1;
                                // xóa phần tử được add vào database ra khỏi list
                                if (listduplicatenew[i].Count < 2)
                                {
                                    listduplicatenew.RemoveAt(i);
                                    i = i--;
                                }
                            }
                            Session["listduplicatenewLapT"] = listduplicatenew;
                           // Session["listtrunglinhkienT"] = listtrunglinhkien;
                            Session["danhsachLaptrunglinhkienT"] = danhsachLaptrunglinhkien;

                            ViewBag.listduplicatenewLap = (List<List<LapData>>)Session["listduplicatenewLapT"];
                            break;
                        }
                    }
                }

                return View();
            }
        }

        /// <summary>
        /// Gộp sản phẩm khi so trùng trong database
        /// </summary>
        /// <returns></returns>
        public ActionResult gopdatabase(String valuesgop)
        {
            using (CPS_SolutionEntities db = new CPS_SolutionEntities())
            {
                List<List<LapData>> listduplicatenew = (List<List<LapData>>)Session["listduplicatenewLapT"];
                String[] tachdup = valuesgop.ToString().Split('@');
                //check saved
                int count2 = 0;
                // duyệt hết list duplicate lớn
                for (int i = 0; i < listduplicatenew.Count; i++)
                {
                    // duyệt từng listduplicate nhỏ 
                    for (int j = 0; j < listduplicatenew[i].Count; j++)
                    {
                        // nếu phát hiện list nào có chứa giá trị tách trả về
                        if (tachdup[1].Equals(listduplicatenew[i][j].stt))
                        {
                            #region lấy id store hoặc lưu mới cho laptop
                            string urlcontent = listduplicatenew[i][1].Url;
                            var store = db.Stores.Where(x => urlcontent.Contains(x.StoreUrl)).FirstOrDefault();
                            int StoreID = 1;
                            string patter = "://|/";
                            Regex reg = new Regex(patter);
                            string host = reg.Split(listduplicatenew[i][1].Url)[1];
                            if (store != null)
                            {
                                StoreID = store.ID;
                            }
                            else
                            {
                                var newStore = new Store
                                {
                                    IsActive = false,
                                    LogoImage = "default",
                                    StoreUrl = host,
                                    StoreName = "Chưa xác định",

                                };
                                db.Stores.Add(newStore);
                                db.SaveChanges();
                                StoreID = newStore.ID;
                            }
                            #endregion
                            // lấy id brand của Laptop
                            int brandID = BrandID(listduplicatenew[i][j].Name);
                            String[] mangten = listduplicatenew[i][1].Name.ToString().Split(';');
                            for (int h = 0; h < mangten.Length; h++)
                            {

                                //lấy product trong database ra kiểm tra xem có trong database chưa.
                                List<AliasProduct> listmap = new List<AliasProduct>();
                                var resource1 = (from x in db.AliasProducts select x);
                                listmap = resource1.ToList();
                                int count1 = 0;
                                for (int r = 0; r < listmap.Count; r++)
                                {
                                    // tên sản phẩm đã có trong database thì không lưu bỏ qua
                                    if (listmap[r].Name.Equals(mangten[h]))
                                    {
                                        count1++;
                                        count2++;
                                    }
                                }
                                // tên sản phẩm chưa có trong database lưu vào
                                if (count1 == 0)
                                {
                                    AliasProduct a = new AliasProduct();
                                    a.Name = mangten[h];
                                    a.ProductID = Convert.ToInt32(listduplicatenew[i][0].stt);
                                    a.ProductID = Convert.ToInt32(listduplicatenew[i][0].stt);
                                    a.Price = Convert.ToDouble(listduplicatenew[i][1].Price);
                                    a.URL = listduplicatenew[i][1].Url;
                                    a.StoreID = StoreID;
                                    a.UpdateTime = DateTime.Now;
                                    if (brandID > 0)
                                    {
                                        a.BrandID = brandID;
                                    }
                                    a.IsMain = false;
                                    a.IsActive = true;
                                    db.AliasProducts.Add(a);
                                    db.SaveChanges();
                                    count2++;
                                }
                            }

                        }

                        // sau khi lưu hoàn thành xóa list dup nhỏ này đi gán lại giá trị vào session.
                        if (count2 > 0)
                        {
                            listduplicatenew.RemoveAt(i);
                            Session["listduplicatenewLapT"] = listduplicatenew;
                            i--;
                            break;
                        }
                    }
                    // đã thực hiện lưu xong thoát khỏi vòng lặp lớn
                    if (count2 > 0)
                    {
                        break;
                    }
                }
                ViewBag.listduplicatenewLap = (List<List<LapData>>)Session["listduplicatenewLapT"];
                return View();
            }
        }

        /// <summary>
        /// Show thông tin về số lượng của 3 tab.
        /// </summary>
        /// <param name="showInfo"></param>
        /// <returns></returns>
        public ActionResult showInfo1(string showInfo)
        {
            if (showInfo.Equals("ok"))
            {
                ViewBag.ListdupLaptraning = (List<List<LapData>>)Session["ListdupLaptraning"];
                ViewBag.listproduct = (List<LapData>)Session["listproductLapT"];
                ViewBag.listduplicatenewLap = (List<List<LapData>>)Session["listduplicatenewLapT"];
                ViewBag.ListerrorTraning = (List<LapData>)Session["ListerrorTraning"];
            }
            return View();
        }
              /// <summary>
        /// Save image in server to insert db
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public string urlImageServer(string url)
        {
            string now = DateTime.Now.ToString("yyyyMMdd-HHmmss");
            string filename = "Laptop" + now;
            return CPS_Solution.Areas.Admin.Helpers.ImageHelper.DownloadImage(url, filename);
            //try
            //{
            //    //string url = "http://laptopno1.com/images/Products/129930991376352255.jpg";
            //    string exts = Path.GetExtension(url);
            //    string strRealname = Path.GetFileName(url);
            //    string name = url.Replace('/', 'a');
            //    name = name.Replace(':', 'b');
            //    name = name.Replace('%', 'b');
            //    System.Net.WebClient wc = new System.Net.WebClient();
            //    string path = Path.Combine(Server.MapPath("~/Images/I"), name + exts);
            //    wc.DownloadFile(url, path);
            //    string newpath = "Images/I/" + name + exts;
            //    return newpath;
            //}catch(Exception ex){
            //    return   "Images/I/default.jpg";
            //}
        }

        /// <summary>
        /// Kiểm tra url image có tồn tại không.
        /// </summary>
        /// <param name="URL"></param>
        /// <returns></returns>
        #region Kiểm tra url image có tồn tại không.
        bool IsImageUrl(string URL)
        {
            var req = (HttpWebRequest)HttpWebRequest.Create(URL);
            req.Method = "HEAD";
            try
            {
                using (var resp = req.GetResponse())
                {
                    return resp.ContentType.ToLower(CultureInfo.InvariantCulture)
                               .StartsWith("image/");
                }
            }
            catch
            {
                return false;
            }
        }
        #endregion
        /// <summary>
        /// Lấy brand Id từ laptopName
        /// </summary>
        /// <param name="LaptopName"></param>
        /// <returns></returns>
        public int BrandID(string LaptopName)
        {
            int brandID = 0;
            using (CPS_SolutionEntities db = new CPS_SolutionEntities())
            {
                var Listbrand = db.Brands.ToList();
                foreach (Brand b in Listbrand)
                {
                    if (LaptopName.ToUpper().Trim().Contains(b.BrandName.ToUpper()))
                    {
                        brandID = b.ID;
                        break;
                    }
                }

            }
            return (brandID);
        }
        /// <summary>
        /// Kiểm tra url có tồn tại không.
        /// </summary>
        /// <param name="URL"></param>
        /// <returns></returns>
        #region Kiểm tra url  có tồn tại không.
        bool IsUrl(string URL)
        {
            HttpWebResponse response = null;
            if (URL.Equals(""))
            {
                return false;
            }
            var request = (HttpWebRequest)WebRequest.Create(URL);
            request.Method = "HEAD";
            try
            {
                response = (HttpWebResponse)request.GetResponse();
                return true;
            }
            catch (WebException ex)
            {
                /* A WebException will be thrown if the status of the response is not `200 OK` */
                return false;
            }
            finally
            {
                // Don't forget to close your response.
                if (response != null)
                {
                    response.Close();
                }
            }
        }
        #endregion
 
    }
}
