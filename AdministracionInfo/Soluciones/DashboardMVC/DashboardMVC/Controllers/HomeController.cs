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

        public ActionResult ConsolidadoBarrasPrincipales()
        {
            var consolidado = consolidadoRepository.ObtenerConsolidadoConsumoBarraPrincipal();
            return PartialView("_ConsolidadoBarrasPrincipales", consolidado);
        }

        public ActionResult ConsolidadoBarrasSecundarias()
        {
            var consolidado = consolidadoRepository.ObtenerConsolidadoConsumoBarraSecundaria();
            return PartialView("_ConsolidadoBarrasSecundarias", consolidado);
        }

        public ActionResult ConsolidadoCentroCostos()
        {
            var consolidado = consolidadoRepository.ObtenerConsolidadoConsumoCentroCostos();
            return PartialView("_ConsolidadoCentroCostos", consolidado);
        }

        public JsonResult DataConsolidadoConsumoBarraPrincipal()
        {
            var consolidado = consolidadoRepository.ObtenerConsolidadoConsumoBarraPrincipal();

            return Json(consolidado, JsonRequestBehavior.AllowGet);
        }

        public JsonResult DataConsolidadoConsumoBarraSecundaria()
        {
            var consolidado = consolidadoRepository.ObtenerConsolidadoConsumoBarraSecundaria();

            return Json(consolidado, JsonRequestBehavior.AllowGet);
        }

        public JsonResult DataConsolidadoConsumoCentroCostos()
        {
            var consolidado = consolidadoRepository.ObtenerConsolidadoConsumoCentroCostos();

            return Json(consolidado, JsonRequestBehavior.AllowGet);
        }


        protected override void Dispose(bool disposing)
        {
            consolidadoRepository.Dispose();
            base.Dispose(disposing);
        }
    }
}