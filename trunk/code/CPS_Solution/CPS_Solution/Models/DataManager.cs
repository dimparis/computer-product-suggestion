﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.EntityFramework;
namespace CPS_Solution.Models
{
    public class DataManager
    {
        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        public List<Product> GetProducts(int BlockNumber, int BlockSize)
        {
            int startIndex = (BlockNumber - 1) * BlockSize;
            var products = context.Products.Where(x => x.IsActive == true).OrderBy(x=>x.ID).Skip(startIndex).Take(BlockSize).ToList();
            return products;
        }
        public class JsonModel
        {
            public string HTMLString { get; set; }
            public bool NoMoreData { get; set; }
        }
    }
}