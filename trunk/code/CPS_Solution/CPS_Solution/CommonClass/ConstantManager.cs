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
        public static string DefaultImage { get; set; }
        public static bool IsParserRunning { get; set; }
    }
    public enum SystemRole { 
        Admin = 1,
        Staff = 2,
        Member  = 3,
    }
}