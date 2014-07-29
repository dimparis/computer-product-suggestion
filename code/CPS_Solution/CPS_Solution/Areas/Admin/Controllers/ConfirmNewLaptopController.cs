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
    public class ConfirmNewLaptopController : Controller
    {
        //
        // GET: /Admin/ConfirmNewLaptop/
        CPS_SolutionEntities db = new CPS_SolutionEntities();
        public ActionResult Index()
        {
            List<Product> listproconfirm = ProductNotConfirm();
            ViewBag.listproconfirm = listproconfirm;
            List<Hardware> ListHardWarePro = new List<Hardware>();
            #region lấy hết những hardware của các product chưa confirm có isactive = true
         
            List<int> listid = new List<int>();
            foreach (Product p in listproconfirm)
            {
                if (p.CpuID != 0)
                {
                    listid.Add(p.CpuID);
                }
                if (p.VgaID != 0)
                {
                    listid.Add(p.VgaID);
                }
                if (p.HddID != 0)
                {
                    listid.Add(p.HddID);
                }
                if (p.RamID != 0)
                {
                    listid.Add(p.RamID);
                }
                if (p.DisplayID !=0)
                {
                    listid.Add(p.DisplayID);
                }
            }
            // lấy list hardware của các sản phẩm có isactive = true;
            foreach (int id in listid)
            {
                var HardwareSign = db.Hardwares.Where(x => x.ID == id && x.IsActive == true).SingleOrDefault();
                if (HardwareSign != null)
                {
                    ListHardWarePro.Add(HardwareSign);
                }
            }
            #endregion
            ViewBag.ListHardWareProActive = ListHardWarePro;
            // Giá trị mặc định không chọn gì cả
            var itemdefault = new SelectListItem
            {
                Text = "Không chọn",
                Value = "0"
            };
          
            // lấy product có isactive = true để autocomplete
            var ProductTrue = db.Products.Where(x => x.IsActive == true).ToList();
            var ProductList = new List<SelectListItem>();
            ProductList.Add(itemdefault);
            foreach (var pro in ProductTrue)
            {
                var item = new SelectListItem
                {
                    Text = pro.Name,
                    Value = pro.ID.ToString()
                };
                ProductList.Add(item);
            }
            ViewBag.ProductList = ProductList;

          
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
        public List<Product> ProductNotConfirm()
        {
            // lấy tất cả hardware có isactive là null lên để confirm
            var ProductNotConfirm = db.Products.Where(x => x.IsActive == null).ToList();                   
            return ProductNotConfirm;
        }


        public ActionResult LoadTableAjax()
        {
            List<Product> listproconfirm = ProductNotConfirm();
            ViewBag.listproconfirm = listproconfirm;
            // lấy product có isactive = true để autocomplete
            var ProductTrue = db.Products.Where(x => x.IsActive == true).ToList();
            var ProductList = new List<SelectListItem>();
            foreach (var pro in ProductTrue)
            {
                var item = new SelectListItem
                {
                    Text = pro.Name,
                    Value = pro.ID.ToString()
                };
                ProductList.Add(item);
            }
            ViewBag.ProductList = ProductList;

            return View();
        }
        public string MappingLaptop(String HardInfo)
        {
            String[] info = HardInfo.ToString().Split('@');
            string stt = info[0].Trim();
            int numstt = Convert.ToInt32(stt);
            string newstt = info[1];

            // Trường hợp mapping
            if (!newstt.Trim().Equals("0"))
            {
                // những hardware mới vào chưa kích hoạt.
                var unConfrimedProducts = db.Hardwares.Where(x => x.IsActive == null).ToList();
                // tìm tới hardware có id = stt

                var product = db.Products.Where(x => x.ID.Equals(numstt)).SingleOrDefault();
                product.IsActive = false;
                db.SaveChanges();
                int id = product.ID;
                var aliasPro = db.AliasProducts.Where(x => x.ProductID.Equals(id)).ToList();

                foreach (AliasProduct ali in aliasPro)
                {
                    ali.ProductID = Convert.ToInt32(newstt);
                    db.SaveChanges();
                }
            }
            // trường hợp kích hoạt cả product cả hardware.
            else
            {
                for (int i = 2; i < info.Length; i++)
                {
                    String[] list = info[i].ToString().Split('|');
                    int numstt1 = Convert.ToInt32(list[0]);
                    string newstt1 = list[1];
                    string productid1 = stt;
                    int numProductid = Convert.ToInt32(stt);
                    // nếu không chọn hardware để map thì active nó 
                    if (newstt1.Trim().Equals("0"))
                    {
                        int id = Convert.ToInt32(list[0]);
                        var hardware = db.Hardwares.FirstOrDefault(x => x.ID == id && x.IsActive == null);

                        // khi active thì tìm tất cả các sản phẩm có tên tương tự để kích hoạt trong bảng product atribute.
                        var ProAtt = db.ProductAttributes.Where(x => x.AttributeID == id).ToList();
                        if (ProAtt != null)
                        {
                            foreach (ProductAttribute pro in ProAtt)
                            {
                                pro.IsActive = true;
                            }
                        }
                        if (hardware != null)
                        {
                            if (hardware.IsActive == null)
                            {
                                hardware.IsActive = true;
                                db.SaveChanges();
                            }
                        }
                    }
                    // trường hợp staff mapping với 1 sản phẩm có sẵn
                    else
                    {
                        // những hardware mới vào chưa kích hoạt.
                        var unConfrimedProducts = db.Hardwares.Where(x => x.IsActive == null).ToList();
                        // tìm tới hardware có id = stt

                        if (productid1.Trim().Equals("0"))
                        {
                            var Hardware = db.Hardwares.Where(x => x.ID.Equals(numstt1)).SingleOrDefault();
                            Hardware.IsActive = false;
                            db.SaveChanges();
                            Dictionary newDic = new Dictionary();
                            newDic.AttributeDicID = Convert.ToInt32(newstt1);
                            newDic.Name = Hardware.Name;
                            newDic.IsActive = true;
                        }
                        else
                        {
                            var Hardware = db.Hardwares.Where(x => x.ID.Equals(numstt1)).SingleOrDefault();
                            Hardware.IsActive = false;
                            string name = Hardware.Name;
                            db.SaveChanges();
                            Dictionary newDic = new Dictionary();
                            newDic.AttributeDicID = Convert.ToInt32(newstt1);
                            newDic.Name = Hardware.Name;
                            newDic.IsActive = true;
                            db.Dictionaries.Add(newDic);
                            db.SaveChanges();
                            //  lấy proAttribute ra sửa
                            var ProAtt = db.ProductAttributes.Where(x => x.AttributeID.Equals(numstt1) && x.ProductID.Equals(numProductid)).SingleOrDefault();
                            ProAtt.AttributeID = Convert.ToInt32(newstt1);
                            ProAtt.IsActive = true;
                            db.SaveChanges();

                            var ListHardware = db.Hardwares.Where(x => x.Name.Trim().Equals(name.Trim()) && x.IsActive == null).ToList();

                            foreach (Hardware hard in ListHardware)
                            {
                                int id = hard.ID;
                                var ProAtt1 = db.ProductAttributes.Where(x => x.AttributeID == id && x.IsActive != true).SingleOrDefault();
                                if (ProAtt1 != null)
                                {
                                    ProAtt1.AttributeID = Convert.ToInt32(newstt1);
                                    ProAtt1.IsActive = true;
                                    db.SaveChanges();
                                }
                            }

                        }
                    }
                }


               int id1 = Convert.ToInt32(stt);
               var laptop = db.Products.FirstOrDefault(x => x.ID == id1);               
               laptop.IsActive = true;
               db.SaveChanges();
            }
            return "";
        }

        [HttpPost]
        public string ActiveLaptop(string stringid)
        {
            int id = Convert.ToInt32(stringid);
            var laptop = db.Products.FirstOrDefault(x => x.ID == id);

            if (ModelState.IsValid)
            {
                if (laptop.IsActive.ToString().Equals(""))
                {
                    laptop.IsActive = true;
 
                }
                else
                {
                    laptop.IsActive = true;

                }
                db.SaveChanges();
            }
            // Display the confirmation message       
            return "";
        }

         [HttpPost]
        public string HuyLaptop(string stringid)
        {
            int id = Convert.ToInt32(stringid);
            var laptop = db.Products.FirstOrDefault(x => x.ID == id);

            if (ModelState.IsValid)
            {
                if (laptop.IsActive == null)
                {
                    laptop.IsActive = false;
                    db.SaveChanges();
                }              
              
            }
            // Display the confirmation message       
            return "";
        }
        
    }
}


