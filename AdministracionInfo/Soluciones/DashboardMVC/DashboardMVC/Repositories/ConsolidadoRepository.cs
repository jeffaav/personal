using System;
using System.Collections.Generic;
using System.Linq;
using MySql.Data;
using MySql.Data.MySqlClient;
using DashboardMVC.Models;
using DashboardMVC.Utils;

namespace DashboardMVC.Repositories
{
    public class ConsolidadoRepository : BaseRepository
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

        public List<ConsolidadoBarraSecundaria> ObtenerConsolidadoConsumoBarraSecundaria()
        {
            var query = "select * from consolidado_barra_secundaria";
            var reader = base.GetReader(query);
            var data = new List<ConsolidadoBarraSecundaria>();

            while (reader.Read())
            {
                data.Add(new ConsolidadoBarraSecundaria
                {
                    Id = reader.GetValue<int>("id"),
                    CodigoBarraSecundaria = reader.GetValue<string>("codigo_barra_secundaria"),
                    Nombre = reader.GetValue<string>("nombre"),
                    Consumo = reader.GetValue<int>("consumo"),
                    Porcentaje = reader.GetValue<decimal>("porcentaje")
                });
            }

            return data;
        }

        public List<ConsolidadoCentroCostos> ObtenerConsolidadoConsumoCentroCostos()
        {
            var query = "select * from consolidado_centro_costos";
            var reader = base.GetReader(query);
            var data = new List<ConsolidadoCentroCostos>();

            while (reader.Read())
            {
                data.Add(new ConsolidadoCentroCostos
                {
                    Id = reader.GetValue<int>("id"),
                    CentroCosto = reader.GetValue<string>("centro_costo"),
                    Consumo = reader.GetValue<int>("consumo")
                });
            }

            return data;
        }
    }
}