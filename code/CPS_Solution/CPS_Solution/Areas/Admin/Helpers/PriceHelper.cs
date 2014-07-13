using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CPS_Solution.Areas.Admin.Helpers
{
    public class PriceHelper
    {
        public static double ConvertPrice(string price)
        {
            string result = "";
            int count = 0;
            foreach (char c in price)
            {
                if (Char.IsDigit(c))
                {
                    result += c;
                    count++;
                }
                if (!Char.IsDigit(c) && count > 1 && !Char.IsWhiteSpace(c) && c != '.' && c != ',')
                {
                    break;
                }
            }
            double tmp = Double.Parse(result);
            return tmp;
        }
    }
}