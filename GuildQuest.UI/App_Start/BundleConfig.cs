using System.Web;
using System.Web.Optimization;

namespace GuildQuest.UI
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                "~/Scripts/jquery-{version}.js"
            ));


            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery-{version}.min.js",
                        "~/Scripts/jquery.validate-vsdoc.js",
                        "~/Scripts/jquery.validate.min.js",
                        "~/Scripts/jquery.validate.unobtrusive.min.js",
                        "~/Scripts/jquery.unobtrusive-ajax.min.js",
                        "~/Scripts/jquery.fancybox.min.js"
                        ));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                    "~/Scripts/modernizr-*"
                    ));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                    "~/Scripts/bootstrap.min.js",
                    "~/Scripts/mdb.min.js",
                    "~/Scripts/popper.min.js",
                    "~/Scripts/respond*",
                    "~/Scripts/Guild_Script.js"
                     ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                    "~/Content/bootstrap.min.css",
                    "~/Content/mdb.min.css",
                    "~/Content/Guild*",
                    "~/Content/style.css",
                    "~/Content/jquery.fancybox.min.css"
                    ));

           
        }
    }
}
