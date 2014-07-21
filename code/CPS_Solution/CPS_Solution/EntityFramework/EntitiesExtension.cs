using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.EntityFramework;
namespace CPS_Solution.EntityFramework
{
    public partial class Product
    {
        private int _cpuId;
        private int _hddId;
        private int _vgaId;
        private int _displayId;
        private int _ramId;
        private double _price;
        private string _cpuName;
        private string _hddName;
        private string _vgaName;
        private string _displayName;
        private string _ramName;
        private string _name;
        private string _productURL;
        private int _cpuScore;
        private int _vgaScore;
        private int _ramScore;
        private int _hddScore;
        private int _displayScore;
        private int _sellPlace;

        private CPS_SolutionEntities context = new CPS_SolutionEntities();

        public String URL
        {
            get
            {
                if (AliasProducts != null && AliasProducts.Count > 0)
                {
                    var mainAlias = AliasProducts.FirstOrDefault(ali => ali.IsMain.Value);
                    if (mainAlias != null)
                    {
                        return mainAlias.URL;
                    }
                }
                return _productURL;
            }
            set
            {
                this._productURL = value;
            }
        }
        public String Name
        {
            get
            {
                if (AliasProducts != null && AliasProducts.Count > 0)
                {
                    var mainAlias = AliasProducts.FirstOrDefault(ali => ali.IsMain.Value && ali.IsActive ==true);
                    if (mainAlias != null)
                    {
                        return mainAlias.Name;
                    }
                }
                return _name;
            }
            set
            {
                this._name = value;
            }
        }
        public int CpuID
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "C" && dic.ID == attribute.AttributeID)
                        {
                            return dic.ID;
                        }
                    }
                }
                return _cpuId;
            }
            set { this._cpuId = value; }
        }
        public int HddID
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "H" && dic.ID == attribute.AttributeID)
                        {
                            return dic.ID;
                        }
                    }
                }
                return _hddId;
            }
            set { this._hddId = value; }
        }
        public int VgaID
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "V" && dic.ID == attribute.AttributeID)
                        {
                            return dic.ID;
                        }

                    }
                }
                return _vgaId;
            }
            set { this._vgaId = value; }
        }
        public int RamID
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "R" && dic.ID == attribute.AttributeID)
                        {
                            return dic.ID;
                        }
                    }
                }
                return _ramId;
            }
            set { this._ramId = value; }
        }
        public int DisplayID
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "D" && dic.ID == attribute.AttributeID)
                        {
                            return dic.ID;
                        }
                    }
                }
                return _displayId;
            }
            set { this._displayId = value; }
        }

        public int SellPlacers 
        {
            get 
            {
                var productAlias = AliasProducts.Where(x => x.ProductID == ID && x.IsActive==true).ToList();
                return productAlias.Count;
            }
            set { this._sellPlace = value; }
        }

        public string strCPU
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "C" && dic.ID == attribute.AttributeID)
                        {
                            return dic.Name;
                        }
                    }
                }
                return _cpuName;
            }
        }
        public string strVGA
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "V" && dic.ID == attribute.AttributeID)
                        {
                            return dic.Name;
                        }
                    }
                }
                return _vgaName;
            }
        }
        public string strRAM
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "R" && dic.ID == attribute.AttributeID)
                        {
                            return dic.Name;
                        }
                    }
                }
                return _ramName;
            }
        }
        public string strHDD
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "H" && dic.ID == attribute.AttributeID)
                        {
                            return dic.Name;
                        }
                    }
                }
                return _hddName;
            }
        }
        public string strDisplay
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "D" && dic.ID == attribute.AttributeID)
                        {
                            return dic.Name;
                        }
                    }
                }
                return _displayName;
            }
        }

        public int cpuScore
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "C" && dic.ID == attribute.AttributeID)
                        {
                            return (int)dic.WeightCriteraPoint;
                        }
                    }
                }
                return _cpuScore;
            }
        }
        public int vgaScore
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "V" && dic.ID == attribute.AttributeID)
                        {
                            return (int)dic.WeightCriteraPoint;
                        }
                    }
                }
                return _vgaScore;
            }
        }
        public int ramScore
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "R" && dic.ID == attribute.AttributeID)
                        {
                            return (int)dic.WeightCriteraPoint;
                        }
                    }
                }
                return _ramScore;
            }
        }
        public int hddScore
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "H" && dic.ID == attribute.AttributeID)
                        {
                            return (int)dic.WeightCriteraPoint;
                        }
                    }
                }
                return _hddScore;
            }
        }
        public int displayScore
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.Hardwares.ToList();
                foreach (var attribute in attributes)
                {
                    foreach (var dic in attDictionarys)
                    {
                        if (dic.CodetypeID == "D" && dic.ID == attribute.AttributeID)
                        {
                            return (int)dic.WeightCriteraPoint;
                        }
                    }
                }
                return _displayScore;
            }
        }
        public double Price
        {
            get
            {
                if (AliasProducts != null && AliasProducts.Count > 0)
                {
                    var mainAlias = AliasProducts.FirstOrDefault(ali => ali.IsMain.Value);
                    if (mainAlias != null)
                    {
                        if (mainAlias.Price.HasValue)
                        {
                            return mainAlias.Price.Value;
                        }
                        else
                        {
                            return 0;
                        }
                    }
                }
                return _price;
            }
            set
            {
                this._price = value;
            }
        }

    }
}