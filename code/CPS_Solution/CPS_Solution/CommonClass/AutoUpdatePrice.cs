using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Quartz;
using CPS_Solution.Areas.Admin.Helpers;
using CPS_Solution.EntityFramework;
using HtmlAgilityPack;
using System.Text.RegularExpressions;
using CPS_Solution.Areas.Admin.Models;
using System.Threading.Tasks;
namespace CPS_Solution.CommonClass
{
    public class AutoUpdatePrice : IJob
    {
        private CPS_SolutionEntities databaseContext = new CPS_SolutionEntities();
        public void Execute(IJobExecutionContext context)
        {
            // Auto Parser Product
            var parseInfoes = databaseContext.ParseInfoes.Where(x => x.IsActive == true).OrderBy(x => x.Parselink).ToList();
            var aliasproduct = databaseContext.AliasProducts.Where(x => x.IsActive == true).ToList();
            Task.Factory.StartNew(() => AutoUpdatePriceTask(aliasproduct, parseInfoes));
        }
        public void AutoUpdatePriceTask(List<AliasProduct> aliasproduct, List<ParseInfo> parseInfoes)
        {
            string patter = "://|/";
            Regex reg = new Regex(patter);
            ConstantManager.IsUpdateRunning = true;
            foreach (var info in parseInfoes)
            {
                foreach (var alias in aliasproduct)
                {
                    if (alias.URL.Contains(reg.Split(info.Parselink)[1]))
                    {
                        ParserHelper.UpdatePriceParser(alias.ID, alias.URL);
                    }
                }
            }
            ConstantManager.IsUpdateRunning = false;
        }
    }
}