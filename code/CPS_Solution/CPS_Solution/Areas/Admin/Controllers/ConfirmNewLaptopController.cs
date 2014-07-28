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
                //AliasProduct newAli = new AliasProduct();
                //newAli.ProductID = Convert.ToInt32(newstt);
                //newAli.Name = product.Name;
                //newAli.Price = product.Price;
                //newAli.URL = product.URL;
                
                //newAli.IsMain = false;
                //newAli.IsActive = true;
                //db.AliasProducts.Add(newAli);
                //db.SaveChanges();
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

        [HttpPost]
        public string ActiveLaptop(string stringid)
        {
            int id = Convert.ToInt32(stringid);
            var laptop = db.Products.FirstOrDefault(x => x.ID == id);
            bool statusFlag = false;
            if (ModelState.IsValid)
            {
                if (laptop.IsActive.ToString().Equals(""))
                {
                    laptop.IsActive = true;
                    statusFlag = false;
                }
                else
                {
                    laptop.IsActive = true;
                    statusFlag = true;
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


