using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DashboardMVC.Repositories;
using DashboardMVC.Models;

namespace DashboardMVC.Controllers
{
    public class HomeController : Controller
    {
        ConsolidadoRepository consolidadoRepository = new ConsolidadoRepository();

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult ObtenerConsolidado()
        {
            var circuitos = consolidadoRepository.ObtenerConsolidadoConsumoBarraPrincipal();

            return Json(circuitos, JsonRequestBehavior.AllowGet);
        }


        protected override void Dispose(bool disposing)
        {
            consolidadoRepository.Dispose();
            base.Dispose(disposing);
        }
    }
}