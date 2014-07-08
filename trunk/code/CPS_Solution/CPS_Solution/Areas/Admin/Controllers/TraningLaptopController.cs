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
    public class TraningLaptopController : Controller
    {
        CPS_SolutionEntities db = new CPS_SolutionEntities();
        //
        // GET: /Admin/TraningLaptop/

        public ActionResult Index()
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
                    List<LapData> duppro = new List<LapData>();
                    String[] line = lines[i].Split('#');
                    for (int j = 0; j < line.Length; j++)
                    {
                        h++;
                        String[] Atrr = line[j].Split('|');
                        LapData pro = new LapData ();
                        pro.stt = h.ToString();
                        pro.Name = Atrr[0];
                        pro.Imagelink = Atrr[1];
                        pro.CPU = Atrr[2];
                        pro.VGA = Atrr[3];
                        pro.HDD = Atrr[4];
                        pro.Display = Atrr[5];
                        pro.RAM = Atrr[6];
                        duppro.Add(pro);
                       
                    }
                    ListdupLaptraning.Add(duppro);

                }
            }
            #endregion
            // sản phẩm trùng trong database
            #region load sản phẩm trùng với database từ LapDatadbTraning
            string path1 = Server.MapPath("~/UploadedExcelFiles/LapDatadbTraning.txt");
            List<List<LapData>> LapDatadbTraning = new List<List<LapData>>();

            if (System.IO.File.Exists(path1))
            {
                int h = 0;
                string[] lines1 = System.IO.File.ReadAllLines(path1);
                for (int i = 0; i < lines1.Length; i++)
                {
                    List<LapData> duppro = new List<LapData>();
                    String[] line1 = lines1[i].Split('#');
                    for (int j = 0; j < line1.Length; j++)
                    {
                        h++;
                        String[] Atrr = line1[j].Split('|');
                        LapData pro = new LapData();
                        pro.stt = h.ToString();
                        pro.Name = Atrr[0];
                        pro.Imagelink = Atrr[1];
                        pro.CPU = Atrr[2];
                        pro.VGA = Atrr[3];
                        pro.HDD = Atrr[4];
                        pro.Display = Atrr[5];
                        pro.RAM = Atrr[6];
                        duppro.Add(pro);

                    }
                    LapDatadbTraning.Add(duppro);

                }
            }
            #endregion
            // list sản phẩm trùng
            Session["ListdupLaptraning"] = ListdupLaptraning;
            ViewBag.ListdupLaptraning = (List<List<LapData>>)Session["ListdupLaptraning"];
            // list sản phẩm trùng database
            Session["LapDatadbTraning"] = LapDatadbTraning;
            ViewBag.LapDatadbTraning = (List<List<LapData>>)Session["LapDatadbTraning"];
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
            List<List<LapData>> listduplicate = (List<List<LapData>>)Session["ListdupLaptraning"];

            // lấy tên chính ở cuối list ra và remove
            string sttTenchinh = values.Last();
            values.Remove(values.Last());

            // tên sản phẩm gộp
            string tenmoi = "";
            string tenchinh = "";
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
                            tenchinh = listduplicate[i][j].Name;
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
                     //-->   listpro.Add(listduplicate[i].First());
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
            // nếu trùng database thì lưu vào txt để check sau
            //lấy product trong database ra.
            List<Product> listproindatabase = new List<Product>();
            var liproduct = (from x in db.Products select x);
            listproindatabase = liproduct.ToList();
            int check = 0;
            for (int j = 0; j < listproindatabase.Count; j++)
            {
                if (CompareStringHelper.CompareString(tenchinh, listproindatabase[j].Name.ToString()) >= 80)
                {
                    LapData pro = new LapData();
                    pro.stt = listproindatabase[j].ID.ToString();
                    int stt = listproindatabase[j].ID;
                    pro.Imagelink = listproindatabase[j].URL;
                    pro.Name = listproindatabase[j].Name;
                    // lấy CPU của product ra
                    var idAttrC = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("C") && a.ProductID == stt select a.AttributeID).SingleOrDefault();
                    if (idAttrC == 0)
                    {
                        pro.CPU = "Đang chờ xử lý";
                    }
                    else
                    {
                        int idCPU = Convert.ToInt32(idAttrC.ToString());
                        var CPU = (from a in db.AttributeDictionaries where a.ID.Equals(idCPU) select a.Name).FirstOrDefault();
                        pro.CPU = CPU.ToString();
                    }          
                    // lấy VGA của product ra
                    var idAttrV = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("V") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                    if (idAttrV == 0)
                    {
                        pro.VGA = "Đang chờ xử lý";
                    }
                    else
                    {
                        int idVGA = Convert.ToInt32(idAttrV.ToString());
                        var VGA = (from a in db.AttributeDictionaries where a.ID.Equals(idVGA) select a.Name).FirstOrDefault();
                        pro.VGA = VGA.ToString();

                    }        
                    // lấy HDD của product ra
                    var idAttrH = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("H") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                    if (idAttrH == 0)
                    {
                        pro.HDD = "Đang chờ xử lý";
                    }
                    else
                    {
                        int idHDD = Convert.ToInt32(idAttrH.ToString());
                        var HDD = (from a in db.AttributeDictionaries where a.ID.Equals(idHDD) select a.Name).FirstOrDefault();
                        pro.HDD = HDD.ToString();

                    }       
                    // lấy Display  của product ra
                    var idAttrD = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("D") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                    if (idAttrD == 0)
                    {
                        pro.Display = "Đang chờ xử lý";
                    }
                    else
                    {
                        int idDisplay = Convert.ToInt32(idAttrD.ToString());
                        var Display = (from a in db.AttributeDictionaries where a.ID.Equals(idDisplay) select a.Name).FirstOrDefault();
                        pro.Display = Display.ToString();
                    }                  
                    // lấy RAM   của product ra
                    var idAttrR = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("R") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                    if (idAttrR == 0)
                    {
                        pro.RAM = "Đang chờ xử lý";
                    }
                    else
                    {
                        int idRAM = Convert.ToInt32(idAttrR.ToString());
                        var RAM = (from a in db.AttributeDictionaries where a.ID.Equals(idRAM) select a.Name).FirstOrDefault();
                        pro.RAM = RAM.ToString();
                    }                        
                    //------------ Ghi vào logfile trùng database
                    string path = Server.MapPath("~/UploadedExcelFiles/LapDatadbTraning.txt");
                    if (System.IO.File.Exists(path))
                    {   // lấy hết dòng trong file txt ra.
                        string[] lines = System.IO.File.ReadAllLines(path);
                        // tảo mảng mới chứa dữ dữ liệu trùng.
                        string[] newlines = new string[2];
                  
                            string newline = "";
                            newline = pro.Name + "|" + pro.Imagelink + "|" +
                                           pro.CPU + "|" + pro.VGA + "|" +
                                           pro.HDD + "|" + pro.Display + "|" +
                                           pro.RAM + "#" 
                                           + sanphamgop.Name + "|" + sanphamgop.Imagelink + "|" +
                                             sanphamgop.CPU + "|" + sanphamgop.VGA + "|" +
                                             sanphamgop.HDD + "|" + sanphamgop.Display + "|" +
                                             sanphamgop.RAM;                         
                           // newline = newline.Substring(0, newline.Length - 1);
                           
                           
                        newlines[0] = newline;
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
                    check++;
                    break;
                }
            }
            //-------------------------------------------------------------------------------------------------------------------------------------
            /////////////////// nếu không trùng thì lưu vào database
            if (check == 0)
            {
             
                //----------------------------- kiểm tra sản phẩm trong listpro có bị trùng linh kiện ko---------------------------
                #region Lấy CPU VGA HDD Display Ram cho vào danh sách riêng để kiểm tra trùng linh kiện
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
                #endregion

                #region Kiểm tra trùng link kiện để ghilog txt
                string errorCPU = "";
                string errorVGA = "";
                string errorHDD = "";
                string errorDisplay = "";
                string errorRam = "";
                int errorCount = 0;
                // trùng CPU 1
                for (int x = 0; x < listCPU.Count; x++)
                {
                    if (sanphamgop.CPU.Equals(listCPU[x].Name))
                    {
                        break;
                    }
                    else if (CompareStringHelper.CompareString(sanphamgop.CPU, listCPU[x].Name) >= 80)
                    {
                      //  listtrunglinhkien[1] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                        errorCount++;
                        errorCPU = listCPU[x].Name;
                        break;
                    }
                }
                // trùng VGA 2
                for (int x = 0; x < listVGA.Count; x++)
                {
                    if (sanphamgop.VGA.Equals(listVGA[x].Name))
                    {
                        break;
                    }
                    else if (CompareStringHelper.CompareString(sanphamgop.VGA, listVGA[x].Name) >= 80)
                    {
                      //  listtrunglinhkien[2] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                        errorCount++;
                        errorVGA = listVGA[x].Name;
                        break;
                    }
                }
                // trùng HDD 3
                for (int x = 0; x < listHDD.Count; x++)
                {
                    if (sanphamgop.HDD.Equals(listHDD[x].Name))
                    {
                        break;
                    }
                    else if (CompareStringHelper.CompareString(sanphamgop.HDD, listHDD[x].Name) >= 80)
                    {
                     //   listtrunglinhkien[3] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                        errorCount++;
                        errorHDD = listHDD[x].Name;
                        break;
                    }
                }
                // trùng Display 4
                for (int x = 0; x < listDisplay.Count; x++)
                {
                    if (sanphamgop.Display.Equals(listDisplay[x].Name))
                    {
                        break;
                    }
                    else if (CompareStringHelper.CompareString(sanphamgop.Display, listDisplay[x].Name) >= 80)
                    {
                       // listtrunglinhkien[4] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                        errorCount++;
                        errorDisplay = listDisplay[x].Name;
                        break;
                    }
                }
                // trùng Ram
                for (int x = 0; x < listRam.Count; x++)
                {
                    if (sanphamgop.RAM.Equals(listRam[x].Name))
                    {
                        break;
                    }
                    else if (CompareStringHelper.CompareString(sanphamgop.RAM, listRam[x].Name) >= 80)
                    {
                       // listtrunglinhkien[5] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                        errorCount++;
                        errorRam = listRam[x].Name;
                        break;
                    }
                }
                #endregion
                #region  lưu product và product alias
                Product p = new Product();
                p.ImageURL = sanphamgop.Imagelink;
                p.Price = 0;
                p.TotalWeightPoint = 0;
                p.IsActive = false;

                // lưu vào database
                db.Products.Add(p);
                db.SaveChanges();

                String[] mangten = sanphamgop.Name.ToString().Split(';');
                // nếu mảng tên >=2 thì lưu cái tên đầu tiên làm tên chính.
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
                // nếu không thì lưu làm tên chính luôn.
                else
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

                // lấy max ID và thêm vào bảng alias tên phụ
                if (mangten.Length >= 2)
                {
                    // lấy id của sản phẩm mới được insert vào db
                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                    int idinsert = Convert.ToInt32(pronew.ID);
                    // bỏ tên đầu tiên vì lưu làm tên chính rồi lưu tên phụ
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
                    if (sanphamgop.CPU.Equals(listCPU[x].Name))
                    {
                        idCPU1 = listCPU[x].ID;
                        break;
                    }
                }
                // nếu chưa có
                if (idCPU1 == 0)
                {   // chưa có mà bị trùng trong database thì ghi log
                    if (!errorCPU.Equals(""))
                    {
                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        int idpro = Convert.ToInt32(pronew.ID);
                        newline[vitriluu] = idpro.ToString() + '-' + errorCPU + ';' + sanphamgop.CPU;
                        vitriluu++;
                     //   break;
                    }
                    else
                    {
                        // Lưu mới CPU và get ID mới lưu
                        AttributeDictionary atcpu = new AttributeDictionary();
                        atcpu.CodetypeID = "C";
                        atcpu.Name = sanphamgop.CPU;
                        atcpu.WeightCriteraPoint = 0;
                        db.AttributeDictionaries.Add(atcpu);
                        db.SaveChanges();
                        var cpunew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        idCPU1 = Convert.ToInt32(cpunew.ID);
                      //  break;
                    }
                }

                //nếu List CPU là rỗng 
                if (listCPU.Count == 0)
                {
                    if (!errorCPU.Equals(""))
                    {
                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        int idpro = Convert.ToInt32(pronew.ID);
                        newline[0] = idpro.ToString() + '-' + errorCPU + ';' + sanphamgop.CPU;
                        vitriluu++;
                    }
                    else
                    {
                        AttributeDictionary atcpu = new AttributeDictionary();
                        atcpu.CodetypeID = "C";
                        atcpu.Name = sanphamgop.CPU;
                        atcpu.WeightCriteraPoint = 0;
                        db.AttributeDictionaries.Add(atcpu);
                        db.SaveChanges();
                        var cpunew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        idCPU1 = Convert.ToInt32(cpunew.ID);
                    }
                }
                #endregion
                // id VGA 2
                #region
                // kiểm tra xem có trong database chưa có rồi thì lấy ID đã có
                for (int x = 0; x < listVGA.Count; x++)
                {
                    if (sanphamgop.VGA.Equals(listVGA[x].Name))
                    {
                        idVGA2 = listVGA[x].ID;
                        break;
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
                        newline[vitriluu] = idpro.ToString() + '-' + errorVGA + ';' + sanphamgop.VGA;
                        vitriluu++;
                      //  break;
                    }
                    // ko trùng thì lưu VGA mới vào database và lấy ID
                    else
                    {

                        AttributeDictionary atvga = new AttributeDictionary();
                        atvga.CodetypeID = "V";
                        atvga.Name = sanphamgop.VGA;
                        atvga.WeightCriteraPoint = 0;
                        db.AttributeDictionaries.Add(atvga);
                        db.SaveChanges();
                        var vganew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        idVGA2 = Convert.ToInt32(vganew.ID);
                       // break;
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
                        newline[vitriluu] = idpro.ToString() + '-' + errorVGA + ';' + sanphamgop.VGA;
                        vitriluu++;
                    }
                    // ko trùng thì lưu VGA mới vào database và lấy ID
                    else
                    {
                        AttributeDictionary atvga = new AttributeDictionary();
                        atvga.CodetypeID = "V";
                        atvga.Name = sanphamgop.VGA;
                        atvga.WeightCriteraPoint = 0;
                        db.AttributeDictionaries.Add(atvga);
                        db.SaveChanges();
                        var vganew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        idVGA2 = Convert.ToInt32(vganew.ID);
                    }
                }
                #endregion
                // id HDD 3
                #region
                // nếu có rồi trong database thì lấy ID ra
                for (int x = 0; x < listHDD.Count; x++)
                {
                    if (sanphamgop.HDD.Equals(listHDD[x].Name))
                    {
                        idHDD3 = listHDD[x].ID;
                        break;
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
                        newline[vitriluu] = idpro.ToString() + '-' + errorHDD + ';' + sanphamgop.HDD;
                        vitriluu++;
                      //  break;
                    }
                    // ko trùng thì lưu HDD mới vào database và lấy ID
                    else
                    {
                        AttributeDictionary athddd = new AttributeDictionary();
                        athddd.CodetypeID = "H";
                        athddd.Name = sanphamgop.HDD;
                        athddd.WeightCriteraPoint = 0;
                        db.AttributeDictionaries.Add(athddd);
                        db.SaveChanges();
                        var hddnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        idHDD3 = Convert.ToInt32(hddnew.ID);
                       // break;
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
                        newline[vitriluu] = idpro.ToString() + '-' + errorHDD + ';' + sanphamgop.HDD;
                        vitriluu++;
                    }
                    // ko trùng thì lưu HDD mới vào database và lấy ID
                    else
                    {
                        AttributeDictionary athddd = new AttributeDictionary();
                        athddd.CodetypeID = "H";
                        athddd.Name = sanphamgop.HDD;
                        athddd.WeightCriteraPoint = 0;
                        db.AttributeDictionaries.Add(athddd);
                        db.SaveChanges();
                        var hddnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        idHDD3 = Convert.ToInt32(hddnew.ID);
                    }
                }
                #endregion
                // id Display 4
                #region
                // nếu có rồi trong database thì lấy id ra
                for (int x = 0; x < listDisplay.Count; x++)
                {
                    if (sanphamgop.Display.Equals(listDisplay[x].Name))
                    {
                        idDisplay4 = listDisplay[x].ID;
                        break;
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
                            newline[vitriluu] = idpro.ToString() + '-' + errorDisplay + ';' + sanphamgop.Display;
                            vitriluu++;
                           // break;
                        }
                        // ko trùng thì lưu Display mới vào database và lấy ID
                        else
                        {
                            AttributeDictionary athdisp = new AttributeDictionary();
                            athdisp.CodetypeID = "D";
                            athdisp.Name = sanphamgop.Display;
                            athdisp.WeightCriteraPoint = 0;
                            db.AttributeDictionaries.Add(athdisp);
                            db.SaveChanges();
                            var dispnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idDisplay4 = Convert.ToInt32(dispnew.ID);
                          //  break;
                        }
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
                        newline[vitriluu] = idpro.ToString() + '-' + errorDisplay + ';' + sanphamgop.Display;
                        vitriluu++;
                    }
                    // ko trùng thì lưu Display mới vào database và lấy ID
                    else
                    {
                        AttributeDictionary athdisp = new AttributeDictionary();
                        athdisp.CodetypeID = "D";
                        athdisp.Name = sanphamgop.Display;
                        athdisp.WeightCriteraPoint = 0;
                        db.AttributeDictionaries.Add(athdisp);
                        db.SaveChanges();
                        var dispnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        idDisplay4 = Convert.ToInt32(dispnew.ID);
                    }
                }
                #endregion
                // id Ram
                #region
                // nếu có rồi trong database thì lấy id ra
                for (int x = 0; x < listRam.Count; x++)
                {
                    if (sanphamgop.RAM.Equals(listRam[x].Name))
                    {
                        idRam5 = listRam[x].ID;
                        break;
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
                        newline[vitriluu] = idpro.ToString() + '-' + errorRam + ';' + sanphamgop.RAM;
                        vitriluu++;
                       // break;
                    }
                    // ko trùng thì lưu Ram mới vào database và lấy ID
                    else
                    {
                        AttributeDictionary athram = new AttributeDictionary();
                        athram.CodetypeID = "R";
                        athram.Name = sanphamgop.RAM;
                        athram.WeightCriteraPoint = 0;
                        db.AttributeDictionaries.Add(athram);
                        db.SaveChanges();
                        var ramnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        idRam5 = Convert.ToInt32(ramnew.ID);
                      //  break;
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
                        newline[vitriluu] = idpro.ToString() + '-' + errorRam + ';' + sanphamgop.RAM;
                        vitriluu++;
                    }
                    // ko trùng thì lưu Display mới vào database và lấy ID
                    else
                    {
                        AttributeDictionary athram = new AttributeDictionary();
                        athram.CodetypeID = "R";
                        athram.Name = sanphamgop.RAM;
                        athram.WeightCriteraPoint = 0;
                        db.AttributeDictionaries.Add(athram);
                        db.SaveChanges();
                        var ramnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        idRam5 = Convert.ToInt32(ramnew.ID);
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
                    atProCPU.ProductID = idinsertnew;
                    db.ProductAttributes.Add(atProCPU);
                    db.SaveChanges();
                }
                if (errorRam.Equals(""))
                {
                    //2 lưu idRam vào bảng ProductAttribute
                    ProductAttribute atProRam = new ProductAttribute();
                    atProRam.AttributeID = idRam5;
                    atProRam.ProductID = idinsertnew;
                    db.ProductAttributes.Add(atProRam);
                    db.SaveChanges();
                }
                if (errorHDD.Equals(""))
                {
                    //3 lưu idhdd vào bảng ProductAttribute
                    ProductAttribute atProHDD = new ProductAttribute();
                    atProHDD.AttributeID = idHDD3;
                    atProHDD.ProductID = idinsertnew;
                    db.ProductAttributes.Add(atProHDD);
                    db.SaveChanges();
                }
                if (errorDisplay.Equals(""))
                {
                    //4 lưu idDisplay vào bảng ProductAttribute
                    ProductAttribute atProDisp = new ProductAttribute();
                    atProDisp.AttributeID = idDisplay4;
                    atProDisp.ProductID = idinsertnew;
                    db.ProductAttributes.Add(atProDisp);
                    db.SaveChanges();
                }
                if (errorVGA.Equals(""))
                {
                    //5 lưu idvag vào bảng ProductAttribute
                    ProductAttribute atProVAG = new ProductAttribute();
                    atProVAG.AttributeID = idVGA2;
                    atProVAG.ProductID = idinsertnew;
                    db.ProductAttributes.Add(atProVAG);
                    db.SaveChanges();
                }

                #endregion
            }
           ////---------------Update lại vào txt LapDataDbTraning---------------------------------------------
            string[] linenews = new string[listduplicate.Count];
            // lấy txt ra
             string path1 = Server.MapPath("~/UploadedExcelFiles/LapDataTraning.txt");
            if (System.IO.File.Exists(path1))
            {
              //  linenews = System.IO.File.ReadAllLines(path1);
                for (int i = 0; i < listduplicate.Count; i++)
                {
                    string newline = "";
                    for (int j = 0; j < listduplicate[i].Count; j++)
                    {
                        newline += listduplicate[i][j].Name + "|" + listduplicate[i][j].Imagelink + "|" +
                                   listduplicate[i][j].CPU + "|" + listduplicate[i][j].VGA + "|" +
                                   listduplicate[i][j].HDD + "|" + listduplicate[i][j].Display + "|" +
                                   listduplicate[i][j].RAM + "#";
                    }
                    newline = newline.Substring(0, newline.Length - 1);
                    linenews[i] = newline;
                }
                // ghi lại vào txt
                System.IO.File.WriteAllLines(path1, linenews);
            }
           
           //---- 
            Session["ListdupLaptraning"] = listduplicate;
            ViewBag.listduplicate = (List<List<LapData>>)Session["ListdupLaptraning"];
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

                // tách bảng
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
                    List<LapData> listpro = new List<LapData>();
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
                                //listpro.Add(listduplicate[i].First());
                                //----------------------------- kiểm tra sản phẩm trong listpro có bị trùng linh kiện ko---------------------------
                                #region Lấy CPU VGA HDD Display Ram cho vào danh sách riêng để kiểm tra trùng linh kiện
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
                                #endregion

                                #region Kiểm tra trùng link kiện để ghilog txt
                                string errorCPU = "";
                                string errorVGA = "";
                                string errorHDD = "";
                                string errorDisplay = "";
                                string errorRam = "";
                                int errorCount = 0;
                                // trùng CPU 1
                                for (int x = 0; x < listCPU.Count; x++)
                                {
                                    if (listduplicate[i].First().CPU.Equals(listCPU[x].Name))
                                    {
                                        break;
                                    }
                                    else if (CompareStringHelper.CompareString(listduplicate[i].First().CPU, listCPU[x].Name) >= 80)
                                    {
                                        //  listtrunglinhkien[1] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                                        errorCount++;
                                        errorCPU = listCPU[x].Name;
                                        break;
                                    }
                                }
                                // trùng VGA 2
                                for (int x = 0; x < listVGA.Count; x++)
                                {
                                    if (listduplicate[i].First().VGA.Equals(listVGA[x].Name))
                                    {
                                        break;
                                    }
                                    else if (CompareStringHelper.CompareString(listduplicate[i].First().VGA, listVGA[x].Name) >= 80)
                                    {
                                        //  listtrunglinhkien[2] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                                        errorCount++;
                                        errorVGA = listVGA[x].Name;
                                        break;
                                    }
                                }
                                // trùng HDD 3
                                for (int x = 0; x < listHDD.Count; x++)
                                {
                                    if (listduplicate[i].First().HDD.Equals(listHDD[x].Name))
                                    {
                                        break;
                                    }
                                    else if (CompareStringHelper.CompareString(listduplicate[i].First().HDD, listHDD[x].Name) >= 80)
                                    {
                                        //   listtrunglinhkien[3] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                                        errorCount++;
                                        errorHDD = listHDD[x].Name;
                                        break;
                                    }
                                }
                                // trùng Display 4
                                for (int x = 0; x < listDisplay.Count; x++)
                                {
                                    if (listduplicate[i].First().Display.Equals(listDisplay[x].Name))
                                    {
                                        break;
                                    }
                                    else if (CompareStringHelper.CompareString(listduplicate[i].First().Display, listDisplay[x].Name) >= 80)
                                    {
                                        // listtrunglinhkien[4] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                                        errorCount++;
                                        errorDisplay = listDisplay[x].Name;
                                        break;
                                    }
                                }
                                // trùng Ram
                                for (int x = 0; x < listRam.Count; x++)
                                {
                                    if (listduplicate[i].First().RAM.Equals(listRam[x].Name))
                                    {
                                        break;
                                    }
                                    else if (CompareStringHelper.CompareString(listduplicate[i].First().RAM, listRam[x].Name) >= 80)
                                    {
                                        // listtrunglinhkien[5] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                                        errorCount++;
                                        errorRam = listRam[x].Name;
                                        break;
                                    }
                                }
                                #endregion
                                #region  lưu product và product alias
                                Product p = new Product();
                                p.ImageURL = listduplicate[i].First().Imagelink;
                                p.Price = 0;
                                p.TotalWeightPoint = 0;
                                p.IsActive = false;

                                // lưu vào database
                                db.Products.Add(p);
                                db.SaveChanges();

                                String[] mangten = listduplicate[i].First().Name.ToString().Split(';');
                                // nếu mảng tên >=2 thì lưu cái tên đầu tiên làm tên chính.
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
                                // nếu không thì lưu làm tên chính luôn.
                                else
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

                                // lấy max ID và thêm vào bảng alias tên phụ
                                if (mangten.Length >= 2)
                                {
                                    // lấy id của sản phẩm mới được insert vào db
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idinsert = Convert.ToInt32(pronew.ID);
                                    // bỏ tên đầu tiên vì lưu làm tên chính rồi lưu tên phụ
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
                                    if (listduplicate[i].First().CPU.Equals(listCPU[x].Name))
                                    {
                                        idCPU1 = listCPU[x].ID;
                                        break;
                                    }
                                }
                                // nếu chưa có
                                if (idCPU1 == 0)
                                {   // chưa có mà bị trùng trong database thì ghi log
                                    if (!errorCPU.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '-' + errorCPU + ';' + listduplicate[i].First().CPU;
                                        vitriluu++;
                                        //   break;
                                    }
                                    else
                                    {
                                        // Lưu mới CPU và get ID mới lưu
                                        AttributeDictionary atcpu = new AttributeDictionary();
                                        atcpu.CodetypeID = "C";
                                        atcpu.Name = listduplicate[i].First().CPU;
                                        atcpu.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(atcpu);
                                        db.SaveChanges();
                                        var cpunew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idCPU1 = Convert.ToInt32(cpunew.ID);
                                        //  break;
                                    }
                                }

                                //nếu List CPU là rỗng 
                                if (listCPU.Count == 0)
                                {
                                    if (!errorCPU.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[0] = idpro.ToString() + '-' + errorCPU + ';' + listduplicate[i].First().CPU;
                                        vitriluu++;
                                    }
                                    else
                                    {
                                        AttributeDictionary atcpu = new AttributeDictionary();
                                        atcpu.CodetypeID = "C";
                                        atcpu.Name = listduplicate[i].First().CPU;
                                        atcpu.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(atcpu);
                                        db.SaveChanges();
                                        var cpunew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idCPU1 = Convert.ToInt32(cpunew.ID);
                                    }
                                }
                                #endregion
                                // id VGA 2
                                #region
                                // kiểm tra xem có trong database chưa có rồi thì lấy ID đã có
                                for (int x = 0; x < listVGA.Count; x++)
                                {
                                    if (listduplicate[i].First().VGA.Equals(listVGA[x].Name))
                                    {
                                        idVGA2 = listVGA[x].ID;
                                        break;
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
                                        newline[vitriluu] = idpro.ToString() + '-' + errorVGA + ';' + listduplicate[i].First().VGA;
                                        vitriluu++;
                                        //  break;
                                    }
                                    // ko trùng thì lưu VGA mới vào database và lấy ID
                                    else
                                    {

                                        AttributeDictionary atvga = new AttributeDictionary();
                                        atvga.CodetypeID = "V";
                                        atvga.Name = listduplicate[i].First().VGA;
                                        atvga.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(atvga);
                                        db.SaveChanges();
                                        var vganew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idVGA2 = Convert.ToInt32(vganew.ID);
                                        // break;
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
                                        newline[vitriluu] = idpro.ToString() + '-' + errorVGA + ';' + listduplicate[i].First().VGA;
                                        vitriluu++;
                                    }
                                    // ko trùng thì lưu VGA mới vào database và lấy ID
                                    else
                                    {
                                        AttributeDictionary atvga = new AttributeDictionary();
                                        atvga.CodetypeID = "V";
                                        atvga.Name = listduplicate[i].First().VGA;
                                        atvga.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(atvga);
                                        db.SaveChanges();
                                        var vganew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idVGA2 = Convert.ToInt32(vganew.ID);
                                    }
                                }
                                #endregion
                                // id HDD 3
                                #region
                                // nếu có rồi trong database thì lấy ID ra
                                for (int x = 0; x < listHDD.Count; x++)
                                {
                                    if (listduplicate[i].First().HDD.Equals(listHDD[x].Name))
                                    {
                                        idHDD3 = listHDD[x].ID;
                                        break;
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
                                        newline[vitriluu] = idpro.ToString() + '-' + errorHDD + ';' + listduplicate[i].First().HDD;
                                        vitriluu++;
                                        //  break;
                                    }
                                    // ko trùng thì lưu HDD mới vào database và lấy ID
                                    else
                                    {
                                        AttributeDictionary athddd = new AttributeDictionary();
                                        athddd.CodetypeID = "H";
                                        athddd.Name = listduplicate[i].First().HDD;
                                        athddd.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(athddd);
                                        db.SaveChanges();
                                        var hddnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idHDD3 = Convert.ToInt32(hddnew.ID);
                                        // break;
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
                                        newline[vitriluu] = idpro.ToString() + '-' + errorHDD + ';' + listduplicate[i].First().HDD;
                                        vitriluu++;
                                    }
                                    // ko trùng thì lưu HDD mới vào database và lấy ID
                                    else
                                    {
                                        AttributeDictionary athddd = new AttributeDictionary();
                                        athddd.CodetypeID = "H";
                                        athddd.Name = listduplicate[i].First().HDD;
                                        athddd.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(athddd);
                                        db.SaveChanges();
                                        var hddnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idHDD3 = Convert.ToInt32(hddnew.ID);
                                    }
                                }
                                #endregion
                                // id Display 4
                                #region
                                // nếu có rồi trong database thì lấy id ra
                                for (int x = 0; x < listDisplay.Count; x++)
                                {
                                    if (listduplicate[i].First().Display.Equals(listDisplay[x].Name))
                                    {
                                        idDisplay4 = listDisplay[x].ID;
                                        break;
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
                                            newline[vitriluu] = idpro.ToString() + '-' + errorDisplay + ';' + listduplicate[i].First().Display;
                                            vitriluu++;
                                            // break;
                                        }
                                        // ko trùng thì lưu Display mới vào database và lấy ID
                                        else
                                        {
                                            AttributeDictionary athdisp = new AttributeDictionary();
                                            athdisp.CodetypeID = "D";
                                            athdisp.Name = listduplicate[i].First().Display;
                                            athdisp.WeightCriteraPoint = 0;
                                            db.AttributeDictionaries.Add(athdisp);
                                            db.SaveChanges();
                                            var dispnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                            idDisplay4 = Convert.ToInt32(dispnew.ID);
                                            //  break;
                                        }
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
                                        newline[vitriluu] = idpro.ToString() + '-' + errorDisplay + ';' + listduplicate[i].First().Display;
                                        vitriluu++;
                                    }
                                    // ko trùng thì lưu Display mới vào database và lấy ID
                                    else
                                    {
                                        AttributeDictionary athdisp = new AttributeDictionary();
                                        athdisp.CodetypeID = "D";
                                        athdisp.Name = listduplicate[i].First().Display;
                                        athdisp.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(athdisp);
                                        db.SaveChanges();
                                        var dispnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idDisplay4 = Convert.ToInt32(dispnew.ID);
                                    }
                                }
                                #endregion
                                // id Ram
                                #region
                                // nếu có rồi trong database thì lấy id ra
                                for (int x = 0; x < listRam.Count; x++)
                                {
                                    if (listduplicate[i].First().RAM.Equals(listRam[x].Name))
                                    {
                                        idRam5 = listRam[x].ID;
                                        break;
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
                                        newline[vitriluu] = idpro.ToString() + '-' + errorRam + ';' + listduplicate[i].First().RAM;
                                        vitriluu++;
                                        // break;
                                    }
                                    // ko trùng thì lưu Ram mới vào database và lấy ID
                                    else
                                    {
                                        AttributeDictionary athram = new AttributeDictionary();
                                        athram.CodetypeID = "R";
                                        athram.Name = listduplicate[i].First().RAM;
                                        athram.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(athram);
                                        db.SaveChanges();
                                        var ramnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idRam5 = Convert.ToInt32(ramnew.ID);
                                        //  break;
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
                                        newline[vitriluu] = idpro.ToString() + '-' + errorRam + ';' + listduplicate[i].First().RAM;
                                        vitriluu++;
                                    }
                                    // ko trùng thì lưu Display mới vào database và lấy ID
                                    else
                                    {
                                        AttributeDictionary athram = new AttributeDictionary();
                                        athram.CodetypeID = "R";
                                        athram.Name = listduplicate[i].First().RAM;
                                        athram.WeightCriteraPoint = 0;
                                        db.AttributeDictionaries.Add(athram);
                                        db.SaveChanges();
                                        var ramnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        idRam5 = Convert.ToInt32(ramnew.ID);
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
                                    atProCPU.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProCPU);
                                    db.SaveChanges();
                                }
                                if (errorRam.Equals(""))
                                {
                                    //2 lưu idRam vào bảng ProductAttribute
                                    ProductAttribute atProRam = new ProductAttribute();
                                    atProRam.AttributeID = idRam5;
                                    atProRam.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProRam);
                                    db.SaveChanges();
                                }
                                if (errorHDD.Equals(""))
                                {
                                    //3 lưu idhdd vào bảng ProductAttribute
                                    ProductAttribute atProHDD = new ProductAttribute();
                                    atProHDD.AttributeID = idHDD3;
                                    atProHDD.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProHDD);
                                    db.SaveChanges();
                                }
                                if (errorDisplay.Equals(""))
                                {
                                    //4 lưu idDisplay vào bảng ProductAttribute
                                    ProductAttribute atProDisp = new ProductAttribute();
                                    atProDisp.AttributeID = idDisplay4;
                                    atProDisp.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProDisp);
                                    db.SaveChanges();
                                }
                                if (errorVGA.Equals(""))
                                {
                                    //5 lưu idvag vào bảng ProductAttribute
                                    ProductAttribute atProVAG = new ProductAttribute();
                                    atProVAG.AttributeID = idVGA2;
                                    atProVAG.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProVAG);
                                    db.SaveChanges();
                                }

                                #endregion

                                // xóa sản phẩm ra khỏi listdup
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

                    Session["ListdupLaptraning"] = listduplicate;
                }
                // tách sản phẩm
                else
                {


                    List<String> valuesTach = new List<String>();
                    String[] value = tachdup[0].ToString().Split('@');
                    for (int j = 1; j < value.Length; j++)
                    {
                        valuesTach.Add(value[j]);
                    }

                    // get list product in session.
                    List<LapData> listpro = new List<LapData>();
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

                    Session["ListdupLaptraning"] = listduplicate;
                    //-----------------------------------------------------------------------------------------------------------------
                    // nếu trùng database thì lưu vào txt để check sau
                    //lấy product trong database ra.
                    List<Product> listproindatabase = new List<Product>();
                    var liproduct = (from x in db.Products select x);
                    listproindatabase = liproduct.ToList();
                    for (int i = 0; i < listpro.Count; i++)
                    {
                        int check = 0;
                        for (int j = 0; j < listproindatabase.Count; j++)
                        {
                            if (CompareStringHelper.CompareString(listpro[i].Name, listproindatabase[j].Name.ToString()) >= 80)
                            {
                                LapData pro = new LapData();
                                pro.stt = listproindatabase[j].ID.ToString();
                                int stt = listproindatabase[j].ID;
                                pro.Imagelink = listproindatabase[j].URL;
                                pro.Name = listproindatabase[j].Name;
                                // lấy CPU của product ra
                                var idAttrC = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("C") && a.ProductID == stt select a.AttributeID).SingleOrDefault();
                                if (idAttrC == 0)
                                {
                                    pro.CPU = "Đang chờ xử lý";
                                }
                                else
                                {
                                    int idCPU = Convert.ToInt32(idAttrC.ToString());
                                    var CPU = (from a in db.AttributeDictionaries where a.ID.Equals(idCPU) select a.Name).FirstOrDefault();
                                    pro.CPU = CPU.ToString();
                                }      
                                // lấy VGA của product ra
                                var idAttrV = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("V") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                                if (idAttrV == 0)
                                {
                                    pro.VGA = "Đang chờ xử lý";
                                }
                                else
                                {
                                    int idVGA = Convert.ToInt32(idAttrV.ToString());
                                    var VGA = (from a in db.AttributeDictionaries where a.ID.Equals(idVGA) select a.Name).FirstOrDefault();
                                    pro.VGA = VGA.ToString();

                                }          
                                // lấy HDD của product ra
                                var idAttrH = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("H") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                                if (idAttrH == 0)
                                {
                                    pro.HDD = "Đang chờ xử lý";
                                }
                                else
                                {
                                    int idHDD = Convert.ToInt32(idAttrH.ToString());
                                    var HDD = (from a in db.AttributeDictionaries where a.ID.Equals(idHDD) select a.Name).FirstOrDefault();
                                    pro.HDD = HDD.ToString();

                                }          
                                // lấy Display  của product ra
                                var idAttrD = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("D") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                                if (idAttrD == 0)
                                {
                                    pro.Display = "Đang chờ xử lý";
                                }
                                else
                                {
                                    int idDisplay = Convert.ToInt32(idAttrD.ToString());
                                    var Display = (from a in db.AttributeDictionaries where a.ID.Equals(idDisplay) select a.Name).FirstOrDefault();
                                    pro.Display = Display.ToString();
                                }                
                                // lấy RAM   của product ra
                                var idAttrR = (from a in db.ProductAttributes where a.AttributeDictionary.CodetypeID.Equals("R") && a.ProductID == stt select a.AttributeID).FirstOrDefault();
                                if (idAttrR == 0)
                                {
                                    pro.RAM = "Đang chờ xử lý";
                                }
                                else
                                {
                                    int idRAM = Convert.ToInt32(idAttrR.ToString());
                                    var RAM = (from a in db.AttributeDictionaries where a.ID.Equals(idRAM) select a.Name).FirstOrDefault();
                                    pro.RAM = RAM.ToString();
                                }            
                                //------------ Ghi vào logfile trùng database
                                string path = Server.MapPath("~/UploadedExcelFiles/LapDatadbTraning.txt");
                                if (System.IO.File.Exists(path))
                                {   // lấy hết dòng trong file txt ra.
                                    string[] lines = System.IO.File.ReadAllLines(path);
                                    // tảo mảng mới chứa dữ dữ liệu trùng.
                                    string[] newlines = new string[2];

                                    string newline = "";
                                    newline = pro.Name + "|" + pro.Imagelink + "|" +
                                                   pro.CPU + "|" + pro.VGA + "|" +
                                                   pro.HDD + "|" + pro.Display + "|" +
                                                   pro.RAM + "#" +listpro[i].Name + "|" + listpro[i].Imagelink + "|" +
                                                     listpro[i].CPU + "|" + listpro[i].VGA + "|" +
                                                     listpro[i].HDD + "|" + listpro[i].Display + "|" +
                                                     listpro[i].RAM;
                                    // newline = newline.Substring(0, newline.Length - 1);
                                    newlines[0] = newline;                                                    
                                    //Gộp hai bảng thành mảng mới và lưu vào txt lại
                                    string[] save = new string[lines.Length + newlines.Length];
                                    for (int o = 0; o < lines.Length; o++)
                                    {
                                        save[o] = lines[o];
                                    }
                                    for (int e = 0; e < newlines.Length; e++)
                                    {
                                        save[e + lines.Length] = newlines[e];
                                    }
                                    // ghi lại vào txt
                                    System.IO.File.WriteAllLines(path, save);
                                }
                                check++;
                                break;
                            }
                        }
                        //-------------------------------------------------------------------------------------------------------------------------------------
                        /////////////////// nếu không trùng thì lưu vào database
                        if (check == 0)
                        {

                            //----------------------------- kiểm tra sản phẩm trong listpro có bị trùng linh kiện ko---------------------------
                            #region Lấy CPU VGA HDD Display Ram cho vào danh sách riêng để kiểm tra trùng linh kiện
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
                            #endregion

                            #region Kiểm tra trùng link kiện để ghilog txt
                            string errorCPU = "";
                            string errorVGA = "";
                            string errorHDD = "";
                            string errorDisplay = "";
                            string errorRam = "";
                            int errorCount = 0;
                            // trùng CPU 1
                            for (int x = 0; x < listCPU.Count; x++)
                            {
                                if (listpro[i].CPU.Equals(listCPU[x].Name))
                                {
                                    break;
                                }
                                else if (CompareStringHelper.CompareString(listpro[i].CPU, listCPU[x].Name) >= 80)
                                {
                                    //  listtrunglinhkien[1] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                                    errorCount++;
                                    errorCPU = listCPU[x].Name;
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
                                else if (CompareStringHelper.CompareString(listpro[i].VGA, listVGA[x].Name) >= 80)
                                {
                                    //  listtrunglinhkien[2] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                                    errorCount++;
                                    errorVGA = listVGA[x].Name;
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
                                else if (CompareStringHelper.CompareString(listpro[i].HDD, listHDD[x].Name) >= 80)
                                {
                                    //   listtrunglinhkien[3] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                                    errorCount++;
                                    errorHDD = listHDD[x].Name;
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
                                else if (CompareStringHelper.CompareString(listpro[i].Display, listDisplay[x].Name) >= 80)
                                {
                                    // listtrunglinhkien[4] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                                    errorCount++;
                                    errorDisplay = listDisplay[x].Name;
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
                                else if (CompareStringHelper.CompareString(listpro[i].RAM, listRam[x].Name) >= 80)
                                {
                                    // listtrunglinhkien[5] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                                    errorCount++;
                                    errorRam = listRam[x].Name;
                                    break;
                                }
                            }
                            #endregion
                            #region  lưu product và product alias
                            Product p = new Product();
                            p.ImageURL = listpro[i].Imagelink;
                            p.Price = 0;
                            p.TotalWeightPoint = 0;
                            p.IsActive = false;

                            // lưu vào database
                            db.Products.Add(p);
                            db.SaveChanges();

                            String[] mangten = listpro[i].Name.ToString().Split(';');
                            // nếu mảng tên >=2 thì lưu cái tên đầu tiên làm tên chính.
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
                            // nếu không thì lưu làm tên chính luôn.
                            else
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

                            // lấy max ID và thêm vào bảng alias tên phụ
                            if (mangten.Length >= 2)
                            {
                                // lấy id của sản phẩm mới được insert vào db
                                var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                int idinsert = Convert.ToInt32(pronew.ID);
                                // bỏ tên đầu tiên vì lưu làm tên chính rồi lưu tên phụ
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
                                if (listpro[i].CPU.Equals(listCPU[x].Name))
                                {
                                    idCPU1 = listCPU[x].ID;
                                    break;
                                }
                            }
                            // nếu chưa có
                            if (idCPU1 == 0)
                            {   // chưa có mà bị trùng trong database thì ghi log
                                if (!errorCPU.Equals(""))
                                {
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idpro = Convert.ToInt32(pronew.ID);
                                    newline[vitriluu] = idpro.ToString() + '-' + errorCPU + ';' + listpro[i].CPU;
                                    vitriluu++;
                                    //   break;
                                }
                                else
                                {
                                    // Lưu mới CPU và get ID mới lưu
                                    AttributeDictionary atcpu = new AttributeDictionary();
                                    atcpu.CodetypeID = "C";
                                    atcpu.Name = listpro[i].CPU;
                                    atcpu.WeightCriteraPoint = 0;
                                    db.AttributeDictionaries.Add(atcpu);
                                    db.SaveChanges();
                                    var cpunew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    idCPU1 = Convert.ToInt32(cpunew.ID);
                                    //  break;
                                }
                            }

                            //nếu List CPU là rỗng 
                            if (listCPU.Count == 0)
                            {
                                if (!errorCPU.Equals(""))
                                {
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idpro = Convert.ToInt32(pronew.ID);
                                    newline[0] = idpro.ToString() + '-' + errorCPU + ';' + listpro[i].CPU;
                                    vitriluu++;
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
                                }
                            }
                            #endregion
                            // id VGA 2
                            #region
                            // kiểm tra xem có trong database chưa có rồi thì lấy ID đã có
                            for (int x = 0; x < listVGA.Count; x++)
                            {
                                if (listpro[i].VGA.Equals(listVGA[x].Name))
                                {
                                    idVGA2 = listVGA[x].ID;
                                    break;
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
                                    newline[vitriluu] = idpro.ToString() + '-' + errorVGA + ';' + listpro[i].VGA;
                                    vitriluu++;
                                    //  break;
                                }
                                // ko trùng thì lưu VGA mới vào database và lấy ID
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
                                    // break;
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
                                    newline[vitriluu] = idpro.ToString() + '-' + errorVGA + ';' + listpro[i].VGA;
                                    vitriluu++;
                                }
                                // ko trùng thì lưu VGA mới vào database và lấy ID
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
                                }
                            }
                            #endregion
                            // id HDD 3
                            #region
                            // nếu có rồi trong database thì lấy ID ra
                            for (int x = 0; x < listHDD.Count; x++)
                            {
                                if (listpro[i].HDD.Equals(listHDD[x].Name))
                                {
                                    idHDD3 = listHDD[x].ID;
                                    break;
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
                                    newline[vitriluu] = idpro.ToString() + '-' + errorHDD + ';' + listpro[i].HDD;
                                    vitriluu++;
                                    //  break;
                                }
                                // ko trùng thì lưu HDD mới vào database và lấy ID
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
                                    // break;
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
                                    newline[vitriluu] = idpro.ToString() + '-' + errorHDD + ';' + listpro[i].HDD;
                                    vitriluu++;
                                }
                                // ko trùng thì lưu HDD mới vào database và lấy ID
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
                                }
                            }
                            #endregion
                            // id Display 4
                            #region
                            // nếu có rồi trong database thì lấy id ra
                            for (int x = 0; x < listDisplay.Count; x++)
                            {
                                if (listpro[i].Display.Equals(listDisplay[x].Name))
                                {
                                    idDisplay4 = listDisplay[x].ID;
                                    break;
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
                                        newline[vitriluu] = idpro.ToString() + '-' + errorDisplay + ';' + listpro[i].Display;
                                        vitriluu++;
                                        // break;
                                    }
                                    // ko trùng thì lưu Display mới vào database và lấy ID
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
                                        //  break;
                                    }
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
                                    newline[vitriluu] = idpro.ToString() + '-' + errorDisplay + ';' + listpro[i].Display;
                                    vitriluu++;
                                }
                                // ko trùng thì lưu Display mới vào database và lấy ID
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
                                }
                            }
                            #endregion
                            // id Ram
                            #region
                            // nếu có rồi trong database thì lấy id ra
                            for (int x = 0; x < listRam.Count; x++)
                            {
                                if (listpro[i].RAM.Equals(listRam[x].Name))
                                {
                                    idRam5 = listRam[x].ID;
                                    break;
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
                                    newline[vitriluu] = idpro.ToString() + '-' + errorRam + ';' + listpro[i].RAM;
                                    vitriluu++;
                                    // break;
                                }
                                // ko trùng thì lưu Ram mới vào database và lấy ID
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
                                    //  break;
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
                                    newline[vitriluu] = idpro.ToString() + '-' + errorRam + ';' + listpro[i].RAM;
                                    vitriluu++;
                                }
                                // ko trùng thì lưu Display mới vào database và lấy ID
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
                                atProCPU.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProCPU);
                                db.SaveChanges();
                            }
                            if (errorRam.Equals(""))
                            {
                                //2 lưu idRam vào bảng ProductAttribute
                                ProductAttribute atProRam = new ProductAttribute();
                                atProRam.AttributeID = idRam5;
                                atProRam.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProRam);
                                db.SaveChanges();
                            }
                            if (errorHDD.Equals(""))
                            {
                                //3 lưu idhdd vào bảng ProductAttribute
                                ProductAttribute atProHDD = new ProductAttribute();
                                atProHDD.AttributeID = idHDD3;
                                atProHDD.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProHDD);
                                db.SaveChanges();
                            }
                            if (errorDisplay.Equals(""))
                            {
                                //4 lưu idDisplay vào bảng ProductAttribute
                                ProductAttribute atProDisp = new ProductAttribute();
                                atProDisp.AttributeID = idDisplay4;
                                atProDisp.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProDisp);
                                db.SaveChanges();
                            }
                            if (errorVGA.Equals(""))
                            {
                                //5 lưu idvag vào bảng ProductAttribute
                                ProductAttribute atProVAG = new ProductAttribute();
                                atProVAG.AttributeID = idVGA2;
                                atProVAG.ProductID = idinsertnew;
                                db.ProductAttributes.Add(atProVAG);
                                db.SaveChanges();
                            }

                            #endregion
                        }
                    }
                    ////---------------Update lại vào txt LapDataDbTraning---------------------------------------------
                    string[] linenews = new string[listduplicate.Count];
                    // lấy txt ra
                    string path1 = Server.MapPath("~/UploadedExcelFiles/LapDataTraning.txt");
                    if (System.IO.File.Exists(path1))
                    {
                        //  linenews = System.IO.File.ReadAllLines(path1);
                        for (int i = 0; i < listduplicate.Count; i++)
                        {
                            string newline = "";
                            for (int j = 0; j < listduplicate[i].Count; j++)
                            {
                                newline += listduplicate[i][j].Name + "|" + listduplicate[i][j].Imagelink + "|" +
                                           listduplicate[i][j].CPU + "|" + listduplicate[i][j].VGA + "|" +
                                           listduplicate[i][j].HDD + "|" + listduplicate[i][j].Display + "|" +
                                           listduplicate[i][j].RAM + "#";
                            }
                            newline = newline.Substring(0, newline.Length - 1);
                            linenews[i] = newline;
                        }
                        // ghi lại vào txt
                        System.IO.File.WriteAllLines(path1, linenews);
                    }

                }
            }

            //cho vào viewbag
            ViewBag.listduplicate = (List<List<LapData>>)Session["ListdupLaptraning"];

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
                List<List<LapData>> listduplicatenew = (List<List<LapData>>)Session["LapDatadbTraning"];
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
                            #region Kiểm tra trùng link kiện không ghi lại những linh kiện trùng để ghilog txt
                            string errorCPU = "";
                            string errorVGA = "";
                            string errorHDD = "";
                            string errorDisplay = "";
                            string errorRam = "";
                            int errorCount = 0;
                            // trùng CPU 1
                            for (int x = 0; x < listCPU.Count; x++)
                            {
                                if (listduplicatenew[i][j].CPU.Equals(listCPU[x].Name))
                                {
                                    break;
                                }
                                else if (CompareStringHelper.CompareString(listduplicatenew[i][j].CPU, listCPU[x].Name) > 80)
                                {
                                    listtrunglinhkien[1] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                    errorCount++;
                                    errorCPU = listCPU[x].Name;
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
                                else if (CompareStringHelper.CompareString(listduplicatenew[i][j].VGA, listVGA[x].Name) > 80)
                                {
                                    listtrunglinhkien[2] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                    errorCount++;
                                    errorVGA = listVGA[x].Name;
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
                                else if (CompareStringHelper.CompareString(listduplicatenew[i][j].HDD, listHDD[x].Name) > 80)
                                {
                                    listtrunglinhkien[3] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                    errorCount++;
                                    errorHDD = listHDD[x].Name;
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
                                else if (CompareStringHelper.CompareString(listduplicatenew[i][j].Display, listDisplay[x].Name) > 80)
                                {
                                    listtrunglinhkien[4] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                    errorCount++;
                                    errorDisplay = listDisplay[x].Name;
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
                                else if (CompareStringHelper.CompareString(listduplicatenew[i][j].RAM, listRam[x].Name) > 80)
                                {
                                    listtrunglinhkien[5] += Convert.ToInt32(listduplicatenew[i][j].stt).ToString() + ",";
                                    errorCount++;
                                    errorRam = listRam[x].Name;
                                    break;
                                }
                            }
                            #endregion
                            //-----------------------------------------------------------------------------------------------------------------
                            //------- lưu những sản phẩm có linh kiện trùng và lưu linh kiện trùng với id sản phẩm vào logfile-----------------
                            if (errorCount > 0)
                            {
                                #region  lưu product và product alias
                                Product p = new Product();
                                p.ImageURL = listduplicatenew[i][j].Imagelink;
                                p.Price = 0;
                                p.TotalWeightPoint = 0;
                                p.IsActive = false;

                                // lưu vào database
                                db.Products.Add(p);
                                db.SaveChanges();

                                String[] mangten = listduplicatenew[i][j].Name.ToString().Split(';');
                                // nếu mảng tên >=2 thì lưu cái tên đầu tiên làm tên chính.
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
                                // nếu không thì lưu làm tên chính luôn.
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

                                // lấy max ID và thêm vào bảng alias tên phụ
                                if (mangten.Length >= 2)
                                {
                                    // lấy id của sản phẩm mới được insert vào db
                                    var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    int idinsert = Convert.ToInt32(pronew.ID);
                                    // bỏ tên đầu tiên vì lưu làm tên chính rồi lưu tên phụ
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
                                    if (listduplicatenew[i][j].CPU.Equals(listCPU[x].Name))
                                    {
                                        idCPU1 = listCPU[x].ID;
                                        break;
                                    }
                                }

                                if (idCPU1 == 0)
                                {   // nếu trùng CPU thì ghi log CPU cùng với ID product
                                    if (!errorCPU.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '-' + errorCPU + ';' + listduplicatenew[i][j].CPU;
                                        vitriluu++;
                                        break;
                                    }
                                    else
                                    {
                                        // Lưu mới CPU và get ID mới lưu
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
                                //nếu List CPU là rỗng 
                                if (listCPU.Count == 0)
                                {
                                    if (!errorCPU.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[0] = idpro.ToString() + '-' + errorCPU + ';' + listduplicatenew[i][j].CPU;
                                        vitriluu++;
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
                                    }
                                }
                                #endregion
                                // id VGA 2
                                #region
                                for (int x = 0; x < listVGA.Count; x++)
                                {
                                    if (listduplicatenew[i][j].VGA.Equals(listVGA[x].Name))
                                    {
                                        idVGA2 = listVGA[x].ID;
                                        break;
                                    }
                                }
                                if (idVGA2 == 0)
                                {
                                    // nếu VGA là trùng
                                    if (!errorVGA.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '-' + errorVGA + ';' + listduplicatenew[i][j].VGA;
                                        vitriluu++;
                                        break;
                                    }
                                    // ko trùng thì lưu VGA mới vào database và lấy ID
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
                                // nếu list VGA là rỗng
                                if (listVGA.Count == 0)
                                {
                                    // nếu VGA là trùng
                                    if (!errorVGA.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '-' + errorVGA + ';' + listduplicatenew[i][j].VGA;
                                        vitriluu++;
                                    }
                                    // ko trùng thì lưu VGA mới vào database và lấy ID
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
                                    }
                                }
                                #endregion
                                // id HDD 3
                                #region
                                for (int x = 0; x < listHDD.Count; x++)
                                {
                                    if (listduplicatenew[i][j].HDD.Equals(listHDD[x].Name))
                                    {
                                        idHDD3 = listHDD[x].ID;
                                        break;
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
                                            newline[vitriluu] = idpro.ToString() + '-' + errorHDD + ';' + listduplicatenew[i][j].HDD;
                                            vitriluu++;
                                            break;
                                        }
                                        // ko trùng thì lưu HDD mới vào database và lấy ID
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
                                }
                                // nếu list HDD là rỗng 
                                if (listHDD.Count == 0)
                                {
                                    // nếu HDD là trùng
                                    if (!errorHDD.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '-' + errorHDD + ';' + listduplicatenew[i][j].HDD;
                                        vitriluu++;
                                    }
                                    // ko trùng thì lưu HDD mới vào database và lấy ID
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
                                    }
                                }
                                #endregion
                                // id Display 4
                                #region
                                for (int x = 0; x < listDisplay.Count; x++)
                                {
                                    if (listduplicatenew[i][j].Display.Equals(listDisplay[x].Name))
                                    {
                                        idDisplay4 = listDisplay[x].ID;
                                        break;
                                    }
                                }
                                if (idDisplay4 == 0)
                                {
                                    // nếu Display là trùng
                                    if (!errorDisplay.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '-' + errorDisplay + ';' + listduplicatenew[i][j].Display;
                                        vitriluu++;
                                        break;
                                    }
                                    // ko trùng thì lưu Display mới vào database và lấy ID
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
                                // nếu list Display là rỗng
                                if (listDisplay.Count == 0)
                                {
                                    // nếu Display là trùng
                                    if (!errorDisplay.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '-' + errorDisplay + ';' + listduplicatenew[i][j].Display;
                                        vitriluu++;
                                    }
                                    // ko trùng thì lưu Display mới vào database và lấy ID
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
                                    }
                                }
                                #endregion
                                // id Ram
                                #region
                                for (int x = 0; x < listRam.Count; x++)
                                {
                                    if (listduplicatenew[i][j].RAM.Equals(listRam[x].Name))
                                    {
                                        idRam5 = listRam[x].ID;
                                        break;
                                    }
                                }
                                if (idRam5 == 0)
                                {
                                    // nếu Ram là trùng ghi log
                                    if (!errorRam.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '-' + errorRam + ';' + listduplicatenew[i][j].RAM;
                                        vitriluu++;
                                        break;
                                    }
                                    // ko trùng thì lưu Ram mới vào database và lấy ID
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

                                // nếu list Ram là rỗng 
                                if (listRam.Count == 0)
                                {
                                    // nếu Ram là trùng ghi log
                                    if (!errorRam.Equals(""))
                                    {
                                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                        int idpro = Convert.ToInt32(pronew.ID);
                                        newline[vitriluu] = idpro.ToString() + '-' + errorRam + ';' + listduplicatenew[i][j].RAM;
                                        vitriluu++;
                                    }
                                    // ko trùng thì lưu Display mới vào database và lấy ID
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
                                    atProCPU.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProCPU);
                                    db.SaveChanges();
                                }
                                if (errorRam.Equals(""))
                                {
                                    //2 lưu idRam vào bảng ProductAttribute
                                    ProductAttribute atProRam = new ProductAttribute();
                                    atProRam.AttributeID = idRam5;
                                    atProRam.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProRam);
                                    db.SaveChanges();
                                }
                                if (errorHDD.Equals(""))
                                {
                                    //3 lưu idhdd vào bảng ProductAttribute
                                    ProductAttribute atProHDD = new ProductAttribute();
                                    atProHDD.AttributeID = idHDD3;
                                    atProHDD.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProHDD);
                                    db.SaveChanges();
                                }
                                if (errorDisplay.Equals(""))
                                {
                                    //4 lưu idDisplay vào bảng ProductAttribute
                                    ProductAttribute atProDisp = new ProductAttribute();
                                    atProDisp.AttributeID = idDisplay4;
                                    atProDisp.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProDisp);
                                    db.SaveChanges();
                                }
                                if (errorVGA.Equals(""))
                                {
                                    //5 lưu idvag vào bảng ProductAttribute
                                    ProductAttribute atProVAG = new ProductAttribute();
                                    atProVAG.AttributeID = idVGA2;
                                    atProVAG.ProductID = idinsertnew;
                                    db.ProductAttributes.Add(atProVAG);
                                    db.SaveChanges();
                                }

                                #endregion
                                // thêm biến đếm số dòng lỗi được thêm vào.                   
                                listduplicatenew[i].RemoveAt(j);
                                j = j - 1;
                            }
                            if (errorCount == 0)
                            {
                                //-------------- nếu không phát hiện trùng linh kiện thì cho add mới sản phẩm ---------------------------
                                Product p = new Product();

                                p.ImageURL = listduplicatenew[i][j].Imagelink;
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
                                }
                                if (idCPU1 == 0)
                                {
                                    AttributeDictionary atcpu = new AttributeDictionary();
                                    atcpu.CodetypeID = "C";
                                    atcpu.Name = listduplicatenew[i][j].CPU;
                                    atcpu.WeightCriteraPoint = 0;
                                    db.AttributeDictionaries.Add(atcpu);
                                    db.SaveChanges();
                                    var cpunew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    idCPU1 = Convert.ToInt32(cpunew.ID);
                                }
                                // id VGA 2
                                for (int x = 0; x < listVGA.Count; x++)
                                {
                                    if (listduplicatenew[i][j].VGA.Equals(listVGA[x].Name))
                                    {
                                        idVGA2 = listVGA[x].ID;
                                        break;
                                    }
                                }
                                if (idVGA2 == 0)
                                {
                                    AttributeDictionary atvga = new AttributeDictionary();
                                    atvga.CodetypeID = "V";
                                    atvga.Name = listduplicatenew[i][j].VGA;
                                    atvga.WeightCriteraPoint = 0;
                                    db.AttributeDictionaries.Add(atvga);
                                    db.SaveChanges();
                                    var vganew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    idVGA2 = Convert.ToInt32(vganew.ID);
                                }
                                // id HDD 3
                                for (int x = 0; x < listHDD.Count; x++)
                                {
                                    if (listduplicatenew[i][j].HDD.Equals(listHDD[x].Name))
                                    {
                                        idHDD3 = listHDD[x].ID;
                                        break;
                                    }
                                }
                                if (idHDD3 == 0)
                                {
                                    AttributeDictionary athddd = new AttributeDictionary();
                                    athddd.CodetypeID = "H";
                                    athddd.Name = listduplicatenew[i][j].HDD;
                                    athddd.WeightCriteraPoint = 0;
                                    db.AttributeDictionaries.Add(athddd);
                                    db.SaveChanges();
                                    var hddnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    idHDD3 = Convert.ToInt32(hddnew.ID);
                                }
                                // id Display 4
                                for (int x = 0; x < listDisplay.Count; x++)
                                {
                                    if (listduplicatenew[i][j].Display.Equals(listDisplay[x].Name))
                                    {
                                        idDisplay4 = listDisplay[x].ID;
                                        break;
                                    }
                                }
                                if (idDisplay4 == 0)
                                {
                                    AttributeDictionary athdisp = new AttributeDictionary();
                                    athdisp.CodetypeID = "D";
                                    athdisp.Name = listduplicatenew[i][j].Display;
                                    athdisp.WeightCriteraPoint = 0;
                                    db.AttributeDictionaries.Add(athdisp);
                                    db.SaveChanges();
                                    var dispnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    idDisplay4 = Convert.ToInt32(dispnew.ID);
                                }
                                // id Ram
                                for (int x = 0; x < listRam.Count; x++)
                                {
                                    if (listduplicatenew[i][j].RAM.Equals(listRam[x].Name))
                                    {
                                        idRam5 = listRam[x].ID;
                                        break;
                                    }
                                }
                                if (idRam5 == 0)
                                {
                                    AttributeDictionary athram = new AttributeDictionary();
                                    athram.CodetypeID = "R";
                                    athram.Name = listduplicatenew[i][j].RAM;
                                    athram.WeightCriteraPoint = 0;
                                    db.AttributeDictionaries.Add(athram);
                                    db.SaveChanges();
                                    var ramnew = db.AttributeDictionaries.OrderByDescending(pro => pro.ID).FirstOrDefault();
                                    idRam5 = Convert.ToInt32(ramnew.ID);
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
                            Session["LapDatadbTraning"] = listduplicatenew;
                         //   Session["listtrunglinhkien"] = listtrunglinhkien;
                       //     Session["danhsachLaptrunglinhkien"] = danhsachLaptrunglinhkien;

                            ViewBag.listduplicatenewLap = (List<List<LapData>>)Session["LapDatadbTraning"];
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
                if (!valuesgop.Equals("nothing"))
                {
                    List<List<LapData>> listduplicatenew = (List<List<LapData>>)Session["LapDatadbTraning"];
                    String[] tachdup = valuesgop.ToString().Split('@');
                    List<String> listtrunglinhkien = (List<String>)Session["listtrunglinhkien"];
                    List<LapData> danhsachLaptrunglinhkien = (List<LapData>)Session["danhsachLaptrunglinhkien"];
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
                                String[] mangten = listduplicatenew[i][1].Name.ToString().Split(';');
                                for (int h = 0; h < mangten.Length; h++)
                                {

                                    //lấy product trong database ra kiểm tra xem có trong database chưa.
                                    List<ProductAlia> listmap = new List<ProductAlia>();
                                    var resource1 = (from x in db.ProductAlias select x);
                                    listmap = resource1.ToList();
                                    int count1 = 0;
                                    for (int r = 0; r < listmap.Count; r++)
                                    {
                                        // tên sản phẩm đã có trong database thì không lưu bỏ qua
                                        if (listmap[r].Name.Equals(mangten[h]))
                                        {
                                            count1++;
                                        }
                                    }
                                    // tên sản phẩm chưa có trong database lưu vào
                                    if (count1 == 0)
                                    {
                                        ProductAlia a = new ProductAlia();
                                        a.Name = mangten[h];
                                        a.ProductID = Convert.ToInt32(listduplicatenew[i][0].stt);
                                        a.IsMain = false;
                                        a.IsActive = true;
                                        db.ProductAlias.Add(a);
                                        db.SaveChanges();
                                        count2++;
                                    }
                                }

                            }
                            // sau khi lưu hoàn thành xóa list dup nhỏ này đi gán lại giá trị vào session.
                            if (count2 > 0)
                            {
                                listduplicatenew.RemoveAt(i);
                                Session["LapDatadbTraning"] = listduplicatenew;
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
                }
                ViewBag.listduplicatenew = (List<List<LapData>>)Session["LapDatadbTraning"];
                return View();
            }
        }
       

    }
}
