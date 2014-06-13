using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.CommonClass;
namespace CPS_Solution.App_Start
{
    public class ConstantConfig
    {
        public static void Register(HttpServerUtility server) 
        {
            ConstantManager.LogPath = server.MapPath("~/AdminAreas/LogFiles/");
            ConstantManager.ConfigPath = server.MapPath("~/AdminAreas/AdminConfig.xml");
            ConstantManager.SavedPath = server.MapPath("~/AdminAreas/SavedTempParsePages");
            ConstantManager.TrainingFilePath = server.MapPath("~/UploadedExcelFiles/ProductName.txt");
            ConstantManager.IsParserRunning = false;
        }
    }
}