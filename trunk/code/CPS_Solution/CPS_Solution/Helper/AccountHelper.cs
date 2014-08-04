using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.Models;
using CPS_Solution.EntityFramework;
using System.Web.Security;
namespace CPS_Solution.Helper
{
    public class AccountHelper
    {
        public void CreateAccount(RegisterModel model)
        {
            using (var context = new CPS_SolutionEntities())
            {
                // Duplicate account
                var account = context.Accounts.FirstOrDefault(x => x.Username == model.UserName);
                if (account != null)
                {
                    throw new MembershipCreateUserException(MembershipCreateStatus.DuplicateUserName);
                }
                // Duplicate email
                var email = context.Accounts.FirstOrDefault(x => x.Email == model.Email);
                if(email !=null)
                {
                    throw new MembershipCreateUserException(MembershipCreateStatus.DuplicateEmail);
                }

                var newUser = new Account
                {
                    Username = model.UserName,
                    Password = model.Password,
                    RoleID = model.RoleId,
                    Email = model.Email,
                    IsActive = true
                };
                context.Accounts.Add(newUser);
                context.SaveChanges();
            }
        }
    }
}