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
    public class TrainingProductController : Controller
    {
        CPS_SolutionEntities db = new CPS_SolutionEntities();
        //
        // GET: /Admin/Training/

        public ActionResult Index()
        {
            // Sản phẩm trùng
            #region load sản phẩm trùng từ txt LapDataTraning
            string path1 = Server.MapPath("~/UploadedExcelFiles/ProductName.txt");
            List<List<ProductMap>> ListdupProductTraning = new List<List<ProductMap>>();
            if (System.IO.File.Exists(path1))
            {
                int h = 0;
                string[] lines = System.IO.File.ReadAllLines(path1);
                for (int i = 0; i < lines.Length; i++)
                {
                    List<ProductMap> duppro = new List<ProductMap>();
                    String[] line = lines[i].Split('#');
                    for (int j = 0; j < line.Length; j++)
                    {
                        h++;
                        String[] Atrr = line[j].Split('|');
                        ProductMap pro = new ProductMap();
                        pro.stt = h.ToString();
                        pro.ten = Atrr[0];
                        pro.loai = Atrr[1];
                        pro.trongso = Atrr[2];
                        duppro.Add(pro);

                    }
                    ListdupProductTraning.Add(duppro);

                }
            }
            #endregion
            // Sản phẩm trùng
            #region load sản phẩm trùng từ txt LapDataTraning
            string path = Server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
            List<List<ProductMap>> Listduptraning = new List<List<ProductMap>>();
            List<String> listID = new List<String>();
            if (System.IO.File.Exists(path))
            {
                int h = 999;
                string[] lines = System.IO.File.ReadAllLines(path);
                for (int i = 0; i < lines.Length; i++)
                {
                    h++;
                    List<ProductMap> duppro = new List<ProductMap>();
                    string[] seperators = { "-", ";" };                
                    // tách ra làm 3 phần tử.
                    String[] line = lines[i].Split(seperators, StringSplitOptions.RemoveEmptyEntries);
                    // cho id vào list ID
                    string productId = line[0];
                    listID.Add(productId);
                    // tên sản phẩm đã có trong database
                    string ten = line[1];
                    var resource = (from x in db.AttributeDictionaries where x.Name.Equals(ten) select x).FirstOrDefault();
                    ProductMap p = new ProductMap();
                    p.stt = resource.ID.ToString();
                    p.ten = resource.Name;
                    p.loai = resource.CodetypeID;
                    p.trongso = resource.WeightCriteraPoint.ToString();
                    p.productid = line[0];
                    duppro.Add(p);
                    String loai = resource.CodetypeID;
                    for (int j = 2; j < line.Length; j++)
                    {
                        ProductMap pr = new ProductMap();
                        pr.stt = h.ToString() + 'z';
                        pr.ten = line[j];
                        pr.loai = loai;
                        pr.trongso = "0";
                        pr.productid = line[0];
                        duppro.Add(pr);
                    }
                    Listduptraning.Add(duppro);
                }
            }
            #endregion
            Session["listID"] = listID;
            Session["ListduptraningProduct"] = Listduptraning;
            Session["ListdupProduct"] = ListdupProductTraning;
            ViewBag.ListdupProduct = (List<List<ProductMap>>)Session["ListdupProduct"];
            ViewBag.Listduptraning = (List<List<ProductMap>>)Session["ListduptraningProduct"];
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
            List<List<ProductMap>> listduplicate = (List<List<ProductMap>>)Session["ListdupProduct"];

            // lấy tên chính ở cuối list ra và remove
            string sttTenchinh = values.Last();
            values.Remove(values.Last());

            // tên sản phẩm gộp
            string tenmoi = "";
            string tenchinh ="";
            ProductMap sanphamgop = new ProductMap();
            int check =0;
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
                            tenchinh = listduplicate[i][j].ten;
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
                       listduplicate[i].First();

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

            // Tạo listduplicate mới chứa trùng giữa listpro và trong database
            List<List<ProductMap>> listduplicatenew = new List<List<ProductMap>>();

            //lấy product trong database ra chỉ lấy Codetype bằng loai.
            List<AttributeDictionary> listproindatabase = new List<AttributeDictionary>();
            String loai = sanphamgop.loai;
            var resource = (from x in db.AttributeDictionaries where x.CodetypeID.Equals(loai) select x);
            listproindatabase = resource.ToList();

            // tìm sản phẩm trùng cho vào list trùng hoặc xóa đi :|
            for (int j = 0; j < listproindatabase.Count; j++)
            {
                List<ProductMap> duplicateProduct = new List<ProductMap>();
               
                    String Name = "";
                    String[] mangten =sanphamgop.ten.ToString().Split(';');
                    if (mangten.Length >= 2)
                    {
                        Name = mangten[0];
                    }
                    else
                    {
                        Name = sanphamgop.ten;
                    }

                    if (listproindatabase[j].Name.ToString().Equals(Name))
                    {
                        listproindatabase.RemoveAt(j);
              
                        j--;
                    }

                    // lấy sản phầm trùng cho vào list trùng mới
                    if (CompareStringHelper.CompareString(tenchinh, listproindatabase[j].Name.ToString()) >= 80)
                    {
                        ProductMap pro = new ProductMap();
                        pro.stt = listproindatabase[j].ID.ToString();
                        pro.ten = listproindatabase[j].Name;
                        pro.loai = listproindatabase[j].Codetype.Name;
                        pro.trongso = listproindatabase[j].WeightCriteraPoint.ToString();
                        duplicateProduct.Add(pro);
                        sanphamgop.stt = "z" + sanphamgop.stt;
                        duplicateProduct.Add(sanphamgop);
                    }

               
                if (duplicateProduct.Count >= 2)
                {
                    listduplicatenew.Add(duplicateProduct);
                    check++;
                }
              }
            
            // lưu vào database
             if(check ==0)
              {
                AttributeDictionary p = new AttributeDictionary();

                String[] mangten = sanphamgop.ten.ToString().Split(';');
                if (mangten.Length >= 2)
                {
                    p.Name = mangten[0];
                }
                else
                {
                    p.Name = sanphamgop.ten;
                }
                p.CodetypeID = sanphamgop.loai;
                p.WeightCriteraPoint = Convert.ToInt32(sanphamgop.trongso);
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
            }


             Session["ListdupProduct"] = listduplicate;
            ViewBag.listduplicate = (List<List<ProductMap>>)Session["ListdupProduct"];


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
                    List<List<ProductMap>> listduplicate = (List<List<ProductMap>>)Session["ListdupProduct"];
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
                    Session["ListdupProduct"] = listduplicate;

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
                    List<List<ProductMap>> listduplicate = (List<List<ProductMap>>)Session["ListdupProduct"];
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

                    Session["ListdupProduct"] = listduplicate;

                    Session["listproduct"] = listpro;
                }
            }
            //cho vào viewbag
            ViewBag.listproduct = (List<ProductMap>)Session["listproduct"];
            ViewBag.listduplicate = (List<List<ProductMap>>)Session["listduplicate"];

            return View();
        }

        /// <summary>
        /// Tách sản phẩm khi so trùng trong database
        /// </summary>
        /// <returns></returns>
        public ActionResult tachdatabase(String valuestach)
        {
            List<List<ProductMap>> listduplicatenew = (List<List<ProductMap>>)Session["ListduptraningProduct"];
            String[] tachdup = valuestach.ToString().Split('@');
            int dem = 0;
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
                            Session["ListduptraningProduct"] = listduplicatenew;
                            dem++;
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
                        Session["ListduptraningProduct"] = listduplicatenew;
                        break;
                    }
                }
                if (dem > 0)
                {
                    break;
                }
            }
            // ghi lại vào txt
            string path = Server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
            listduplicatenew = (List<List<ProductMap>>)Session["ListduptraningProduct"];
            string[] lines = new string[listduplicatenew.Count];
            for (int i = 0; i < listduplicatenew.Count; i++)
            {
                string line = "";
                for (int j = 0; j < listduplicatenew[i].Count; j++)
                {
                    line += listduplicatenew[i][j].ten + ";";
                }
                line = line.Substring(0, line.Length - 1);
                lines[i] = line;

            }
            System.IO.File.WriteAllLines(path, lines);
            ViewBag.Listduptraning = (List<List<ProductMap>>)Session["ListduptraningProduct"];
            return View();
        }
        /// <summary>
        /// Gộp sản phẩm khi so trùng trong database
        /// </summary>
        /// <returns></returns>
        public ActionResult gopdatabase(String valuesgop)
        {
            List<List<ProductMap>> listduplicatenew = (List<List<ProductMap>>)Session["ListduptraningProduct"];

            List<String> listID = (List<String>)Session["listID"];
            String[] tachdup = valuesgop.ToString().Split('@');
            int count = 0;
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
                            

                            // thêm ProductAtribute khi add sản phẩm :|
                            ProductAttribute proAttr = new ProductAttribute();
                           // proAttr.ProductID = Convert.ToInt32(listID[i]);
                            proAttr.ProductID = Convert.ToInt32(listduplicatenew[i][1].productid);
                            proAttr.AttributeID = Convert.ToInt32(listduplicatenew[i][0].stt);
                            db.ProductAttributes.Add(proAttr);
                            db.SaveChanges();
                            listduplicatenew.RemoveAt(i);
                            listID.RemoveAt(i);
                            i = i - 1;
                            count++;
                            break;
                        }
                    }
                 
                    Session["ListduptraningProduct"] = listduplicatenew;
                    if (count>0)
                    {

                        break;
                    }

                }
                if (count > 0)
                {

                    break;
                }

            }

            // ghi lại vào txt
            string path = Server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
            listduplicatenew = (List<List<ProductMap>>)Session["ListduptraningProduct"];
            string[] lines = new string[listduplicatenew.Count];
            for (int i = 0; i < listduplicatenew.Count; i++)
            {
                //string line = listID[i]+'-';  
                string line = listduplicatenew[i][1].productid + '-';
                for (int j = 0; j < listduplicatenew[i].Count; j++)
                {
                    line += listduplicatenew[i][j].ten + ";";
                }
                line = line.Substring(0, line.Length - 1);
                lines[i] = line;

            }
            System.IO.File.WriteAllLines(path, lines);
            ViewBag.Listduptraning = (List<List<ProductMap>>)Session["ListduptraningProduct"];
            return View();
        }

    }


}
