using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data;
using MySql.Data.MySqlClient;
using DashboardMVC.Models;
using DashboardMVC.Utils;

namespace DashboardMVC.Repositories
{
    public class ConsolidadoRepository : BaseRepository<Circuito>
    {
        public List<ConsolidadoBarraPrincipal> ObtenerConsolidadoConsumoBarraPrincipal()
        {
            var query = "select * from consolidado_barra_principal";
            var reader = base.GetReader(query);
            var data = new List<ConsolidadoBarraPrincipal>();

            while (reader.Read())
            {
                data.Add(new ConsolidadoBarraPrincipal
                {
                    Id = reader.GetValue<int>("id"),
                    CodigoBarraPrincipal = reader.GetValue<string>("codigo_barra_principal"),
                    Nombre = reader.GetValue<string>("nombre"),
                    Consumo = reader.GetValue<int>("consumo")
                });
            }

            return data;
        }
    }
}