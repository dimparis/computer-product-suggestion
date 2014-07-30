
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HtmlAgilityPack;
using CPS_Solution.CommonClass;
using System.Diagnostics;
using CPS_Solution.Areas.Admin.Models;
using CPS_Solution.EntityFramework;
using System.IO;
using System.Data.Entity.Infrastructure;
using System.Text;
using System.Web.Mvc;
using System.Text.RegularExpressions;
namespace CPS_Solution.Areas.Admin.Helpers
{
    public static class ParserHelper
    {

        // Load web
        #region
        public static void LoadWeb(string parseAttributeLink)
        {
            //Create agent of website
            var web = new HtmlWeb { UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:26.0) Gecko/20100101 Firefox/26.0" };
            try
            {
                //Load website
                var document = web.Load(parseAttributeLink);
                //Remove all script
                var src = new List<HtmlNode>(document.DocumentNode.Descendants().Where(x => x.Attributes["src"] != null));
                var link = new List<HtmlNode>(document.DocumentNode.Descendants().Where(x => x.Attributes["href"] != null));
                CorrectLink(src, parseAttributeLink, "src");
                CorrectLink(link, parseAttributeLink, "href");
                //Save file path
                document.DocumentNode.Descendants().Where(x => x.Name == "script").ToList().ForEach(x => x.Remove());

                string fileName = "tmp.html";
                string path = Path.Combine(ConstantManager.SavedPath, fileName);
                document.Save(path, new UTF8Encoding());
            }
            catch (System.Net.WebException ex)
            {
                LoadWebProduct(parseAttributeLink);
            }
            catch (HtmlWebException ex)
            {
                LoadWebProduct(parseAttributeLink);
            }

        }
        [ValidateInput(false)]
        public static void LoadWebProduct(string ParseProductLink)
        {
            //Create agent of website
            var web = new HtmlWeb { UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:26.0) Gecko/20100101 Firefox/26.0" };
            try
            {
                //Load website
                HtmlNode.ElementsFlags.Remove("form");
                HtmlNode.ElementsFlags.Remove("option");
                var document = web.Load(ParseProductLink);

                var src = new List<HtmlNode>(document.DocumentNode.Descendants().Where(x => x.Attributes["src"] != null));
                var link = new List<HtmlNode>(document.DocumentNode.Descendants().Where(x => x.Attributes["href"] != null));
                CorrectLink(src, ParseProductLink, "src");
                CorrectLink(link, ParseProductLink, "href");
                //Save file path
                //Remove all script
                if (ParseProductLink.Contains("thietbiso.com") || ParseProductLink.Contains("nguyenkim.com"))
                {
                    document.DocumentNode.Descendants().Where(x => x.Name == "script").ToList().ForEach(x => x.Remove());
                }

                string fileName = "ProductTmp.html";
                string path = Path.Combine(ConstantManager.SavedPath, fileName);
                document.Save(path, new UTF8Encoding());
            }
            catch (System.Net.WebException ex)
            {
                LoadWebProduct(ParseProductLink);
            }
            catch (HtmlWebException ex)
            {
                LoadWebProduct(ParseProductLink);
            }

        }
        public static void CorrectLink(List<HtmlNode> nodes, string link, string attName)
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
            foreach (HtmlNode node in nodes)
            {
                if (node.Attributes[attName] != null && !node.Attributes[attName].Value.StartsWith("http"))
                {
                    string tmp = "";
                    if (node.Attributes["src"] != null)
                    {
                        tmp = node.Attributes[attName].Value;
                        if (tmp.StartsWith("/"))
                        {
                            tmp = host + tmp;
                            node.Attributes[attName].Value = tmp;
                            continue;
                        }//modified for laptopgiahuy
                        else if (tmp.StartsWith("im"))
                        {
                            tmp = host + "/" + tmp;
                            node.Attributes["src"].Value = tmp;
                            continue;
                        }
                    }

                    if (path.Length > 1)
                    {
                        tmp = host + "/" + path + "/" + tmp;
                    }
                    else
                    {
                        tmp = host + "/" + tmp;
                    }
                    while (tmp.IndexOf("//") > 0)
                    {
                        tmp = tmp.Replace("//", "/");
                    }
                    tmp = tmp.Replace("http:/", "http://");
                    node.Attributes[attName].Value = tmp;
                }
            }
        }
        #endregion

        // Parse Attribute
        #region
        public static void ParseData()
        {
            ConstantManager.IsParserRunning = true;
            //stopwatch to track parse time
            var stopwatch = new Stopwatch();
            // track log info
            var loginfos = new List<LogInfo>();
            // Create Firefox browser
            var web = new HtmlWeb { UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:26.0) Gecko/20100101 Firefox/26.0" };
            //do more to get data
            using (var context = new CPS_SolutionEntities())
            {
                var parseAttList = context.ParseAttributes.Where(p => p.IsActive);
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
                        ToDatabase = InserttoDb(data, item.CodetypeID)
                    };
                    loginfos.Add(log);
                    stopwatch.Reset();
                }
                LogFileHelper.GenerateLogfile(loginfos);
                ConstantManager.IsParserRunning = false;
            }
        }
        /// <summary>
        /// Get Data
        /// </summary>
        /// <param name="web"></param>
        /// <param name="parseAtt"></param>
        /// <returns></returns>
        public static List<KeyValuePair<string, string>> GetData(HtmlWeb web, ParseAttribute parseAtt)
        {
            var data = new List<KeyValuePair<string, string>>();
            var uri = new Uri(parseAtt.ParseAttributelink);
            string host = uri.GetLeftPart(UriPartial.Authority);
            //load website

            //1st page
            HtmlDocument doc = web.Load(parseAtt.ParseAttributelink);
            data = MatchingData(doc, parseAtt.NameXPath, parseAtt.PointXPath);
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
                    var tempdata = MatchingData(doc, parseAtt.NameXPath, parseAtt.PointXPath);
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
        public static List<KeyValuePair<string, string>> MatchingData(HtmlDocument doc, string nameXpath, string pointXpath)
        {

            var data = new List<KeyValuePair<string, string>>();
            int miss = 0;
            var i = 1;

            while (true)
            {
                //Replace Xtah
                string namei = nameXpath.Replace("[i]", ")[" + i + "]");
                namei = "(" + namei;
                string pointi = pointXpath.Replace("[i]", ")[" + i + "]");
                pointi = "(" + pointi;
                //Get data 
                var name = doc.DocumentNode.SelectSingleNode(namei);
                var point = doc.DocumentNode.SelectSingleNode(pointi);
                //Name not null
                if (name != null && point != null)
                {
                    miss = 0;
                    if (name.InnerText != "" && point.InnerText != "")
                    {
                        var pair = new KeyValuePair<string, string>(name.InnerText, point.InnerText);
                        data.Add(pair);
                    }
                    else if (name.InnerText != "")
                    {
                        var pair = new KeyValuePair<string, string>(name.InnerText, "");
                        data.Add(pair);
                    }
                }
                //Get all data
                if (name == null && point == null)
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
        #endregion

        // Parse 1 product
        #region
        public static void ParseProductData(ProductParserCreator model)
        {
            ConstantManager.IsRecommendRunning = true;
            // Create Firefox browser
            var web = new HtmlWeb { UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:26.0) Gecko/20100101 Firefox/26.0" };
            //do more to get data
            var uri = new Uri(model.ParseProductLink);
            string host = uri.GetLeftPart(UriPartial.Authority);
            using (var context = new CPS_SolutionEntities())
            {
                var parseinfo = context.ParseInfoes.Where(p => p.IsActive && p.Parselink.Contains(host)).FirstOrDefault();
                var data = GetProductData(web, parseinfo);
                InsertProductToDb(data, model);
                ConstantManager.IsRecommendRunning = false;
            }
        }
        [ValidateInput(false)]
        public static ProductData GetProductData(HtmlWeb web, ParseInfo parseInfo)
        {
            var data = new ProductData();
            try
            {
                //load page
                System.Net.ServicePointManager.Expect100Continue = false;
                var uri = new Uri(parseInfo.Parselink);
                string host = uri.GetLeftPart(UriPartial.Authority);
                HtmlNode.ElementsFlags.Remove("form");
                var doc = web.Load(parseInfo.Parselink);
                data = MatchingProductData(host, doc, parseInfo.Name, parseInfo.PriceXPath, parseInfo.ImageXpath, parseInfo.CPUXPath, parseInfo.VGAXPath, parseInfo.HDDXPath, parseInfo.RAMXPath, parseInfo.DisplayXPath);
                return data;
            }
            catch (System.Net.WebException ex)
            {
                GetProductData(web, parseInfo);
            }
            catch (HtmlWebException ex)
            {
                GetProductData(web, parseInfo);
            }
            return data;
        }
        public static ProductData MatchingProductData(string host, HtmlDocument doc, string nameXpath, string priceXpath, string imageXpath, string cpuXpath, string vgaXpath, string hddXpath, string ramXpath, string displayXpath)
        {
            var data = new ProductData();
            HtmlNode name = null;
            HtmlNode cpu = null;
            HtmlNode vga = null;
            HtmlNode hdd = null;
            HtmlNode ram = null;
            HtmlNode display = null;
            HtmlNode image = null;
            HtmlNode price = null;
            // modify xpath for vienthong a 
            if (host.Contains("vienthonga.vn"))
            {
                string[] seperator = { "/form" };
                string take2stString = nameXpath.Split(seperator, StringSplitOptions.RemoveEmptyEntries)[1];
                string final = "//form" + take2stString.Replace("/", "//");
                name = doc.DocumentNode.SelectSingleNode(final);
            }
            else
            {
                name = doc.DocumentNode.SelectSingleNode(nameXpath);
            }

            if (host.Contains("www.nguyenkim.com") || host.Contains("www.dienmaythienhoa.vn") || host.Contains("thietbiso.com"))
            {
                if (priceXpath != null)
                {
                    price = doc.DocumentNode.SelectSingleNode(priceXpath);
                }
                cpu = doc.DocumentNode.SelectSingleNode(ReplaceUntable(cpuXpath, "/t", "//t"));
                vga = doc.DocumentNode.SelectSingleNode(ReplaceUntable(vgaXpath, "/t", "//t"));
                hdd = doc.DocumentNode.SelectSingleNode(ReplaceUntable(hddXpath, "/t", "//t"));
                ram = doc.DocumentNode.SelectSingleNode(ReplaceUntable(ramXpath, "/t", "//t"));
                display = doc.DocumentNode.SelectSingleNode(ReplaceUntable(displayXpath, "/t", "//t"));
                if (host.Contains("dienmaythienhoa"))
                {
                    imageXpath = ReplaceUntable(imageXpath, "/t", "//t");
                }
            }
            else
            {
                if (priceXpath != null)
                {
                    price = doc.DocumentNode.SelectSingleNode(priceXpath);
                }
                cpu = doc.DocumentNode.SelectSingleNode(cpuXpath);
                vga = doc.DocumentNode.SelectSingleNode(vgaXpath);
                hdd = doc.DocumentNode.SelectSingleNode(hddXpath);
                ram = doc.DocumentNode.SelectSingleNode(ramXpath);
                display = doc.DocumentNode.SelectSingleNode(displayXpath);
            }
            if (cpu != null && vga != null && hdd != null &&
                display != null && ram != null && name != null)
            {
                //Check null
                if (!String.IsNullOrEmpty(name.InnerText) && !String.IsNullOrEmpty(cpu.InnerText) &&
                    !String.IsNullOrEmpty(vga.InnerText) && !String.IsNullOrEmpty(hdd.InnerText) &&
                    !String.IsNullOrEmpty(ram.InnerText) && !String.IsNullOrEmpty(display.InnerText))
                {
                    data.Name = name.InnerText;
                    data.CPU = cpu.InnerText;
                    data.VGA = vga.InnerText;

                    //Modifed for take Price
                    if (priceXpath != null)
                    {
                        if (price != null)
                        {
                            data.Price = price.InnerText;
                        }
                        else
                        {
                            data.Price = "0";
                        }
                    }
                    else
                    {
                        data.Price = "0";
                    }
                    // modify xpath for lazada
                    if (host.Contains("lazada.vn"))
                    {
                        string patter = "RAM |/|,|-| HDD ";
                        Regex reg = new Regex(patter);
                        if (ram.InnerText.Contains(",") || ram.InnerText.Contains("/") || ram.InnerText.Contains("-"))
                        {
                            string[] spltRAMString = reg.Split(ram.InnerText);
                            data.RAM = spltRAMString[1];
                        }
                        else
                        {
                            data.RAM = ram.InnerText;
                        }
                        if (hdd.InnerText.Contains(",") || hdd.InnerText.Contains("/") || hdd.InnerText.Contains("-"))
                        {
                            string[] spltHDDString = reg.Split(hdd.InnerText);
                            data.HDD = spltHDDString[3];
                        }
                        else
                        {
                            data.HDD = hdd.InnerText;
                        }
                        imageXpath = "//*[@id='productZoom']";
                    }
                    else
                    {
                        data.HDD = hdd.InnerText;
                        data.RAM = ram.InnerText;
                    }
                    data.Display = display.InnerText;
                    data.Image = ImageHelper.TakePath(host, doc, imageXpath);
                    if (String.IsNullOrEmpty(data.Image))
                    {
                        data.Image = ImageHelper.TakePath(host, doc, imageXpath);
                    }
                }
            }
            return data;
        }
        public static ProductData MatchingProductDataPreview(string host, HtmlDocument doc, string nameXpath, string priceXpath, string imageXpath, string cpuXpath, string vgaXpath, string hddXpath, string ramXpath, string displayXpath)
        {
            var data = new ProductData();
            HtmlNode name = null;
            HtmlNode cpu = null;
            HtmlNode vga = null;
            HtmlNode hdd = null;
            HtmlNode ram = null;
            HtmlNode display = null;
            HtmlNode image = null;
            HtmlNode price = null;
            // modify xpath for vienthong a 
            if (host.Contains("vienthonga.vn"))
            {
                string[] seperator = { "/form" };
                string take2stString = nameXpath.Split(seperator, StringSplitOptions.RemoveEmptyEntries)[1];
                string final = "//form" + take2stString.Replace("/", "//");
                name = doc.DocumentNode.SelectSingleNode(final);
            }
            else
            {
                name = doc.DocumentNode.SelectSingleNode(nameXpath);
            }

            if (host.Contains("www.nguyenkim.com") || host.Contains("www.dienmaythienhoa.vn") || host.Contains("thietbiso.com"))
            {
                if (priceXpath != null)
                {
                    price = doc.DocumentNode.SelectSingleNode(priceXpath);
                }
                cpu = doc.DocumentNode.SelectSingleNode(ReplaceUntable(cpuXpath, "/t", "//t"));
                vga = doc.DocumentNode.SelectSingleNode(ReplaceUntable(vgaXpath, "/t", "//t"));
                hdd = doc.DocumentNode.SelectSingleNode(ReplaceUntable(hddXpath, "/t", "//t"));
                ram = doc.DocumentNode.SelectSingleNode(ReplaceUntable(ramXpath, "/t", "//t"));
                display = doc.DocumentNode.SelectSingleNode(ReplaceUntable(displayXpath, "/t", "//t"));
                if (host.Contains("dienmaythienhoa"))
                {
                    imageXpath = ReplaceUntable(imageXpath, "/t", "//t");
                }
            }
            else
            {
                if (priceXpath != null)
                {
                    price = doc.DocumentNode.SelectSingleNode(priceXpath);
                }
                cpu = doc.DocumentNode.SelectSingleNode(cpuXpath);
                vga = doc.DocumentNode.SelectSingleNode(vgaXpath);
                hdd = doc.DocumentNode.SelectSingleNode(hddXpath);
                ram = doc.DocumentNode.SelectSingleNode(ramXpath);
                display = doc.DocumentNode.SelectSingleNode(displayXpath);
            }

            if (cpu != null && vga != null && hdd != null &&
               display != null && ram != null && name != null)
            {
                //Check null
                if (!String.IsNullOrEmpty(name.InnerText) && !String.IsNullOrEmpty(cpu.InnerText) &&
                    !String.IsNullOrEmpty(vga.InnerText) && !String.IsNullOrEmpty(hdd.InnerText) &&
                    !String.IsNullOrEmpty(ram.InnerText) && !String.IsNullOrEmpty(display.InnerText))
                {
                    data.Name = name.InnerText;
                    data.CPU = cpu.InnerText;
                    data.VGA = vga.InnerText;

                    //Modifed for take Price
                    if (priceXpath != null)
                    {
                        if (price != null)
                        {
                            data.Price = price.InnerText;
                        }
                        else
                        {
                            data.Price = "0";
                        }
                    }
                    else
                    {
                        data.Price = "0";
                    }
                    // modify xpath for lazada
                    if (host.Contains("lazada.vn"))
                    {
                        string patter = "RAM |/|,|-| HDD ";
                        Regex reg = new Regex(patter);
                        if (ram.InnerText.Contains(",") || ram.InnerText.Contains("/") || ram.InnerText.Contains("-"))
                        {
                            string[] spltRAMString = reg.Split(ram.InnerText);
                            data.RAM = spltRAMString[1];
                        }
                        else
                        {
                            data.RAM = ram.InnerText;
                        }
                        if (hdd.InnerText.Contains(",") || hdd.InnerText.Contains("/") || hdd.InnerText.Contains("-"))
                        {
                            string[] spltHDDString = reg.Split(hdd.InnerText);
                            data.HDD = spltHDDString[3];
                        }
                        else
                        {
                            data.HDD = hdd.InnerText;
                        }


                        imageXpath = "//*[@id='productZoom']";
                    }
                    else
                    {
                        data.HDD = hdd.InnerText;
                        data.RAM = ram.InnerText;
                    }
                    data.Display = display.InnerText;
                    data.Image = ImageHelper.TakePath(host, doc, imageXpath);
                    if (String.IsNullOrEmpty(data.Image))
                    {
                        data.Image = ImageHelper.TakePath(host, doc, imageXpath);
                    }
                }
            }
            return data;
        }

        #endregion

        // insert into DB
        #region
        public static int InserttoDb(IEnumerable<KeyValuePair<string, string>> data, string codetypeID)
        {

            int success = 0;
            double point = 0;
            using (var context = new CPS_SolutionEntities())
            {
                foreach (var pair in data)
                {

                    if (!String.IsNullOrEmpty(pair.Value.ToString()) || !String.IsNullOrWhiteSpace(pair.Value.ToString()))
                    {
                        point = Double.Parse(pair.Value);
                    }
                    else
                    {
                        point = 0;
                    }
                    ////Check good match 
                    var goodMatch = new List<int>();
                    var averageMatch = new List<int>();
                    int pId = -1;
                    bool wholeMatch = false;
                    foreach (var attADalias in context.Dictionaries)
                    {
                        if (pair.Key == attADalias.Name)
                        {
                            wholeMatch = true;
                            pId = attADalias.AttributeDicID;
                            break;
                        }
                        double matchPercent = CompareStringHelper.CompareString(attADalias.Name, pair.Key);
                        if (matchPercent > 90.00)
                        {
                            // Good match 
                            goodMatch.Add(attADalias.AttributeDicID);
                        }
                        if (matchPercent > 80.00)
                        {
                            // Normal match 
                            averageMatch.Add(attADalias.AttributeDicID);
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
                            ExportTrainingFile(goodMatch, pair.Key, pair.Value);
                            continue;
                        }
                        else if (averageMatch.Count > 0 && pId == -1)
                        {
                            // Only average match, admin decide
                            ExportTrainingFile(averageMatch, pair.Key, pair.Value);
                            continue;
                        }
                    }
                    // If attDic alr Existed? 
                    if (pId != -1)
                    {
                        var att = context.Hardwares.Where(x => x.ID == pId).FirstOrDefault();
                        att.WeightCriteraPoint = point;
                        try
                        {
                            context.SaveChanges();
                            success++;
                        }
                        catch (DbUpdateException)
                        {
                            // Do nothing
                        }


                    }
                    else
                    {
                        //Add a new record
                        var newADitem = new Hardware { Name = pair.Key, CodetypeID = codetypeID, WeightCriteraPoint = point, IsActive = true };
                        context.Hardwares.Add(newADitem);
                        try
                        {
                            context.SaveChanges();
                            success++;
                            var aliasDic = new Dictionary
                            {
                                AttributeDicID = newADitem.ID,
                                Name = newADitem.Name,
                                IsActive = true,
                            };
                            context.Dictionaries.Add(aliasDic);
                            context.SaveChanges();
                        }
                        catch (DbUpdateException)
                        {
                            // Do nothing
                        }
                    }
                }
            }
            return success;
        }
        public static void InsertProductToDb(ProductData data, ProductParserCreator model)
        {
            //create list of Att
            List<Hardware> listAttDic = new List<Hardware>();
            if (data != null)
            {
                //Convert Price
                double valPrice = 0;
                if (!String.IsNullOrEmpty(data.Price))
                {
                    valPrice = PriceHelper.ConvertPrice(data.Price);
                }
                else
                {
                    valPrice = 0;
                }


                if (!String.IsNullOrEmpty(data.Name) && !String.IsNullOrEmpty(data.CPU) &&
                    !String.IsNullOrEmpty(data.HDD) && !String.IsNullOrEmpty(data.RAM) &&
                    !String.IsNullOrEmpty(data.VGA) && !String.IsNullOrEmpty(data.Display))
                {
                    using (var context = new CPS_SolutionEntities())
                    {
                        //Add table product
                        var prod = new Product
                        {
                            Description = "Fill me ",
                            ImageURL = data.Image,
                            TotalWeightPoint = 0,
                            IsActive = null,
                        };
                        //Check for Store

                        var store = context.Stores.Where(x => model.ParseProductLink.Contains(x.StoreUrl)).FirstOrDefault();
                        int StoreID = 1;
                        string patter = "://|/";
                        Regex reg = new Regex(patter);
                        string host = reg.Split(model.ParseProductLink)[1];
                        if (store != null)
                        {
                            StoreID = store.ID;
                        }
                        else
                        {
                            var newStore = new Store
                            {
                                IsActive = false,
                                LogoImage = "default",
                                StoreUrl = host,
                                StoreName = "Chưa xác định",

                            };
                            context.Stores.Add(newStore);
                            context.SaveChanges();
                            StoreID = newStore.ID;
                        }
                        //Add alias product
                        prod.AliasProducts.Add(new AliasProduct()
                                        {
                                            Name = data.Name,
                                            URL = model.ParseProductLink,
                                            Price = valPrice,
                                            StoreID = StoreID,
                                            IsMain = true,
                                            IsActive = true,
                                            UpdateTime = DateTime.Now
                                        });
                        context.Products.Add(prod);
                        context.SaveChanges();

                        List<KeyValuePair<string, string>> listofAttributes = new List<KeyValuePair<string, string>>();

                        var cpu = new KeyValuePair<string, string>(data.CPU, "C");
                        var ram = new KeyValuePair<string, string>(data.RAM, "R");
                        var vga = new KeyValuePair<string, string>(data.VGA, "V");
                        var hdd = new KeyValuePair<string, string>(data.HDD, "H");
                        var display = new KeyValuePair<string, string>(data.Display, "D");

                        listofAttributes.Add(cpu);
                        listofAttributes.Add(ram);
                        listofAttributes.Add(hdd);
                        listofAttributes.Add(vga);
                        listofAttributes.Add(display);

                        //add 5 attribute for 1 product
                        foreach (var attribute in listofAttributes)
                        {

                            ////Check good match 
                            var goodMatch = new List<int>();
                            var averageMatch = new List<int>();
                            int pId = -1;
                            bool wholeMatch = false;

                            foreach (var alias in context.Dictionaries)
                            {
                                if (attribute.Key == alias.Name)
                                {
                                    wholeMatch = true;
                                    pId = alias.AttributeDicID;
                                    break;
                                }
                                double matchPercent = CompareStringHelper.CompareString(attribute.Key, alias.Name);
                                //good match
                                if (matchPercent > 90)
                                {
                                    goodMatch.Add(alias.AttributeDicID);
                                }
                                // normal Match
                                if (matchPercent > 80)
                                {
                                    averageMatch.Add(alias.AttributeDicID);
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
                                    ExportTrainingFileForProduct(goodMatch, attribute.Key, prod.ID);
                                    continue;
                                }
                                else if (averageMatch.Count > 0 && pId == -1)
                                {
                                    // Only average match, admin decide
                                    ExportTrainingFileForProduct(averageMatch, attribute.Key, prod.ID);
                                    continue;
                                }
                            }

                            // If attDic alr Existed? 
                            if (pId != -1)
                            {
                                var productAtt = new ProductAttribute
                                {
                                    ProductID = prod.ID,
                                    AttributeID = pId,
                                    IsActive = true
                                };
                                context.ProductAttributes.Add(productAtt);
                                context.SaveChanges();
                            }
                            else
                            {
                                //Add a new record
                                var newADitem = new Hardware { Name = attribute.Key, CodetypeID = attribute.Value, WeightCriteraPoint = 0 };

                                // Add new item for Product Attribute
                                var productAtt = new ProductAttribute
                                {
                                    ProductID = prod.ID,
                                    AttributeID = newADitem.ID,
                                };
                                try
                                {
                                    // Save change into DB
                                    context.Hardwares.Add(newADitem);
                                    context.ProductAttributes.Add(productAtt);
                                    context.SaveChanges();
                                    var aliasDic = new Dictionary
                                    {
                                        AttributeDicID = newADitem.ID,
                                        Name = newADitem.Name,
                                        IsActive = true,
                                    };
                                    context.Dictionaries.Add(aliasDic);
                                    context.SaveChanges();
                                }
                                catch (DbUpdateException)
                                {
                                    // Do nothing
                                }
                            }
                        }
                    }
                }
            }
        }
        #endregion
        // Process File
        #region
        public static void ExportTrainingFile(List<int> match, string name, string point)
        {
            List<string> data = ReadDataFromFile();
            string path = ConstantManager.TrainingFilePath;
            string content = "";
            string Loai = "";
            using (var context = new CPS_SolutionEntities())
            {
                foreach (int id in match)
                {
                    var attAD = context.Hardwares.FirstOrDefault(a => a.ID == id);
                    if (attAD != null)
                    {
                        content = "0~" + attAD.Name + "|" + attAD.CodetypeID + "|" + attAD.WeightCriteraPoint + '|' + attAD.ID + "#";
                        Loai = attAD.CodetypeID;

                    }
                }
            }
            content += name + "|" + Loai + "|" + point + '|' + '0';
            bool isExisted = false;
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
                using (StreamWriter writer = File.AppendText(path))
                {
                    writer.WriteLine(content);
                }
            }
        }
        public static void ExportTrainingFileForProduct(List<int> match, string name, int newProductID)
        {
            List<string> data = ReadDataFromFileForProduct();
            string path = ConstantManager.TrainingFilePathForProduct;
            string content = "";
            string loai = "";
            using (var context = new CPS_SolutionEntities())
            {
                foreach (int id in match)
                {
                    var attAD = context.Hardwares.FirstOrDefault(a => a.ID == id);
                    if (attAD != null)
                    {
                        content = newProductID + "~" + attAD.Name + '|' + attAD.CodetypeID + '|' + attAD.WeightCriteraPoint + '|' + attAD.ID + "#";
                        loai = attAD.CodetypeID;
                    }
                }
            }
            content += name + '|' + loai + '|' + '0' + '|' + '0';
            bool isExisted = false;
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
                using (StreamWriter writer = File.AppendText(path))
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
        private static List<string> ReadDataFromFileForProduct()
        {
            string path = ConstantManager.TrainingFilePathForProduct;
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
        #endregion

        private static string ReplaceUntable(string data, string splitOne, string replaceOne)
        {
            string result = data.Replace(splitOne, replaceOne);
            return result;
        }
        public static void UpdatePriceParser(int id, string parserLink)
        {
            // Create Firefox browser
            var web = new HtmlWeb { UserAgent = "Mozilla/5.0 (Windows NT 6.1; rv:26.0) Gecko/20100101 Firefox/26.0" };
            //do more to get data
            var uri = new Uri(parserLink);
            string host = uri.GetLeftPart(UriPartial.Authority);
            using (var context = new CPS_SolutionEntities())
            {
                var parseinfo = context.ParseInfoes.Where(p => p.IsActive && p.Parselink.Contains(host)).FirstOrDefault();
                var data = GetProductData(web, parseinfo);
                UpdatePriceToDb(id, data);
            }
        }
        public static void UpdatePriceToDb(int productID, ProductData data)
        {
            ConstantManager.IsUpdateRunning = true;
            //Convert Price
            double valPrice = 0;
            if (!String.IsNullOrEmpty(data.Price))
            {
                valPrice = PriceHelper.ConvertPrice(data.Price);
            }
            else
            {
                valPrice = 0;
            }
            using (var context = new CPS_SolutionEntities())
            {
                var alias = context.AliasProducts.Where(x => x.ID == productID).FirstOrDefault();
                if (alias != null)
                {
                    alias.Price = valPrice;
                    alias.UpdateTime = DateTime.Now;
                    context.SaveChanges();
                }
                ConstantManager.IsUpdateRunning = false;
            }
        }
    }
}