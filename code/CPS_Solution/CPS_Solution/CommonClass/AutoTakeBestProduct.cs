using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Quartz;
using CPS_Solution.EntityFramework;
using System.Xml.Linq;
using System.Data;
using System.Data.Entity;

namespace CPS_Solution.CommonClass
{
    public class AutoTakeBestProduct : IJob
    {
        private readonly string xmlFilePath = ConstantManager.ConfigPath;
        private CPS_SolutionEntities context = new CPS_SolutionEntities();

        public void Execute(IJobExecutionContext context)
        {
            
            double result = TakeBestProductPoint();
            ConstantManager.BestProduct = result;
        }

        public double TakeBestProductPoint()
        {
            var CPU = context.Hardwares.Where(x => x.CodetypeID == "C").OrderByDescending(x => x.WeightCriteraPoint).FirstOrDefault();
            var VGA = context.Hardwares.Where(x => x.CodetypeID == "V").OrderByDescending(x => x.WeightCriteraPoint).FirstOrDefault();
            var RAM = context.Hardwares.Where(x => x.CodetypeID == "R").OrderByDescending(x => x.WeightCriteraPoint).FirstOrDefault();
            var HDD = context.Hardwares.Where(x => x.CodetypeID == "H").OrderByDescending(x => x.WeightCriteraPoint).FirstOrDefault();
            var Display = context.Hardwares.Where(x => x.CodetypeID == "D").OrderByDescending(x => x.WeightCriteraPoint).FirstOrDefault();

           
            ConstantManager.RatioCPUPoint = 100 / CPU.WeightCriteraPoint;
            ConstantManager.RatioVGAPoint = 100 / VGA.WeightCriteraPoint;
            ConstantManager.RatioRAMPoint = 100 / RAM.WeightCriteraPoint;
            ConstantManager.RatioHDDPoint = 100 / HDD.WeightCriteraPoint;
            ConstantManager.RatioDisplayPoint = 100 / Display.WeightCriteraPoint;


            var products = (from p in context.Products
                           select p).ToList();
            
            foreach (var i in products){
                if(i.TotalWeightPoint.Equals(0)){
                    var priorScore = i.cpuScore * ConstantManager.RatioCPUPoint + i.vgaScore * ConstantManager.RatioVGAPoint;
                    var normalScore = i.ramScore * ConstantManager.RatioRAMPoint + i.hddScore * ConstantManager.RatioHDDPoint + i.displayScore * ConstantManager.RatioDisplayPoint;
                    i.TotalWeightPoint = (priorScore * 0.6 + normalScore * 0.4) / 5;
                    context.Entry(i).State = EntityState.Modified;
                    context.SaveChanges();
                }
            }

            var bestProduct = context.Products.OrderByDescending(x => x.TotalWeightPoint).FirstOrDefault();

            return bestProduct.TotalWeightPoint;
        }
    }
}