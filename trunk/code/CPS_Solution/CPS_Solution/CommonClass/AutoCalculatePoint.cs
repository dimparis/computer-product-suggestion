using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.EntityFramework;
using Quartz;
using System.Threading.Tasks;
namespace CPS_Solution.CommonClass
{
    public class AutoCalculatePoint:IJob
    {
        private CPS_SolutionEntities db = new CPS_SolutionEntities();
        public void Execute(IJobExecutionContext context)
        {
            var ListOfProducts = db.Products.Where(x => x.IsActive == true && x.TotalWeightPoint == 0).ToList();
            CalculatePoint(ListOfProducts);
        }
        public void CalculatePoint(List<Product> products)
        {
            if (products != null && products.Count() > 0)
            {
                int countAtt = 0;
                foreach (var i in products)
                {
                    countAtt = 0;
                    //Get product with have 5 att
                    if (i.ProductAttributes.Count() >= 5)
                    {
                        foreach (var item in i.ProductAttributes)
                        {
                            //check if have 5 point of each product
                            if (item.Hardware.WeightCriteraPoint > 0)
                            {
                                countAtt++;
                            }
                        }
                        //Calculate point
                        if (countAtt >= 5)
                        {
                            var priorScore = i.cpuScore * ConstantManager.RatioCPUPoint + i.vgaScore * ConstantManager.RatioVGAPoint;
                            var normalScore = i.ramScore * ConstantManager.RatioRAMPoint + i.hddScore * ConstantManager.RatioHDDPoint + i.displayScore * ConstantManager.RatioDisplayPoint;
                            i.TotalWeightPoint = (priorScore * 0.6 + normalScore * 0.4) / 5;
                            db.SaveChanges();
                        }
                    }
                }
            }
        }
    }
}