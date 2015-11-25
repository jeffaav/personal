using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DashboardMVC.Models
{
    public class ConsolidadoBarraSecundaria
    {
        public int Id { get; set; }

        public string CodigoBarraSecundaria { get; set; }

        public string Nombre { get; set; }

        public int Consumo { get; set; }

        public decimal Porcentaje { get; set; }
    }
}