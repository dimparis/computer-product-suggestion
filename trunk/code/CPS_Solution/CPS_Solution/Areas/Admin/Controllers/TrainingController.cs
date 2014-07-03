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
    public class TrainingController : Controller
    {
        CPS_SolutionEntities db = new CPS_SolutionEntities();
        //
        // GET: /Admin/Training/

        public ActionResult Index()
        {
            string path = Server.MapPath("~/UploadedExcelFiles/ProductName.txt");
            List<List<ProductMap>> Listduptraning = new List<List<ProductMap>>();
          
            if (System.IO.File.Exists(path))
            {
                int h = 0;
                string[] lines = System.IO.File.ReadAllLines(path);
                for (int i = 0; i < lines.Length; i++)
                {
                    List<ProductMap> duppro = new List<ProductMap>();
                    String[] line = lines[i].Split(';');
                    string ten = line[0];
                    var resource = (from x in db.AttributeDictionaries where x.Name.Equals(ten) select x).FirstOrDefault();
                    ProductMap p = new ProductMap();
                    p.stt = resource.ID.ToString();
                    p.ten = resource.Name;
                    p.loai = resource.CodetypeID;
                    p.trongso = resource.WeightCriteraPoint.ToString();
                    duppro.Add(p);
                    String loai = resource.CodetypeID;
                    for (int j = 1; j < line.Length; j++)
                    {
                        ProductMap pr = new ProductMap();
                        pr.stt = h.ToString() + 'z';
                        pr.ten = line[j];
                        pr.loai = loai;
                        pr.trongso = "0";
                        duppro.Add(pr);
                    }
                    Listduptraning.Add(duppro);
                }
            }
            Session["Listduptraning"] = Listduptraning;
            ViewBag.Listduptraning = (List<List<ProductMap>>)Session["Listduptraning"];
            return View();
        }


        /// <summary>
        /// Tách sản phẩm khi so trùng trong database
        /// </summary>
        /// <returns></returns>
        public ActionResult tachdatabase(String valuestach)
        {
            List<List<ProductMap>> listduplicatenew = (List<List<ProductMap>>)Session["Listduptraning"];
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
                            Session["Listduptraning"] = listduplicatenew;
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
                        Session["Listduptraning"] = listduplicatenew;
                        break;
                    }
                }
                if(dem > 0)
                {
                    break;
                }
            }
            // ghi lại vào txt
            string path = Server.MapPath("~/UploadedExcelFiles/ProductName.txt");
            listduplicatenew = (List<List<ProductMap>>)Session["Listduptraning"];
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
            ViewBag.Listduptraning = (List<List<ProductMap>>)Session["Listduptraning"];
            return View();
        }
        /// <summary>
        /// Gộp sản phẩm khi so trùng trong database
        /// </summary>
        /// <returns></returns>
        public ActionResult gopdatabase(String valuesgop)
        {
            List<List<ProductMap>> listduplicatenew = (List<List<ProductMap>>)Session["Listduptraning"];
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
                            listduplicatenew.RemoveAt(i);
                            i = i - 1;
                            count++;
                            break;
                        }
                       
                    }
                    if (count > 1)
                    {
                       
                        break;
                    }
                    
                    Session["Listduptraning"] = listduplicatenew;
                   
                }

            }

            // ghi lại vào txt
            string path = Server.MapPath("~/UploadedExcelFiles/ProductName.txt");

            listduplicatenew = (List<List<ProductMap>>)Session["Listduptraning"];
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
            ViewBag.Listduptraning = (List<List<ProductMap>>)Session["Listduptraning"];
            return View();
        }
    }
}
