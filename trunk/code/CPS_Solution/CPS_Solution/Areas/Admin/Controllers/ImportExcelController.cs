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
    public class ImportExcelController : Controller
    {

        CPS_SolutionEntities db = new CPS_SolutionEntities();
        //
        // GET: /Admin/ImportExcel/
        [HttpGet]
        public ActionResult Index()
        {
            List<String> danhsachloi = (List<String>)Session["errorLine"];
            Session["danhsachloi"] = null;
            if (danhsachloi != null)
            {
                if (Convert.ToInt32(danhsachloi[0]) > 5)
                {
                    Session["listproduct"] = null;
                    Session["listduplicate"] = null;
                    Session["danhsachloi"] = Session["listerror"];
                    Session["listerror"] = null;
                }
            }
            // danh sahcs đúng, trùng, lỗi
            ViewBag.listproduct = (List<ProductMap>)Session["listproduct"];
            ViewBag.listerror = (List<ProductMap>)Session["listerror"];
            ViewBag.listduplicate = (List<List<ProductMap>>)Session["listduplicate"];
            // danh sách trùng với database
            ViewBag.listduplicatenew = (List<List<ProductMap>>)Session["listduplicatenew"];

            // quá nhiều lỗi hiện thị ra dòng và sản phẩm bị lỗi.
            ViewBag.danhsachloi = (List<ProductMap>)Session["danhsachloi"];
            // dòng chứa lỗi
            ViewBag.errorLine = Session["errorLine"];
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
            List<ProductMap> listpro = (List<ProductMap>)Session["listproduct"];
            List<ProductMap> listerror = (List<ProductMap>)Session["listerror"];
            List<List<ProductMap>> listduplicate = (List<List<ProductMap>>)Session["listduplicate"];


            //ghi logfile---------------------------------------------------------------------------------
            String[] ghilog = checkval.ToString().Split('@');

            // nếu có check  ghilog Duplicate
            #region ghilog Duplicate
            if (!ghilog[0].Equals("no")&&listduplicate!=null)
            {
                // lấy dữ liệu trong file text traning ra LapDataTraning;
                string path = Server.MapPath("~/UploadedExcelFiles/ProductName.txt");
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
                            newline += listduplicate[i][j].ten + "|" + listduplicate[i][j].loai + "|" +
                                       listduplicate[i][j].trongso + "#";
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
            #endregion
            Session["listduplicate"] = null;
            // nếu có check ghilog Error
            if (!ghilog[1].Equals("no"))
            {
                // LogFileHelper.LogfileThanhPhanloi(listerror);
                // xóa session error

            }
            Session["listerror"] = null;


            // Tạo listduplicate mới chứa trùng giữa listpro và trong database
            List<List<ProductMap>> listduplicatenew = new List<List<ProductMap>>();

            //lấy product trong database ra chỉ lấy Codetype bằng loai.
            List<Hardware> listproindatabase = new List<Hardware>();
            var resource = (from x in db.Hardwares select x);
            listproindatabase = resource.ToList();

            // tìm sản phẩm trùng với database cho vào list trùng hoặc xóa đi :|
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
                    // nếu đã có trong database rồi thì xóa đi.
                    if (listproindatabase[j].Name.ToString().Equals(Name))
                    {
                        listproindatabase.RemoveAt(j);
                        listpro.RemoveAt(i);
                        i--;
                        j--;
                        break;
                    }

                    // lấy sản phầm trùng cho vào list trùng mới
                    if (CompareStringHelper.CompareString(Name, listproindatabase[j].Name.ToString()) >= 80)
                    {
                        ProductMap pro = new ProductMap();
                        pro.stt = listproindatabase[j].ID.ToString();
                        pro.ten = listproindatabase[j].Name;
                        pro.loai = listproindatabase[j].CodetypeID;
                        pro.trongso = listproindatabase[j].WeightCriteraPoint.ToString();

                        //add list dup.
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
                    Session["listduplicatenew"] = listduplicatenew;
                }
            }


            // lưu vào database
            for (int i = 0; i < listpro.Count; i++)
            {
                Hardware p = new Hardware();

                String[] mangten = listpro[i].ten.ToString().Split(';');
                if (mangten.Length >= 2)
                {
                    p.Name = mangten[0];
                }
                else
                {
                    p.Name = listpro[i].ten;
                }
                p.CodetypeID = listpro[i].loai;
                p.WeightCriteraPoint = Convert.ToInt32(listpro[i].trongso);
                p.IsActive = true;
                db.Hardwares.Add(p);
                db.SaveChanges();
                // lấy max ID và thêm vào bảng alias
                if (mangten.Length >= 1)
                {
                    var pronew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                    int idinsert = Convert.ToInt32(pronew.ID);

                    for (int h = 0; h < mangten.Length; h++)
                    {
                        Dictionary a = new Dictionary();
                        a.Name = mangten[h];
                        a.AttributeDicID = idinsert;
                        a.IsActive = true;
                        db.Dictionaries.Add(a);
                        db.SaveChanges();
                    }

                }
                // xóa phần tử được add vào database ra khỏi list
                listpro.Remove(listpro[i]);
                i = i - 1;
            }
            Session["listduplicatenew"] = listduplicatenew;
            ViewBag.listduplicatenew = (List<List<ProductMap>>)Session["listduplicatenew"];
            return RedirectToAction("index");
        }

        /// <summary>
        /// Hủy import excel
        /// </summary>
        /// <returns></returns>
        public ActionResult huyimport()
        {
            Session["listproduct"] = null;
            Session["listerror"] = null;
            Session["listduplicate"] = null;
            Session["listduplicatenew"] = null;
            return RedirectToAction("Index");
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
                List<ProductMap> listpro = (List<ProductMap>)Session["listproduct"];
                List<ProductMap> listerror = (List<ProductMap>)Session["listerror"];
                List<List<ProductMap>> listduplicate = (List<List<ProductMap>>)Session["listduplicate"];

                int count1 = listerror.Count;
                String[] info = stringpro.ToString().Split('@');
                string stt = info[0];
                string ten = info[1];
                string tronngso = info[3];
                string loai = info[2];
                // gán vào list để kiểm tra
                List<ProductMap> newlisterror = listerror;
                foreach (ProductMap p in newlisterror)
                {
                    if (p.stt.Equals(stt))
                    {
                        p.ten = ten;
                        p.trongso = tronngso;
                        p.loai = loai;
                        break;
                    }
                }
                List<ProductMap> newlisterror1 = ListErrorProduct(newlisterror);
                // gọi hàm kiểm tra lỗi và đếm xem có bao nhiêu sản phẩm lỗi
                int count2 = newlisterror1.Count;
                // nếu phát hiện số sản phẩm lỗi giảm đi 1 thì kiểm tra trùng với list pro và list dup, xóa trong list error
                if ((count1 - count2) == 1)
                {
                    // xóa sản phẩm trong list error và cập nhập vào session
                    ProductMap delpro = new ProductMap();
                    foreach (ProductMap p in listerror)
                    {
                        if (p.stt.Equals(stt))
                        {
                            delpro = p;
                            break;
                        }
                    }
                    listerror.Remove(delpro);
                    Session["listerror"] = newlisterror1;
                    // xử lý sản phẩm lỗi đã được update.
                    ProductMap update = new ProductMap();
                    update.stt = stt;
                    update.ten = ten;
                    update.trongso = tronngso;
                    update.loai = loai;

                    // so trùng với correct list và duplicate list
                    List<ProductMap> listtam = new List<ProductMap>();
                    listtam.Add(update);

                    //Duyệt hết list correct
                    for (int i = 0; i < listpro.Count; i++)
                    {
                        // nếu phát hiện trùng
                        if (CompareStringHelper.CompareString(listpro[i].ten.ToString(), update.ten) >= 80)
                        {
                            listtam.Add(listpro[i]);
                            listpro.Remove(listpro[i]);
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
                            if (CompareStringHelper.CompareString(listduplicate[i][0].ten.ToString(), update.ten) >= 80)
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
                if ((count1 - count2) == 0)
                {
                    Session["listerror"] = newlisterror1;
                }
                //update listError and listDuplicate
                Session["listpro"] = listpro;
                Session["listduplicate"] = listduplicate;
            }
            // cho vào 3 list
            ViewBag.listproduct = (List<ProductMap>)Session["listproduct"];
            ViewBag.listerror = (List<ProductMap>)Session["listerror"];
            ViewBag.listduplicate = (List<List<ProductMap>>)Session["listduplicate"];

            // quá nhiều lỗi hiện thị ra dòng và sản phẩm bị lỗi.
            ViewBag.danhsachloi = (List<ProductMap>)Session["danhsachloi"];
            // dòng chứa lỗi
            ViewBag.errorLine = Session["errorLine"];
            return View();
        }

        /// <summary>
        /// Delete a product on correct product.
        /// </summary>
        /// <param name="delstt"></param>
        /// <returns></returns>
        public ActionResult deleteproduct(String sttproduct)
        {
            if (!sttproduct.Equals("nothing"))
            {
                // get list product in session.
                List<ProductMap> listpro = (List<ProductMap>)Session["listproduct"];
                List<ProductMap> listerror = (List<ProductMap>)Session["listerror"];
                List<List<ProductMap>> listduplicate = (List<List<ProductMap>>)Session["listduplicate"];
                ProductMap delpro = new ProductMap();
                foreach (ProductMap p in listpro)
                {
                    if (p.stt.Equals(sttproduct))
                    {
                        delpro = p;
                        break;
                    }
                }
                listpro.Remove(delpro);
                Session["listproduct"] = listpro;
            }
            ViewBag.listproduct = (List<ProductMap>)Session["listproduct"];
            ViewBag.listerror = (List<ProductMap>)Session["listerror"];
            ViewBag.listduplicate = (List<List<ProductMap>>)Session["listduplicate"];
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
            List<ProductMap> listpro = (List<ProductMap>)Session["listproduct"];
            List<ProductMap> listerror = (List<ProductMap>)Session["listerror"];
            List<List<ProductMap>> listduplicate = (List<List<ProductMap>>)Session["listduplicate"];

            // lấy tên chính ở cuối list ra và remove
            string sttTenchinh = values.Last();
            values.Remove(values.Last());

            // tên sản phẩm gộp
            string tenmoi = "";
            ProductMap sanphamgop = new ProductMap();

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
                            tenmoi = listduplicate[i][j].ten;
                            sanphamgop = listduplicate[i][j];
                            listduplicate[i].Remove(listduplicate[i][j]);
                        }
                        if (listduplicate[i][j].stt.ToString().Equals(values[t].ToString()))
                        {
                            tenmoi += ";" + listduplicate[i][j].ten;
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

            sanphamgop.ten = tenmoi;
            listpro.Add(sanphamgop);
            Session["listproduct"] = listpro;
            Session["listerror"] = listerror;
            Session["listduplicate"] = listduplicate;
            ViewBag.listproduct = (List<ProductMap>)Session["listproduct"];
            ViewBag.listerror = (List<ProductMap>)Session["listerror"];
            ViewBag.listduplicate = (List<List<ProductMap>>)Session["listduplicate"];


            //    Json(new { Result = String.Format("Fist item in list: '{0}'", values[0]) });
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
                    List<ProductMap> listpro = (List<ProductMap>)Session["listproduct"];
                    List<ProductMap> listerror = (List<ProductMap>)Session["listerror"];
                    List<List<ProductMap>> listduplicate = (List<List<ProductMap>>)Session["listduplicate"];
                    ProductMap duplicate = new ProductMap();
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
                            List<ProductMap> duplicateProduct = new List<ProductMap>();
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

                    Session["listerror"] = listerror;
                    Session["listduplicate"] = listduplicate;

                    Session["listproduct"] = listpro;
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
                    List<ProductMap> listpro = (List<ProductMap>)Session["listproduct"];
                    List<ProductMap> listerror = (List<ProductMap>)Session["listerror"];
                    List<List<ProductMap>> listduplicate = (List<List<ProductMap>>)Session["listduplicate"];
                    ProductMap duplicate = new ProductMap();
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

                    Session["listerror"] = listerror;
                    Session["listduplicate"] = listduplicate;

                    Session["listproduct"] = listpro;
                }
            }
            //cho vào viewbag
            ViewBag.listproduct = (List<ProductMap>)Session["listproduct"];
            ViewBag.listerror = (List<ProductMap>)Session["listerror"];
            ViewBag.listduplicate = (List<List<ProductMap>>)Session["listduplicate"];

            return View();
        }

        /// <summary>
        /// Tách tất cả
        /// </summary>
        /// <param name="value2"></param>
        /// <returns></returns>
        #region Tách tất cả
        //public ActionResult tachtatca(List<String> value2)
        //{
        //    List<List<String>> listlon = new List<List<String>>();

        //    for (int i = 1; i < value2.Count; i++)
        //    {
        //        List<String> listcon = new List<String>();
        //        String[] tablestt = value2[i].ToString().Split('@');
        //        for (int j = 1; j < tablestt.Length; j++)
        //        {
        //            listcon.Add(tablestt[j]);
        //        }
        //        listlon.Add(listcon);

        //    }
        //    for (int h = 0; h < listlon.Count; h++)
        //    {
        //        //-------------------------------------------------------------------------------------------------------------------
        //        // get list product in session.
        //        List<ProductMap> listpro = (List<ProductMap>)Session["listproduct"];
        //        List<ProductMap> listerror = (List<ProductMap>)Session["listerror"];
        //        List<List<ProductMap>> listduplicate = (List<List<ProductMap>>)Session["listduplicate"];
        //        ProductMap duplicate = new ProductMap();
        //        for (int i = 0; i < listduplicate.Count; i++)
        //        {
        //            for (int j = 0; j < listduplicate[i].Count; j++)
        //            {
        //                // duyệt để tim thấy list có chưa id tách được gửi về.
        //                for (int t = 0; t < listlon[h].Count; t++)
        //                {
        //                    if (listduplicate[i][j].stt.ToString().Equals(listlon[h][t].ToString()))
        //                    {
        //                        listpro.Add(listduplicate[i][j]);
        //                        listduplicate[i].Remove(listduplicate[i][j]);
        //                    }
        //                }

        //                // kiểm tra trong list nhỏ còn có 1 phần tử thì tách nó luôn cho vào list correct
        //                if (listduplicate[i].Count == 1)
        //                {
        //                    listpro.Add(listduplicate[i].First());
        //                    listduplicate[i].Remove(listduplicate[i].First());
        //                    //Xóa list rỗng trong list bự duplicate 
        //                    listduplicate.Remove(listduplicate[i]);
        //                }
        //                else if (listduplicate[i].Count == 0)
        //                {
        //                    //Xóa list rỗng trong list bự duplicate 
        //                    listduplicate.Remove(listduplicate[i]);
        //                }
        //            }
        //        }

        //        Session["listerror"] = listerror;
        //        Session["listduplicate"] = listduplicate;
        //        Session["listproduct"] = listpro;
        //        //-------------------------------------------------------------------------------------------------------------------
        //    }
        //    return RedirectToAction("Index");
        //}

        ///// <summary>
        ///// gộp tất cả
        ///// </summary>
        ///// <param name="value1"></param>
        ///// <returns></returns>
        //public ActionResult goptatca(List<String> value1)
        //{
        //    List<List<String>> listlon = new List<List<String>>();

        //    for (int i = 1; i < value1.Count; i++)
        //    {
        //        List<String> listcon = new List<String>();
        //        String[] tablestt = value1[i].ToString().Split('@');
        //        for (int j = 1; j < tablestt.Length; j++)
        //        {
        //            listcon.Add(tablestt[j]);
        //        }
        //        listlon.Add(listcon);

        //    }
        //    for (int h = 0; h < listlon.Count; h++)
        //    {

        //        //--------------------------------------------------------------------------------------------------------------------
        //        List<ProductMap> listpro = (List<ProductMap>)Session["listproduct"];
        //        List<ProductMap> listerror = (List<ProductMap>)Session["listerror"];
        //        List<List<ProductMap>> listduplicate = (List<List<ProductMap>>)Session["listduplicate"];

        //        // lấy tên chính ở cuối list ra và remove
        //        string sttTenchinh = listlon[h].Last();
        //        listlon[h].Remove(listlon[h].Last());

        //        // tên sản phẩm gộp
        //        string tenmoi = "";
        //        ProductMap sanphamgop = new ProductMap();

        //        int count = 0;
        //        for (int i = 0; i < listduplicate.Count; i++)
        //        {
        //            for (int j = 0; j < listduplicate[i].Count; j++)
        //            {
        //                // duyệt để tim thấy list có chưa id tách được gửi về.
        //                for (int t = 0; t < listlon[h].Count; t++)
        //                {
        //                    if (listduplicate[i][j].stt.ToString().Equals(sttTenchinh))
        //                    {
        //                        count++;
        //                        tenmoi = listduplicate[i][j].ten;
        //                        sanphamgop = listduplicate[i][j];
        //                        listduplicate[i].Remove(listduplicate[i][j]);
        //                    }
        //                    if (listduplicate[i][j].stt.ToString().Equals(listlon[h][t].ToString()))
        //                    {
        //                        tenmoi += ";" + listduplicate[i][j].ten;
        //                        listduplicate[i].Remove(listduplicate[i][j]);
        //                    }
        //                    if (listduplicate[i].Count == 0)
        //                    {
        //                        break;
        //                    }
        //                }
        //                // kiểm tra trong list nhỏ còn có 1 phần tử thì tách nó luôn cho vào list correct
        //                if (listduplicate[i].Count == 1)
        //                {
        //                    listpro.Add(listduplicate[i].First());
        //                    listduplicate[i].Remove(listduplicate[i].First());
        //                    //Xóa list rỗng trong list bự duplicate 
        //                    listduplicate.Remove(listduplicate[i]);
        //                }
        //                else if (listduplicate[i].Count == 0)
        //                {
        //                    //Xóa list rỗng trong list bự duplicate 
        //                    listduplicate.Remove(listduplicate[i]);
        //                }
        //                if (count > 0)
        //                {

        //                    break;
        //                }
        //            }
        //            if (count > 0)
        //            {

        //                break;
        //            }
        //        }

        //        sanphamgop.ten = tenmoi;
        //        listpro.Add(sanphamgop);
        //        Session["listproduct"] = listpro;
        //        Session["listerror"] = listerror;
        //        Session["listduplicate"] = listduplicate;
        //        //--------------------------------------------------------------------------------------------------------------------
        //    }
        //    // string txtName = Request.Params["id"];
        //    //      Json(new { Result = String.Format("Fist item in list: '{0}'", value1[0]) });
        //    return RedirectToAction("Index");
        //}
        #endregion
        /// <summary>
        /// Tách sản phẩm khi so trùng trong database
        /// </summary>
        /// <returns></returns>
        public ActionResult tachdatabase(String valuestach)
        {
            List<List<ProductMap>> listduplicatenew = (List<List<ProductMap>>)Session["listduplicatenew"];
            String[] tachdup = valuestach.ToString().Split('@');
            ProductMap proTach = new ProductMap();
            proTach.stt = tachdup[0];
            proTach.ten = tachdup[1];
            proTach.trongso = tachdup[2];
            proTach.loai = tachdup[3];

            int count11 = 0;
            // duyệt hết list duplicate lớn
            for (int i = 0; i < listduplicatenew.Count; i++)
            {               
                // duyệt từng listduplicate nhỏ 
                for (int j = 0; j < listduplicatenew[i].Count; j++)
                {
                    // nếu phát hiện list nào có chứa giá trị tách trả về
                    if (proTach.stt.Equals(listduplicatenew[i][j].stt))
                    {
                       
                        // nếu tên thành phần bị thanh đổi thì
                        if (!proTach.ten.Equals(listduplicatenew[i][j].ten))
                        {
                            //----------------------------------------------------------------------------------------
                            // lấy database ra so trùng tên mới nếu trùng cho vào list trùng mới
                            List<Hardware> listproindatabase = new List<Hardware>();
                            var resource = (from x in db.Hardwares select x);
                            listproindatabase = resource.ToList();

                          // tìm sản phẩm trùng cho vào list trùng hoặc xóa đi :|
                            for (int h = 0; h < listproindatabase.Count; h++)
                            {
                                List<ProductMap> duplicateProduct = new List<ProductMap>();                        
                                    String Name = "";
                                    String[] mangten = proTach.ten.ToString().Split(';');
                                    if (mangten.Length >= 2)
                                    {
                                        Name = mangten[0];
                                    }
                                    else
                                    {
                                        Name = proTach.ten;
                                    }
                                    // nếu đã có trong database rồi thì xóa đi.
                                    if (listproindatabase[h].Name.ToString().Equals(Name))
                                    {
                                        listproindatabase.RemoveAt(h);
                                        listduplicatenew.RemoveAt(i);
                                        i--;
                                        break;
                                    }

                                    // lấy sản phầm trùng cho vào list trùng mới
                                    if (CompareStringHelper.CompareString(Name, listproindatabase[h].Name.ToString()) >= 80)
                                    {
                                        count11++;
                                        ProductMap pro = new ProductMap();
                                        pro.stt = listproindatabase[h].ID.ToString();
                                        pro.ten = listproindatabase[h].Name;
                                        pro.loai = listproindatabase[h].Codetype.Name;
                                        pro.trongso = listproindatabase[h].WeightCriteraPoint.ToString();

                                        //add list dup.
                                        duplicateProduct.Add(pro);
                                        duplicateProduct.Add(proTach);
                                        listduplicatenew.RemoveAt(i);
                                        i--;
                                    }

                                
                                if (duplicateProduct.Count >= 2)
                                {
                                    listduplicatenew.Add(duplicateProduct);
                                    Session["listduplicatenew"] = listduplicatenew;
                                    break;
                                }
                            }
                            if(count11==0){
                                Hardware p = new Hardware();

                                String[] mangten = proTach.ten.ToString().Split(';');
                                if (mangten.Length >= 2)
                                {
                                    p.Name = mangten[0];
                                }
                                else
                                {
                                    p.Name = proTach.ten;
                                }
                                p.CodetypeID = proTach.loai;
                                p.WeightCriteraPoint = Convert.ToInt32(proTach.trongso);
                                db.Hardwares.Add(p);
                                db.SaveChanges();
                                // lấy max ID và thêm vào bảng alias
                                if (mangten.Length >= 1)
                                {
                                    var pronew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idinsert = Convert.ToInt32(pronew.ID);

                                    for (int h = 0; h < mangten.Length; h++)
                                    {
                                        Dictionary a = new Dictionary();
                                        a.Name = mangten[h];
                                        a.AttributeDicID = idinsert;
                                        db.Dictionaries.Add(a);
                                        db.SaveChanges();
                                    }

                                }
                                // xóa phần tử được add vào database ra khỏi list
                                listduplicatenew.RemoveAt(i);
                                i--;
                            }
                        }
                        // nếu vẫn là tên cũ thì lưu vào database
                        else
                        {
                            Hardware p = new Hardware();
                            String[] mangten = listduplicatenew[i][1].ten.ToString().Split(';');
                            if (mangten.Length >= 2)
                            {
                                p.Name = mangten[0];
                            }
                            else
                            {
                                p.Name = listduplicatenew[i][1].ten;
                            }

                            //lấy product trong database ra chỉ lấy Codetype bằng loai kiểm tra xem có trong database chưa @@.
                            List<Hardware> listproindatabase = new List<Hardware>();
                            String loai = listduplicatenew[i][1].loai;
                          var resource = (from x in db.Hardwares select x);
                         listproindatabase = resource.ToList();
                            int count = 0;
                            for (int t = 0; t < listproindatabase.Count; t++)
                            {
                                if (listproindatabase[t].Name.Equals(p.Name))
                                {
                                    count++;
                                }
                            }

                            if (count > 0)
                            {
                                listduplicatenew.RemoveAt(i);
                                Session["listduplicatenew"] = listduplicatenew;
                                break;
                            }
                            p.CodetypeID = listduplicatenew[i][1].loai;
                            p.WeightCriteraPoint = Convert.ToInt32(listduplicatenew[i][1].trongso);
                            db.Hardwares.Add(p);
                            db.SaveChanges();
                            // lấy max ID và thêm vào bảng alias
                            if (mangten.Length >= 2)
                            {
                                var pronew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                int idinsert = Convert.ToInt32(pronew.ID);

                                for (int h = 1; h < mangten.Length; h++)
                                {

                                    //lấy product trong database ra chỉ lấy Codetype bằng loai kiểm tra xem có trong database chưa @@.
                                     List<Dictionary> listmap = new List<Dictionary>();
                                    var resource1 = (from x in db.Dictionaries  select x);
                                    listmap = resource1.ToList();
                                    int count1 = 0;
                                    for (int r = 0; r < listmap.Count; r++)
                                    {
                                        if (listmap[r].Name.Equals(mangten[h]))
                                        {
                                            count1++;
                                        }
                                    }
                                    if (count1 > 0)
                                    {
                                        break;
                                    }

                                    for (int t = 0; t < listproindatabase.Count; t++)
                                    {
                                        if (listproindatabase[t].Name.Equals(p.Name))
                                        {
                                            count++;
                                        }
                                    }
                                    Dictionary a = new Dictionary();
                                    a.Name = mangten[h];
                                    a.AttributeDicID = idinsert;
                                    a.IsActive = true;
                                    db.Dictionaries.Add(a);
                                    db.SaveChanges();
                                }

                            }
                            listduplicatenew.RemoveAt(i);
                            Session["listduplicatenew"] = listduplicatenew;
                            break;
                        }
                    }
                    if (count11 > 0)
                    {
                        break;
                    }
                }
                if (count11 > 0)
                {
                    break;
                }
            }
            ViewBag.listduplicatenew = (List<List<ProductMap>>)Session["listduplicatenew"];
            return View();
        }
        /// <summary>
        /// Gộp sản phẩm khi so trùng trong database
        /// </summary>
        /// <returns></returns>
        public ActionResult gopdatabase(String valuesgop)
        {
            List<List<ProductMap>> listduplicatenew = (List<List<ProductMap>>)Session["listduplicatenew"];
            String[] tachdup = valuesgop.ToString().Split('@');
            int count2=0;
            // duyệt hết list duplicate lớn
            for (int i = 0; i < listduplicatenew.Count; i++)
            {
                // duyệt từng listduplicate nhỏ 
                for (int j = 0; j < listduplicatenew[i].Count; j++)
                {
                    // nếu phát hiện list nào có chứa giá trị tách trả về
                    if (tachdup[1].Equals(listduplicatenew[i][j].stt))
                    {
                        String[] mangten = listduplicatenew[i][1].ten.ToString().Split(';');
                        for (int h = 0; h < mangten.Length; h++)
                        {
                            //lấy product trong database ra kiểm tra xem có trong database chưa.
                            List<Dictionary> listmap = new List<Dictionary>();
                            var resource1 = (from x in db.Dictionaries select x);
                            listmap = resource1.ToList();
                            int count1 = 0;
                            for (int r = 0; r < listmap.Count; r++)
                            {
                                if (listmap[r].Name.Equals(mangten[h]))
                                {
                                    count1++;
                                    count2++;
                                }
                            }
                            // tên sản phẩm chưa có trong database lưu vào
                            if (count1 == 0)
                            {
                                Dictionary a = new Dictionary();
                                a.Name = mangten[h];
                                a.AttributeDicID = Convert.ToInt32(listduplicatenew[i][0].stt);
                                a.IsActive = true;
                                db.Dictionaries.Add(a);
                                db.SaveChanges();
                                count2++;
                            }
                        }
                    }

                    // sau khi lưu hoàn thành xóa list dupnhỏ này đi gán lại giá trị vào session
                    if (count2 > 0)
                    {
                        listduplicatenew.RemoveAt(i);
                        Session["listduplicatenew"] = listduplicatenew;
                        i--;
                        break;
                    }
                }
            }
             ViewBag.listduplicatenew = (List<List<ProductMap>>)Session["listduplicatenew"];
            return View();
            }
           
        
        /// <summary>
        /// Lấy dữ liệu từ excel cho vào 3 list
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Index(HttpPostedFileBase file)
        {
            List<ProductMap> listpro = new List<ProductMap>();
            List<ProductMap> listerror = new List<ProductMap>();
            List<List<ProductMap>> listduplicate = new List<List<ProductMap>>();

            //Get path after upload file to process
            String path = uploadFile(file);
            var excel = new ExcelQueryFactory();
            excel.FileName = path;
            // Get all product from excel to list
            try
            {
                var list = from x in excel.WorksheetRange("A2", "D900000")
                           select new ProductMap
                           {
                               stt = x["STT"],
                               ten = x["Tên"],
                               trongso = x["Trọng Số"],
                               loai = x["Loại"]
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
                listpro[i].stt = sttp.ToString();
                sttp++;
            }

            //Kiểm tra xem có trong database chưa có rồi thì cho vào list đã tồn tại cho người dùng xem.

            using (CPS_SolutionEntities db = new CPS_SolutionEntities())
            {
                List<Hardware> listNameIndb = new List<Hardware>();
                var listAlias = (from x in db.Hardwares select x);
                listNameIndb = listAlias.ToList();
                for (int i = 0; i < listpro.Count; i++)
                {
                    for (int j = 0; j < listNameIndb.Count; j++)
                    {
                        if (listpro[i].ten.Equals(listNameIndb[j].Name))
                        {
                            listpro.RemoveAt(i);
                            i--;
                            break;
                        }
                    }
                }
                List<Dictionary> listNameMapIndb = new List<Dictionary>();
                var listMap = (from x in db.Dictionaries select x);
                listNameMapIndb = listMap.ToList();
                for (int i = 0; i < listpro.Count; i++)
                {
                    for (int j = 0; j < listNameMapIndb.Count; j++)
                    {
                        if (listpro[i].ten.Equals(listNameMapIndb[j].Name))
                        {
                            listpro.RemoveAt(i);
                            i--;
                            break;
                        }
                    }
                }

            }
            // call function listerror
            listerror = ListErrorProduct(listpro);
            // call function listduplicate
            listduplicate = ListDuplicateProduct(listpro);

            Session["listproduct"] = listpro;
            Session["listerror"] = listerror;
            Session["listduplicate"] = listduplicate;
            // redirect back to the index action to show the form once again
            //   TempData["listproduct"] = listpro;
            //   ViewBag.listproduct = listpro;
            return RedirectToAction("Index");
            // return View();
        }

        /// <summary>
        /// upload file
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
        public List<ProductMap> ListErrorProduct(List<ProductMap> list)
        {
            List<ProductMap> errorlist = new List<ProductMap>();
            List<String> errorLine = new List<String>();
            // list dòng lỗi 1 Tên, 2 Trọng số, 3 Loại.
            for (int i = 0; i < 4; i++)
            {
                errorLine.Add("");
            }
            int count = 0;
            // ---duyệt list phát hiện lỗi-------------------
            for (int i = 0; i < list.Count; i++)
            {
                int loi = 0;
                // dòng lỗi tên Lap
                if (list[i].ten.Length < 5 || list[i].ten.Length > 100)
                {
                    errorLine[1] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }

                // dòng lỗi trọng số
                int distance;
                if (!int.TryParse(list[i].trongso, out distance))
                {
                    errorLine[2] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi loại thành phần
                int t = 0;
                if (list[i].loai.Trim().Equals("C") || list[i].loai.Trim().Equals("V") || list[i].loai.Trim().Equals("H") || list[i].loai.Trim().Equals("D") || list[i].loai.Trim().Equals("R"))
                {
                    t++;
                }
                // từ 1 tới 5 ký tự
                if (list[i].loai.Length < 1 || list[i].loai.Length > 5 || t == 0)
                {
                    errorLine[3] += (Convert.ToInt32(list[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                if (loi > 0)
                {
                    errorlist.Add(list[i]);
                    list.RemoveAt(i);
                    i = i - 1;
                }

            }
            errorLine[0] = count.ToString();
            Session["errorLine"] = errorLine;
            return errorlist;
        }
        /// <summary>
        /// Get duplicate product list
        /// </summary>
        /// <param name="list"></param>
        /// <returns></returns>
        public List<List<ProductMap>> ListDuplicateProduct(List<ProductMap> list)
        {
            List<List<ProductMap>> duplicatelist = new List<List<ProductMap>>();

            for (int i = 0; i < list.Count - 1; i++)
            {
                List<ProductMap> duplicateProduct = new List<ProductMap>();
                for (int j = i + 1; j < list.Count; j++)
                {
                    if (CompareStringHelper.CompareString(list[i].ten.ToString(), list[j].ten.ToString()) >= 80)
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

    }
}



