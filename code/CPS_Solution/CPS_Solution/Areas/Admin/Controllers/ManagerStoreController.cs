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
    public class ManagerStoreController : Controller
    {
        //
        // GET: /Admin/ManagerStore/
        CPS_SolutionEntities db = new CPS_SolutionEntities();
        public ActionResult Index()
        {
            var listStore = db.Stores.ToList();
            ViewBag.listStore = listStore;
            return View();
        }

        /// <summary>
        /// tạo một store mới
        /// </summary>
        /// <returns></returns>
        public ActionResult CreateNewStore()
        {
            string logoUrl = "default";
            if (Request.Files.Count > 0)
            {
                var file = Request.Files[0];
                if (file != null && file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    fileName = DateTime.Now.ToString("yyyyMMdd-HHmmss") + fileName;
                    var path = Path.Combine(Server.MapPath("~/Images/StoreLogo/"), fileName);
                    file.SaveAs(path);
                    logoUrl = "images/StoreLogo/" + fileName;
                }
            }
            String storeName = Request.Params["idStoreName"];
            String storeUrl = Request.Params["idStoreUrl"];

            Store st = new Store();
            st.StoreName = storeName;
            st.StoreUrl = storeUrl;
            st.LogoImage = logoUrl;
            st.IsActive = true;
            db.Stores.Add(st);
            db.SaveChanges();
            
            return RedirectToAction("Index");
        }


        public ActionResult EditStore()
        {
            string logoimage ="";
            string id = Request.Params["idStore"];
            string newName = Request.Params["idStoreNameUp"];
            string newURL = Request.Params["idStoreUrlUp"];
            int StoreID = Convert.ToInt32(id);
            if (Request.Files.Count > 0)
            {
                var file = Request.Files[0];
                if (file != null && file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);           
                    fileName = DateTime.Now.ToString("yyyyMMdd-HHmmss") + fileName;
                    fileName = fileName.Replace('-', 'a');
                    var path = Path.Combine(Server.MapPath("~/Images/StoreLogo/"), fileName);
                    file.SaveAs(path);
                    logoimage = "images/StoreLogo/" + fileName;
                }
            }

            var store = db.Stores.Where(x => x.ID == StoreID).SingleOrDefault();
            store.StoreName = newName;
            store.StoreUrl = newURL;

            if (!logoimage.Equals(""))
            {
                store.LogoImage = logoimage;
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }



        /// <summary>
        /// kích hoạt hoặc bỏ hủy bỏ một store
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string ActiveStore(string id)
        {
            int storeID = Convert.ToInt32(id);
            var store = db.Stores.Where(x => x.ID == storeID).SingleOrDefault();
            if (store != null)
            {
                if (store.IsActive == true)
                {
                    store.IsActive = false;
                }
                else
                {
                    store.IsActive = true;
                }
                db.SaveChanges();
            }
            return "";
        }

        // loadtable ajax
        public ActionResult loadTableAgain()
        {
            var listStore = db.Stores.ToList();
            ViewBag.listStore = listStore;
            return View();
        }

    }
}
