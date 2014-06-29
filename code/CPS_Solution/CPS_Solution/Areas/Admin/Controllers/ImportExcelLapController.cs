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
namespace CPS_Solution.Areas.Admin.Controllers
{
    public class ImportExcelLapController : Controller
    {
        CPS_SolutionEntities db = new CPS_SolutionEntities();

        // GET: /Admin/ImportExcelLap/
        public ActionResult Index()
        {
           List<String> danhsachloi =(List<String>)Session["errorLineLap"];

            // nếu có danh sách lỗi thì xóa hết 3 list
           Session["danhsachlaploi"] =null;
           if (danhsachloi != null)
           {
               if (Convert.ToInt32(danhsachloi[0]) > 10)
               {
                   Session["listproductLap"] = null;
                   Session["listduplicateLap"] = null;
                   Session["danhsachlaploi"] = Session["listerrorLap"];
                   Session["listerrorLap"] = null;
               }
           }
            // danh sách Đúng, Trùng, Lỗi
            ViewBag.listproduct = (List<LapData>)Session["listproductLap"];
            ViewBag.listerror = (List<LapData>)Session["listerrorLap"];
            ViewBag.listduplicate = (List<List<LapData>>)Session["listduplicateLap"];
            ViewBag.listduplicatenew = (List<List<LapData>>)Session["listduplicatenewLap"];

            // quá nhiều lỗi hiện thị ra dòng và sản phẩm bị lỗi.
            ViewBag.danhsachlaploi = (List<LapData>)Session["danhsachlaploi"];
            // dòng chứa lỗi
            ViewBag.errorLineLap= Session["errorLineLap"];
            return View();
        }

        /// <summary>
        /// Lưu dữ liệu đúng vào database
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult saveAllProduct(String checkval)
        {

            // get list product in session.
            List<ProductMap> listpro = (List<ProductMap>)Session["listproductLap"];
            List<ProductMap> listerror = (List<ProductMap>)Session["listerrorLap"];
            List<List<ProductMap>> listduplicate = (List<List<ProductMap>>)Session["listduplicateLap"];


            //ghi logfile---------------------------------------------------------------------------------
            String[] ghilog = checkval.ToString().Split('@');

            // nếu có check  ghilog Duplicate
            if (!ghilog[0].Equals("no"))
            {
                LogFileDupProHelper.GenerateLogfile(listduplicate);
                // xóa session dup
                Session["listduplicateLap"] = null;
            }
            // nếu có check ghilog Error
            if (!ghilog[1].Equals("no"))
            {

                // xóa session error
                Session["listerrorLap"] = null;
            }



            // Tạo listduplicate mới chứa trùng giữa listpro và trong database
            List<List<ProductMap>> listduplicatenew = new List<List<ProductMap>>();

            //lấy product trong database ra chỉ lấy Codetype bằng loai.
            List<AttributeDictionary> listproindatabase = new List<AttributeDictionary>();
            String loai = listpro[0].loai;
            var resource = (from x in db.AttributeDictionaries where x.Codetype.Name.Equals(loai) select x);
            listproindatabase = resource.ToList();

            // tìm sản phẩm trùng cho vào list trùng hoặc xóa đi :|
            for (int j = 0; j < listproindatabase.Count; j++)
            {
                List<ProductMap> duplicateProduct = new List<ProductMap>();
                for (int i = 0; i < listpro.Count; i++)
                {
                    String Name = "";
                    String[] mangten = listpro[i].ten.ToString().Split(';');
                    if (mangten.Length >= 2)
                    {
                        Name = mangten[0];
                    }
                    else
                    {
                        Name = listpro[i].ten;
                    }

                    if (listproindatabase[j].Name.ToString().Equals(Name))
                    {
                        listproindatabase.RemoveAt(j);
                        listpro.RemoveAt(i);
                        i--;
                        j--;
                        break;
                    }

                    // lấy sản phầm trùng cho vào list trùng mới
                    if (CompareStringHelper.CompareString(Name, listproindatabase[j].Name.ToString()) >= 85)
                    {
                        ProductMap pro = new ProductMap();
                        pro.stt = listproindatabase[j].ID.ToString();
                        pro.ten = listproindatabase[j].Name;
                        pro.loai = listproindatabase[j].Codetype.Name;
                        pro.trongso = listproindatabase[j].WeightCriteraPoint.ToString();
                        duplicateProduct.Add(pro);
                        listpro[i].stt = "z" + listpro[i].stt;
                        duplicateProduct.Add(listpro[i]);
                        listpro.RemoveAt(i);
                        i--;
                    }

                }
                if (duplicateProduct.Count >= 2)
                {
                    listduplicatenew.Add(duplicateProduct);
                }
            }
            Session["listduplicatenewLap"] = listduplicatenew;

            // lưu vào database
            for (int i = 0; i < listpro.Count; i++)
            {
                AttributeDictionary p = new AttributeDictionary();

                String[] mangten = listpro[i].ten.ToString().Split(';');
                if (mangten.Length >= 2)
                {
                    p.Name = mangten[0];
                }
                else
                {
                    p.Name = listpro[i].ten;
                }
                var LCodeType = (from c in db.Codetypes select c);

                List<Codetype> Listcodetype = LCodeType.ToList();

                foreach (Codetype codety in Listcodetype)
                {
                    codety.Name.Equals(listpro[i].loai);
                    p.CodetypeID = codety.ID;
                    break;
                }
                p.WeightCriteraPoint = Convert.ToInt32(listpro[i].trongso);
                db.AttributeDictionaries.Add(p);
                db.SaveChanges();
                // lấy max ID và thêm vào bảng alias
                if (mangten.Length >= 2)
                {
                    var pronew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                    int idinsert = Convert.ToInt32(pronew.ID);

                    for (int h = 1; h < mangten.Length; h++)
                    {
                        AttributeMapping a = new AttributeMapping();
                        a.Name = mangten[h];
                        a.AttributeDicID = idinsert;
                        db.AttributeMappings.Add(a);
                        db.SaveChanges();
                    }

                }
                // xóa phần tử được add vào database ra khỏi list
                listpro.Remove(listpro[i]);
                i = i - 1;
            }
            Session["listduplicatenewLap"] = listduplicatenew;
            ViewBag.listduplicatenew = (List<List<ProductMap>>)Session["listduplicatenewLap"];
            return RedirectToAction("index");
        }

        /// <summary>
        /// Lấy dữ liệu từ excel cho vào 3 list
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Index(HttpPostedFileBase file)
        {
            List<LapData> listpro = new List<LapData>();
            List<LapData> listerror = new List<LapData>();
            List<List<LapData>> listduplicate = new List<List<LapData>>();

            //Get path after upload file to process
            String path = uploadFile(file);
            var excel = new ExcelQueryFactory();
            excel.FileName = path;
            // Get all product from excel to list
            try
            {
                var list = from x in excel.WorksheetRange("A2", "H900000")
                           select new LapData
                           {
                               stt = x["STT"],
                               Name = x["Tên"],
                               Imagelink = x["Địa chỉ ảnh"],
                               CPU = x["CPU"],
                               VGA = x["VGA"],
                               HDD = x["HDD"],
                               Display = x["Display"],
                               RAM = x["RAM"]
                           };
                listpro = list.ToList();
            }


            catch (Exception e)
            {

            }
            // Gán số thứ tự
            int sttp = 0;
            for (int i = 0; i < listpro.Count; i++)
            {
                sttp++;
                listpro[i].stt = sttp.ToString();
                
            }
            // call function listerror
            listerror = ListErrorProduct(listpro);
            // call function listduplicate
            listduplicate = ListDuplicateProduct(listpro);

            Session["listproductLap"] = listpro;
            Session["listerrorLap"] = listerror;
            Session["listduplicateLap"] = listduplicate;
            Session["danhsachlaploi"] = null;
            // redirect back to the index action to show the form once again
            //   TempData["listproduct"] = listpro;
            //   ViewBag.listproduct = listpro;
            return RedirectToAction("Index");
            // return View();
        }

        /// <summary>
        /// Hủy import excel
        /// </summary>
        /// <returns></returns>
        public ActionResult huyimport()
        {
            Session["listproductLap"] = null;
            Session["listerrorLap"] = null;
            Session["listduplicateLap"] = null;
            Session["danhsachlaploi"] = null;
            Session["listduplicatenewLap"] = null;
            return RedirectToAction("Index");
        }
        /// <summary>
        /// upload file and save file
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        public string uploadFile(HttpPostedFileBase file)
        {
            string path = "";
            // Verify that the user selected a file
            if (file != null && file.ContentLength > 0)
            {
                // extract only the fielname
                var fileName = Path.GetFileName(file.FileName);
                // store the file inside ~/App_Data/uploads folder
                path = Path.Combine(Server.MapPath("~/App_Data/uploads"), fileName);
                file.SaveAs(path);
            }
            return path;
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
            // list dòng lỗi 1 Name, 2 Linkimage, 3 Display, 4 CPU, 5 HDD, 6 VGA, 7 Ram
            for (int i = 0; i < 8; i++)
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
                int anh1 = list[i].Imagelink.IndexOf("jpg");
                int anh2 = list[i].Imagelink.IndexOf("png");
                Uri myUri;
                if (!Uri.TryCreate(list[i].Imagelink, UriKind.RelativeOrAbsolute, out myUri) || (anh1 + anh1 < 0))
                {
                    errorLine[2] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi Display
                if (list[i].Display.Length < 5 || list[i].Display.Length > 100)
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
                int distance;
                if (!int.TryParse(list[i].HDD, out distance))
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
                int distance1;
                if (!int.TryParse(list[i].RAM, out distance1))
                {
                    errorLine[7] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }

                // cho vào list lỗi @@
                if (loi > 0)
                {
                    errorlist.Add(list[i]);
                    // thêm biến đếm số dòng lỗi được thêm vào.                   
                    list.RemoveAt(i);
                    i=i -1;
                }
            }
            errorLine[0] = count.ToString();
            Session["errorLineLap"] = errorLine;
            return errorlist;
        }
        /// <summary>
        /// Get duplicate product list
        /// </summary>
        /// <param name="list"></param>
        /// <returns></returns>
        public List<List<LapData>> ListDuplicateProduct(List<LapData> list)
        {
            List<List<LapData>> duplicatelist = new List<List<LapData>>();

            for (int i = 0; i < list.Count -1; i++)
            {
                List<LapData> duplicateProduct = new List<LapData>();
                for (int j = i + 1; j < list.Count; j++)
                {
                    if (Helpers.CompareStringHelper.CompareString(list[i].Name.ToString(), list[j].Name.ToString()) >= 85)
                    {
                        duplicateProduct.Add(list[j]);
                        list.RemoveAt(j);
                        j--;
                    }
                }
                if (duplicateProduct.Count >= 1)
                {
                    duplicateProduct.Add(list[i]);
                    list.RemoveAt(i);
                    i--;
                    duplicatelist.Add(duplicateProduct);
                }
            }
            return duplicatelist;
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
                List<LapData> listpro = (List<LapData>)Session["listproductLap"];
                List<LapData> listerror = (List<LapData>)Session["listerrorLap"];
                List<List<LapData>> listduplicate = (List<List<LapData>>)Session["listduplicateLap"];
                String[] info = stringpro.ToString().Split('@');
                string stt = info[0];
                string Name = info[1];
                string ImageLink = info[2];
                string CPU = info[3];
                string VGA = info[4];
                string HDD = info[5];
                string Display = info[6];
                string Ram = info[7];

                // xóa sản phẩm trong list error và cập nhập vào session
                LapData delpro = new LapData();
                foreach (LapData p in listerror)
                {
                    if (p.stt.Equals(stt))
                    {
                        delpro = p;
                        break;
                    }
                }
                listerror.Remove(delpro);
                Session["listerrorLap"] = listerror;
                // xử lý sản phẩm lỗi đã được update.
                LapData update = new LapData();
                update.stt = stt;
                update.Name = Name;
                update.Imagelink = ImageLink;
                update.CPU = CPU;
                update.VGA = VGA;
                update.HDD = HDD;
                update.Display = Display;
                update.RAM = Ram;
                // so trùng với correct list và duplicate list
                List<LapData> listtam = new List<LapData>();
                listtam.Add(update);

                //Duyệt hết list correct
                for (int i = 0; i < listpro.Count; i++)
                {
                    // nếu phát hiện trùng
                    if (CompareStringHelper.CompareString(listpro[i].Name.ToString(), update.Name) >= 85)
                    {
                        listtam.Add(listpro[i]);
                        listpro.Remove(listpro[i]);
                        i--;
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
                    int count = 0;
                    for (int i = 0; i < listduplicate.Count; i++)
                    {
                        if (CompareStringHelper.CompareString(listduplicate[i][0].ToString(), update.Name) >= 85)
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
                //update listError and listDuplicate
                Session["listproductLap"] = listpro;
                Session["listduplicateLap"] = listduplicate;
            }
            ViewBag.listproduct = (List<LapData>)Session["listproductLap"];
            ViewBag.listerror = (List<LapData>)Session["listerrorLap"];
            ViewBag.listduplicate = (List<List<LapData>>)Session["listduplicateLap"];
            // quá nhiều lỗi hiện thị ra dòng và sản phẩm bị lỗi.
            ViewBag.danhsachlaploi = (List<LapData>)Session["danhsachlaploi"];
            // dòng chứa lỗi
            ViewBag.errorLineLap = Session["errorLineLap"];
            return View();
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
                List<LapData> listpro = (List<LapData>)Session["listproductLap"];
                List<LapData> listerror = (List<LapData>)Session["listerrorLap"];
                List<List<LapData>> listduplicate = (List<List<LapData>>)Session["listduplicateLap"];
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
            ViewBag.listproduct = (List<LapData>)Session["listproductLap"];
            ViewBag.listerror = (List<LapData>)Session["listerrorLap"];
            ViewBag.listduplicate = (List<List<LapData>>)Session["listduplicateLap"];
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
            List<LapData> listpro = (List<LapData>)Session["listproductLap"];
            List<LapData> listerror = (List<LapData>)Session["listerrorLap"];
            List<List<LapData>> listduplicate = (List<List<LapData>>)Session["listduplicateLap"];

            // lấy tên chính ở cuối list ra và remove
            string sttTenchinh = values.Last();
            values.Remove(values.Last());

            // tên sản phẩm gộp
            string tenmoi = "";
            LapData sanphamgop = new LapData();

            int count = 0;
            for (int i = 0; i < listduplicate.Count; i++)
            {
                for (int j = 0; j < listduplicate[i].Count; j++)
                {
                    // duyệt để tim thấy list có chưa id tách được gửi về.
                    for (int t = 0; t < values.Count; t++)
                    {
                        if (listduplicate[i][j].stt.ToString().Equals(sttTenchinh))
                        {
                            count++;
                            tenmoi = listduplicate[i][j].Name;
                            sanphamgop = listduplicate[i][j];
                            listduplicate[i].Remove(listduplicate[i][j]);
                        }
                        if (listduplicate[i][j].stt.ToString().Equals(values[t].ToString()))
                        {
                            tenmoi += ";" + listduplicate[i][j].Name;
                            listduplicate[i].Remove(listduplicate[i][j]);
                        }
                        if (listduplicate[i].Count == 0)
                        {
                            break;
                        }
                    }
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

            sanphamgop.Name = tenmoi;
            listpro.Add(sanphamgop);
            Session["listproductLap"] = listpro;
            Session["listerrorLap"] = listerror;
            Session["listduplicateLap"] = listduplicate;
            ViewBag.listproduct = (List<LapData>)Session["listproductLap"];
            ViewBag.listerror = (List<LapData>)Session["listerrorLap"];
            ViewBag.listduplicate = (List<List<LapData>>)Session["listduplicateLap"];
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
                    List<LapData> listpro = (List<LapData>)Session["listproductLap"];
                    List<LapData> listerror = (List<LapData>)Session["listerrorLap"];
                    List<List<LapData>> listduplicate = (List<List<LapData>>)Session["listduplicateLap"];
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

                    Session["listerrorLap"] = listerror;
                    Session["listduplicateLap"] = listduplicate;

                    Session["listproductLap"] = listpro;
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
                    List<LapData> listpro = (List<LapData>)Session["listproductLap"];
                    List<LapData> listerror = (List<LapData>)Session["listerrorLap"];
                    List<List<LapData>> listduplicate = (List<List<LapData>>)Session["listduplicateLap"];
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

                    Session["listerrorLap"] = listerror;
                    Session["listduplicateLap"] = listduplicate;

                    Session["listproductLap"] = listpro;
                }
            }
            //cho vào viewbag
            ViewBag.listproduct = (List<LapData>)Session["listproductLap"];
            ViewBag.listerror = (List<LapData>)Session["listerrorLap"];
            ViewBag.listduplicate = (List<List<LapData>>)Session["listduplicateLap"];

            return View();
        }
    }
}
