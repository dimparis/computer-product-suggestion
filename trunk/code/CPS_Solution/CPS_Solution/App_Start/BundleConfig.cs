using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Optimization;

namespace CPS_Solution.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/Scripts").Include(
                "~/Scripts/jquery-{version}.js",
                "~/Scripts/jquery.*",
                "~/Scripts/jquery-ui-{version}.js")
            );

            bundles.Add(new ScriptBundle("~/Scripts").Include(
                 "~/Scripts/knockout-{version}.js",
                 "~/Scripts/knockout-deferred-updates.js")
            );
        }
    }
}