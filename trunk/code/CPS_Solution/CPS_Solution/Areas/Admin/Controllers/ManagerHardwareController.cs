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
using System.Net;
using CPS_Solution.CommonClass;


namespace CPS_Solution.Areas.Admin.Controllers
{
    public class ManagerHardwareController : Controller
    {
        //
        // GET: /Admin/ManagerHardware/

        CPS_SolutionEntities db = new CPS_SolutionEntities();
        public ActionResult Index()
        {
            var listHardware = db.Hardwares.ToList();
            ViewBag.listHardware = listHardware;
            var listCodetype = db.Codetypes.ToList();
            ViewBag.listCodetype = listCodetype;
            return View();
        }


        
        /// <summary>
        /// kích hoạt hoặc bỏ hủy bỏ một store
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string ActiveHardware(string id)
        {
            int hardwareID = Convert.ToInt32(id);
            var hardware = db.Hardwares.Where(x => x.ID == hardwareID).SingleOrDefault();
            if (hardware != null)
            {
                if (hardware.IsActive == true)
                {
                    hardware.IsActive = false;
                    db.SaveChanges();
                    return "false";                 
                }
                else
                {
                    hardware.IsActive = true;
                    db.SaveChanges();
                    return "true";             
                }
               
            }
            return "";
        }

        // loadtable ajax
        public ActionResult loadTableAgain()
        {
            var listHardware = db.Hardwares.ToList();
            ViewBag.listHardware = listHardware;
            var listCodetype = db.Codetypes.ToList();
            ViewBag.listCodetype = listCodetype;
            return View();
        }


        /// <summary>
        /// tạo một hardware mới
        /// </summary>
        /// <returns></returns>
        public ActionResult CreateNewHardware()
        {
            string name = Request.Params["idHardwareName"];
            string trongso = Request.Params["IdTrongSo"];
            string loai = Request.Params["idLoai"];

            Hardware hard = new Hardware();

            hard.Name = name;
            hard.WeightCriteraPoint = Convert.ToDouble(trongso);
            hard.CodetypeID = loai;
            hard.IsActive = true;
            db.Hardwares.Add(hard);
            db.SaveChanges();

            return RedirectToAction("index", "ManagerHardware");
        }


        

        /// <summary>
        /// edit hardware
        /// </summary>
        /// <returns></returns>
        public ActionResult EditHardware()
        {
            string HardId = Request.Params["idHardware"];
            int id = Convert.ToInt32(HardId);
            string name = Request.Params["idHardwareNameUp"];
            string trongso = Request.Params["idTrongSoUp"];
            string loai = Request.Params["idLoaiUp"];

            var hard = db.Hardwares.Where(x =>x.ID == id).SingleOrDefault();
            hard.Name = name;
            hard.WeightCriteraPoint = Convert.ToDouble(trongso);
            hard.CodetypeID = loai;
            db.SaveChanges();

           return RedirectToAction("index", "Admin/ManagerHardware");
        }

        // tên phụ của hardware
        public ActionResult Aliasname(string id1)
        {
            int id = Convert.ToInt32(id1);
            var listDictionary = db.Dictionaries.Where(x => x.AttributeDicID == id).ToList();
            ViewBag.listDictionary = listDictionary;          
            return View();
        }

         // tên phụ của hardware
        [HttpPost]
        public ActionResult CreateNewAliasHardware()
        {
            string aliasname = Request.Params["idHardwareAliasName"];
            string IdHardware = Request.Params["IdHardware"];

            int id = Convert.ToInt32(IdHardware);
          //  var dic = db.Dictionaries.Where(x => x.AttributeDicID == id).SingleOrDefault();
            Dictionary dic = new Dictionary();
            dic.Name = aliasname;
            dic.AttributeDicID = id;
            dic.IsActive = true;
            db.Dictionaries.Add(dic);
            db.SaveChanges();
            return RedirectToAction("Aliasname", "Admin/ManagerHardware", new { id1 = id });
        }
        [HttpPost]
        public ActionResult EditAliasHardware()
        {
            string aliasname = Request.Params["idHardwareNameUp"];
            string IdHardware = Request.Params["idHardwareAlias"];
            string Id = Request.Params["idHardware"];
            
            int id = Convert.ToInt32(IdHardware);
             var dic = db.Dictionaries.Where(x => x.ID == id).SingleOrDefault();
             dic.Name = aliasname;
             db.SaveChanges();
             return RedirectToAction("Aliasname", "Admin/ManagerHardware", new { id1 = Id });
        }


        /// <summary>
        /// kích hoạt hoặc bỏ hủy bỏ một tên phụ
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string ActiveAlias(string id)
        {
            int DicID = Convert.ToInt32(id);
            var dic = db.Dictionaries.Where(x => x.ID == DicID).SingleOrDefault();
            if (dic != null)
            {
                if (dic.IsActive == true)
                {
                    dic.IsActive = false;
                    db.SaveChanges();
                    return "false";
                }
                else
                {
                    dic.IsActive = true;
                    db.SaveChanges();
                    return "true";
                }
             
            }
            return "";
          
        }

        public string checkName(string name)
        {
            var listdic = db.Dictionaries.ToList();
            
            foreach(Dictionary dic in listdic)
            {
                if (dic.Name.Equals(name))
                {
                    return "true";
                }
            }
            return "false";
        }
    }
}
