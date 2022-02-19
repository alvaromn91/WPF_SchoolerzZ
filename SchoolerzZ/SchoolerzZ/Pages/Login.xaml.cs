using SchoolerzZ;
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
using SchoolerzZ;

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

        private void btn_Login_Click(object sender, RoutedEventArgs e)
        {
            req1.Visibility = Visibility.Collapsed;
            req2.Visibility = Visibility.Collapsed;
            char rol;
            string user;
            switch (cmb_Type.SelectedIndex) 
            {
                case 0:
                    rol = 'P';
                    break;
                case 1:
                    rol = 'S';
                    break;
                case 2:
                    rol = 'T';
                    break;
                case 3:
                    rol = 'M';
                    break;
                default:
                    rol = 'X';
                    break;
            }
            if (rol == 'X')
            {
                MessageBox.Show("Elige un tipo de usuario");
            }
            else
            {
                if (tb_User.Text == string.Empty)
                {
                    req1.Visibility = Visibility.Visible;
                    req1.Foreground = Brushes.Red;
                }
                if (tb_Pass.Password == string.Empty)
                {
                    req2.Visibility = Visibility.Visible;
                    req2.Foreground = Brushes.Red;
                }
                AccesoDatos con = new AccesoDatos();
                int r = con.Login(rol, tb_User.Text.ToString(), Student.GetMD5(tb_Pass.Password.ToString()));
                if (r == 0)
                {
                    App.Parent.parent.Navigate(new AddStudent());
                    App.Parent.stp_MenuLat.Visibility = Visibility.Visible;
                    App.Parent.title.Visibility = Visibility.Collapsed;
                    App.Parent.stp_GorilaMid.Visibility = Visibility.Collapsed;
                    App.Parent.stp_GorilaMenuLat.Visibility = Visibility.Visible;

                }
                else
                {
                    MessageBox.Show("Incorrecto");
                }
            }            
        }
    }
}
