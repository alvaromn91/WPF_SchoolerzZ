using System;
using System.Collections.Generic;
using System.Diagnostics;
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
using SZ.Pages;


namespace SZ
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        Login login = new Login();   
        public MainWindow()
        {
            InitializeComponent();
            mostrarPaginaInicio();
        }
        public void mostrarPaginaInicio()
        {
            App.Parent = this;
            //this.parent.Navigate(login);
            this.parent.Navigate(new GetStudent());
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
            parent.NavigationService.Navigate(new AddStudent());
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

        private void btn_Add_Teachers_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Search_G_S_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Search_U_S_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Add_S_Click_1(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Modify_S_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Delete_S_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Search_P_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Modify_P_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Delete_P_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Create_G_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Delete_G_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Mod_G_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Data_Sc_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Mod_Teachers_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Del_Teachers_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Search_Teachers_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
