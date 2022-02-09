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

namespace SchoolerzZ.Pages
{
    /// <summary>
    /// Lógica de interacción para Login.xaml
    /// </summary>
    public partial class Login : Page
    {
        bool clicked = false;
        public Login()
        {
            InitializeComponent();
        }

        private void btn_Recover_Click(object sender, RoutedEventArgs e)
        {
            if (!clicked)
            {
                stp_Recover.Visibility = Visibility.Visible;
                Pass.Visibility = Visibility.Collapsed;
                stp_btn.Visibility = Visibility.Collapsed;
                Change.Visibility = Visibility.Visible;
                clicked = true;
            }
            else
            {
                stp_Recover.Visibility = Visibility.Collapsed;
                Pass.Visibility = Visibility.Visible;
                stp_btn.Visibility = Visibility.Visible;
                Change.Visibility = Visibility.Collapsed;
                clicked = false;
            }
            
        }
    }
}
