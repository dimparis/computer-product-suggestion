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

        private string _cpuName;
        private string _hddName;
        private string _vgaName;
        private string _displayName;
        private string _ramName;



        private CPS_SolutionEntities context = new CPS_SolutionEntities();
        public String Name
        {
            get
            {
                if (ProductAlias != null && ProductAlias.Count > 0)
                {
                    var mainAlias = ProductAlias.FirstOrDefault(ali => ali.IsMain.Value);
                    if (mainAlias != null)
                    {
                        return mainAlias.Name;
                    }
                }
                return "No name";
            }
        }
        public int CpuID
        {
            get
            {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.AttributeDictionaries.ToList();
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
                var attDictionarys = context.AttributeDictionaries.ToList();
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
                var attDictionarys = context.AttributeDictionaries.ToList();
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
                var attDictionarys = context.AttributeDictionaries.ToList();
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
                var attDictionarys = context.AttributeDictionaries.ToList();
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

        public string strCPU {
            get {
                var attributes = ProductAttributes.Where(x => x.ProductID == ID).ToList();
                var attDictionarys = context.AttributeDictionaries.ToList();
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
                var attDictionarys = context.AttributeDictionaries.ToList();
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
                var attDictionarys = context.AttributeDictionaries.ToList();
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
                var attDictionarys = context.AttributeDictionaries.ToList();
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
                var attDictionarys = context.AttributeDictionaries.ToList();
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
    }
}