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
                "~/Scripts/jquery-2.1.4.js",
                "~/Scripts/jquery.unobtrusive-ajax.js",
                "~/Scripts/modernizr-2.6.2.js",
                "~/Scripts/bootstrap.js",
                "~/Scripts/tab.js",
                "~/Scripts/d3.js",
                "~/Scripts/linq.js"
            ));

            BundleTable.EnableOptimizations = true;
        }
    }
}