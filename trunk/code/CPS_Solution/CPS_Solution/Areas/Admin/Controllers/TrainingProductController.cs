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
            //Load Thành phần trùng nhau từ ProductName.txt
            List<List<ProductMap>> ListdupProductTraning = LoadThanhPhanTrung();
            //Load thành phần trùng với db từ ProductNameTraining.txt
            List<List<ProductMap>> Listduptraning = LoadThanhPhanTrungDB();

            Session["ListduptraningProduct"] = Listduptraning;
            Session["ListdupProduct"] = ListdupProductTraning;
            ViewBag.ListdupProduct = (List<List<ProductMap>>)Session["ListdupProduct"];
            ViewBag.Listduptraning = (List<List<ProductMap>>)Session["ListduptraningProduct"];
            return View();
        }

        //LoadThanhPhanTrung từ txt
        public List<List<ProductMap>> LoadThanhPhanTrung()
        {
            #region load sản phẩm trùng từ txt LapDataTraning
            string path1 = Server.MapPath("~/UploadedExcelFiles/ProductName.txt");
            List<List<ProductMap>> ListdupProductTraning = new List<List<ProductMap>>();
            if (System.IO.File.Exists(path1))
            {
                int h = 0;
                string[] lines = System.IO.File.ReadAllLines(path1);
                for (int i = 0; i < lines.Length; i++)
                {
                    if (!String.IsNullOrWhiteSpace(lines[i].Trim()))
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
            }
            #endregion
            return ListdupProductTraning;

        }
        //Load thành phần trùng với database từ txt
        public List<List<ProductMap>> LoadThanhPhanTrungDB()
        {  // Thành phần trùng với thành phần trong database
            #region load sản phẩm trùng từ txt LapDataTraning
            string path = Server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
            List<List<ProductMap>> Listduptraning = new List<List<ProductMap>>();
            List<String> listID = new List<String>();
            if (System.IO.File.Exists(path))
            {
                int h = 999;
                string[] lines = System.IO.File.ReadAllLines(path);






                int sttp = 0;
                for (int i = 0; i < lines.Length; i++)
                {
                    if (!String.IsNullOrWhiteSpace(lines[i].Trim()))
                    {
                        h++;
                        List<ProductMap> duppro = new List<ProductMap>();
                        string[] seperators = { "~", "#" };
                        // tách ra làm 3 phần tử.
                        String[] line = lines[i].Split(seperators, StringSplitOptions.RemoveEmptyEntries);
                        // cho id vào list ID
                        string productId = line[0];
                        // tên sản phẩm đã có trong database
                        string[] produc1 = line[1].Split('|');
                        ProductMap p1 = new ProductMap();
                        p1.stt = produc1[3];
                        p1.ten = produc1[0];
                        p1.loai = produc1[1];
                        p1.trongso = produc1[2];
                        p1.productid = line[0];
                        duppro.Add(p1);
                        // tên product bị trùng với product đã có trong database
                        string[] produc2 = line[2].Split('|');
                        ProductMap p2 = new ProductMap();
                        p2.stt = sttp.ToString() + 'z';
                        sttp++;
                        p2.ten = produc2[0];
                        p2.loai = produc1[1];

                        if (produc2[2].Equals(""))
                        {
                            p2.trongso = "0";
                        }
                        else
                        {
                            p2.trongso = produc2[2];
                        }
                        p2.productid = line[0];
                        duppro.Add(p2);

                        Listduptraning.Add(duppro);

                    }
                }
            }
            #endregion
            return Listduptraning;
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
            // tạo list chứa sản phẩm để lưu hoặc so trùng với db
            List<ProductMap> listpro = new List<ProductMap>();
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
            string tenchinh = "";
            ProductMap sanphamgop = new ProductMap();
            int check = 0;
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
                        tenmoi = listduplicate[i][j].ten;
                        tenchinh = listduplicate[i][j].ten;
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

                            tenmoi += ";" + listduplicate[i][j].ten;
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

            sanphamgop.ten = tenmoi;
            // cho vào listpro
            listpro.Add(sanphamgop);
            // Tạo listduplicate mới chứa trùng giữa listpro và trong database
            List<List<ProductMap>> listduplicatenew = new List<List<ProductMap>>();

            //lấy product trong database ra chỉ lấy Codetype bằng loai.
            List<Hardware> listproindatabase = new List<Hardware>();
            String loai = sanphamgop.loai;
            var resource = (from x in db.Hardwares select x);
            listproindatabase = resource.ToList();

            // tìm sản phẩm trùng cho vào list trùng hoặc xóa đi :|
            for (int j = 0; j < listproindatabase.Count; j++)
            {
                for (int i = 0; i < listpro.Count; i++)
                {
                    List<ProductMap> duplicateProduct = new List<ProductMap>();

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

                        j--;
                    }

                    // lấy sản phầm trùng cho vào list trùng mới
                    if (CompareStringHelper.CompareString(tenchinh, listproindatabase[j].Name.ToString()) >= 80)
                    {
                        ProductMap pro = new ProductMap();
                        pro.stt = listproindatabase[j].ID.ToString();
                        pro.ten = listproindatabase[j].Name;
                        pro.loai = listproindatabase[j].CodetypeID;
                        pro.trongso = listproindatabase[j].WeightCriteraPoint.ToString();
                        duplicateProduct.Add(pro);
                        listpro[i].stt = "z" + listpro[i].stt;
                        duplicateProduct.Add(listpro[i]);
                        listpro.RemoveAt(i);
                        i = i--;
                        //lấy dữ liệu trong file text traning ra ProductNameTraining;
                        string path1 = Server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
                        if (System.IO.File.Exists(path1))
                        {   // lấy hết dòng trong file txt ra.
                            string[] lines1 = System.IO.File.ReadAllLines(path1);
                            // tảo mảng mới chứa dữ dữ liệu trùng.
                            string[] newlines = new string[1];
                            string newline = "0" + '~';
                            for (int h = 0; h < duplicateProduct.Count; h++)
                            {
                                newline += duplicateProduct[h].ten + "|" + duplicateProduct[h].loai + "|" +
                                           duplicateProduct[h].trongso + "|" + duplicateProduct[h].stt + "#";
                            }
                            newline = newline.Substring(0, newline.Length - 1);
                            newlines[0] = newline;
                            //Gộp hai bảng thành mảng mới và lưu vào txt lại
                            string[] save = new string[lines1.Length + newlines.Length];
                            for (int h = 0; h < lines1.Length; h++)
                            {
                                save[h] = lines1[h];
                            }
                            for (int h = 0; h < newlines.Length; h++)
                            {
                                save[h + lines1.Length] = newlines[h];
                            }
                            // ghi lại vào txt
                            System.IO.File.WriteAllLines(path1, save);
                        }
                    }


                    if (duplicateProduct.Count >= 2)
                    {
                     
                        listduplicatenew.Add(duplicateProduct);
                        check++;
                    }
                }
            }

            // lưu vào database
            if (check == 0)
            {
                Hardware p = new Hardware();

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
            }

            // ghi lại vào txt
            string path = Server.MapPath("~/UploadedExcelFiles/ProductName.txt");
            string[] lines = new string[listduplicate.Count];
            for (int i = 0; i < listduplicate.Count; i++)
            {
                string line = "";
                for (int j = 0; j < listduplicate[i].Count; j++)
                {
                    line += listduplicate[i][j].ten + "|" + listduplicate[i][j].loai + "|" + listduplicate[i][j].trongso + "#";
                }
                line = line.Substring(0, line.Length - 1);
                lines[i] = line;

            }
            System.IO.File.WriteAllLines(path, lines);
            Session["ListdupProduct"] = listduplicate;
            ViewBag.ListdupProduct = (List<List<ProductMap>>)Session["ListdupProduct"];


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
                    List<ProductMap> listpro = new List<ProductMap>(); ;
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
                    List<ProductMap> listpro = new List<ProductMap>();
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

                    //kiểm tra listpro có bị trùng database ko nếu bị trùng thì lưu vào ProductNameTraining

                    List<List<ProductMap>> listduplicatenew = new List<List<ProductMap>>();
                    //lấy product trong database ra chỉ lấy Codetype bằng loai.
                    List<Hardware> listproindatabase = new List<Hardware>();

                    var resource = (from x in db.Hardwares select x);
                    listproindatabase = resource.ToList();

                    // tìm sản phẩm trùng cho vào list trùng hoặc xóa đi :|
                    for (int j = 0; j < listproindatabase.Count; j++)
                    {
                        for (int i = 0; i < listpro.Count; i++)
                        {
                            List<ProductMap> duplicateProduct = new List<ProductMap>();

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

                                j--;
                            }

                            // lấy sản phầm trùng cho vào list trùng mới
                            if (CompareStringHelper.CompareString(Name, listproindatabase[j].Name.ToString()) >= 80)
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
                                i = i--;

                                //lấy dữ liệu trong file text traning ra ProductNameTraining;
                                string path1 = Server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
                                if (System.IO.File.Exists(path1))
                                {   // lấy hết dòng trong file txt ra.
                                    string[] lines1 = System.IO.File.ReadAllLines(path1);
                                    // tảo mảng mới chứa dữ dữ liệu trùng.
                                    string[] newlines = new string[1];
                                    string newline = "0" + '~';
                                    for (int h = 0; h < duplicateProduct.Count; h++)
                                    {
                                        newline += duplicateProduct[h].ten + "|" + duplicateProduct[h].loai + "|" +
                                                   duplicateProduct[h].trongso + "|" + duplicateProduct[h].stt + "#";
                                    }
                                    newline = newline.Substring(0, newline.Length - 1);
                                    newlines[0] = newline;
                                    //Gộp hai bảng thành mảng mới và lưu vào txt lại
                                    string[] save = new string[lines1.Length + newlines.Length];
                                    for (int h = 0; h < lines1.Length; h++)
                                    {
                                        save[h] = lines1[h];
                                    }
                                    for (int h = 0; h < newlines.Length; h++)
                                    {
                                        save[h + lines1.Length] = newlines[h];
                                    }
                                    // ghi lại vào txt
                                    System.IO.File.WriteAllLines(path1, save);
                                }
                            }


                            if (duplicateProduct.Count >= 2)
                            {
                                listduplicatenew.Add(duplicateProduct);
                            }




                        }
                    }
                    Session["ListdupProduct"] = listduplicate;
                    // ghi lại vào txt
                    string path = Server.MapPath("~/UploadedExcelFiles/ProductName.txt");
                    string[] lines = new string[listduplicate.Count];
                    for (int a = 0; a < listduplicate.Count; a++)
                    {
                        string line = "";
                        for (int b = 0; b < listduplicate[a].Count; b++)
                        {
                            line += listduplicate[a][b].ten + "|" + listduplicate[a][b].loai + "|" + listduplicate[a][b].trongso + "#";
                        }
                        line = line.Substring(0, line.Length - 1);
                        lines[a] = line;
                    }
                    System.IO.File.WriteAllLines(path, lines);

                }
            }

            //cho vào viewbag
            ViewBag.listproduct = (List<ProductMap>)Session["listproduct"];
            ViewBag.ListdupProduct = (List<List<ProductMap>>)Session["ListdupProduct"];

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
                    if (tachdup[1].Equals(listduplicatenew[i][j].stt)&&tachdup[2].Equals(listduplicatenew[i][1].stt))
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
                        var resource = (from x in db.Hardwares where x.CodetypeID.Equals(loai) select x);
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

                        //foreach (Codetype codety in Listcodetype)
                        //{
                        //    codety.Name.Equals(listduplicatenew[i][1].loai);
                            p.CodetypeID = listduplicatenew[i][1].loai;
                        //    break;
                        //}
                        p.WeightCriteraPoint = Convert.ToInt32(listduplicatenew[i][1].trongso);
                        // nếu có trọng số rồi thì cho isactive = true
                        if (Convert.ToInt32(listduplicatenew[i][1].trongso)>0)
                        {
                            p.IsActive = true;
                        }
                        db.Hardwares.Add(p);
                        db.SaveChanges();

                        // Lưu vào Dictionary
                        var Pronewid = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        Dictionary newdiction = new Dictionary();
                        newdiction.AttributeDicID = Pronewid.ID;
                        newdiction.Name = Pronewid.Name;
                        newdiction.IsActive = true;
                        db.Dictionaries.Add(newdiction);
                        db.SaveChanges();


                        //lấy id vừa mới insert cho vào bảng ProductAttibute------------------------------------------
                        if (!listduplicatenew[i][0].productid.Equals("0"))
                        {
                            // lấy id hardware vừa insert
                            var pronew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            int idinsert = Convert.ToInt32(pronew.ID);
                            ProductAttribute proatt = new ProductAttribute();
                            proatt.AttributeID = idinsert;
                            proatt.ProductID = Convert.ToInt32(listduplicatenew[i][0].productid);
                            db.ProductAttributes.Add(proatt);
                            db.SaveChanges();

                        }


                        // lấy max ID và thêm vào bảng alias
                        if (mangten.Length >= 2)
                        {
                            var pronew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            int idinsert = Convert.ToInt32(pronew.ID);

                            for (int h = 1; h < mangten.Length; h++)
                            {

                                //lấy product trong database ra chỉ lấy Codetype bằng loai kiểm tra xem có trong database chưa @@.
                                List<Dictionary> listmap = new List<Dictionary>();
                                var resource1 = (from x in db.Dictionaries select x);
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
                                db.Dictionaries.Add(a);
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
                string line = listduplicatenew[i][0].productid + '~';
                for (int j = 0; j < listduplicatenew[i].Count; j++)
                {
                    line += listduplicatenew[i][j].ten + "|" + listduplicatenew[i][j].loai + "|" + listduplicatenew[i][j].trongso + "|" + listduplicatenew[i][j].stt + "#";
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
            if (!valuesgop.Equals("nothing"))
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
                        if (tachdup[1].Equals(listduplicatenew[i][j].stt) && tachdup[2].Equals(listduplicatenew[i][1].stt))
                        {

                            Hardware p = new Hardware();

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
                                        count++;
                                        if (!listduplicatenew[i][0].productid.Equals("0"))
                                        {
                                            // thêm ProductAtribute khi add sản phẩm :|
                                            ProductAttribute proAttr = new ProductAttribute();
                                            // proAttr.ProductID = Convert.ToInt32(listID[i]);
                                            proAttr.ProductID = Convert.ToInt32(listduplicatenew[i][1].productid);
                                            proAttr.AttributeID = listmap[r].AttributeDicID;
                                            proAttr.IsActive = true;
                                            db.ProductAttributes.Add(proAttr);
                                            db.SaveChanges();
                                        }
                                        listduplicatenew.RemoveAt(i);
                                        //listID.RemoveAt(i);
                                        i = i - 1;
                                        break;
                                    }
                                }
                                if (count > 0)
                                {
                                    break;
                                }

                                Dictionary a = new Dictionary();
                                a.Name = mangten[h];
                                a.AttributeDicID = Convert.ToInt32(listduplicatenew[i][0].stt);
                                a.IsActive = true;
                                db.Dictionaries.Add(a);
                                db.SaveChanges();

                                if (!listduplicatenew[i][0].productid.Equals("0"))
                                {
                                    // thêm ProductAtribute khi add sản phẩm :|
                                    ProductAttribute proAttr = new ProductAttribute();
                                    // proAttr.ProductID = Convert.ToInt32(listID[i]);
                                    proAttr.ProductID = Convert.ToInt32(listduplicatenew[i][1].productid);
                                    proAttr.AttributeID = Convert.ToInt32(listduplicatenew[i][0].stt);
                                    proAttr.IsActive = true;
                                    db.ProductAttributes.Add(proAttr);
                                    db.SaveChanges();
                                }
                                listduplicatenew.RemoveAt(i);
                                //listID.RemoveAt(i);
                                i = i - 1;
                                count++;
                                break;
                            }
                        }

                        Session["ListduptraningProduct"] = listduplicatenew;
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

                // ghi lại vào txt
                string path = Server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
                listduplicatenew = (List<List<ProductMap>>)Session["ListduptraningProduct"];
                string[] lines = new string[listduplicatenew.Count];
                for (int i = 0; i < listduplicatenew.Count; i++)
                {
                    //string line = listID[i]+'~';  
                    string line = listduplicatenew[i][1].productid + '~';
                    for (int j = 0; j < listduplicatenew[i].Count; j++)
                    {
                        //  line += listduplicatenew[i][j].ten + "#";
                        line += listduplicatenew[i][j].ten + "|" + listduplicatenew[i][j].loai + "|" + listduplicatenew[i][j].trongso + "|" + listduplicatenew[i][j].stt + "#";
                    }
                    line = line.Substring(0, line.Length - 1);
                    lines[i] = line;

                }
                System.IO.File.WriteAllLines(path, lines);
                ViewBag.Listduptraning = (List<List<ProductMap>>)Session["ListduptraningProduct"];
            }
            else
            {
                ViewBag.Listduptraning = LoadThanhPhanTrungDB();
            }
          
            return View();
        }

        /// <summary>
        /// Show info
        /// </summary>
        /// <param name="showInfo"></param>
        /// <returns></returns>
        public ActionResult showInfo1(string showInfo)
        {
            if (showInfo.Equals("ok"))
            {
                ViewBag.ListdupProduct = (List<List<ProductMap>>)Session["ListdupProduct"];
                ViewBag.Listduptraning = (List<List<ProductMap>>)Session["ListduptraningProduct"];
            }
            return View();
        }

    }


}
