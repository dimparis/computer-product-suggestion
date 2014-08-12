using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.CommonClass;
using CPS_Solution.EntityFramework;
namespace CPS_Solution.App_Start
{
    public static class ConstantConfig
    {
        public static CPS_SolutionEntities context = new CPS_SolutionEntities();
        public static void Register(HttpServerUtility server) 
        {
            ConstantManager.LogPath = server.MapPath("~/Areas/Admin/LogFiles/");
            ConstantManager.ConfigPath = server.MapPath("~/Areas/Admin/AdminConfig.xml");
            ConstantManager.SavedPath = server.MapPath("~/Areas/Admin/SavedPages");
            ConstantManager.TrainingFilePath = server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
            ConstantManager.TrainingFilePathForProduct = server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
            ConstantManager.NoResultFilePath = server.MapPath("~/Areas/Admin/LogFiles/NoResult/result.txt");
            ConstantManager.DefaultImage = server.MapPath("~/images/I/default.jpg");
            ConstantManager.IsParserRunning = false;
            ConstantManager.IsRecommendRunning = false;
            ConstantManager.IsUpdateRunning = false;

            ConstantManager.RatioCPUPoint = 1;
            ConstantManager.RatioVGAPoint = 1;
            ConstantManager.RatioRAMPoint = 1;
            ConstantManager.RatioHDDPoint = 1;
            ConstantManager.RatioDisplayPoint = 1;
            ConstantManager.BestProduct = 1;
        }
    }
}