namespace DashboardMVC.Models
{
    public class Circuito
    {
        public int Id { get; set; }

        public int Numero { get; set; }

        public string Nombre { get; set; }

        public string Codigo { get; set; }

        public int IdBarraPrincipal { get; set; }

        public int IdBarraSecundaria { get; set; }

        public int Nivel { get; set; }

        public int IdCentroCosto { get; set; }
    }
}