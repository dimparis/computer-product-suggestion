using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebMatrix.WebData;
using CPS_Solution.EntityFramework;
using System.Data.Entity;
namespace CPS_Solution.CommonClass
{
    public class CustomRoleProvinder : SimpleRoleProvider
    {
             public override bool IsUserInRole(string username, string roleName)
        {
            bool result = false;
            using (var context = new CPS_SolutionEntities())
            {
                var user = context.Accounts
                    .Include(x => x.Role)
                    .FirstOrDefault(x => x.Username == username);
                if (user != null)
                {
                    if (user.Role.Rolename == roleName)
                    {
                        result = true;
                    }
                }
            }
            return result;
        }

        public override string[] GetRolesForUser(string username)
        {
            var result = new string[1];
            using (var context = new CPS_SolutionEntities())
            {
                var user = context.Accounts
                    .Include(x => x.Role)
                    .FirstOrDefault(x => x.Username == username);
                if (user != null)
                {
                    result[0] = user.Role.Rolename;
                }
            }
            return result;
        }
    }
}