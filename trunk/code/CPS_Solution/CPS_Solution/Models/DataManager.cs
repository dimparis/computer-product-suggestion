﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.EntityFramework;
using CPS_Solution.CommonClass;
using System.IO;
namespace CPS_Solution.Models
{
    public class DataManager
    {
        private const double _8M = 8000000;
        private const double _10M = 10000000;
        private const double _13M = 13000000;
        private const double _16M = 16000000;
        private const double _20M = 20000000;
        private const double _25M = 25000000;

        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        public List<Product> GetProducts(int BlockNumber, int BlockSize)
        {
            int startIndex = (BlockNumber - 1) * BlockSize;
            var products =
                new DataManager().Check5AttributeLoad(context.Products.Where(x => x.IsActive == true).ToList());
            var filters = products.OrderBy(x => x.TotalWeightPoint).Skip(startIndex).Take(BlockSize).ToList();
            return filters;
        }
        public List<Product> GetProductsByName(int BlockNumber, int BlockSize, string searchValue)
        {
            DataManager dataManager = new DataManager();
            int startIndex = (BlockNumber - 1) * BlockSize;
            var temp =
               dataManager.Check5AttributeLoad(context.Products.Where(x => x.IsActive == true).ToList());
            List<Product> ListOfNone = new List<Product>();
            if (searchValue != null)
            {
                var filter = temp.Where(x => x.Name.ToUpper().Contains(searchValue.ToUpper()));
                var products = filter.Where(x => x.IsActive == true).OrderBy(x => x.ID).Skip(startIndex).Take(BlockSize).ToList();
                if (products.Any())
                {
                    return products;
                }
                else if (!products.Any())
                {
                    var listNone = context.AliasProducts.Where(x => x.IsActive == true && x.IsMain ==false).OrderBy(x=>x.ProductID).ToList();
                    var filterNone = listNone.Where(x => x.Name.ToUpper().Contains(searchValue.ToUpper())).ToList();
                    ListOfNone = dataManager.Check5AttributeLoadAnotherName(filterNone).OrderBy(x => x.ID).Skip(startIndex).Take(BlockSize).ToList();
                    if (!ListOfNone.Any())
                    {
                        WriteToNoResultFile(searchValue);
                        //write to log file
                    }
                    return ListOfNone;
                }               
                return products;
            }
            else
            {
                var filter = temp;
                var products = filter.Where(x => x.IsActive == true).OrderBy(x => x.ID).Skip(startIndex).Take(BlockSize).ToList();
                return products;
            }
        }
        public List<Product> GetProductsByPrice(int BlockNumber, int BlockSize, int brandID, int value)
        {
            var ListOFProducts = new List<Product>();
            int startIndex = (BlockNumber - 1) * BlockSize;
            var temp = new DataManager().Check5AttributeLoad(context.Products.Where(x => x.IsActive == true).ToList());
            if (brandID != 13)
            {
                // Price from  < 8 mil
                if (value == 1)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID && x.Price < _8M).ToList();
                    ListOFProducts = filterProduct;
                }
                // Price from   8 mil < 10 mil
                else if (value == 2)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID
                       && x.Price > _8M
                       && x.Price <= _10M).ToList();
                    ListOFProducts = filterProduct;
                }
                // Price from   10 mil < 13 mil
                else if (value == 3)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID
                        && x.Price > _10M
                        && x.Price <= _13M).ToList();
                    ListOFProducts = filterProduct;
                }
                // Price from   13 mil < 16 mil
                else if (value == 4)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID
                        && x.Price > _13M
                        && x.Price <= _16M).ToList();
                    ListOFProducts = filterProduct;
                }
                // Price from   16 mil < 20 mil
                else if (value == 5)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID
                       && x.Price > _16M
                       && x.Price <= _20M).ToList();
                    ListOFProducts = filterProduct;
                }
                // Price from   20 mil < 25 mil
                else if (value == 6)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID
                        && x.Price > _20M
                        && x.Price <= _25M).ToList();
                    ListOFProducts = filterProduct;
                }
                // Price from   > 25 mil
                else if (value == 7)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID
                        && x.Price > _25M).ToList();
                    ListOFProducts = filterProduct;
                }
                else if (value == 8)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID).ToList();
                    ListOFProducts = filterProduct;
                }
                var products = ListOFProducts.Where(x => x.IsActive == true).OrderBy(x => x.ID).Skip(startIndex).Take(BlockSize).ToList();
                return products;
            }
            else
            {
                // Price from  < 8 mil
                if (value == 1)
                {
                    var filterProduct = temp.Where(x => x.Price < _8M).ToList();
                    ListOFProducts = filterProduct;
                }
                // Price from   8 mil < 10 mil
                else if (value == 2)
                {
                    var filterProduct = temp.Where(x => x.Price > _8M
                       && x.Price <= _10M).ToList();
                    ListOFProducts = filterProduct;
                }
                // Price from   10 mil < 13 mil
                else if (value == 3)
                {
                    var filterProduct = temp.Where(x => x.Price > _10M
                        && x.Price <= _13M).ToList();
                    ListOFProducts = filterProduct;
                }
                // Price from   13 mil < 16 mil
                else if (value == 4)
                {
                    var filterProduct = temp.Where(x => x.Price > _13M
                        && x.Price <= _16M).ToList();
                    ListOFProducts = filterProduct;
                }
                // Price from   16 mil < 20 mil
                else if (value == 5)
                {
                    var filterProduct = temp.Where(x => x.Price > _16M
                       && x.Price <= _20M).ToList();
                    ListOFProducts = filterProduct;
                }
                // Price from   20 mil < 25 mil
                else if (value == 6)
                {
                    var filterProduct = temp.Where(x => x.Price > _20M
                        && x.Price <= _25M).ToList();
                    ListOFProducts = filterProduct;
                }
                // Price from   > 25 mil
                else if (value == 7)
                {
                    var filterProduct = temp.Where(x => x.Price > _25M).ToList();
                    ListOFProducts = filterProduct;
                }
                else if (value == 8)
                {
                    ListOFProducts = temp;
                }
                var products = ListOFProducts.Where(x => x.IsActive == true).OrderBy(x => x.ID).Skip(startIndex).Take(BlockSize).ToList();
                return products;
            }
        }
        public class JsonModel
        {
            public string HTMLString { get; set; }
            public bool NoMoreData { get; set; }
        }
        public List<Product> Check5AttributeLoad(List<Product> products)
        {
            var listOfValuableId = new List<int>();
            foreach (var item in products)
            {
                int havepointCount = 0;
                var aliasProduct = context.AliasProducts.FirstOrDefault(x => x.IsActive && x.IsMain == true && x.ProductID == item.ID);
                if (aliasProduct != null)
                {
                    var countElement = context.ProductAttributes.Where(x => x.ProductID == aliasProduct.ProductID).ToList();
                    if (countElement.Count() >= 5)
                    {
                        foreach (var itemCount in countElement)
                        {
                            var itemHardware = context.Hardwares.FirstOrDefault(x => x.ID == itemCount.AttributeID);
                            if (itemHardware != null)
                            {
                                if (itemHardware.WeightCriteraPoint > 0)
                                {
                                    havepointCount++;
                                }
                            }
                        }
                    }
                }
                if (havepointCount >= 5)
                {
                    listOfValuableId.Add(item.ID);
                    havepointCount = 0;
                }
            }
            var listProducts = new List<Product>();
            foreach (var i in listOfValuableId)
            {
                var product = context.Products.FirstOrDefault(x => x.ID == i);
                listProducts.Add(product);
            }

            return listProducts.OrderBy(x => x.TotalWeightPoint).ToList();
        }
        public List<Product> Check5AttributeLoadAnotherName(List<AliasProduct> products)
        {
            var listOfValuableId = new List<int>();
            foreach (var item in products)
            {
                if (products.Any())
                {
                    var countElement = context.ProductAttributes.Where(x => x.ProductID == item.ProductID).ToList();
                    if (countElement.Count() >= 5)
                    {
                        listOfValuableId.Add(item.ProductID);
                    }
                }
            }
            var listProducts = new List<Product>();
            foreach (var i in listOfValuableId.Distinct())
            {
                var product = context.Products.FirstOrDefault(x => x.ID == i);
                listProducts.Add(product);
            }
            return listProducts.OrderBy(x => x.TotalWeightPoint).ToList();
        }
        public List<Product> Check5AttributeLoadTrueName(List<AliasProduct> products)
        {
            var listOfValuableId = new List<int>();
            foreach (var item in products)
            {
                int havePoint = 0;
                if (products.Any())
                {
                    var countElement = context.ProductAttributes.Where(x => x.ProductID == item.ProductID).ToList();
                    if (countElement.Count() >= 5)
                    {
                        foreach (var countItem in countElement) 
                        {
                            if (countItem.Hardware.WeightCriteraPoint > 0) 
                            {
                                havePoint++;
                            }
                        }
                        if (havePoint >= 5) 
                        {
                            listOfValuableId.Add(item.ProductID);
                        } 
                    }
                }
            }
            var listProducts = new List<Product>();
            foreach (var i in listOfValuableId)
            {
                var product = context.Products.FirstOrDefault(x => x.ID == i);
                listProducts.Add(product);
            }
            return listProducts.OrderBy(x => x.TotalWeightPoint).ToList();
        }
        public List<Product> ListOfTop3ProductbyPrice(int brandID, int value)
        {
            var listOFProducts = new List<Product>();
            var temp = new DataManager().Check5AttributeLoad(context.Products.Where(x => x.IsActive == true).ToList());
            if (brandID != 13)
            {
                // Price from  < 8 mil
                if (value == 1)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID && x.Price < _8M).ToList();
                    listOFProducts = filterProduct;
                }
                // Price from   8 mil < 10 mil
                else if (value == 2)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID
                       && x.Price > _8M
                       && x.Price <= _10M).ToList();
                    listOFProducts = filterProduct;
                }
                // Price from   10 mil < 13 mil
                else if (value == 3)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID
                        && x.Price > _10M
                        && x.Price <= _13M).ToList();
                    listOFProducts = filterProduct;
                }
                // Price from   13 mil < 16 mil
                else if (value == 4)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID
                        && x.Price > _13M
                        && x.Price <= _16M).ToList();
                    listOFProducts = filterProduct;
                }
                // Price from   16 mil < 20 mil
                else if (value == 5)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID
                       && x.Price > _16M
                       && x.Price <= _20M).ToList();
                    listOFProducts = filterProduct;
                }
                // Price from   20 mil < 25 mil
                else if (value == 6)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID
                        && x.Price > _20M
                        && x.Price <= _25M).ToList();
                    listOFProducts = filterProduct;
                }
                // Price from   > 25 mil
                else if (value == 7)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID
                        && x.Price > _25M).ToList();
                    listOFProducts = filterProduct;
                }
                else if (value == 8)
                {
                    var filterProduct = temp.Where(x => x.BrandID == brandID).ToList();
                    listOFProducts = filterProduct;
                }
                return listOFProducts;
            }
            else
            {
                // Price from  < 8 mil
                if (value == 1)
                {
                    var filterProduct = temp.Where(x => x.Price < _8M).ToList();
                    listOFProducts = filterProduct;
                }
                // Price from   8 mil < 10 mil
                else if (value == 2)
                {
                    var filterProduct = temp.Where(x => x.Price > _8M
                       && x.Price <= _10M).ToList();
                    listOFProducts = filterProduct;
                }
                // Price from   10 mil < 13 mil
                else if (value == 3)
                {
                    var filterProduct = temp.Where(x => x.Price > _10M
                        && x.Price <= _13M).ToList();
                    listOFProducts = filterProduct;
                }
                // Price from   13 mil < 16 mil
                else if (value == 4)
                {
                    var filterProduct = temp.Where(x => x.Price > _13M
                        && x.Price <= _16M).ToList();
                    listOFProducts = filterProduct;
                }
                // Price from   16 mil < 20 mil
                else if (value == 5)
                {
                    var filterProduct = temp.Where(x => x.Price > _16M
                       && x.Price <= _20M).ToList();
                    listOFProducts = filterProduct;
                }
                // Price from   20 mil < 25 mil
                else if (value == 6)
                {
                    var filterProduct = temp.Where(x => x.Price > _20M
                        && x.Price <= _25M).ToList();
                    listOFProducts = filterProduct;
                }
                // Price from   > 25 mil
                else if (value == 7)
                {
                    var filterProduct = temp.Where(x => x.Price > _25M).ToList();
                    listOFProducts = filterProduct;
                }
                else if (value == 8)
                {
                    listOFProducts = temp;
                }
                return listOFProducts;
            }
        }
        // Truncates a body of text (string) to the desired size.
        public string Truncate(string input, int characterLimit)
        {
            string output = input;


            // Check if the string is longer than the allowed amount otherwise do nothing.
            if (output.Length > characterLimit && characterLimit > 0)
            {


                // Cut the string down to the maximum number of characters.
                output = output.Substring(0, characterLimit);


                // Check if the character right after the truncate point was a space
                // if not, we are in the middle of a word and need to remove the rest of it
                if (input.Substring(output.Length, 1) != " ")
                {
                    int LastSpace = output.LastIndexOf(" ");


                    // If we found a space then, cut back to that space.
                    if (LastSpace != -1)
                    {
                        output = output.Substring(0, LastSpace);
                    }
                }
                // Finally, add the "..."
                output += "...";
            }
            return output;
        }
        public void WriteToNoResultFile(string value)
        {
            List<string> data = ReadDataFromNoResultFile();
            string path = ConstantManager.NoResultFilePath;
            string content = DateTime.Now.ToShortDateString() + " - " + DateTime.Now.ToShortTimeString() + " | Từ khóa: " + value;
            using (StreamWriter writer = System.IO.File.AppendText(path))
            {
                writer.WriteLine(content);
            }
        }
        private static List<string> ReadDataFromNoResultFile()
        {
            string path = ConstantManager.NoResultFilePath;
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