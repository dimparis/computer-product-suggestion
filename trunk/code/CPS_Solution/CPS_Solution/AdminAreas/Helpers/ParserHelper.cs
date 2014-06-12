using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HtmlAgilityPack;
using CPS_Solution.CommonClass;
using System.Diagnostics;
using CPS_Solution.AdminAreas.Models;
using CPS_Solution.EntityFramework;
using System.IO;
using System.Data.Entity.Infrastructure;
using System.Text;
namespace CPS_Solution.AdminAreas.Helpers
{
    public static class ParserHelper
    {
        public static void LoadWeb(string parseAttributeLink) { 
            //Create agent of website
            var web = new HtmlWeb { UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:26.0) Gecko/20100101 Firefox/26.0" };
            //Load website
            var document = web.Load(parseAttributeLink);
            //Remove all script
            var src = new List<HtmlNode>(document.DocumentNode.Descendants().Where(x => x.Attributes["src"] != null));
            var link = new List<HtmlNode>(document.DocumentNode.Descendants().Where(x => x.Attributes["href"] != null));
            CorrectLink(src, parseAttributeLink, "src");
            CorrectLink(link, parseAttributeLink, "href");
            //Save file path
            document.DocumentNode.Descendants().Where(x => x.Name == "script").ToList().ForEach(x => x.Remove());

            string fileName = "savedtmp.html";
            string path = Path.Combine(ConstantManager.SavedPath, fileName);
            document.Save(path, new UTF8Encoding());

        }
        public static void CorrectLink(List<HtmlNode> nodes,string link,string attName) 
        { 
            //Take link 
            var uri = new Uri(link);
            //get host 
            string host = uri.GetLeftPart(UriPartial.Authority);
            //get path 
            String path = uri.AbsolutePath;
            if (path.EndsWith(".aspx") || path.EndsWith(".htm") || path.EndsWith(".html")) 
            {
                path = path.Substring(0, path.LastIndexOf('/'));
            }
            foreach (HtmlNode node in nodes) {
                if (node.Attributes[attName] != null && !node.Attributes[attName].Value.StartsWith("http")) 
                {
                    string tmp = node.Attributes[attName].Value;
                    if (tmp.StartsWith("/"))
                    {
                        tmp = host + tmp;
                        node.Attributes[attName].Value = tmp;
                        continue;
                    }
                    if (path.Length > 1)
                    {
                        tmp = host + "/" + path + "/" + tmp;
                    }
                    else
                    {
                        tmp = host + "/" + tmp;
                    }
                    while (tmp.IndexOf("//") >0)
                    {
                        tmp = tmp.Replace("//", "/");    
                    }
                    tmp = tmp.Replace("http:/", "http://");
                    node.Attributes[attName].Value = tmp;
                }
            }
        }
        public static void ParseData() {
            ConstantManager.IsParserRunning = true;
            //stopwatch to track parse time
            var stopwatch = new Stopwatch();
            // track log info
            var loginfos = new List<LogInfo>();
            // Create Firefox browser
            var web = new HtmlWeb { UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:26.0) Gecko/20100101 Firefox/26.0" };
            //do more to get data
            using (var context =new CPS_SolutionEntities())
            {
                var parseAttList = context.ParseAttributes.Where(p => p.IsActive);
                {
                    foreach (var item in parseAttList)
                    {
                        stopwatch.Start();
                        var data = GetData(web, item);
                        stopwatch.Stop();
                        var log = new LogInfo
                        {
                            Link = item.ParseAttributelink,
                            ElapsedTime = stopwatch.Elapsed.Milliseconds,
                            TotalItems = data.Count,
                            ToDatabase = InserttoDb(data,Int32.Parse(item.Codetype))
                        };
                    }
                }
            }
        }
        /// <summary>
        /// Get Data
        /// </summary>
        /// <param name="web"></param>
        /// <param name="parseAtt"></param>
        /// <returns></returns>
        public static List<KeyValuePair<string, string>> GetData(HtmlWeb web,ParseAttribute parseAtt)
        {
            var data = new List<KeyValuePair<string, string>>();
            var uri = new Uri(parseAtt.ParseAttributelink);
            string host = uri.GetLeftPart(UriPartial.Authority);
            //load website

            //1st page
            HtmlDocument doc = web.Load(parseAtt.ParseAttributelink);
            data = MatchingData(doc, parseAtt.NameXPath);
            //other page 

            if (parseAtt.PagingXPath != null) 
            {
                var pages = doc.DocumentNode.SelectNodes(parseAtt.PagingXPath);
                foreach (var page in pages) 
                {
                    int pageNumber;
                    if (page == null || !Int32.TryParse(page.InnerText, out pageNumber)) 
                    {
                        break;
                    }
                    //get add 
                    string url = host + page.Attributes["href"].Value;
                    //load page
                    doc = web.Load(url);
                    //get data 
                    var tempdata = MatchingData(doc, parseAtt.NameXPath);
                    // add data to collection
                    data.AddRange(tempdata);
                }
            }

            return data;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="doc"></param>
        /// <param name="nameXpath"></param>
        /// <returns></returns>
        public static List<KeyValuePair<string, string>> MatchingData(HtmlDocument doc, string nameXpath) {

            var data = new List<KeyValuePair<string, string>>();
            int miss = 0;
            var i = 1;

            while (true) {
                string namei = nameXpath.Replace("[i]", ")[" + i + "]");
                namei = "(" + namei;
                //Get data 
                var name = doc.DocumentNode.SelectSingleNode(namei);
                //Name not null
                if (name != null) 
                {
                    miss = 0;
                    if (name.InnerText != "")
                    {
                        var pair = new KeyValuePair<string, string>(name.InnerText,"0");
                        data.Add(pair);
                    }
                }
                //Get all data
                if (name == null) 
                {
                    miss++;    
                }
                if (miss > 1) 
                {
                    break;    
                }
                i++;
            }
            return data;
        }
        public static int InserttoDb(IEnumerable<KeyValuePair<string,string>> data, int codetypeID) {
            int success = 0;
            using (var context = new CPS_SolutionEntities()) 
            {
                foreach (var pair in data) 
                {
                      ////Check good match 
                var goodMatch = new List<int>();
                var averageMatch = new List<int>();
                int pId = -1;
                bool wholeMatch = false;
                    foreach (var attADalias in context.AttributeAlias) 
                    {
                        if (pair.Key == attADalias.Name)
                        {
                            wholeMatch = true;
                            pId = attADalias.AttributeDicID.Value;
                            break;
                        }
                        double matchPercent = CompareStringHelper.CompareString(attADalias.Name, pair.Key);
                        if (matchPercent > 0.9) 
                        {
                            // Good match 
                            goodMatch.Add(attADalias.AttributeDicID.Value);
                        }
                        if (matchPercent > 0.7)
                        {
                            // Normal match 
                            averageMatch.Add(attADalias.AttributeDicID.Value);
                        }
                    }
                    if (!wholeMatch)
                    {
                        if (goodMatch.Count == 1)
                        {
                            // Match well with only 1 product, take it
                            pId = goodMatch[0];
                        }
                        else if (goodMatch.Count > 1)
                        {
                            // Match well with more than 1 product, admin decide
                            ExportTrainingFile(goodMatch, pair.Key);
                            continue;
                        }
                        else if (averageMatch.Count > 0 && pId == -1)
                        {
                            // Only average match, admin decide
                            ExportTrainingFile(averageMatch, pair.Key);
                            continue;
                        }
                    }
                    // If attDic alr Existed? 
                    if (pId != -1)
                    {
                    // Do nothing
                    }
                    else 
                    {
                        //Add a new record
                        var newADitem = new AttributeDictionary { Name = pair.Key, Codetype = codetypeID.ToString() };
                        context.AttributeDictionaries.Add(newADitem);
                        try 
                        {
                            context.SaveChanges();
                            success++;
                            var aliasDic = new AttributeAlia
                            {
                                AttributeDicID = newADitem.ID,
                                Name = newADitem.Name
                            };
                            context.AttributeAlias.Add(aliasDic);
                            context.SaveChanges();
                        }
                        catch (DbUpdateException)
                        {
                            // Do nothing
                        }
                    }
                }
            }
            return 1;
        }
        public static void ExportTrainingFile(List<int> match, string name) {
            List<string> data = ReadDataFromFile();
            string path = ConstantManager.TrainingFilePath;
            string content = "";
            using (var context = new CPS_SolutionEntities())
            {
                foreach (int id in match)
                {
                    var attAD= context.AttributeDictionaries.FirstOrDefault(a=>a.ID == id);
                    if (attAD != null)
                    {
                        content = attAD.Name + ";";
                    }
                }
            }
            content +=name;
            bool  isExisted = false;
            foreach (string item in data)
            {
                if (item == content)
                {
                    isExisted = true;
                    break;
                }
            }
            if (!isExisted)
            {
                using (StreamWriter writer  = File.AppendText(path))
                {
                    writer.WriteLine(content);
                }
            }
        }
        /// <summary>
        /// Read train data from file
        /// </summary>
        /// <returns> list of line match product</returns>
        private static List<string> ReadDataFromFile()
        {
            string path = ConstantManager.TrainingFilePath;
            var result = new List<string>();
            string line;

            var reader = new StreamReader(path);
            while ((line = reader.ReadLine()) != null)
            {
                result.Add(line);
            }
            reader.Close();
            return result;
        }
    }
}