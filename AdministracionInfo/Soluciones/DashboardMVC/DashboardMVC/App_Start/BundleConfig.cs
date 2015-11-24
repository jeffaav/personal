using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace DashboardMVC
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new StyleBundle("~/bundle-css").Include(
                "~/Content/bootstrap.css",
                "~/Content/Site.css"
            ));

            bundles.Add(new ScriptBundle("~/bundle-js").Include(
                "~/Scritps/jquery-2.1.4.js",
                "~/Scritps/modernizr-2.6.2.js",
                "~/Scritps/bootstrap.js",
                "~/Scritps/d3.js"
            ));

            BundleTable.EnableOptimizations = true;
        }
    }
}