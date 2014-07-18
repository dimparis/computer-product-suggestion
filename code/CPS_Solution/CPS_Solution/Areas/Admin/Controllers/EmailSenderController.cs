using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace CPS_Solution.Areas.Admin.Controllers
{
    public class EmailSenderController : Controller
    {
        //
        // GET: /Admin/EmailSender/

        public ActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// Send mail after staff confirm
        /// </summary>
        /// <param name="address">địa chỉ email khách hàng</param>
        /// <param name="subject">subject</param>
        /// <param name="message">tên laptop đã được confirm</param>
        public void SendEmail(string address, string subject, string lapName)
        {
            string email = "latopsuggestion@gmail.com"; string password = "latopsuggestion1";
            string message = "Laptop "+lapName+" mà bạn gợi ý cho hệ thống hiện đã được chúng tôi cập nhập"+
                "\n Xin hãy vào địa chỉ để xem lại" + "http://localhost:28758/";

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
            smtpClient.Credentials = loginInfo; smtpClient.Send(msg);
        }


    }
}
