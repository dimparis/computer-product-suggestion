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
namespace CPS_Solution.Areas.Admin.Controllers
{
    public class ImportExcelLapController : Controller
    {


        // GET: /Admin/ImportExcelLap/
        public ActionResult Index()
        {
            using (CPS_SolutionEntities db = new CPS_SolutionEntities())
            {

                List<String> danhsachloi = (List<String>)Session["errorLineLap"];
                // nếu có danh sách lỗi thì xóa hết 3 list
                Session["danhsachlaploi"] = null;
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
                ViewBag.listExistedLap = (List<LapData>)TempData["listExistedLap"];
                ViewBag.listerror = (List<LapData>)Session["listerrorLap"];
                ViewBag.listduplicate = (List<List<LapData>>)Session["listduplicateLap"];
                ViewBag.listduplicatenewLap = (List<List<LapData>>)Session["listduplicatenewLap"];

                // quá nhiều lỗi hiện thị ra dòng và sản phẩm bị lỗi.
                ViewBag.danhsachlaploi = (List<LapData>)Session["danhsachlaploi"];
                // dòng chứa lỗi
                ViewBag.errorLineLap = Session["errorLineLap"];
                return View();
            }
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
                List<LapData> listpro = (List<LapData>)Session["listproductLap"];
                List<LapData> listerror = (List<LapData>)Session["listerrorLap"];
                List<List<LapData>> listduplicate = (List<List<LapData>>)Session["listduplicateLap"];


                //ghi logfile---------------------------------------------------------------------------------
                String[] ghilog = checkval.ToString().Split('@');

                // nếu có check  ghilog Duplicate
                if (!ghilog[0].Equals("no"))
                {
                    // LogFileDupProHelper.GenerateLogfile(listduplicate);
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
                List<List<LapData>> listduplicatenew = new List<List<LapData>>();

                //lấy product trong database ra.
                List<Product> listproindatabase = new List<Product>();
                var liproduct = (from x in db.Products select x);
                listproindatabase = liproduct.ToList();

                // tìm sản phẩm trùng cho vào list trùng hoặc xóa đi :|
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

                        if (listproindatabase[j].Name.ToString().Equals(Name))
                        {
                            listproindatabase.RemoveAt(j);
                            listpro.RemoveAt(i);
                            i--;
                            j--;
                            break;
                        }

                        //---- lấy sản phầm trùng cho vào list trùng mới------------------------------------------------------------
                        if (CompareStringHelper.CompareString(Name, listproindatabase[j].Name.ToString()) >= 85)
                        {
                            LapData pro = new LapData();
                            pro.stt = listproindatabase[j].ID.ToString();
                            int stt = listproindatabase[j].ID;
                            pro.Imagelink = listproindatabase[j].URL;
                            pro.Name = listproindatabase[j].Name;
                            // lấy CPU của product ra
                            var idAttrC = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("C") && a.ProductID == stt select a.AttributeID).SingleOrDefault();
                            int idCPU = Convert.ToInt32(idAttrC.ToString());
                            var CPU = (from a in db.AttributeDictionaries where a.ID.Equals(idCPU) select a.Name).FirstOrDefault();
                            pro.CPU = CPU.ToString();
                            // lấy VGA của product ra
                            var idAttrV = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("V") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                            int idVGA = Convert.ToInt32(idAttrV.ToString());
                            var VGA = (from a in db.AttributeDictionaries where a.ID.Equals(idVGA) select a.Name).FirstOrDefault();
                            pro.VGA = VGA.ToString();
                            // lấy HDD của product ra
                            var idAttrH = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("H") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                            int idHDD = Convert.ToInt32(idAttrH.ToString());
                            var HDD = (from a in db.AttributeDictionaries where a.ID.Equals(idHDD) select a.Name).FirstOrDefault();
                            pro.HDD = HDD.ToString();
                            // lấy Display  của product ra
                            var idAttrD = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("D") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                            int idDisplay = Convert.ToInt32(idAttrD.ToString());
                            var Display = (from a in db.AttributeDictionaries where a.ID.Equals(idDisplay) select a.Name).FirstOrDefault();
                            pro.Display = Display.ToString();
                            // lấy RAM   của product ra
                            var idAttrR = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("R") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                            int idRAM = Convert.ToInt32(idAttrR.ToString());
                            var RAM = (from a in db.AttributeDictionaries where a.ID.Equals(idRAM) select a.Name).FirstOrDefault();
                            pro.RAM = RAM.ToString();
                            // add list dup
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
                        Session["listduplicatenewLap"] = listduplicatenew;
                        break;
                    }
                }

                // -----sản phẩm còn lại lưu vào database-------------------------------------------------------
                // khởi tạo listtrunglinh kiện chứa id của những sản phẩm bị trùng
                List<String> listtrunglinhkien = new List<String>();
                List<LapData> danhsachLaptrunglinhkien = new List<LapData>();
                for (int x = 0; x < 6; x++)
                {
                    listtrunglinhkien.Add("");
                }
                for (int i = 0; i < listpro.Count; i++)
                {
                    //----------------------------- kiểm tra sản phẩm trong listpro có bị trùng linh kiện ko---------------------------
                    // lấy hết CPU trong db ra
                    var listCPUdb = (from a in db.AttributeDictionaries where a.CodetypeID.Equals("C") select a);
                    List<AttributeDictionary> listCPU = listCPUdb.ToList();
                    // lấy hết VGA trong db ra
                    var listVGAdb = (from a in db.AttributeDictionaries where a.CodetypeID.Equals("V") select a);
                    List<AttributeDictionary> listVGA = listVGAdb.ToList();
                    // lấy hết HDD trong db ra
                    var listHDDdb = (from a in db.AttributeDictionaries where a.CodetypeID.Equals("H") select a);
                    List<AttributeDictionary> listHDD = listHDDdb.ToList();
                    // lấy hết Display trong db ra
                    var listDisplaydb = (from a in db.AttributeDictionaries where a.CodetypeID.Equals("D") select a);
                    List<AttributeDictionary> listDisplay = listDisplaydb.ToList();
                    // lấy hết Ram trong db ra
                    var listRamdb = (from a in db.AttributeDictionaries where a.CodetypeID.Equals("R") select a);
                    List<AttributeDictionary> listRam = listRamdb.ToList();

                    int errorCount = 0;
                    // trùng CPU 1
                    for (int x = 0; x < listCPU.Count; x++)
                    {
                        if (listpro[i].CPU.Equals(listCPU[x].Name))
                        {
                            break;
                        }
                        else if (CompareStringHelper.CompareString(listpro[i].CPU, listCPU[x].Name) > 85)
                        {
                            listtrunglinhkien[1] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                            errorCount++;
                            break;
                        }
                    }
                    // trùng VGA 2
                    for (int x = 0; x < listVGA.Count; x++)
                    {
                        if (listpro[i].VGA.Equals(listVGA[x].Name))
                        {
                            break;
                        }
                        else if (CompareStringHelper.CompareString(listpro[i].VGA, listVGA[x].Name) > 85)
                        {
                            listtrunglinhkien[2] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                            errorCount++;
                            break;
                        }
                    }
                    // trùng HDD 3
                    for (int x = 0; x < listHDD.Count; x++)
                    {
                        if (listpro[i].HDD.Equals(listHDD[x].Name))
                        {
                            break;
                        }
                        else if (CompareStringHelper.CompareString(listpro[i].HDD, listHDD[x].Name) > 85)
                        {
                            listtrunglinhkien[3] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                            errorCount++;
                            break;
                        }
                    }
                    // trùng Display 4
                    for (int x = 0; x < listDisplay.Count; x++)
                    {
                        if (listpro[i].Display.Equals(listDisplay[x].Name))
                        {
                            break;
                        }
                        else if (CompareStringHelper.CompareString(listpro[i].Display, listDisplay[x].Name) > 85)
                        {
                            listtrunglinhkien[4] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                            errorCount++;
                            break;
                        }
                    }
                    // trùng Ram
                    for (int x = 0; x < listRam.Count; x++)
                    {
                        if (listpro[i].RAM.Equals(listRam[x].Name))
                        {
                            break;
                        }
                        else if (CompareStringHelper.CompareString(listpro[i].RAM, listRam[x].Name) > 85)
                        {
                            listtrunglinhkien[5] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                            errorCount++;
                            break;
                        }
                    }

                    // cho vào list lỗi @@
                    if (errorCount > 0)
                    {
                        danhsachLaptrunglinhkien.Add(listpro[i]);
                        // thêm biến đếm số dòng lỗi được thêm vào.                   
                        listpro.RemoveAt(i);
                        i = i - 1;
                    }
                    //-------------- nếu không phát hiện trùng linh kiện thì cho add mới sản phẩm ---------------------------
                    if (errorCount == 0)
                    {
                        Product p = new Product();

                        p.URL = listpro[i].Imagelink;
                        p.Price = 0;
                        p.TotalWeightPoint = 0;
                        p.IsActive = false;

                        // lưu vào database
                        db.Products.Add(p);
                        db.SaveChanges();

                        String[] mangten = listpro[i].Name.ToString().Split(';');
                        if (mangten.Length >= 2)
                        {
                            var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            int idinsert = Convert.ToInt32(pronew.ID);
                            ProductAlia proAli = new ProductAlia();
                            proAli.Name = mangten[0];
                            proAli.ProductID = idinsert;
                            proAli.IsMain = true;
                            proAli.IsActive = true;
                            db.ProductAlias.Add(proAli);
                            db.SaveChanges();
                        }
                        else
                        {
                            var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            int idinsert = Convert.ToInt32(pronew.ID);
                            ProductAlia proAli = new ProductAlia();
                            proAli.Name = mangten[i];
                            proAli.ProductID = idinsert;
                            proAli.IsMain = true;
                            proAli.IsActive = true;
                            db.ProductAlias.Add(proAli);
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
                                ProductAlia proAli = new ProductAlia();
                                proAli.Name = mangten[h];
                                proAli.ProductID = idinsert;
                                proAli.IsMain = false;
                                proAli.IsActive = true;
                                db.ProductAlias.Add(proAli);
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
                            if (listpro[i].CPU.Equals(listCPU[x].Name))
                            {
                                idCPU1 = listCPU[x].ID;
                                break;
                            }
                            else
                            {
                                AttributeDictionary atcpu = new AttributeDictionary();
                                atcpu.CodetypeID = "C";
                                atcpu.Name = listpro[i].CPU;
                                atcpu.WeightCriteraPoint = 0;
                                db.AttributeDictionaries.Add(atcpu);
                                db.SaveChanges();
                                var cpunew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                idCPU1 = Convert.ToInt32(cpunew.ID);
                                break;
                            }
                        }
                        // id VGA 2
                        for (int x = 0; x < listVGA.Count; x++)
                        {
                            if (listpro[i].VGA.Equals(listVGA[x].Name))
                            {
                                idVGA2 = listVGA[x].ID;
                                break;
                            }
                            else
                            {

                                AttributeDictionary atvga = new AttributeDictionary();
                                atvga.CodetypeID = "V";
                                atvga.Name = listpro[i].VGA;
                                atvga.WeightCriteraPoint = 0;
                                db.AttributeDictionaries.Add(atvga);
                                db.SaveChanges();
                                var vganew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                idVGA2 = Convert.ToInt32(vganew.ID);
                                break;
                            }
                        }
                        // id HDD 3
                        for (int x = 0; x < listHDD.Count; x++)
                        {
                            if (listpro[i].HDD.Equals(listHDD[x].Name))
                            {
                                idHDD3 = listHDD[x].ID;
                                break;
                            }
                            else
                            {

                                AttributeDictionary athddd = new AttributeDictionary();
                                athddd.CodetypeID = "H";
                                athddd.Name = listpro[i].HDD;
                                athddd.WeightCriteraPoint = 0;
                                db.AttributeDictionaries.Add(athddd);
                                db.SaveChanges();
                                var hddnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                idHDD3 = Convert.ToInt32(hddnew.ID);
                                break;
                            }
                        }
                        // id Display 4
                        for (int x = 0; x < listDisplay.Count; x++)
                        {
                            if (listpro[i].Display.Equals(listDisplay[x].Name))
                            {
                                idDisplay4 = listDisplay[x].ID;
                                break;
                            }
                            else
                            {
                                AttributeDictionary athdisp = new AttributeDictionary();
                                athdisp.CodetypeID = "D";
                                athdisp.Name = listpro[i].Display;
                                athdisp.WeightCriteraPoint = 0;
                                db.AttributeDictionaries.Add(athdisp);
                                db.SaveChanges();
                                var dispnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                idDisplay4 = Convert.ToInt32(dispnew.ID);
                                break;
                            }
                        }
                        // id Ram
                        for (int x = 0; x < listRam.Count; x++)
                        {
                            if (listpro[i].RAM.Equals(listRam[x].Name))
                            {
                                idRam5 = listRam[x].ID;
                                break;
                            }
                            else
                            {

                                AttributeDictionary athram = new AttributeDictionary();
                                athram.CodetypeID = "R";
                                athram.Name = listpro[i].RAM;
                                athram.WeightCriteraPoint = 0;
                                db.AttributeDictionaries.Add(athram);
                                db.SaveChanges();
                                var ramnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                idRam5 = Convert.ToInt32(ramnew.ID);
                                break;
                            }
                        }
                        // lấy id của sản phẩm mới được insert vào db
                        var pronewinsert = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        int idinsertnew = Convert.ToInt32(pronewinsert.ID);

                        //1 lưu idcpu vào bảng ProductAttribute
                        ProductAttribute atProCPU = new ProductAttribute();
                        atProCPU.AttributeID = idCPU1;
                        atProCPU.ProductID = idinsertnew;
                        db.ProductAttributes.Add(atProCPU);
                        db.SaveChanges();
                        //2 lưu idRam vào bảng ProductAttribute
                        ProductAttribute atProRam = new ProductAttribute();
                        atProRam.AttributeID = idRam5;
                        atProRam.ProductID = idinsertnew;
                        db.ProductAttributes.Add(atProRam);
                        db.SaveChanges();
                        //3 lưu idhdd vào bảng ProductAttribute
                        ProductAttribute atProHDD = new ProductAttribute();
                        atProHDD.AttributeID = idHDD3;
                        atProHDD.ProductID = idinsertnew;
                        db.ProductAttributes.Add(atProHDD);
                        db.SaveChanges();
                        //4 lưu idDisplay vào bảng ProductAttribute
                        ProductAttribute atProDisp = new ProductAttribute();
                        atProDisp.AttributeID = idDisplay4;
                        atProDisp.ProductID = idinsertnew;
                        db.ProductAttributes.Add(atProDisp);
                        db.SaveChanges();
                        //5 lưu idvag vào bảng ProductAttribute
                        ProductAttribute atProVAG = new ProductAttribute();
                        atProVAG.AttributeID = idVGA2;
                        atProVAG.ProductID = idinsertnew;
                        db.ProductAttributes.Add(atProVAG);
                        db.SaveChanges();

                        // xóa phần tử được add vào database ra khỏi list
                        listpro.Remove(listpro[i]);
                        i = i - 1;
                    }
                }
                //list string id link kien bi trung
                Session["danhsachLaptrunglinhkien"] = danhsachLaptrunglinhkien;
                Session["listtrunglinhkien"] = listtrunglinhkien;
                return RedirectToAction("index");
            }
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
            //Kiểm tra xem có trong database chưa có rồi thì cho vào list đã tồn tại cho người dùng xem.

            using (CPS_SolutionEntities db = new CPS_SolutionEntities())
            {
               
                List<LapData> listExistedLap = new List<LapData>();
                List<ProductAlia> listNameIndb = new List<ProductAlia>();
                var listAlias = (from x in db.ProductAlias select x);
                listNameIndb = listAlias.ToList();
                for (int i = 0; i < listpro.Count; i++)
                {
                    for (int j = 0; j < listNameIndb.Count; j++)
                    {
                      if(listpro[i].Name.Equals(listNameIndb[j].Name))
                      {
                          listExistedLap.Add(listpro[i]);
                          listpro.RemoveAt(i);
                          i--;
                          break;
                      }
                    }

                  

                }
                TempData["listExistedLap"] = listExistedLap;
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
                    i = i - 1;
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

            for (int i = 0; i < list.Count - 1; i++)
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
        /// <summary>
        /// Tách sản phẩm khi so trùng trong database
        /// </summary>
        /// <returns></returns>
        public ActionResult tachdatabase(String valuestach)
        {
            using (CPS_SolutionEntities db = new CPS_SolutionEntities())
            {
                List<List<LapData>> listduplicatenew = (List<List<LapData>>)Session["listduplicatenewLap"];
                String[] tachdup = valuestach.ToString().Split('@');
                List<String> listtrunglinhkien = (List<String>)Session["listtrunglinhkien"];
                List<LapData> danhsachLaptrunglinhkien = (List<LapData>)Session["danhsachLaptrunglinhkien"];
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
                            var listCPUdb = (from a in db.AttributeDictionaries where a.CodetypeID.Equals("C") select a);
                            List<AttributeDictionary> listCPU = listCPUdb.ToList();
                            // lấy hết VGA trong db ra
                            var listVGAdb = (from a in db.AttributeDictionaries where a.CodetypeID.Equals("V") select a);
                            List<AttributeDictionary> listVGA = listVGAdb.ToList();
                            // lấy hết HDD trong db ra
                            var listHDDdb = (from a in db.AttributeDictionaries where a.CodetypeID.Equals("H") select a);
                            List<AttributeDictionary> listHDD = listHDDdb.ToList();
                            // lấy hết Display trong db ra
                            var listDisplaydb = (from a in db.AttributeDictionaries where a.CodetypeID.Equals("D") select a);
                            List<AttributeDictionary> listDisplay = listDisplaydb.ToList();
                            // lấy hết Ram trong db ra
                            var listRamdb = (from a in db.AttributeDictionaries where a.CodetypeID.Equals("R") select a);
                            List<AttributeDictionary> listRam = listRamdb.ToList();

                            int errorCount = 0;
                            // trùng CPU 1
                            for (int x = 0; x < listCPU.Count; x++)
                            {
                                if (listduplicatenew[i][j].CPU.Equals(listCPU[x].Name))
                                {
                                    break;
                                }
                                else if (CompareStringHelper.CompareString(listduplicatenew[i][j].CPU, listCPU[x].Name) > 85)
                                {
                                    listtrunglinhkien[1] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                    errorCount++;
                                    break;
                                }
                            }
                            // trùng VGA 2
                            for (int x = 0; x < listVGA.Count; x++)
                            {
                                if (listduplicatenew[i][j].VGA.Equals(listVGA[x].Name))
                                {
                                    break;
                                }
                                else if (CompareStringHelper.CompareString(listduplicatenew[i][j].VGA, listVGA[x].Name) > 85)
                                {
                                    listtrunglinhkien[2] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                    errorCount++;
                                    break;
                                }
                            }
                            // trùng HDD 3
                            for (int x = 0; x < listHDD.Count; x++)
                            {
                                if (listduplicatenew[i][j].HDD.Equals(listHDD[x].Name))
                                {
                                    break;
                                }
                                else if (CompareStringHelper.CompareString(listduplicatenew[i][j].HDD, listHDD[x].Name) > 85)
                                {
                                    listtrunglinhkien[3] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                    errorCount++;
                                    break;
                                }
                            }
                            // trùng Display 4
                            for (int x = 0; x < listDisplay.Count; x++)
                            {
                                if (listduplicatenew[i][j].Display.Equals(listDisplay[x].Name))
                                {
                                    break;
                                }
                                else if (CompareStringHelper.CompareString(listduplicatenew[i][j].Display, listDisplay[x].Name) > 85)
                                {
                                    listtrunglinhkien[4] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                    errorCount++;
                                    break;
                                }
                            }
                            // trùng Ram
                            for (int x = 0; x < listRam.Count; x++)
                            {
                                if (listduplicatenew[i][j].RAM.Equals(listRam[x].Name))
                                {
                                    break;
                                }
                                else if (CompareStringHelper.CompareString(listduplicatenew[i][j].RAM, listRam[x].Name) > 85)
                                {
                                    listtrunglinhkien[5] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                    errorCount++;
                                    break;
                                }
                            }

                            // cho vào list lỗi @@
                            if (errorCount > 0)
                            {
                                danhsachLaptrunglinhkien.Add(listduplicatenew[i][j]);
                                // thêm biến đếm số dòng lỗi được thêm vào.                   
                                listduplicatenew[i].RemoveAt(j);
                                j = j - 1;
                            }
                            if (errorCount == 0)
                            {
                                //-------------- nếu không phát hiện trùng linh kiện thì cho add mới sản phẩm ---------------------------
                                Product p = new Product();

                                p.URL = listduplicatenew[i][j].Imagelink;
                                p.Price = 0;
                                p.TotalWeightPoint = 0;
                                p.IsActive = false;

                                // lưu vào database
                                db.Products.Add(p);
                                db.SaveChanges();

                                String[] mangten = listduplicatenew[i][j].Name.ToString().Split(';');
                                if (mangten.Length >= 2)
                                {
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idinsert = Convert.ToInt32(pronew.ID);
                                    ProductAlia proAli = new ProductAlia();
                                    proAli.Name = mangten[0];
                                    proAli.ProductID = idinsert;
                                    proAli.IsMain = true;
                                    proAli.IsActive = true;
                                    db.ProductAlias.Add(proAli);
                                    db.SaveChanges();
                                }
                                else
                                {
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idinsert = Convert.ToInt32(pronew.ID);
                                    ProductAlia proAli = new ProductAlia();
                                    proAli.Name = mangten[i];
                                    proAli.ProductID = idinsert;
                                    proAli.IsMain = true;
                                    proAli.IsActive = true;
                                    db.ProductAlias.Add(proAli);
                                    db.SaveChanges();
                                }

                                // lấy max ID và thêm vào bảng alias
                                if (mangten.Length >= 2)
                                {
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idinsert = Convert.ToInt32(pronew.ID);

                                    for (int h = 1; h < mangten.Length; h++)
                                    {
                                        ProductAlia proAli = new ProductAlia();
                                        proAli.Name = mangten[h];
                                        proAli.ProductID = idinsert;
                                        proAli.IsMain = false;
                                        proAli.IsActive = true;
                                        db.ProductAlias.Add(proAli);
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
                                    if (listduplicatenew[i][j].CPU.Equals(listCPU[x].Name))
                                    {
                                        idCPU1 = listCPU[x].ID;
                                        break;
                                    }
                                    else
                                    {
                                        AttributeDictionary atcpu = new AttributeDictionary();
                                        atcpu.CodetypeID = "C";
                                        atcpu.Name = listduplicatenew[i][j].CPU;
                                        atcpu.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(atcpu);
                                        db.SaveChanges();
                                        var cpunew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idCPU1 = Convert.ToInt32(cpunew.ID);
                                        break;
                                    }
                                }
                                // id VGA 2
                                for (int x = 0; x < listVGA.Count; x++)
                                {
                                    if (listduplicatenew[i][j].VGA.Equals(listVGA[x].Name))
                                    {
                                        idVGA2 = listVGA[x].ID;
                                        break;
                                    }
                                    else
                                    {

                                        AttributeDictionary atvga = new AttributeDictionary();
                                        atvga.CodetypeID = "V";
                                        atvga.Name = listduplicatenew[i][j].VGA;
                                        atvga.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(atvga);
                                        db.SaveChanges();
                                        var vganew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idVGA2 = Convert.ToInt32(vganew.ID);
                                        break;
                                    }
                                }
                                // id HDD 3
                                for (int x = 0; x < listHDD.Count; x++)
                                {
                                    if (listduplicatenew[i][j].HDD.Equals(listHDD[x].Name))
                                    {
                                        idHDD3 = listHDD[x].ID;
                                        break;
                                    }
                                    else
                                    {

                                        AttributeDictionary athddd = new AttributeDictionary();
                                        athddd.CodetypeID = "H";
                                        athddd.Name = listduplicatenew[i][j].HDD;
                                        athddd.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(athddd);
                                        db.SaveChanges();
                                        var hddnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idHDD3 = Convert.ToInt32(hddnew.ID);
                                        break;
                                    }
                                }
                                // id Display 4
                                for (int x = 0; x < listDisplay.Count; x++)
                                {
                                    if (listduplicatenew[i][j].Display.Equals(listDisplay[x].Name))
                                    {
                                        idDisplay4 = listDisplay[x].ID;
                                        break;
                                    }
                                    else
                                    {
                                        AttributeDictionary athdisp = new AttributeDictionary();
                                        athdisp.CodetypeID = "D";
                                        athdisp.Name = listduplicatenew[i][j].Display;
                                        athdisp.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(athdisp);
                                        db.SaveChanges();
                                        var dispnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idDisplay4 = Convert.ToInt32(dispnew.ID);
                                        break;
                                    }
                                }
                                // id Ram
                                for (int x = 0; x < listRam.Count; x++)
                                {
                                    if (listduplicatenew[i][j].RAM.Equals(listRam[x].Name))
                                    {
                                        idRam5 = listRam[x].ID;
                                        break;
                                    }
                                    else
                                    {

                                        AttributeDictionary athram = new AttributeDictionary();
                                        athram.CodetypeID = "R";
                                        athram.Name = listduplicatenew[i][j].RAM;
                                        athram.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(athram);
                                        db.SaveChanges();
                                        var ramnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idRam5 = Convert.ToInt32(ramnew.ID);
                                        break;
                                    }
                                }
                                // lấy id của sản phẩm mới được insert vào db
                                var pronewinsert = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                int idinsertnew = Convert.ToInt32(pronewinsert.ID);

                                //1 lưu idcpu vào bảng ProductAttribute
                                ProductAttribute atProCPU = new ProductAttribute();
                                atProCPU.AttributeID = idCPU1;
                                atProCPU.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProCPU);
                                db.SaveChanges();
                                //2 lưu idRam vào bảng ProductAttribute
                                ProductAttribute atProRam = new ProductAttribute();
                                atProRam.AttributeID = idRam5;
                                atProRam.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProRam);
                                db.SaveChanges();
                                //3 lưu idhdd vào bảng ProductAttribute
                                ProductAttribute atProHDD = new ProductAttribute();
                                atProHDD.AttributeID = idHDD3;
                                atProHDD.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProHDD);
                                db.SaveChanges();
                                //4 lưu idDisplay vào bảng ProductAttribute
                                ProductAttribute atProDisp = new ProductAttribute();
                                atProDisp.AttributeID = idDisplay4;
                                atProDisp.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProDisp);
                                db.SaveChanges();
                                //5 lưu idvag vào bảng ProductAttribute
                                ProductAttribute atProVAG = new ProductAttribute();
                                atProVAG.AttributeID = idVGA2;
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
                            Session["listduplicatenewLap"] = listduplicatenew;
                            Session["listtrunglinhkien"] = listtrunglinhkien;
                            Session["danhsachLaptrunglinhkien"] = danhsachLaptrunglinhkien;

                            ViewBag.listduplicatenewLap = (List<List<LapData>>)Session["listduplicatenewLap"];
                            break;
                        }
                    }
                }

                return View();
            }
        }
    }
}
