using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DashboardMVC.Models
{
    public class ConsolidadoBarraPrincipal
    {
        public int Id { get; set; }

        public string CodigoBarraPrincipal { get; set; }

        public string Nombre { get; set; }

        public int Consumo { get; set; }
    }
}