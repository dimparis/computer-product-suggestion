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
    public class ConfirmNewHardwareController : Controller
    {
        // private CPS_SolutionEntities db = new CPS_SolutionEntities();
        //
        // GET: /Admin/ConfirmNewHardware/
        CPS_SolutionEntities db = new CPS_SolutionEntities();
        public ActionResult Index()
        {
            List<HardwareConfirm> listOfHardware = loadHardwareFalse();
            ViewBag.listOfHardware = listOfHardware;
            //var approvedHardwares = db.Hardwares.Where(x => x.IsActive == true).ToList();
            //var approveListHardware = new List<SelectListItem>();

            // Load CPU list
            var cpus = db.Hardwares.Where(x => x.CodetypeID == "C" && x.IsActive == true)
                .OrderBy(x => x.Name)
                .ToList();
            var cpuList = new List<SelectListItem>();
            foreach (var cpu in cpus)
            {
                var item = new SelectListItem
                {
                    Text = cpu.Name,
                    Value = cpu.ID.ToString()
                };
                cpuList.Add(item);
            }
            ViewBag.cpuList = cpuList;

            // Load VGA list
            var vgas = db.Hardwares.Where(x => x.CodetypeID == "V" && x.IsActive == true)
                .OrderBy(x => x.Name)
                .ToList();
            var vgaList = new List<SelectListItem>();
            foreach (var vga in vgas)
            {
                var item = new SelectListItem
                {
                    Text = vga.Name,
                    Value = vga.ID.ToString()
                };
                vgaList.Add(item);
            }
            ViewBag.vgaList = vgaList;

            // Load HDD list
            var hdds = db.Hardwares.Where(x => x.CodetypeID == "H" && x.IsActive == true)
                .OrderBy(x => x.Name)
                .ToList();
            var hddList = new List<SelectListItem>();
            foreach (var hdd in hdds)
            {
                var item = new SelectListItem
                {
                    Text = hdd.Name,
                    Value = hdd.ID.ToString()
                };
                hddList.Add(item);
            }
            ViewBag.hddList = hddList;


            // Load Ram list
            var rams = db.Hardwares.Where(x => x.CodetypeID == "R" && x.IsActive == true)
                .OrderBy(x => x.Name)
                .ToList();
            var ramList = new List<SelectListItem>();
            foreach (var ram in rams)
            {
                var item = new SelectListItem
                {
                    Text = ram.Name,
                    Value = ram.ID.ToString()
                };
                ramList.Add(item);
            }
            ViewBag.ramList = ramList;

            // Load Display list
            var displays = db.Hardwares.Where(x => x.CodetypeID == "D" && x.IsActive == true)
                .OrderBy(x => x.Name)
                .ToList();
            var displayList = new List<SelectListItem>();
            foreach (var display in displays)
            {
                var item = new SelectListItem
                {
                    Text = display.Name,
                    Value = display.ID.ToString()
                };
                displayList.Add(item);
            }
            ViewBag.displayList = displayList;


            return View();
        }

        /// <summary>
        /// load lại table
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult LoadTableAjax()
        {
            List<HardwareConfirm> listOfHardware = loadHardwareFalse();
            ViewBag.listOfHardware = listOfHardware;
            //var approvedHardwares = db.Hardwares.Where(x => x.IsActive == true).ToList();
            //var approveListHardware = new List<SelectListItem>();

            // Load CPU list
            var cpus = db.Hardwares.Where(x => x.CodetypeID == "C" && x.IsActive == true)
                .OrderBy(x => x.Name)
                .ToList();
            var cpuList = new List<SelectListItem>();
            foreach (var cpu in cpus)
            {
                var item = new SelectListItem
                {
                    Text = cpu.Name,
                    Value = cpu.ID.ToString()
                };
                cpuList.Add(item);
            }
            ViewBag.cpuList = cpuList;

            // Load VGA list
            var vgas = db.Hardwares.Where(x => x.CodetypeID == "V" && x.IsActive == true)
                .OrderBy(x => x.Name)
                .ToList();
            var vgaList = new List<SelectListItem>();
            foreach (var vga in vgas)
            {
                var item = new SelectListItem
                {
                    Text = vga.Name,
                    Value = vga.ID.ToString()
                };
                vgaList.Add(item);
            }
            ViewBag.vgaList = vgaList;

            // Load HDD list
            var hdds = db.Hardwares.Where(x => x.CodetypeID == "H" && x.IsActive == true)
                .OrderBy(x => x.Name)
                .ToList();
            var hddList = new List<SelectListItem>();
            foreach (var hdd in hdds)
            {
                var item = new SelectListItem
                {
                    Text = hdd.Name,
                    Value = hdd.ID.ToString()
                };
                hddList.Add(item);
            }
            ViewBag.hddList = hddList;


            // Load Ram list
            var rams = db.Hardwares.Where(x => x.CodetypeID == "R" && x.IsActive == true)
                .OrderBy(x => x.Name)
                .ToList();
            var ramList = new List<SelectListItem>();
            foreach (var ram in rams)
            {
                var item = new SelectListItem
                {
                    Text = ram.Name,
                    Value = ram.ID.ToString()
                };
                ramList.Add(item);
            }
            ViewBag.ramList = ramList;

            // Load Display list
            var displays = db.Hardwares.Where(x => x.CodetypeID == "D" && x.IsActive == true)
                .OrderBy(x => x.Name)
                .ToList();
            var displayList = new List<SelectListItem>();
            foreach (var display in displays)
            {
                var item = new SelectListItem
                {
                    Text = display.Name,
                    Value = display.ID.ToString()
                };
                displayList.Add(item);
            }
            ViewBag.displayList = displayList;

            return View();
        }
        // Tải những phần cứng isActive null lên.
        public List<HardwareConfirm> loadHardwareFalse()
        {
            // lấy tất cả hardware có isactive là false
            var unConfrimedProducts = db.Hardwares.Where(x => x.IsActive == null).ToList();
            // lấy tất cả productatribute
            var productAttribures = db.ProductAttributes.ToList();
            HardwareConfirm newConfirm = null;
            List<HardwareConfirm> listOfHardware = new List<HardwareConfirm>();
            // cho vào list

            foreach (var item in unConfrimedProducts)
            {
                newConfirm = new HardwareConfirm
                {
                    IdHardware = item.ID,
                    CodetypeHardware = item.Codetype.Name,
                    NameHardware = item.Name,
                    WeightHardware = item.WeightCriteraPoint,
                    IdProduct = 0,
                    NameProduct = "Chưa có sản phẩm nào"
                };
                //Cho vào list Add
                listOfHardware.Add(newConfirm);
            }
            foreach (var item in listOfHardware)
            {
                foreach (var att in productAttribures)
                {
                    // id của atribute trùng thì cho vào newConfirm
                    if (att.AttributeID == item.IdHardware)
                    {
                        item.IdProduct = att.ProductID;
                        item.NameProduct = att.Product.Name;
                        //Cho vào list Add
                    }
                }

            }
            return listOfHardware;
        }

        /// <summary>
        /// Edit confirm phần cứng
        /// </summary>
        /// <param name="HardInfo"></param>
        /// <returns></returns>
        public string EditHardware(String HardInfo)
        {
            String[] info = HardInfo.ToString().Split('@');
            string stt = info[0].Trim();
            int numstt = Convert.ToInt32(stt);
            string newstt = info[1];
            string productid = info[2].Trim();
            int numProductid = Convert.ToInt32(productid);
            // những hardware mới vào chưa kích hoạt.
            var unConfrimedProducts = db.Hardwares.Where(x => x.IsActive == null).ToList();
            // tìm tới hardware có id = stt

            if (productid.Trim().Equals("0"))
            {
                var Hardware = db.Hardwares.Where(x => x.ID.Equals(numstt)).SingleOrDefault();
                Hardware.IsActive = false;
                db.SaveChanges();
                Dictionary newDic = new Dictionary();
                newDic.AttributeDicID = Convert.ToInt32(newstt);
                newDic.Name = Hardware.Name;
                newDic.IsActive = true;
            }
            else
            {
                var Hardware = db.Hardwares.Where(x => x.ID.Equals(numstt)).SingleOrDefault();
                Hardware.IsActive = false;
                string name = Hardware.Name;
                db.SaveChanges();
                Dictionary newDic = new Dictionary();
                newDic.AttributeDicID = Convert.ToInt32(newstt);
                newDic.Name = Hardware.Name;
                newDic.IsActive = true;
                db.Dictionaries.Add(newDic);
                db.SaveChanges();
                //  lấy proAttribute ra sửa
                var ProAtt = db.ProductAttributes.Where(x => x.AttributeID.Equals(numstt) && x.ProductID.Equals(numProductid)).SingleOrDefault();
                ProAtt.AttributeID = Convert.ToInt32(newstt);
                ProAtt.IsActive = true;
                db.SaveChanges();

                var ListHardware = db.Hardwares.Where(x => x.Name.Trim().Equals(name.Trim())&& x.IsActive ==null).ToList();

                foreach (Hardware hard in ListHardware)
                {
                    int id = hard.ID;
                    var ProAtt1 = db.ProductAttributes.Where(x => x.AttributeID ==id && x.IsActive!=true).SingleOrDefault();
                    if (ProAtt1 != null)
                    {
                        ProAtt1.AttributeID = Convert.ToInt32(newstt);
                        ProAtt1.IsActive = true;
                        db.SaveChanges();
                    }
                }

            }

            #region code comment
            //for (int i = 0; i < unConfrimedProducts.Count; i++)
            //{
            //    if (stt.Equals(unConfrimedProducts[i].ID.ToString()))
            //    {
            //        // trường hợp đổi tên
            //        if (Name != unConfrimedProducts[i].Name.ToString())
            //        {
            //            try
            //            {
            //                // danh sahcs hardware đã kích hoạt có code type giống như code của harware cần sửa.
            //                string test = unConfrimedProducts[i].CodetypeID;
            //                var Hardwarecorect = db.Hardwares.Where(x => x.IsActive == true && x.CodetypeID.Equals(test)).ToList();

            //                // trường hợp tên đã có trong database
            //                for (int j = 0; j < Hardwarecorect.Count; j++)
            //                {
            //                    if (Name.Equals(Hardwarecorect[j].Name.ToString()))
            //                    {
            //                        // lấy proAttribute ra sửa
            //                        var ProAtt = db.ProductAttributes.Where(x => x.AttributeID.Equals(numstt) && x.ProductID.Equals(numProductid)).SingleOrDefault();
            //                        ProAtt.AttributeID = Hardwarecorect[j].ID;
            //                        db.SaveChanges();
            //                        count++;
            //                        break;
            //                    }// trường hợp đổi tên mà thuật toán trùng phát hiện trùng >80%     
            //                    else if (CompareStringHelper.CompareString(Name, Hardwarecorect[j].Name.ToString()) >= 80)
            //                    {
            //                        List<ProductMap> duplicateProduct = new List<ProductMap>();
            //                        // lấy pro trong db ra
            //                        ProductMap pro = new ProductMap();
            //                        pro.stt = Hardwarecorect[j].ID.ToString();
            //                        pro.ten = Hardwarecorect[j].Name;
            //                        pro.loai = Hardwarecorect[j].CodetypeID;
            //                        pro.trongso = Hardwarecorect[j].WeightCriteraPoint.ToString();
            //                        duplicateProduct.Add(pro);
            //                        ProductMap pro1 = new ProductMap();
            //                        pro1.stt = stt;
            //                        pro1.ten = Name;
            //                        pro1.loai = Hardwarecorect[j].CodetypeID;
            //                        pro1.trongso = Weight;
            //                        duplicateProduct.Add(pro1);

            //                        //lấy dữ liệu trong file text traning ra ProductNameTraining;
            //                        string path = Server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
            //                        if (System.IO.File.Exists(path))
            //                        {   // lấy hết dòng trong file txt ra.
            //                            string[] lines = System.IO.File.ReadAllLines(path);
            //                            // tảo mảng mới chứa dữ dữ liệu trùng.
            //                            string[] newlines = new string[1];
            //                            string newline = productid + '~';
            //                            for (int h = 0; h < duplicateProduct.Count; h++)
            //                            {
            //                                newline += duplicateProduct[h].ten + "|" + duplicateProduct[h].loai + "|" +
            //                                           duplicateProduct[h].trongso + "|" + duplicateProduct[h].stt + "#";
            //                            }
            //                            newline = newline.Substring(0, newline.Length - 1);
            //                            newlines[0] = newline;
            //                            //Gộp hai bảng thành mảng mới và lưu vào txt lại
            //                            string[] save = new string[lines.Length + newlines.Length];
            //                            for (int h = 0; h < lines.Length; h++)
            //                            {
            //                                save[h] = lines[h];
            //                            }
            //                            for (int h = 0; h < newlines.Length; h++)
            //                            {
            //                                save[h + lines.Length] = newlines[h];
            //                            }
            //                            // ghi lại vào txt
            //                            System.IO.File.WriteAllLines(path, save);
            //                        }
            //                        // lấy proAttribute ra sửa
            //                        var ProAtt = db.ProductAttributes.Where(x => x.AttributeID.Equals(numstt) && x.ProductID.Equals(numProductid)).SingleOrDefault();
            //                        db.ProductAttributes.Remove(ProAtt);
            //                        db.SaveChanges();
            //                        count++;
            //                        break;
            //                    }

            //                }
            //            }
            //            // nếu ko có danh sách hardware trong database để so trùng
            //            catch (Exception ex)
            //            {
            //                if (count == 0)
            //                {
            //                    var Hardware = db.Hardwares.Where(x => x.ID.Equals(numstt) && x.IsActive == false).SingleOrDefault();
            //                    Hardware.Name = Name;
            //                    Hardware.WeightCriteraPoint = Convert.ToInt32(Weight);
            //                    if (isActive.Equals("true"))
            //                    {
            //                        Hardware.IsActive = true;
            //                    }
            //                    db.SaveChanges();
            //                    count++;
            //                    break;

            //                }
            //            }

            //            if (count > 0)
            //            {
            //                break;
            //            }
            //            // trường hợp đổi tên mà ko bị trùng
            //            if (count == 0)
            //            {
            //                var Hardware = db.Hardwares.Where(x => x.ID.Equals(numstt) && x.IsActive == false).SingleOrDefault();
            //                Hardware.Name = Name;
            //                Hardware.WeightCriteraPoint = Convert.ToInt32(Weight);
            //                if (isActive.Equals("true"))
            //                {
            //                    Hardware.IsActive = true;
            //                }
            //                db.SaveChanges();
            //                count++;
            //                break;

            //            }

            //        }


            //    }
            //}
            //// trường hợp không đổi tên   
            //if (count == 0)
            //{
            //    var Hardware = db.Hardwares.Where(x => x.ID.Equals(numstt) && x.IsActive == false).SingleOrDefault();
            //    Hardware.WeightCriteraPoint = Convert.ToInt32(Weight);
            //    if (isActive.Equals("true"))
            //    {
            //        Hardware.IsActive = true;
            //    }
            //    db.SaveChanges();
            //}

            //// get list product in session.         

            #endregion
            return "";
        }
        #region  code comment
        //public JsonResult AutoCompleteHardware(string term, string codetype)
        //{
        //    if (codetype == null)
        //    {
        //        codetype = "";
        //        if (term == null)
        //        {
        //            term = "";
        //        }
        //    }
        //    else
        //    {
        //        codetype = codetype.First() + "";
        //    }
        //    var result = db.Hardwares.Select(x => new { x.ID, x.Name, x.CodetypeID }).Where(x => x.Name.ToLower().Contains(term.ToLower()) && x.CodetypeID == codetype).Distinct();
        //    int count = result.Count();
        //    return Json(result, JsonRequestBehavior.AllowGet);
        //}
        #endregion

        
             [HttpPost]
        public string HuyboHard(string stringid)
        {
            int id = Convert.ToInt32(stringid);
            var hardware = db.Hardwares.FirstOrDefault(x => x.ID == id && x.IsActive == null);
            var ProAtt = db.ProductAttributes.Where(x => x.AttributeID == id).ToList();

            if (ProAtt != null)
            {
                foreach(ProductAttribute pro in ProAtt)
                {
                    pro.IsActive = null;
                }
            }

            if (hardware.IsActive == null)
            {

                hardware.IsActive = false;

                db.SaveChanges();



            }
            // Display the confirmation message       
            return "";
        }

        [HttpPost]
        public string ActiveHardware(string stringid)
        {
            int id = Convert.ToInt32(stringid);
            var hardware = db.Hardwares.FirstOrDefault(x => x.ID == id && x.IsActive == null);
            var ProAtt = db.ProductAttributes.Where(x => x.AttributeID == id).ToList();

            if (ProAtt != null)
            {
                foreach(ProductAttribute pro in ProAtt)
                {
                    pro.IsActive = true;
                }
            }

            if (hardware.IsActive == null)
            {

                hardware.IsActive = true;

                db.SaveChanges();



            }
            // Display the confirmation message       
            return "";
        }
    }
}
