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


            var itemdefault = new SelectListItem
            {
                Text = "Không chọn",
                Value = "0"
            };

            // Load CPU list
            var cpus = db.Hardwares.Where(x => x.CodetypeID == "C" && x.IsActive == true)
                .OrderBy(x => x.Name)
                .ToList();
            var cpuList = new List<SelectListItem>();
            cpuList.Add(itemdefault);
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
            vgaList.Add(itemdefault);
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
            hddList.Add(itemdefault);
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
            ramList.Add(itemdefault);
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
            displayList.Add(itemdefault);
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

            // default nếu không chọn
            var itemdefault = new SelectListItem
            {
                Text = "Không chọn",
                Value = "0"
            };

            // Load CPU list
            var cpus = db.Hardwares.Where(x => x.CodetypeID == "C" && x.IsActive == true)
                .OrderBy(x => x.Name)
                .ToList();
            var cpuList = new List<SelectListItem>();
            cpuList.Add(itemdefault);
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
            vgaList.Add(itemdefault);
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
            hddList.Add(itemdefault);
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
            ramList.Add(itemdefault);
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
            displayList.Add(itemdefault);
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
            string newName = info[3].Trim();
            int numProductid = Convert.ToInt32(productid);
            // nếu không chọn hardware để map thì active nó 
            if (newstt.Trim().Equals("0"))
            {
                int id = Convert.ToInt32(stt);
                var hardware = db.Hardwares.FirstOrDefault(x => x.ID == id && x.IsActive == null);
                hardware.Name = newName.Trim();

                string Codetype = hardware.CodetypeID;
                // lấy những hardware có codetype = true ra nếu tên mới trùng thì lấy id của cái có sẵn để thay vào attribute với sản phẩm
                var DictionaryHardTrue = db.Dictionaries.Where(x => x.Hardware.IsActive == true && x.Hardware.CodetypeID.Equals(Codetype)).ToList();
                int hardtrueid = 0;
                foreach (Dictionary d in DictionaryHardTrue)
                {
                    if(d.Name.Trim().Equals(newName.Trim()))
                    {
                        // lấy id của hardware true có sẵn trong db.
                        hardtrueid = d.Hardware.ID;

                        var ProAtt = db.ProductAttributes.Where(x => x.AttributeID == id).ToList();
                        if (ProAtt != null)
                        {
                            foreach (ProductAttribute pro in ProAtt)
                            {
                                pro.AttributeID = hardtrueid;
                                pro.IsActive = true;
                              
                            }

                        }
                        db.SaveChanges();
                    }
                }

                if (hardtrueid == 0)
                {
                    // khi active thì tìm tất cả các sản phẩm có tên tương tự để kích hoạt trong bảng product atribute.
                    var ProAtt = db.ProductAttributes.Where(x => x.AttributeID == id).ToList();
                    if (ProAtt != null)
                    {
                        foreach (ProductAttribute pro in ProAtt)
                        {
                            pro.IsActive = true;                        
                        }
                    }
                    if (hardware.IsActive == null)
                    {

                        hardware.IsActive = true;
                    }
                    db.SaveChanges();
                }
            }
                // trường hợp staff mapping với 1 sản phẩm có sẵn
            else
            {
                // những hardware mới vào chưa kích hoạt.
                var unConfrimedProducts = db.Hardwares.Where(x => x.IsActive == null).ToList();
                // tìm tới hardware có id = stt

                if (productid.Trim().Equals("0"))
                {
                    var Hardware = db.Hardwares.Where(x => x.ID.Equals(numstt)).SingleOrDefault();
                    Hardware.Name = newName;
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
                    Hardware.Name = newName;
                    db.SaveChanges();
                    string name = Hardware.Name;
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
                    var ListHardware = db.Hardwares.Where(x => x.Name.Trim().Equals(name.Trim()) && x.IsActive == null).ToList();
                    foreach (Hardware hard in ListHardware)
                    {
                        int id = hard.ID;
                        var ProAtt1 = db.ProductAttributes.Where(x => x.AttributeID == id && x.IsActive != true).SingleOrDefault();
                        if (ProAtt1 != null)
                        {
                            ProAtt1.AttributeID = Convert.ToInt32(newstt);
                            ProAtt1.IsActive = true;
                            db.SaveChanges();
                        }
                    }

                }
            }
            return "";
        }
        #region  code comment JsonResult
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
            try
            {
                int id = Convert.ToInt32(stringid);
                var hardware = db.Hardwares.FirstOrDefault(x => x.ID == id && x.IsActive == null);
                var ProAtt = db.ProductAttributes.Where(x => x.AttributeID == id).ToList();

                if (ProAtt != null)
                {
                    foreach (ProductAttribute pro in ProAtt)
                    {
                        pro.IsActive = null;
                    }
                }

                if (hardware.IsActive == null)
                {

                    hardware.IsActive = false;

                    db.SaveChanges();



                }
            }catch(Exception ex)
            {
            }
            // Display the confirmation message       
            return "";
        }

        [HttpPost]
        public string ActiveHardware(string stringid)
        {
           
            // Display the confirmation message       
            return "";
        }
    }
}
