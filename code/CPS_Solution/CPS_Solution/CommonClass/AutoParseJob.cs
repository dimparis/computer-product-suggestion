﻿using System;
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
    public class AutoParseJob : IJob
    {
        private CPS_SolutionEntities databaseContext = new CPS_SolutionEntities();
        public void Execute(IJobExecutionContext context)
        {
            string patter = "://|/";
            Regex reg = new Regex(patter);
            var parseInfoes = databaseContext.ParseInfoes.Where(x => x.IsActive == true).OrderBy(x => x.Parselink).ToList();
            var rcmdProduct = databaseContext.RecommendProducts.Where(x => x.IsApprove == false).OrderBy(x => x.Parselink).ToList();
            List<ParseInfo> listInfo = new List<ParseInfo>();
            ParseInfo infoItem = null;
            List<RecommendProduct> list = new List<RecommendProduct>();
            foreach (var info in parseInfoes)
            {
                infoItem = new ParseInfo
                {
                    CPUXPath = info.CPUXPath,
                    DisplayXPath = info.DisplayXPath,
                    HDDXPath = info.HDDXPath,
                    ImageXpath = info.ImageXpath,
                    IsActive = true,
                    Name = info.Name,
                    Parselink = info.Parselink,
                    RAMXPath = info.RAMXPath,
                    VGAXPath = info.VGAXPath,
                };
                listInfo.Add(infoItem);

            }
            var fitlerList = listInfo.Select(x => new
            {
                host = reg.Split(x.Parselink)[1],
                x.CPUXPath,
                x.DisplayXPath,
                x.HDDXPath,
                x.ImageXpath,
                x.Name,
                x.Parselink,
                x.RAMXPath,
                x.VGAXPath,
                x.IsActive
            })
                .Distinct()
                .GroupBy(y => new { y.host })
                .ToArray();
            ProductParserCreator model = null;
            foreach (var item in fitlerList)
            {
                foreach (var recommend in rcmdProduct)
                {
                    if (recommend.Parselink.Contains(item.Key.host))
                    {
                        model = new ProductParserCreator
                        {
                            CPUXpath = item.First().CPUXPath,
                            DisplayXpath = item.First().DisplayXPath,
                            HDDXpath = item.First().HDDXPath,
                            ImageXpath = item.First().ImageXpath,
                            IsActive = true,
                            ParseProductLink = item.First().Parselink,
                            ProductNameXpath = item.First().Name,
                            RAMXpath = item.First().RAMXPath,
                            VGAXpath = item.First().VGAXPath,
                            RecommendProductId = recommend.ID.ToString(),
                        };
                        Task.Factory.StartNew(() => ParserHelper.ParseProductData(model));
                        int rcmId = Int32.Parse(model.RecommendProductId);
                        var recommendProduct = databaseContext.RecommendProducts.Where(x => x.ID == rcmId).FirstOrDefault();
                        recommendProduct.IsApprove = true;
                    }
                }
            }
            databaseContext.SaveChanges();
        }
    }
}