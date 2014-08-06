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
            ConstantManager.TotalPoint = 1;
            ConstantManager.CPUPoint = 1;
            ConstantManager.VGAPoint = 1;
            ConstantManager.RAMPoint = 1;
            ConstantManager.HDDPoint = 1;
            ConstantManager.DISPLAYPoint = 1;
        }
    }
}