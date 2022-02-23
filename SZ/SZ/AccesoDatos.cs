using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using MySql.Data.MySqlClient;

namespace SZ
{
    public class AccesoDatos
    {
        //string connectionString = "datasource=localhost;port=3306;username=root;password=7101991a;database=schoolerzz;";
        string connectionString = "datasource=localhost;port=3306;username=root;password=1234;database=schoolerzz;";
        //string connectionString = "datasource=172.16.51.7;port=3306;username=root;password=1234;database=schoolerzz;";

        MySqlConnection databaseConnection;

        public AccesoDatos()
        {
            databaseConnection = new MySqlConnection(connectionString);
        }
        public AccesoDatos(string servidorDatos, string puerto, string u, string pwd, string bbdd)
        {
            databaseConnection = new MySqlConnection("datasource=" + servidorDatos + ";port=" + puerto + ";username=" + u + ";password= " + pwd + ";database=" + bbdd + ";");
        }
        private void EstablecerConexion()
        {
            databaseConnection.Open();
        }

        public void CerrarConexion()
        {
            databaseConnection.Close();
        }

        public int Login(char pc_Char, string pv_Nick, string pv_Password)
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

            return s;
        }
        public List<string> GetManager(string Manager)
        {
            List<string> lista = new List<string>();
            MySqlCommand cmd = new MySqlCommand("GetManager", databaseConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new MySqlParameter("pv_Nick", Manager));
            cmd.Parameters.Add(new MySqlParameter("pv_name", MySqlDbType.VarChar));
            cmd.Parameters.Add(new MySqlParameter("pv_sn1", MySqlDbType.VarChar));
            cmd.Parameters.Add(new MySqlParameter("pv_sn2", MySqlDbType.VarChar));
            cmd.Parameters["pv_name"].Direction = ParameterDirection.Output;
            cmd.Parameters["pv_sn1"].Direction = ParameterDirection.Output;
            cmd.Parameters["pv_sn2"].Direction = ParameterDirection.Output;

            EstablecerConexion();

            cmd.ExecuteNonQuery();
            lista.Add(cmd.Parameters["pv_name"].Value.ToString());
            lista.Add(cmd.Parameters["pv_sn1"].Value.ToString());
            lista.Add((string)cmd.Parameters["pv_sn2"].Value.ToString());
            CerrarConexion();
            return lista;

        }
    }    
}
