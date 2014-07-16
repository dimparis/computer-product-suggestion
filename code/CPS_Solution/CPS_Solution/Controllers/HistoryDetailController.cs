using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CPS_Solution.EntityFramework;
namespace CPS_Solution.Controllers
{
    public class HistoryDetailController : Controller
    {
        //
        // GET: /HistoryDetail/
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        public ActionResult Index()
        {
            //clay user hoac user name id 
            string username = "admin";
            var histories = context.Histories.Where(x => x.Username.Equals(username)).ToList();
            List<HistoryDetail> listOfDetails = new List<HistoryDetail>();
            var details = context.HistoryDetails.ToList();
            foreach (var item in histories) 
            {
                foreach (var detail in details) 
                {
                    if (item.ID == detail.HistoryID) 
                    {
                        listOfDetails.Add(detail);
                        break;
                    }

                }
            }

            return View(listOfDetails);
        }

    }
}
