using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CPS_Solution.Helper
{
    public static class DayHelper
    {
        public static string ToRelativeDate(this DateTime dateTime)
        {
            var timeSpan = DateTime.Now - dateTime;

            if (timeSpan <= TimeSpan.FromSeconds(60))
                return string.Format("Cập nhật {0} giây trước", timeSpan.Seconds);

            if (timeSpan <= TimeSpan.FromMinutes(60))
                return timeSpan.Minutes > 1 ? String.Format("Cập nhật {0} phút trước", timeSpan.Minutes) : "Cập nhật 1 phút trước";

            if (timeSpan <= TimeSpan.FromHours(24))
                return timeSpan.Hours > 1 ? String.Format("Cập nhật {0} giờ trước", timeSpan.Hours) : "Cập nhật 1 giờ trước";

            if (timeSpan <= TimeSpan.FromDays(30))
                return timeSpan.Days > 1 ? String.Format("Cập nhật {0} ngày trước", timeSpan.Days) : "Cập nhật 1 ngày trước";

            if (timeSpan <= TimeSpan.FromDays(365))
                return timeSpan.Days > 30 ? String.Format("Cập nhật {0} tháng trước", timeSpan.Days / 30) : "Cập nhật 1 tháng trước";

            return timeSpan.Days > 365 ? String.Format("Cập nhật {0} năm trước", timeSpan.Days / 365) : "Cập nhật 1 năm trước";
        }
    }
}