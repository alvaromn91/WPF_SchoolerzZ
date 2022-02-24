using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SZ.Pages
{
    /// <summary>
    /// Lógica de interacción para AddStudent.xaml
    /// </summary>
    public partial class AddStudent : Page
    {
        
        
        public AddStudent()
        {
            InitializeComponent();
        }

        private void btn_SignUp_Click(object sender, RoutedEventArgs e)
        {
            
            DateTime fecha = cal_Birth.SelectedDate.GetValueOrDefault();
            Student student = new Student(tb_Name.Text.ToString(), tb_Surname1.Text.ToString(), tb_Surname2.Text.ToString(), fecha, tb_Nationality.Text.ToString(), tb_Country.Text.ToString(), tb_City.Text.ToString(), tb_PostalCode.Text.ToString(), tb_Address.Text.ToString(), tb_Email.Text.ToString(), tb_Password.Password.ToString(),tb_Medical.Text.ToString(), tb_Observations.Text.ToString(), img_Photo.Source.ToString());
            AccesoDatos con = new AccesoDatos();
            int r = con.AddStudent(App.nick, student.Name, student.Surname1, student.Surname2, student.Birth, student.Nationality, student.Country, student.City, student.PostalCode, student.Address, student.Email, student.Password, student.Medical, student.Observations, student.PhotoRoute);

        }

        private void btn_Image_Click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog openFileDlg = new Microsoft.Win32.OpenFileDialog();
            
            openFileDlg.DefaultExt = ".png";
            openFileDlg.Filter = "Image Files(*.BMP;*.JPG;*.GIF)|*.BMP;*.JPG;*.GIF";
            openFileDlg.InitialDirectory = @"C:\Users\admin-dam2b\Pictures";
            openFileDlg.Multiselect = false;
            
            Nullable<bool> result = openFileDlg.ShowDialog();

            try
            {
                string archi = openFileDlg.FileName;
                BitmapImage bi = new BitmapImage();
                bi.BeginInit();
                bi.UriSource = new Uri(archi);
                bi.EndInit();
                img_Photo.Source = bi;
            }
            catch
            {
                MessageBox.Show("No has elegido Foto");
            }
        }
    }
}
