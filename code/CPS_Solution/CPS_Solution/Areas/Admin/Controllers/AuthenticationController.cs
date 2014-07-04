using CPS_Solution.Filters;
using CPS_Solution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMatrix.WebData;

namespace CPS_Solution.Areas.Admin.Controllers
{
    [Authorize]
    [InitializeSimpleMembership]
    public class AuthenticationController : Controller
    {
        //
        // GET: /Admin/Authentication/
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel model, string returnUrl)
        {
            if (ModelState.IsValid && WebSecurity.Login(model.UserName, model.Password, persistCookie: model.RememberMe))
            {
                return RedirectToLocal(returnUrl);
            }

            // If we got this far, something failed, redisplay form
            ModelState.AddModelError("", "Thông tin đăng nhập không hợp lệ!");
            return View(model);
        }

        public ActionResult LogOff()
        {
            WebSecurity.Logout();

            return RedirectToAction("Login");
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("WelcomeAreasAdmin", "System");
        }
    }
}
