﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using CPS_Solution.Areas.Admin;
using CPS_Solution.Controllers;
using CPS_Solution.App_Start;
using System.Web.Optimization;
using Microsoft.AspNet.SignalR;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
namespace CPS_Solution
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            ConstantConfig.Register(Server);

            BundleConfig.RegisterBundles(BundleTable.Bundles);

            //Do schedules
            BackgroundConfigurations.StartScheduler();
            BackgroundConfigurations.CalculateBestPoint();
            BackgroundConfigurations.ScheduleSendMail();
            BackgroundConfigurations.ScheduleUpdatePrice();
            BackgroundConfigurations.ScheduleParser();
            BackgroundConfigurations.CalculatePoint();
        }
    }
}