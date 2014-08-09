using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Quartz;
using CPS_Solution.EntityFramework;
using System.Xml.Linq;
using System.Data;
namespace CPS_Solution.CommonClass
{
    public class AutoTakeBestProduct : IJob
    {
        private readonly string xmlFilePath = ConstantManager.ConfigPath;
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        public void Execute(IJobExecutionContext context)
        {
            int result = (int)TakeBestProductPoint();
            ConstantManager.TotalPoint = result;
        }
        public double TakeBestProductPoint()
        {
            var CPU = context.Hardwares.Where(x => x.CodetypeID == "C").OrderByDescending(x => x.WeightCriteraPoint).FirstOrDefault();
            var VGA = context.Hardwares.Where(x => x.CodetypeID == "V").OrderByDescending(x => x.WeightCriteraPoint).FirstOrDefault();
            var RAM = context.Hardwares.Where(x => x.CodetypeID == "R").OrderByDescending(x => x.WeightCriteraPoint).FirstOrDefault();
            var HDD = context.Hardwares.Where(x => x.CodetypeID == "H").OrderByDescending(x => x.WeightCriteraPoint).FirstOrDefault();
            var Display = context.Hardwares.Where(x => x.CodetypeID == "D").OrderByDescending(x => x.WeightCriteraPoint).FirstOrDefault();

            ConstantManager.CPUPoint = (int)CPU.WeightCriteraPoint;
            ConstantManager.VGAPoint = (int)VGA.WeightCriteraPoint;
            ConstantManager.RAMPoint = (int)RAM.WeightCriteraPoint;
            ConstantManager.HDDPoint = (int)HDD.WeightCriteraPoint;
            ConstantManager.DISPLAYPoint = (int)Display.WeightCriteraPoint;

            var products = (from p in context.Products
                           select p).ToList();

            foreach (var i in products) {
                i.TotalWeightPoint = (i.cpuScore + i.vgaScore) * 6 + (i.ramScore + i.hddScore + i.displayScore) * 4;
                context.Entry(i).State = EntityState.Modified;
                context.SaveChanges();
            }

            var bestProduct = context.Products.OrderByDescending(x => x.TotalWeightPoint).FirstOrDefault();
            ConstantManager.BestScore = (int)bestProduct.TotalWeightPoint;
            

            double main = 6 * (CPU.WeightCriteraPoint + VGA.WeightCriteraPoint);
            double alias = 4 * (RAM.WeightCriteraPoint + HDD.WeightCriteraPoint + Display.WeightCriteraPoint);
            double result = (main + alias) / 10;
            return result;
        }
    }
}