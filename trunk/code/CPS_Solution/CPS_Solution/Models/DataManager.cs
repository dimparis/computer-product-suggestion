using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.EntityFramework;
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
            var products = context.Products.Where(x => x.IsActive == true).OrderBy(x=>x.ID).Skip(startIndex).Take(BlockSize).ToList();
            return products;
        }
        public List<Product> GetProductsByName(int BlockNumber, int BlockSize,string searchValue)
        {
            int startIndex = (BlockNumber - 1) * BlockSize;
            var temp = context.Products.Where(x => x.IsActive == true).ToList();
            if (searchValue != null)
            {
                var filter = temp.Where(x => x.Name.ToUpper().Contains(searchValue.ToUpper()));
                int count = filter.Count();
                var products = filter.Where(x => x.IsActive == true).OrderBy(x => x.ID).Skip(startIndex).Take(BlockSize).ToList();
                int c = products.Count();
                return products;
            }
            else 
            {
                var filter = temp;
                var products = filter.Where(x => x.IsActive == true).OrderBy(x => x.ID).Skip(startIndex).Take(BlockSize).ToList();
                return products;
            }
        }
        public List<Product> GetProductsByPrice(int BlockNumber, int BlockSize,int brandID,int value)
        {
            List<Product> ListOFProducts = new List<Product>();
            int startIndex = (BlockNumber - 1) * BlockSize;
            var temp = context.Products.Where(x => x.IsActive == true).ToList();
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
    }
}