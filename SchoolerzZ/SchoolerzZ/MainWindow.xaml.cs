using SchoolerzZ.Pages;
using System;
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
using System.Diagnostics;

namespace SchoolerzZ
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Login log = new Login();
        AddStudent student = new AddStudent();
        SchoolManager manager; 
        public MainWindow()
        {
            InitializeComponent();
            mostrarPaginaInicio();
            if (App.login.cmb_Type.SelectedIndex == 3) //3 porque es lo que devuelve el ComboBox cuando esta seleccionado el SchoolManager
            { 
                manager = new SchoolManager(App.login.tb_User.Text.ToString()); 
                // A partir de aquí pasar al datacontext
            }
        }
        public void mostrarPaginaInicio()
        {
            App.Parent = this;
            Login nuevo = new Login();
            this.parent.Navigate(nuevo);
            manager = new SchoolManager(nuevo.tb_User.Text.ToString());
        }

        private void btn_Students_Click(object sender, RoutedEventArgs e)
        {
            stp_SubM_Students.Visibility = Visibility.Visible;
        }

        private void btn_Search_S_Click(object sender, RoutedEventArgs e)
        {
            stp_SubM_Search_S.Visibility = Visibility.Visible;
            title.Visibility = Visibility.Collapsed;
        }

        private void btn_Twitter_Click(object sender, RoutedEventArgs e)
        {
            ProcessStartInfo psi = new ProcessStartInfo
            {
                FileName = "https://twitter.com/home",
                UseShellExecute = true
            };
            Process.Start(psi);
        }

        private void btn_Instagram_Click(object sender, RoutedEventArgs e)
        {
            ProcessStartInfo psi = new ProcessStartInfo
            {
                FileName = "https://www.instagram.com/?hl=es",
                UseShellExecute = true
            };
            Process.Start(psi);
        }

        private void btn_Facebook_Click(object sender, RoutedEventArgs e)
        {
            ProcessStartInfo psi = new ProcessStartInfo
            {
                FileName = "https://es-es.facebook.com/",
                UseShellExecute = true
            };
            Process.Start(psi);

        }

        private void btn_Add_S_Click(object sender, RoutedEventArgs e)
        {
            //fra_Log.NavigationService.Navigate(student);
            title.Visibility = Visibility.Collapsed;
        }


        private void btn_Group_Click(object sender, RoutedEventArgs e)
        {
            stp_SubM2_Group.Visibility = Visibility.Visible;
        }

        private void btn_School_Click(object sender, RoutedEventArgs e)
        {
            stp_SubM1_Group.Visibility = Visibility.Visible;
        }

        private void btn_Teachers_Click(object sender, RoutedEventArgs e)
        {
            stp_SubM_Teachers.Visibility = Visibility.Visible;
        }

        private void btn_Parents_Click(object sender, RoutedEventArgs e)
        {
            stp_SubM_Parents.Visibility = Visibility.Visible;
        }
        public void HandleNavigating(Object sender, NavigatingCancelEventArgs e)
        {
            if (e.NavigationMode == NavigationMode.Forward || e.NavigationMode == NavigationMode.Back)
            {
                e.Cancel = true;
            }
        }
    }
}
