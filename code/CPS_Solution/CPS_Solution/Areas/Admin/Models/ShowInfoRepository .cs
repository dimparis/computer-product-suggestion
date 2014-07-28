using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using CPS_Solution.EntityFramework;
namespace CPS_Solution.Areas.Admin.Models
{
    public class ShowInfo
    {
        public int NumberOfHardwaresNoPoint { get; set; }
        public int NumberOfNewLaptops { get; set; }
        public int NumberOfNewHardwares { get; set; }
        public int NumberOfNewRecommends { get; set; }
    }
    public class ShowInfoRepository
    {
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        public ShowInfo GetNewInfo() 
        {
            ShowInfo info = new ShowInfo();
            info.NumberOfHardwaresNoPoint = context.Hardwares.Where(x => x.WeightCriteraPoint <= 0 && x.IsActive ==true).Count();
            info.NumberOfNewLaptops = context.Products.Where(x => x.IsActive == null).Count();
            info.NumberOfNewHardwares = context.Hardwares.Where(x => x.IsActive == null).Count();
            info.NumberOfNewRecommends = context.RecommendProducts.Where(x => x.IsApprove == null && x.IsTrue == false).Count();
            return info;
        }
    }
}