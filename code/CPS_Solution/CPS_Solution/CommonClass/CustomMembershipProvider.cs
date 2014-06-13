using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.EntityFramework;
using WebMatrix.WebData;
using System.Web.Security;
namespace CPS_Solution.CommonClass
{
    public class CustomMembershipProvider:SimpleMembershipProvider
    {
        public override bool ValidateUser(string username, string password)
        {
            using (var context = new CPS_SolutionEntities())
            {
                var user = context.Accounts.FirstOrDefault(x => x.Username == username && x.Password == password);
                if (user != null)
                {
                    return true;
                }
                return false;
            }
        }
    }
}