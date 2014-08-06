using System;
using System.Collections.Generic;
using System.Linq;
using Quartz;
using CPS_Solution.EntityFramework;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
namespace CPS_Solution.CommonClass
{
    public class AutoSendMail : IJob
    {
        private CPS_SolutionEntities db = new CPS_SolutionEntities();
        public void Execute(IJobExecutionContext context)
        {
            var recommendProducts = db.RecommendProducts.Where(x => x.IsMailSent == false &&
                x.IsReceive == true && x.IsApprove == true).ToList();
            AutoSendMailforUser(recommendProducts);
        }
        public void SendEmail(string address, string subject, string lapName, string productID)
        {
            string email = "latopsuggestion@gmail.com"; string password = "latopsuggestion1";
            string message = "Laptop " + lapName + ":" + " mà bạn gợi ý cho hệ thống hiện đã được chúng tôi cập nhập" +
                "\n Xin hãy vào địa chỉ để xem tại " + "http://localhost:28758/Product/Details?ID=" + productID;

            var loginInfo = new NetworkCredential(email, password);
            var msg = new MailMessage();
            var smtpClient = new SmtpClient("smtp.gmail.com", 587);

            msg.From = new MailAddress(email);
            msg.To.Add(new MailAddress(address));
            msg.Subject = subject;
            msg.Body = message;
            msg.IsBodyHtml = true;

            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            try
            {
                smtpClient.Credentials = loginInfo; smtpClient.Send(msg);
            }
            catch (Exception ex)
            {
               //donothing.
            }
        }
        public void AutoSendMailforUser(List<RecommendProduct> rcmProducts)
        {
            List<int> mailSent = new List<int>();
            foreach (var item in rcmProducts)
            {
                int havepointCount = 0;
                var aliasProducts = db.AliasProducts.FirstOrDefault(x => x.IsActive == true && x.IsMain == true && item.Parselink.Contains(x.URL));
                if (aliasProducts != null)
                {
                    var countElement = db.ProductAttributes.Where(x => x.ProductID == aliasProducts.ProductID).ToList();
                    if (countElement.Count() >= 5)
                    {
                        foreach (var itemCount in countElement)
                        {
                            var itemHardware = db.Hardwares.FirstOrDefault(x => x.ID == itemCount.AttributeID);
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
                    Task.Factory.StartNew(() => SendEmail(item.Email, "CPS- Đề xuất sản phẩm", aliasProducts.Name, aliasProducts.ProductID.ToString()));
                    mailSent.Add(item.ID);
                }
            }
            foreach (var i in mailSent)
            {
                var itemRecommendMailSent = db.RecommendProducts.FirstOrDefault(x => x.ID == i);
                if (itemRecommendMailSent != null) itemRecommendMailSent.IsMailSent = true;
            }
            db.SaveChanges();
        }
    }
}