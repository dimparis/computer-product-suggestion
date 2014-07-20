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
            string message = "Laptop " + lapName + " mà bạn gợi ý cho hệ thống hiện đã được chúng tôi cập nhập" +
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

        /// <summary>
        /// Ghi lại report của user về latop
        /// </summary>
        /// <param name="idUser"></param>
        /// <param name="idLap"></param>
        /// <param name="contextReport"></param>
        public void SaveLogReportLaptop(string idUser,string idLap, string contextReport)
        {
            // lấy dữ liệu trong file text traning ra LogFileReportLaptop;
            string path = Server.MapPath("~Areas/Admin/LogFiles/LogFileReportLaptop.txt");
            if (System.IO.File.Exists(path))
            {   // lấy hết dòng trong file txt ra.
                string[] lines = System.IO.File.ReadAllLines(path);
                // tảo mảng mới chứa dữ dữ liệu trùng.
                string[] newlines = new string[1];
                string newline = idLap + '|' + contextReport;
                newlines[0] = newline;
                //Gộp hai bảng thành mảng mới và lưu vào txt lại
                string[] save = new string[lines.Length + newlines.Length];
                for (int i = 0; i < lines.Length; i++)
                {
                    save[i] = lines[i];
                }
                for (int i = 0; i < newlines.Length; i++)
                {
                    save[i + lines.Length] = newlines[i];
                }
                // ghi lại vào txt
                System.IO.File.WriteAllLines(path, save);
            }
        }

    }
}
