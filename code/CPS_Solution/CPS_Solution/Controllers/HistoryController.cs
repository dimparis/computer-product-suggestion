using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Net;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
using CPS_Solution.Models;
using PagedList;

namespace CPS_Solution.Controllers
{
    public class HistoryController : Controller
    {
        private CPS_SolutionEntities db = new CPS_SolutionEntities();

        public ActionResult CompareHistory(int? page)
        {

            var histories = from h in db.Histories
                            select h;

            histories = histories.Where(x => x.Username == User.Identity.Name).OrderByDescending(x => x.CompareTime);

            //DateTime minusThirty = DateTime.Today.AddDays(-30);
            //DateTime minusZero = DateTime.Today.AddDays(0);
            //var history = from item in db.Histories
            //              where item.CompareTime >= minusThirty && item.CompareTime <= minusZero && item.Username.Equals(User.Identity.Name)
            //              select item;
            //history = history.OrderByDescending(item => item.CompareTime);

            return View(histories);
        }

        public ActionResult CompareHistoryDetail(int? id)
        {
            var details = db.HistoryDetails.Where(x=>x.HistoryID ==id).ToList();
            if (details == null)
            {
                return HttpNotFound();
            }

            return View(details);
        }

        //
        // GET: /History/

        public ActionResult Index()
        {
            var histories = db.Histories.Include(h => h.Account);
            return View(histories.ToList());
        }

        //
        // GET: /History/Details/5

        //public ActionResult Details(int id = 0)
        //{
        //    History history = db.Histories.Find(id);
        //    if (history == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(history);
        //}

        ////
        //// GET: /History/Create

        //public ActionResult Create()
        //{
        //    ViewBag.Username = new SelectList(db.Accounts, "Username", "Password");
        //    return View();
        //}

        ////
        //// POST: /History/Create

        //[HttpPost]
        //public ActionResult Create(History history)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Histories.Add(history);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.Username = new SelectList(db.Accounts, "Username", "Password", history.Username);
        //    return View(history);
        //}

        ////
        //// GET: /History/Edit/5

        //public ActionResult Edit(int id = 0)
        //{
        //    History history = db.Histories.Find(id);
        //    if (history == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.Username = new SelectList(db.Accounts, "Username", "Password", history.Username);
        //    return View(history);
        //}

        ////
        //// POST: /History/Edit/5

        //[HttpPost]
        //public ActionResult Edit(History history)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(history).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.Username = new SelectList(db.Accounts, "Username", "Password", history.Username);
        //    return View(history);
        //}

        ////
        //// GET: /History/Delete/5

        //public ActionResult Delete(int id = 0)
        //{
        //    History history = db.Histories.Find(id);
        //    if (history == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(history);
        //}

        ////
        //// POST: /History/Delete/5

        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    History history = db.Histories.Find(id);
        //    db.Histories.Remove(history);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        //protected override void Dispose(bool disposing)
        //{
        //    db.Dispose();
        //    base.Dispose(disposing);
        //}
    }
}