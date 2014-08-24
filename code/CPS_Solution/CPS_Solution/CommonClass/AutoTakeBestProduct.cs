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
            ConstantManager.BestScore = result;
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
            var bestProduct = context.Products.OrderByDescending(x => x.TotalWeightPoint).FirstOrDefault();
            return bestProduct.TotalWeightPoint;
        }
    }
}