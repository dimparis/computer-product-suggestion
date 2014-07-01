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
            ViewBag.listproduct = (List<ProductMap>)Session["listproduct"];
            ViewBag.listerror = (List<ProductMap>)Session["listerror"];
            ViewBag.listduplicate = (List<List<ProductMap>>)Session["listduplicate"];
            ViewBag.listduplicatenew = (List<List<ProductMap>>)Session["listduplicatenew"];
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
            if (!ghilog[0].Equals("no"))
            {
                LogFileHelper.LogfileThanhPhan(listduplicate);
                // xóa session dup
                Session["listduplicate"] = null;
            }
            // nếu có check ghilog Error
            if (!ghilog[1].Equals("no"))
            {
                LogFileHelper.LogfileThanhPhanloi(listerror);
                // xóa session error
                Session["listerror"] = null;
            }

          

            // Tạo listduplicate mới chứa trùng giữa listpro và trong database
            List<List<ProductMap>> listduplicatenew = new List<List<ProductMap>>(); 

            //lấy product trong database ra chỉ lấy Codetype bằng loai.
            List<AttributeDictionary> listproindatabase = new List<AttributeDictionary>();
            String loai = listpro[0].loai;
            var resource = (from x in db.AttributeDictionaries where x.CodetypeID.Equals(loai) select x);
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
            Session["listduplicatenew"] = listduplicatenew;

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
                String[] info = stringpro.ToString().Split('@');
                string stt = info[0];
                string ten = info[1];
                string tronngso = info[3];
                string loai = info[2];

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
                Session["listerror"] = listerror;
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
                    if (CompareStringHelper.CompareString(listpro[i].ten.ToString(), update.ten) >= 85)
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
                        if (CompareStringHelper.CompareString(listduplicate[i][0].ToString(), update.ten) >= 85)
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
                Session["listpro"] = listpro;
                Session["listduplicate"] = listduplicate;
            }
            ViewBag.listproduct = (List<ProductMap>)Session["listproduct"];
            ViewBag.listerror = (List<ProductMap>)Session["listerror"];
            ViewBag.listduplicate = (List<List<ProductMap>>)Session["listduplicate"];
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
                    String[]  tach1 = tachdup[0].Split('*');
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

        /// <summary>
        /// Tách sản phẩm khi so trùng trong database
        /// </summary>
        /// <returns></returns>
        public ActionResult tachdatabase(String valuestach)
        {
            List<List<ProductMap>> listduplicatenew = (List<List<ProductMap>>)Session["listduplicatenew"];
            String[] tachdup = valuestach.ToString().Split('@');

            // duyệt hết list duplicate lớn
            for (int i = 0; i < listduplicatenew.Count; i++)
            {
                // duyệt từng listduplicate nhỏ 
                for (int j = 0; j < listduplicatenew[i].Count; j++)
                {
                         // nếu phát hiện list nào có chứa giá trị tách trả về
                        if(tachdup[1].Equals(listduplicatenew[i][j].stt)){

                            AttributeDictionary p = new AttributeDictionary();

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
                            List<AttributeDictionary> listproindatabase = new List<AttributeDictionary>();
                            String loai = listduplicatenew[i][1].loai;
                            var resource = (from x in db.AttributeDictionaries where x.CodetypeID.Equals(loai) select x);
                            listproindatabase = resource.ToList();
                            int count =0;
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


                            var LCodeType = (from c in db.Codetypes select c);

                            List<Codetype> Listcodetype = LCodeType.ToList();

                            foreach (Codetype codety in Listcodetype)
                            {
                                codety.Name.Equals(listduplicatenew[i][1].loai);
                                p.CodetypeID = codety.ID;
                                break;
                            }
                            p.WeightCriteraPoint = Convert.ToInt32(listduplicatenew[i][1].trongso);
                            db.AttributeDictionaries.Add(p);
                            db.SaveChanges();
                            // lấy max ID và thêm vào bảng alias
                            if (mangten.Length >= 2)
                            {
                                var pronew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                int idinsert = Convert.ToInt32(pronew.ID);

                                for (int h = 1; h < mangten.Length; h++)
                                {

                                    //lấy product trong database ra chỉ lấy Codetype bằng loai kiểm tra xem có trong database chưa @@.
                                    List<AttributeMapping> listmap = new List<AttributeMapping>();
                                    var resource1 = (from x in db.AttributeMappings  select x);
                                    listmap = resource1.ToList();
                                    int count1 = 0;
                                   for(int r =0; r< listmap.Count; r++)
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
                                    AttributeMapping a = new AttributeMapping();
                                    a.Name = mangten[h];
                                    a.AttributeDicID = idinsert;
                                    db.AttributeMappings.Add(a);
                                    db.SaveChanges();
                                }

                            }
                            listduplicatenew.RemoveAt(i);
                            Session["listduplicatenew"] = listduplicatenew;
                            break;
                        }
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
           
            // duyệt hết list duplicate lớn
            for (int i = 0; i < listduplicatenew.Count; i++)
            {
                // duyệt từng listduplicate nhỏ 
                for (int j = 0; j < listduplicatenew[i].Count; j++)
                {
                    // nếu phát hiện list nào có chứa giá trị tách trả về
                    if (tachdup[1].Equals(listduplicatenew[i][j].stt))
                    {

                        AttributeDictionary p = new AttributeDictionary();

                        String[] mangten = listduplicatenew[i][1].ten.ToString().Split(';');                
      

                            for (int h = 0; h < mangten.Length; h++)
                            {

                                //lấy product trong database ra kiểm tra xem có trong database chưa.
                                List<AttributeMapping> listmap = new List<AttributeMapping>();
                                var resource1 = (from x in db.AttributeMappings select x);
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

                                AttributeMapping a = new AttributeMapping();
                                a.Name = mangten[h];
                                a.AttributeDicID = Convert.ToInt32(listduplicatenew[i][0].stt);
                                a.IsActive = true;
                                db.AttributeMappings.Add(a);
                                db.SaveChanges();
                            }

                        }
                        listduplicatenew.RemoveAt(i);
                        Session["listduplicatenew"] = listduplicatenew;
                        break;
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
            // Gán số thứ tự
           
            catch (Exception e)
            {

            }
            int sttp = 0;
            for (int i = 0; i < listpro.Count; i++)
            {
                listpro[i].stt = sttp.ToString();
                sttp++;
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


            for (int i = 0; i < list.Count - 1; i++)
            {
                if (list[i].ten.Length < 5 || list[i].ten.Length > 100 ||
                    list[i].loai.Length < 1 || list[i].loai.Length > 5 ||
                    list[i].trongso.ToString().Length < 1 || list[i].trongso.ToString().Length > 300)
                {
                    errorlist.Add(list[i]);
                    list.RemoveAt(i);
                    i = i - 1;
                }
            }
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
                    if (CompareStringHelper.CompareString(list[i].ten.ToString(), list[j].ten.ToString()) >= 85)
                    {
                        duplicateProduct.Add(list[j]);
                        list.RemoveAt(j);
                    }
                }

                duplicateProduct.Add(list[i]);
                list.RemoveAt(i);
                if (duplicateProduct.Count >= 2)
                {
                    duplicatelist.Add(duplicateProduct);
                }
            }
            return duplicatelist;
        }


        /// <summary>
        /// So sanh chuoi 
        /// </summary>
        /// <param name="s1"></param>
        /// <param name="s2"></param>
        /// <returns></returns>
        //public static double similarity(String s1, String s2)
        //{
        //    if (s1.Length < s2.Length)
        //    { // s1 should always be bigger
        //        String swap = s1; s1 = s2; s2 = swap;
        //    }
        //    int bigLen = s1.Length;
        //    if (bigLen == 0) { return 1.0; /* both strings are zero length */ }
        //    return (bigLen - computeEditDistance(s1, s2)) / (double)bigLen;
        //}

        //public static int computeEditDistance(String s1, String s2)
        //{
        //    s1 = s1.ToLower();
        //    s2 = s2.ToLower();

        //    int[] costs = new int[s2.Length + 1];
        //    for (int i = 0; i <= s1.Length; i++)
        //    {
        //        int lastValue = i;
        //        for (int j = 0; j <= s2.Length; j++)
        //        {
        //            if (i == 0)
        //                costs[j] = j;
        //            else
        //            {
        //                if (j > 0)
        //                {
        //                    int newValue = costs[j - 1];
        //                    if ((char)s1[i - 1] != (char)s2[j - 1])
        //                        newValue = Math.Min(Math.Min(newValue, lastValue),
        //                                costs[j]) + 1;
        //                    costs[j - 1] = lastValue;
        //                    lastValue = newValue;
        //                }

        //            }
        //        }
        //        if (i > 0)
        //            costs[s2.Length] = lastValue;
        //    }
        //    return costs[s2.Length];
        //}

    }
}



