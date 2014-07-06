using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.CommonClass;
using CPS_Solution.Areas.Admin.Models;
using System.Xml.Linq;
using CPS_Solution.App_Start;
namespace CPS_Solution.Areas.Admin.Helpers
{
    public class ConfigureHelper
    {
        private readonly string xmlFilePath = ConstantManager.ConfigPath;
        public ConfigurationModel CreateNewModel() 
        {
            var model = new ConfigurationModel
            {
                LimitRequestPerDay = GetLimitPerDay(),
                ParseTime = GetParseTime(),
                TotalPoint = GetTotalMaxPoint()
            };
                return model;
        }
        public void UpdateModel(ConfigurationModel model) 
        {
            SetLimitPerDay(model.LimitRequestPerDay);
            SetParseTime(model.ParseTime);
            SetToTalMaxPoint(model.TotalPoint);
        }
        public int GetLimitPerDay() 
        {
            XDocument xmlDoc = XDocument.Load(xmlFilePath);
            var eleLimit = xmlDoc.Root.Element("LimitRequestPerDay");
            if (eleLimit != null) 
            {
                int limit = Int32.Parse(eleLimit.Value);
                if (limit > 0) 
                {
                    return limit;
                }
            }
            return -1;
        }
        public void SetLimitPerDay(int limit) 
        {
            XDocument xmlDoc = XDocument.Load(xmlFilePath);
            var eleLimit = xmlDoc.Root.Element("LimitRequestPerDay");
            if (eleLimit != null) 
            {
                eleLimit.Value = limit.ToString();
            }
            xmlDoc.Save(xmlFilePath);
        }
        public string GetParseTime() 
        {
            string result = "";
            XDocument xmlDoc = XDocument.Load(xmlFilePath);
            var hour = xmlDoc.Root.Element("ParseTime").Element("hours");
            if (hour != null) 
            {
                result += hour.Value;
            }
            var minutes = xmlDoc.Root.Element("ParseTime").Element("minutes");
            if (minutes != null) 
            {
                result += ":" + minutes.Value;
            }
            return result;
        }
        public void SetParseTime(string parseTime) 
        {
            string[] splitTime = parseTime.Split(':');
            string hours = splitTime[0];
            string minutes = splitTime[1];
            XDocument xmlDoc = XDocument.Load(xmlFilePath);
            var eleHours = xmlDoc.Root.Element("ParseTime").Element("hours");
            if (eleHours != null) 
            {
                eleHours.Value = hours;
            }
            var eleMinutes = xmlDoc.Root.Element("ParseTime").Element("minutes");
            if (eleMinutes != null)
            {
                eleMinutes.Value = minutes;
            }
            xmlDoc.Save(xmlFilePath);
            // Chạy schedules
            int time_hours = Int32.Parse(hours);
            int times_minutes = Int32.Parse(minutes);

            BackgroundConfigurations.RescheduleParser(time_hours, times_minutes);
        }
        public double GetTotalMaxPoint() 
        {
            XDocument xmlDoc = XDocument.Load(xmlFilePath);
            var eleTotal = xmlDoc.Root.Element("Totalpoint");
            if (eleTotal != null) 
            {
                double total = Double.Parse(eleTotal.Value);
                if (total > 0) 
                {
                    return total;
                }
            }
            return -1;
        }
        public void SetToTalMaxPoint(double point) 
        {
            XDocument xmlDoc = XDocument.Load(xmlFilePath);
            var eleTotal = xmlDoc.Root.Element("Totalpoint");
            if (eleTotal != null) 
            {
                eleTotal.Value = point.ToString();
            }
            xmlDoc.Save(xmlFilePath);
        }
    }
}