using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using MySql.Data.MySqlClient;

namespace SchoolerzZ
{
    public class AccesoDatos
    {
        //string connectionString = "datasource=localhost;port=3306;username=root;password=7101991a;database=schoolerzz;";
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
            
            return s;
        }
        public string GeneratePassword() 
        {
            MySqlCommand cmd = new MySqlCommand("GeneratePassword", databaseConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new MySqlParameter("pv_word", MySqlDbType.VarChar));
            cmd.Parameters["pv_word"].Direction = ParameterDirection.Output;

            EstablecerConexion();

            cmd.ExecuteNonQuery();
            string pass = (string)cmd.Parameters["pv_word"].Value;

            CerrarConexion();
            return pass;
        }
        public int AddStudent(string name, string surname1, string surname2, DateTime birth, string nationality, string country, string city, string postalCode, string address, string email, string password ,string medical, string observations, string photoRoute) 
        {
     

            MySqlCommand cmd = new MySqlCommand("AddStudent", databaseConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new MySqlParameter("pv_School_Manager_Nick","")); // AÑADIR SCHOOL MANAGER
            cmd.Parameters.Add(new MySqlParameter("pv_Name", name));
            cmd.Parameters.Add(new MySqlParameter("pv_SN1", surname1));
            cmd.Parameters.Add(new MySqlParameter("pv_SN2", surname2));
            cmd.Parameters.Add(new MySqlParameter("pdt_Birth", birth));
            cmd.Parameters.Add(new MySqlParameter("pv_Nationality", nationality));
            cmd.Parameters.Add(new MySqlParameter("pv_Country", country));
            cmd.Parameters.Add(new MySqlParameter("pv_city", city));
            cmd.Parameters.Add(new MySqlParameter("pv_PostalCode", postalCode));
            cmd.Parameters.Add(new MySqlParameter("pv_Adrress", address));
            cmd.Parameters.Add(new MySqlParameter("pv_Email", email));
            cmd.Parameters.Add(new MySqlParameter("pv_Password", password));
            cmd.Parameters.Add(new MySqlParameter("pv_Medical", medical));
            cmd.Parameters.Add(new MySqlParameter("pv_Observations", observations));
            cmd.Parameters.Add(new MySqlParameter("pv_Photo_Internal_Route", photoRoute));
            cmd.Parameters.Add(new MySqlParameter("pv_Licence","")); //Licencia

            cmd.Parameters.Add(new MySqlParameter("pi_r", MySqlDbType.Int32));
            cmd.Parameters["pi_r"].Direction = ParameterDirection.Output;

            EstablecerConexion();

            cmd.ExecuteNonQuery();
            int s = (int)cmd.Parameters["pi_r"].Value;

            CerrarConexion();
            return s;
        }

        public string GetLicence(string Manager) 
        {
            MySqlCommand cmd = new MySqlCommand("GetLicence", databaseConnection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new MySqlParameter("pv_School_Manager_Nick", Manager)); // AÑADIR SCHOOL MANAGER
            cmd.Parameters.Add(new MySqlParameter("pv_Licence", MySqlDbType.VarChar));
            cmd.Parameters["pv_Licence"].Direction = ParameterDirection.Output;

            EstablecerConexion();

            cmd.ExecuteNonQuery();
            string s = (string)cmd.Parameters["pv_Licence"].Value;

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
            lista.Add(cmd.Parameters["pv_sn2"].Value.ToString());

            CerrarConexion();
            return lista;

        }
    }
}
