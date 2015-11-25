using MySql.Data;
using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Threading.Tasks;

namespace DashboardMVC.Repositories
{
    public class BaseRepository
    {
        private MySqlConnection connection;
        public MySqlConnection Connection 
        {
            get 
            {
                if (connection == null)
                {
                    var connectionString = ConfigurationManager.ConnectionStrings["tf_admininfo"].ConnectionString;
                    connection = new MySqlConnection(connectionString);
                }

                return connection;
            }
        }


        public MySqlDataReader GetReader(string query)
        {
            Connection.Open();
            var cmd = new MySqlCommand(query, Connection);
            return cmd.ExecuteReader();
        }

        public int NonQuery(string query)
        {
            Connection.Open();
            var cmd = new MySqlCommand(query, Connection);

            return cmd.ExecuteNonQuery();
        }

        public void Dispose()
        {
            if (connection != null)
            {
                connection.Close();
                connection.Dispose();
            }
        }
    }
}