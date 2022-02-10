using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using MySql.Data.MySqlClient;

namespace CapaAccDatosB
{
    public class AccesoDatos
    {
        string connectionString = "datasource=localhost;port=3306;username=root;password=1234;database=schoolerzz;";
        MySqlConnection databaseConnection;

        public AccesoDatos()
        {
            databaseConnection = new MySqlConnection(connectionString);
        }
        public AccesoDatos(string servidorDatos,string puerto,string u, string pwd, string bbdd)
        {
            databaseConnection = new MySqlConnection("datasource=" + servidorDatos + ";port=" + puerto + ";username=" + u + ";password= " + pwd +";database=" + bbdd +";");
        }
        private void EstablecerConexion()
        {
            databaseConnection.Open();
        }
        
        public void CerrarConexion()
        {
            databaseConnection.Close();
        }
       
        public int Login(char pc_Char, string pv_Nick , string pv_Password )
        {
            
            MySqlCommand cmd = new MySqlCommand("LoginAJ", databaseConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new MySqlParameter("pc_char", pc_Char));
            cmd.Parameters.Add(new MySqlParameter("pv_username", pv_Nick));
            cmd.Parameters.Add(new MySqlParameter("pv_password", pv_Password));


            cmd.Parameters.Add(new MySqlParameter("pi_valid", MySqlDbType.Int32));
            cmd.Parameters["pi_valid"].Direction = ParameterDirection.Output;

            EstablecerConexion();

            cmd.ExecuteNonQuery();
            int s = (int)cmd.Parameters["pi_valid"].Value;
            
            CerrarConexion();
            
            return  s; 
            
        }

        // Tenemos que ver como conseguir cerrar el stack panel de Login
    }
}
