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
            string path = Server.MapPath("~/UploadedExcelFiles/ErrorLap.txt");
           List<LapData> ListerrorTraning = new List<LapData>();
          
            if (System.IO.File.Exists(path))
            {
                int h = 0;
                string[] lines = System.IO.File.ReadAllLines(path);
                for (int i = 0; i < lines.Length; i++)
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
                    ListerrorTraning.Add(p);
                }
            }
            List<LapData> errorlist = new List<LapData>();
            // quá nhiều lỗi
            List<String> errorLine = new List<String>();
            // list dòng lỗi 1 Name, 2 Linkimage, 3 Display, 4 CPU, 5 HDD, 6 VGA, 7 Ram
            for (int i = 0; i < 8; i++)
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
                int anh1 = ListerrorTraning[i].Imagelink.IndexOf(".jpg");
                int anh2 = ListerrorTraning[i].Imagelink.IndexOf(".png");
                Uri myUri;
                if (!Uri.TryCreate(ListerrorTraning[i].Imagelink, UriKind.RelativeOrAbsolute, out myUri) || (anh1 + anh1 < 0))
                {
                    errorLine[2] += (Convert.ToInt32(ListerrorTraning[i].stt) + 2).ToString() + ",";
                    loi++;
                    count++;
                }
                // dòng lỗi Display
                if (ListerrorTraning[i].Display.Length < 5 || ListerrorTraning[i].Display.Length > 100)
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
                int distance;
                if (!int.TryParse(ListerrorTraning[i].HDD, out distance))
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
                int distance1;
                if (!int.TryParse(ListerrorTraning[i].RAM, out distance1))
                {
                    errorLine[7] += (Convert.ToInt32(ListerrorTraning[i].stt) + 2).ToString() + ",";
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
            ViewBag.errorLineLap1 = Session["errorLineLap1"];
            ViewBag.ListerrorTraning = (List<LapData>)Session["ListerrorTraning"];
            return View();
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
                List<LapData> listerror = (List<LapData>)Session["ListerrorTraning"];
                // số sản phẩm lỗi trước khi được test
                int count1 = listerror.Count;
                List<List<LapData>> listduplicate = (List<List<LapData>>)Session["listduplicateLap"];
                String[] info = stringpro.ToString().Split('@');
                string stt = info[0]
                    ;
                string Name = info[1];
                string ImageLink = info[2];
                string CPU = info[3];
                string VGA = info[4];
                string HDD = info[5];
                string Display = info[6];
                string Ram = info[7];
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
                    newlisterror1.Remove(delpro);
                    Session["ListerrorTraning"] = newlisterror1;
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
                  
                    //----------------------------- kiểm tra sản phẩm trong listpro có bị trùng linh kiện ko---------------------------
                    #region Lấy CPU VGA HDD Display Ram cho vào danh sách riêng để kiểm tra trùng linh kiện
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
                        if (update.CPU.Equals(listCPU[x].Name))
                        {
                            break;
                        }
                        else if (CompareStringHelper.CompareString(update.CPU, listCPU[x].Name) >= 80)
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
                        if (update.VGA.Equals(listVGA[x].Name))
                        {
                            break;
                        }
                        else if (CompareStringHelper.CompareString(update.VGA, listVGA[x].Name) >= 80)
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
                        if (update.HDD.Equals(listHDD[x].Name))
                        {
                            break;
                        }
                        else if (CompareStringHelper.CompareString(update.HDD, listHDD[x].Name) >= 80)
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
                        if (update.Display.Equals(listDisplay[x].Name))
                        {
                            break;
                        }
                        else if (CompareStringHelper.CompareString(update.Display, listDisplay[x].Name) >= 80)
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
                        if (update.RAM.Equals(listRam[x].Name))
                        {
                            break;
                        }
                        else if (CompareStringHelper.CompareString(update.RAM, listRam[x].Name) >= 80)
                        {
                            // listtrunglinhkien[5] += Convert.ToInt32(listpro[i].stt).ToString() + ",";
                            errorCount++;
                            errorRam = listRam[x].Name;
                            break;
                        }
                    }
                    #endregion
                    #region  lưu product và product alias
                    Product pro1 = new Product();
                    pro1.ImageURL = update.Imagelink;
                    pro1.Price = 0;
                    pro1.TotalWeightPoint = 0;
                    pro1.IsActive = false;

                    // lưu vào database
                    db.Products.Add(pro1);
                    db.SaveChanges();

                    String[] mangten = update.Name.ToString().Split(';');
                    // nếu mảng tên >=2 thì lưu cái tên đầu tiên làm tên chính.
                    if (mangten.Length >= 2)
                    {
                        var pronew = db.Products.OrderByDescending(pro => pro.ID).FirstOrDefault();
                        int idinsert = Convert.ToInt32(pronew.ID);
                        AliasProduct proAli = new AliasProduct();
                        proAli.Name = mangten[0];
                        proAli.ProductID = idinsert;
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
                        if (update.CPU.Equals(listCPU[x].Name))
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
                            newline[vitriluu] = idpro.ToString() + '-' + errorCPU + ';' + update.CPU;
                            vitriluu++;
                            //   break;
                        }
                        else
                        {
                            // Lưu mới CPU và get ID mới lưu
                            Hardware atcpu = new Hardware();
                            atcpu.CodetypeID = "C";
                            atcpu.Name = update.CPU;
                            atcpu.WeightCriteraPoint = 0;
                            db.Hardwares.Add(atcpu);
                            db.SaveChanges();
                            var cpunew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
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
                            newline[0] = idpro.ToString() + '-' + errorCPU + ';' + update.CPU;
                            vitriluu++;
                        }
                        else
                        {
                            Hardware atcpu = new Hardware();
                            atcpu.CodetypeID = "C";
                            atcpu.Name = update.CPU;
                            atcpu.WeightCriteraPoint = 0;
                            db.Hardwares.Add(atcpu);
                            db.SaveChanges();
                            var cpunew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idCPU1 = Convert.ToInt32(cpunew.ID);
                        }
                    }
                    #endregion
                    // id VGA 2
                    #region
                    // kiểm tra xem có trong database chưa có rồi thì lấy ID đã có
                    for (int x = 0; x < listVGA.Count; x++)
                    {
                        if (update.VGA.Equals(listVGA[x].Name))
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
                            newline[vitriluu] = idpro.ToString() + '-' + errorVGA + ';' + update.VGA;
                            vitriluu++;
                            //  break;
                        }
                        // ko trùng thì lưu VGA mới vào database và lấy ID
                        else
                        {

                            Hardware atvga = new Hardware();
                            atvga.CodetypeID = "V";
                            atvga.Name = update.VGA;
                            atvga.WeightCriteraPoint = 0;
                            db.Hardwares.Add(atvga);
                            db.SaveChanges();
                            var vganew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
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
                            newline[vitriluu] = idpro.ToString() + '-' + errorVGA + ';' + update.VGA;
                            vitriluu++;
                        }
                        // ko trùng thì lưu VGA mới vào database và lấy ID
                        else
                        {
                            Hardware atvga = new Hardware();
                            atvga.CodetypeID = "V";
                            atvga.Name = update.VGA;
                            atvga.WeightCriteraPoint = 0;
                            db.Hardwares.Add(atvga);
                            db.SaveChanges();
                            var vganew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idVGA2 = Convert.ToInt32(vganew.ID);
                        }
                    }
                    #endregion
                    // id HDD 3
                    #region
                    // nếu có rồi trong database thì lấy ID ra
                    for (int x = 0; x < listHDD.Count; x++)
                    {
                        if (update.HDD.Equals(listHDD[x].Name))
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
                            newline[vitriluu] = idpro.ToString() + '-' + errorHDD + ';' + update.HDD;
                            vitriluu++;
                            //  break;
                        }
                        // ko trùng thì lưu HDD mới vào database và lấy ID
                        else
                        {
                            Hardware athddd = new Hardware();
                            athddd.CodetypeID = "H";
                            athddd.Name = update.HDD;
                            athddd.WeightCriteraPoint = 0;
                            db.Hardwares.Add(athddd);
                            db.SaveChanges();
                            var hddnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
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
                            newline[vitriluu] = idpro.ToString() + '-' + errorHDD + ';' + update.HDD;
                            vitriluu++;
                        }
                        // ko trùng thì lưu HDD mới vào database và lấy ID
                        else
                        {
                            Hardware athddd = new Hardware();
                            athddd.CodetypeID = "H";
                            athddd.Name = update.HDD;
                            athddd.WeightCriteraPoint = 0;
                            db.Hardwares.Add(athddd);
                            db.SaveChanges();
                            var hddnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idHDD3 = Convert.ToInt32(hddnew.ID);
                        }
                    }
                    #endregion
                    // id Display 4
                    #region
                    // nếu có rồi trong database thì lấy id ra
                    for (int x = 0; x < listDisplay.Count; x++)
                    {
                        if (update.Display.Equals(listDisplay[x].Name))
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
                                newline[vitriluu] = idpro.ToString() + '-' + errorDisplay + ';' + update.Display;
                                vitriluu++;
                                // break;
                            }
                            // ko trùng thì lưu Display mới vào database và lấy ID
                            else
                            {
                                Hardware athdisp = new Hardware();
                                athdisp.CodetypeID = "D";
                                athdisp.Name = update.Display;
                                athdisp.WeightCriteraPoint = 0;
                                db.Hardwares.Add(athdisp);
                                db.SaveChanges();
                                var dispnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
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
                            newline[vitriluu] = idpro.ToString() + '-' + errorDisplay + ';' + update.Display;
                            vitriluu++;
                        }
                        // ko trùng thì lưu Display mới vào database và lấy ID
                        else
                        {
                            Hardware athdisp = new Hardware();
                            athdisp.CodetypeID = "D";
                            athdisp.Name = update.Display;
                            athdisp.WeightCriteraPoint = 0;
                            db.Hardwares.Add(athdisp);
                            db.SaveChanges();
                            var dispnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
                            idDisplay4 = Convert.ToInt32(dispnew.ID);
                        }
                    }
                    #endregion
                    // id Ram
                    #region
                    // nếu có rồi trong database thì lấy id ra
                    for (int x = 0; x < listRam.Count; x++)
                    {
                        if (update.RAM.Equals(listRam[x].Name))
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
                            newline[vitriluu] = idpro.ToString() + '-' + errorRam + ';' + update.RAM;
                            vitriluu++;
                            // break;
                        }
                        // ko trùng thì lưu Ram mới vào database và lấy ID
                        else
                        {
                            Hardware athram = new Hardware();
                            athram.CodetypeID = "R";
                            athram.Name = update.RAM;
                            athram.WeightCriteraPoint = 0;
                            db.Hardwares.Add(athram);
                            db.SaveChanges();
                            var ramnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
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
                            newline[vitriluu] = idpro.ToString() + '-' + errorRam + ';' + update.RAM;
                            vitriluu++;
                        }
                        // ko trùng thì lưu Display mới vào database và lấy ID
                        else
                        {
                            Hardware athram = new Hardware();
                            athram.CodetypeID = "R";
                            athram.Name = update.RAM;
                            athram.WeightCriteraPoint = 0;
                            db.Hardwares.Add(athram);
                            db.SaveChanges();
                            var ramnew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
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
                // update listerrorLap
                if ((count1 - count2) == 0)
                {
                    Session["ListerrorTraning"] = newlisterror1;
                }

            }

            ViewBag.ListerrorTraning = (List<LapData>)Session["ListerrorTraning"];
            // quá nhiều lỗi hiện thị ra dòng và sản phẩm bị lỗi.
            ViewBag.danhsachlaploi = (List<LapData>)Session["danhsachlaploi"];
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
                int anh1 = list[i].Imagelink.IndexOf(".jpg");
                int anh2 = list[i].Imagelink.IndexOf(".png");
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
            Session["errorLineLap1"] = errorLine;
            return errorlist;
        }
        ///// <summary>
        ///// Tách sản phẩm khi so trùng trong database
        ///// </summary>
        ///// <returns></returns>
        //public ActionResult tachdatabase(String valuestach)
        //{
        //    List<List<ProductMap>> listduplicatenew = (List<List<ProductMap>>)Session["Listduptraning"];
        //    String[] tachdup = valuestach.ToString().Split('@');
        //    int dem = 0;
        //    // duyệt hết list duplicate lớn
        //    for (int i = 0; i < listduplicatenew.Count; i++)
        //    {
        //        // duyệt từng listduplicate nhỏ 
        //        for (int j = 0; j < listduplicatenew[i].Count; j++)
        //        {
        //            // nếu phát hiện list nào có chứa giá trị tách trả về
        //            if (tachdup[1].Equals(listduplicatenew[i][j].stt))
        //            {

        //                Hardware p = new Hardware();

        //                String[] mangten = listduplicatenew[i][1].ten.ToString().Split(';');
        //                if (mangten.Length >= 2)
        //                {
        //                    p.Name = mangten[0];
        //                }
        //                else
        //                {
        //                    p.Name = listduplicatenew[i][1].ten;
        //                }

        //                //lấy product trong database ra chỉ lấy Codetype bằng loai kiểm tra xem có trong database chưa @@.
        //                List<Hardware> listproindatabase = new List<Hardware>();
        //                String loai = listduplicatenew[i][1].loai;
        //                var resource = (from x in db.Hardwares where x.CodetypeID.Equals(loai) select x);
        //                listproindatabase = resource.ToList();
        //                int count = 0;
        //                for (int t = 0; t < listproindatabase.Count; t++)
        //                {
        //                    if (listproindatabase[t].Name.Equals(p.Name))
        //                    {
        //                        count++;
        //                    }
        //                }

        //                if (count > 0)
        //                {
        //                    listduplicatenew.RemoveAt(i);
        //                    Session["Listduptraning"] = listduplicatenew;
        //                    dem++;
        //                    break;
        //                }


        //                var LCodeType = (from c in db.Codetypes select c);

        //                List<Codetype> Listcodetype = LCodeType.ToList();

        //                foreach (Codetype codety in Listcodetype)
        //                {
        //                    codety.Name.Equals(listduplicatenew[i][1].loai);
        //                    p.CodetypeID = codety.ID;
        //                    break;
        //                }
        //                p.WeightCriteraPoint = Convert.ToInt32(listduplicatenew[i][1].trongso);
        //                db.Hardwares.Add(p);
        //                db.SaveChanges();
        //                // lấy max ID và thêm vào bảng alias
        //                if (mangten.Length >= 2)
        //                {
        //                    var pronew = db.Hardwares.OrderByDescending(pro => pro.ID).FirstOrDefault();
        //                    int idinsert = Convert.ToInt32(pronew.ID);

        //                    for (int h = 1; h < mangten.Length; h++)
        //                    {

        //                        //lấy product trong database ra chỉ lấy Codetype bằng loai kiểm tra xem có trong database chưa @@.
        //                        List<Dictionary> listmap = new List<Dictionary>();
        //                        var resource1 = (from x in db.Dictionaries select x);
        //                        listmap = resource1.ToList();
        //                        int count1 = 0;
        //                        for (int r = 0; r < listmap.Count; r++)
        //                        {
        //                            if (listmap[r].Name.Equals(mangten[h]))
        //                            {
        //                                count1++;
        //                            }
        //                        }
        //                        if (count1 > 0)
        //                        {
        //                            break;
        //                        }

        //                        for (int t = 0; t < listproindatabase.Count; t++)
        //                        {
        //                            if (listproindatabase[t].Name.Equals(p.Name))
        //                            {
        //                                count++;
        //                            }
        //                        }
        //                        Dictionary a = new Dictionary();
        //                        a.Name = mangten[h];
        //                        a.AttributeDicID = idinsert;
        //                        db.Dictionaries.Add(a);
        //                        db.SaveChanges();
        //                    }

        //                }
        //                listduplicatenew.RemoveAt(i);
        //                Session["Listduptraning"] = listduplicatenew;
        //                break;
        //            }
        //        }
        //        if(dem > 0)
        //        {
        //            break;
        //        }
        //    }
        //    // ghi lại vào txt
        //    string path = Server.MapPath("~/UploadedExcelFiles/ProductName.txt");
        //    listduplicatenew = (List<List<ProductMap>>)Session["Listduptraning"];
        //    string[] lines = new string[listduplicatenew.Count];
        //    for (int i = 0; i < listduplicatenew.Count; i++)
        //    {
        //        string line = "";
        //        for (int j = 0; j < listduplicatenew[i].Count; j++)
        //        {
        //            line += listduplicatenew[i][j].ten + ";";
        //        }
        //        line = line.Substring(0, line.Length - 1);
        //        lines[i] = line;

        //    }
        //     System.IO.File.WriteAllLines(path, lines);
        //    ViewBag.Listduptraning = (List<List<ProductMap>>)Session["Listduptraning"];
        //    return View();
        //}
        ///// <summary>
        ///// Gộp sản phẩm khi so trùng trong database
        ///// </summary>
        ///// <returns></returns>
        //public ActionResult gopdatabase(String valuesgop)
        //{
        //    List<List<ProductMap>> listduplicatenew = (List<List<ProductMap>>)Session["Listduptraning"];
        //    String[] tachdup = valuesgop.ToString().Split('@');
        //    int count = 0;
        //    // duyệt hết list duplicate lớn
        //    for (int i = 0; i < listduplicatenew.Count; i++)
        //    {
        //        // duyệt từng listduplicate nhỏ 
        //        for (int j = 0; j < listduplicatenew[i].Count; j++)
        //        {
        //            // nếu phát hiện list nào có chứa giá trị tách trả về
        //            if (tachdup[1].Equals(listduplicatenew[i][j].stt))
        //            {
                       
        //                Hardware p = new Hardware();

        //                String[] mangten = listduplicatenew[i][1].ten.ToString().Split(';');


        //                for (int h = 0; h < mangten.Length; h++)
        //                {

        //                    //lấy product trong database ra kiểm tra xem có trong database chưa.
        //                    List<Dictionary> listmap = new List<Dictionary>();
        //                    var resource1 = (from x in db.Dictionaries select x);
        //                    listmap = resource1.ToList();
        //                    int count1 = 0;
        //                    for (int r = 0; r < listmap.Count; r++)
        //                    {
        //                        if (listmap[r].Name.Equals(mangten[h]))
        //                        {
        //                            count1++;
        //                        }
        //                    }
        //                    if (count1 > 0)
        //                    {
        //                        break;
        //                    }

        //                    Dictionary a = new Dictionary();
        //                    a.Name = mangten[h];
        //                    a.AttributeDicID = Convert.ToInt32(listduplicatenew[i][0].stt);
        //                    a.IsActive = true;
        //                    db.Dictionaries.Add(a);
        //                    db.SaveChanges();
        //                    listduplicatenew.RemoveAt(i);
        //                    i = i - 1;
        //                    count++;
        //                    break;
        //                }
                       
        //            }
        //            if (count > 1)
        //            {
                       
        //                break;
        //            }
                    
        //            Session["Listduptraning"] = listduplicatenew;
                   
        //        }

        //    }

        //    // ghi lại vào txt
        //    string path = Server.MapPath("~/UploadedExcelFiles/ProductName.txt");

        //    listduplicatenew = (List<List<ProductMap>>)Session["Listduptraning"];
        //    string[] lines = new string[listduplicatenew.Count];
        //    for (int i = 0; i < listduplicatenew.Count; i++)
        //    {
        //        string line = "";
        //        for (int j = 0; j < listduplicatenew[i].Count; j++)
        //        {
        //            line += listduplicatenew[i][j].ten + ";";
        //        }
        //        line = line.Substring(0, line.Length - 1);
        //        lines[i] = line;

        //    }

        //    System.IO.File.WriteAllLines(path, lines);
        //    ViewBag.Listduptraning = (List<List<ProductMap>>)Session["Listduptraning"];
        //    return View();
        //}
    }
}
