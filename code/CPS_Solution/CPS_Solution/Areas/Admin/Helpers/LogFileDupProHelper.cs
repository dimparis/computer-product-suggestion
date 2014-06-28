using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.Areas.Admin.Models;
using CPS_Solution.EntityFramework;
using CPS_Solution.Areas.Admin.Models;
using CPS_Solution.CommonClass;
using System.IO;
using System.Text;
namespace CPS_Solution.Areas.Admin.Helpers
{
    public class LogFileDupProHelper
    {
        public static void GenerateLogfile(List<List<ProductMap>> proMap)
        {
            string path = ConstantManager.LogPath;
            int max = 20;
            max++;
            string link = "Link".PadRight(max);
            string fileName = Path.GetRandomFileName() + ".txt";
            string templateLine = TemplateLine(max);
            string content = "CPS Solution Log File \n" +
                             "Được tạo lúc :" + DateTime.Now.ToShortDateString() + "," +
                             DateTime.Now.ToShortTimeString() + "\n";
            content += templateLine;
            content += string.Format("|{0,-3}|{1}|{2,-15}|{3,-13}|{4,-19}|\n", "STT", link, "Thời gian parse",
                                    "Tổng thành phần", "Insert vào database");
            content += templateLine;
            for (int i = 0; i < proMap.Count; i++)
            {
                for (int j = 0; j < proMap[i].Count; j++)
                {
                    content += string.Format("|{0,-3}|{1}|{2,-15}|{3,-13}|{4,-19}|\n",
                                         i + 1, proMap[i][j].ten.PadRight(max), proMap[i][j].loai, proMap[i][j].trongso,
                                         proMap[i][j].trongso);
                    content += templateLine;
                }
                
            }
            int totalTime = 30;
            int totalParsedItems = proMap.Sum(x => x.Count);
            content += "Tổng thời gian parse: " + totalTime + " mili giây\n";
            content += "Tổng thành phần được parse: " + totalParsedItems;
            File.WriteAllText(path + fileName, content, new UnicodeEncoding());
            using (var context = new CPS_SolutionEntities())
            {
                var log = new LogFile
                {
                    Filename = fileName,
                    CreatedTime = DateTime.Now,
                    IsActive = true
                };
                context.LogFiles.Add(log);
                context.SaveChanges();
            }

        }
        private static string TemplateLine(int max)
        {
            int length = 70 + max;
            string line = "";
            for (int i = 0; i < length; i++)
            {
                line += "=";
            }
            line += "\n";
            return line;
        }

    }
}