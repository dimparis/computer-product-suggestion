using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using HtmlAgilityPack;
using CPS_Solution.CommonClass;
namespace CPS_Solution.Areas.Admin.Helpers
{
    public static class ImageHelper
    {
        public static string DownloadImage(string urlImage, string fileName)
        {
            string remoteImgPath = urlImage;
            try
            {
                var remoteImgPathUri = new Uri(remoteImgPath);
                string remoteImgPathWithoutQuery = remoteImgPathUri.GetLeftPart(UriPartial.Path);
                string fileExtension = Path.GetExtension(remoteImgPathWithoutQuery); // .jpg, .png

                string folder = DateTime.Now.ToString("yyyyMMdd");
                string uploadPath = AppDomain.CurrentDomain.BaseDirectory + "Images\\I\\" + folder;
                if (!Directory.Exists(uploadPath))
                {
                    Directory.CreateDirectory(uploadPath);
                }

                string localPathFull = AppDomain.CurrentDomain.BaseDirectory + "Images\\I\\" + folder + "\\" + fileName + fileExtension;

                var webClient = new WebClient();
                webClient.DownloadFile(remoteImgPath, localPathFull);
                return "images/I/" + "/" + folder + "/" + fileName + fileExtension;
            }
            catch (Exception ex)
            {
                return ConstantManager.DefaultImage;
            }
        }
        public static string TakePath(string host, HtmlDocument doc, string imageXpath)
        {
            var node = doc.DocumentNode.SelectSingleNode(imageXpath);
            string now = DateTime.Now.ToString("yyyyMMdd-HHmmss");
            string filename = "Laptop" + now;
            if (node != null)
            {
                if (node.Attributes["src"] != null)
                {
                    string tmp = node.Attributes["src"].Value;
                    if (tmp.StartsWith("/"))
                    {
                        tmp = host + tmp;
                        node.Attributes["src"].Value = tmp;
                    }
                    else if (tmp.StartsWith("image"))
                    {
                        tmp = host + "/" + tmp;
                        node.Attributes["src"].Value = tmp;
                    }
                    string Imageurl = node.Attributes["src"].Value;
                    string ImageName = DownloadImage(Imageurl, filename);
                    return ImageName;
                }
            }

            return ConstantManager.DefaultImage;
        }
        public static string TakePathPreview(string host, HtmlDocument doc, string imageXpath)
        {
            var node = doc.DocumentNode.SelectSingleNode(imageXpath);
            string now = DateTime.Now.ToString("yyyyMMdd-HHmmss");
            string filename = "Laptop" + now;
            if (node != null)
            {
                if (node.Attributes["src"] != null)
                {
                    string tmp = node.Attributes["src"].Value;
                    if (tmp.StartsWith("/"))
                    {
                        tmp = host + tmp;
                        node.Attributes["src"].Value = tmp;
                    }
                    else if (tmp.StartsWith("image"))
                    {
                        tmp = host + "/" + tmp;
                        node.Attributes["src"].Value = tmp;
                    }
                    string Imageurl = node.Attributes["src"].Value;
                    return Imageurl;
                }
            }
            return ConstantManager.DefaultImage;
        }
    }

}