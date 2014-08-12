using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CPS_Solution.CommonClass
{
    public static class ConstantManager
    {
        public static string LogPath { get; set; }
        public static string ConfigPath { get; set; }
        public static string SavedPath { get; set; }
        public static string TrainingFilePath { get; set; }
        public static string TrainingFilePathForProduct { get; set; }
        public static string NoResultFilePath { get; set; }
        public static string DefaultImage { get; set; }
        public static bool IsParserRunning { get; set; }
        public static bool IsUpdateRunning { get; set; }
        public static bool IsRecommendRunning { get; set; }
        
        public static double RatioCPUPoint { get; set; }
        public static double RatioVGAPoint { get; set; }
        public static double RatioRAMPoint { get; set; }
        public static double RatioHDDPoint { get; set; }
        public static double RatioDisplayPoint { get; set; }
        public static double BestProduct { get; set; }
        public static int BestScore { get; set; }
    }
    public enum SystemRole { 
        Admin = 1,
        Staff = 2,
        Member  = 3,
    }    
}