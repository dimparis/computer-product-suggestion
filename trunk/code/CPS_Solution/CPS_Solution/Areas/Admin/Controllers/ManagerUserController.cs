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
    [MyAuthorize(Roles = "admin")]
    public class ManagerUserController : Controller
    {
        //
        // GET: /Admin/ManagerUser/
        CPS_SolutionEntities db = new CPS_SolutionEntities();
        public ActionResult Index()
        {
            var listUser = db.Accounts.Where(x => x.IsActive == true).ToList();
            List<Account> user = listUser;

            var listRole = db.Roles.ToList();
            List<Role> role = listRole;

            ViewBag.listRole = role;
            ViewBag.listUser = user;
            return View(listUser);
        }


        public ActionResult loadTableAgain()
        {
            var listUser = db.Accounts.ToList();
            List<Account> user = listUser;
            var listRole = db.Roles.ToList();
            List<Role> role = listRole;
            ViewBag.listRole = role;
            ViewBag.listUser = user;
            return View();
        }

        /// <summary>
        /// create new user
        /// </summary>
        /// <param name="newAccountinfo"></param>
        /// <returns></returns>
        public string CreateNewAccount(string newAccountinfo)
        {
            String[] info = newAccountinfo.Trim().Split('|');
            string username = info[0];
            string pass = info[1];
            string email = info[2];
            string role = info[3];
            var account = db.Accounts.Where(x => x.Username.Equals(username)).SingleOrDefault();
            if (account == null)
            {
                Account newacc = new Account();
                newacc.Username = username;
                newacc.Password = pass;
                newacc.Email = email;
                newacc.RoleID = Convert.ToInt32(role);
                newacc.IsActive = true;
                db.Accounts.Add(newacc);
                db.SaveChanges();
                return "";
            }
            else
            {
                return "existed";
            }
        }

        public string UpdateUser(string Accountinfo)
        {
            String[] info = Accountinfo.Trim().Split('|');
            string username = info[0];
            string pass = info[1];
            string email = info[2];
            string role = info[3];
            var account = db.Accounts.Where(x => x.Username.Equals(username)).SingleOrDefault();
            account.Password = pass;
            account.Email = email;
            account.RoleID = Convert.ToInt32(role);
            db.SaveChanges();
            return "";
        }


        public string ActiveUser(string username)
        {
            var account = db.Accounts.Where(x => x.Username.Equals(username)).SingleOrDefault();

            if (!account.Role.Rolename.Equals("Admin"))
            {
                // đổi status
                if (account.IsActive == true)
                {
                    account.IsActive = false;
                }
                else
                {
                    account.IsActive = true;
                }
                db.SaveChanges();
                return "";
            }
            else
            {
                return "admin";
            }
        }

    }
}
