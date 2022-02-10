//using System;
//using System.Collections.Generic;
//using System.Collections.ObjectModel;
//using System.Data;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using System.Windows;
//using MySql.Data.MySqlClient;

//namespace CapaAccDatosB
//{
//    public class AccesoDatos
//    {
//        string connectionString = "datasource=127.0.0.1;port=3306;username=root;password=1234;database=scholerzz;";
//        MySqlConnection databaseConnection;

//        public AccesoDatos()
//        {
//            databaseConnection = new MySqlConnection(connectionString);
//        }
//        public AccesoDatos(string servidorDatos,string puerto,string u, string pwd, string bbdd)
//        {
//            databaseConnection = new MySqlConnection("datasource=" + servidorDatos + ";port=" + puerto + ";username=" + u + ";password= " + pwd +";database=" + bbdd +";");
//        }
//        private void EstablecerConexion()
//        {
//            databaseConnection.Open();
//        }
        
//        public void CerrarConexion()
//        {
//            databaseConnection.Close();
//        }
       
//        public int Login(char pc_Type, string pv_Nick , string pv_Password )
//        {
//            MySqlCommand cmd = new MySqlCommand("SELECT Login(?, ?, ?)", databaseConnection);
//            cmd.CommandType = CommandType.Text;
//            cmd.Parameters.AddWithValue("pc_Type",pc_Type);
//            cmd.Parameters.AddWithValue("pv_Nick", pv_Nick);
//            cmd.Parameters.AddWithValue("pv_Password", pv_Password);

//            EstablecerConexion();
//            int s = cmd.ExecuteNonQuery();
//            CerrarConexion();
//            return  s; //Lista<Object>
//        }
//    }
//}
