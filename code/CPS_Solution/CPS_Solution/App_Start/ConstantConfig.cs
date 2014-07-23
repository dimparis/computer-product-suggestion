using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.CommonClass;
namespace CPS_Solution.App_Start
{
    public static class ConstantConfig
    {
        public static void Register(HttpServerUtility server) 
        {
            ConstantManager.LogPath = server.MapPath("~/Areas/Admin/LogFiles/");
            ConstantManager.ConfigPath = server.MapPath("~/Areas/Admin/AdminConfig.xml");
            ConstantManager.SavedPath = server.MapPath("~/Areas/Admin/SavedPages");
            ConstantManager.TrainingFilePath = server.MapPath("~/UploadedExcelFiles/ProductName.txt");
            ConstantManager.TrainingFilePathForProduct = server.MapPath("~/UploadedExcelFiles/ProductNameTraining.txt");
            ConstantManager.DefaultImage = server.MapPath("~/images/I/default.jpg");
            ConstantManager.IsParserRunning = false;
            ConstantManager.IsRecommendRunning = false;
            ConstantManager.IsUpdateRunning = false;
        }
    }
}