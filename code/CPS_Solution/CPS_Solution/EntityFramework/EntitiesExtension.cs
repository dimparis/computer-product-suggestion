using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CPS_Solution.EntityFramework
{
    public partial class Product
    {
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
    }
}