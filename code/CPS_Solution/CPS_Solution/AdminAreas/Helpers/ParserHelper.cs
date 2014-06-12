using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HtmlAgilityPack;
using CPS_Solution.CommonClass;
using System.Diagnostics;
using CPS_Solution.AdminAreas.Models;
using CPS_Solution.EntityFramework;
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
        }
        /// <summary>
        /// Get Data
        /// </summary>
        /// <param name="web"></param>
        /// <param name="parseAtt"></param>
        /// <returns></returns>
        public static List<KeyValuePair<string,string>> GetData (HtmlWeb web,ParseAttribute parseAtt)
        {
            var data = new List<KeyValuePair<string,string>>();
            var uri = new Uri(parseAtt.Parselink);
            string host = uri.GetLeftPart(UriPartial.Authority);
            //load website
            return null;
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
    }
}