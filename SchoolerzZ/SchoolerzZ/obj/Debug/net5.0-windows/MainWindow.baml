   M S B A M L   `   `   `  ����E  ASchoolerzZ, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:SchoolerzZ
SchoolerzZ  5   	       SchoolerzZ.MainWindow   5   	   W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:SchoolerzZ     5   	   Z VFontAwesome.WPF, Version=4.7.0.37774, Culture=neutral, PublicKeyToken=0758b07a11a4f466-fa$http://schemas.fontawesome.io/icons/  5   	   _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	      MaterialDesignBody#���   5	   	   $��Regular"�5
   	   $��13(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5   	    � Title$ 
MainWindow��5   	    � WindowState$ 	Maximized=�6   .��5      � ���	#7FE8C56A � ColumnDefinitions 5   
   �� 5      $��2* �6   �� 5      $	��12* �6    � RowDefinitions 5   
   �� 5      $��3* �6   �� 5      $��9* �6   �� 5      $��* �6   .+�5   
   �� -   5         ��Name$ stp_GorilaMenuLat��5   ,   $y�	Collapsed=�6   .+�5      �� $��images/branded_logo.png��6   $	��250��65   5      �� 5   
   -   5        $ stp_GorilaMid��5      $��2��6,   $��Center=�6=   $y�Visible=�6X   .+�5       �� $��images/logo_mid.png��6   5!      �� 5#   
   -   5        $ stp_MenuLat��5#   I   $��0��6   $��1��6%   $y�	Collapsed=�62   .+�5%      �� -   5         ��Name$ btn_Teachers��5%      $
��Left=�6+   ���	#B3E8C56A���	#B2E8C56A.��5'      ��  �� Orientation$ 
Horizontal=�6   .+�5(      �� $��Images/Classroom.png��6   $��30��6:   $��20��6E   $
��Left=�6Q   $��Center=�6l   $��	-12,0,0,0q�6�   �� 5)      $��Center=�6    $��10,0,0,0q�6;   
Profesores6Y   5*      5+      �� 5,      -   5        $ stp_SubM_Teachers��5,      $y�	Collapsed=�64   .+�5.      �� -   5        $ btn_Add_Teachers��5.      $��Añadir Profesor��63   $
��Left=�6M   $��20,0,0,0q�6o   ���	#66E8C56A���	#66E8C56A6�   5/      �� 51      -   5        $ btn_Students��51      $
��Left=�6+   ���	#B2E8C56A���	#B2E8C56A$��Center=�6�   .��53      �� $ 
Horizontal=�6   .+�54      �� $��Images/Students.png��6   $��30��69   $��30��6D   $
��Left=�6P   $��Center=�6k   $��	-12,0,0,0q�6�   �� 55      $��Center=�6    $��10,0,0,0q�6;   Estudiantes6Z   56      57      �� 58      -   5        $ stp_SubM_Students��58      $y�	Collapsed=�64   .+�5:      �� -	   5        $ btn_Search_S��5:      $��Buscar��6/   $
��Left=�6@   $��20,0,0,0q�6b   ���	#66E8C56A���	#66E8C56A6�   �� 5;      -
   5        $ stp_SubM_Search_S��5;      $y�	Collapsed=�68   .+�5=      �� -   5        $ btn_Search_G_S��5=      $��	Por Grupo��65   $
��Left=�6I   $��40,0,0,0q�6k   ���	#33E8C56A	 � Cursor$
	 Hand��6�   ���	#33E8C56A6�   �� 5>      -   5        $ btn_Search_U_S��5>      $��
Por Nombre��65   $
��Left=�6J   $��40,0,0,0q�6l   ���	#33E8C56A���	#33E8C56A$
	 Hand��6�   5?      �� 5@      -   5        $ 	btn_Add_S��5@      $��Añadir��6E   $
��Left=�6V   $��20,0,0,0q�6x   ���	#66E8C56A���	#66E8C56A6�   �� 5A      -   5        $ btn_Modify_S��5A      $��	Modificar��6/   $
��Left=�6C   $��20,0,0,0q�6e   ���	#66E8C56A���	#66E8C56A6�   �� 5B      -   5        $ btn_Delete_S��5B      $��Eliminar��6/   $
��Left=�6B   $��20,0,0,0q�6d   ���	#66E8C56A���	#66E8C56A6�   5C      �� 5E      -   5        $ btn_Parents��5E      $
��Left=�6*   ���	#B2E8C56A���	#B2E8C56A.��5G      �� $ 
Horizontal=�6   .+�5H      �� $��Images/Family.png��6   $��30��67   $��30��6B   $
��Left=�6N   $��	-12,0,0,0q�6i   �� 5I      $��Center=�6    $��10,0,0,0q�6;   Padres6U   5J      5K      �� 5L      -   5        $ stp_SubM_Parents��5L      $y�	Collapsed=�63   .+�5N      �� -   5        $ btn_Search_P��5N      $��Buscar��6/   $
��Left=�6@   $��20,0,0,0q�6b   ���	#66E8C56A���	#66E8C56A6�   �� 5O      -   5        $ btn_Modify_P��5O      $��	Modificar��6/   $
��Left=�6C   $��20,0,0,0q�6e   ���	#66E8C56A���	#66E8C56A6�   �� 5P      -   5        $ btn_Delete_P��5P      $��Eliminar��6/   $
��Left=�6B   $��20,0,0,0q�6d   ���	#66E8C56A���	#66E8C56A6�   5Q      �� 5T      -   5        $ 
btn_School��5T      $
��Left=�6)   ���	#B2E8C56A���	#B2E8C56A.��5U      �� $ 
Horizontal=�6   .+�5V      �� $��Images/School.png��6   $��25��67   $��25��6B   $
��Left=�6N   $��Center=�6i   $��-8,0,0,0q�6�   �� 5W      $��Center=�6    $��10,0,0,0q�6;   	Colegio6V   5X      5Y      �� 5Z      -   5        $ stp_SubM1_Group��5Z      $y�	Collapsed=�62   .+�5[      �� -   5        $ 	btn_Group��5[      $��Grupo��6,   $
��Left=�6T   $��20,0,0,0q�6v   ���	#66E8C56A���	#66E8C56A6�   �� 5\      -   5        $ stp_SubM2_Group��5\      $y�	Collapsed=�66   .+�5^      �� -   5        $ btn_Create_G��5^      $��Crear Grupo��63   $
��Left=�6I   $��40,0,0,0q�6k   ���	#33E8C56A$
	 Hand��6�   ���	#33E8C56A6�   �� 5_      -   5        $ btn_Delete_G��5_      $��Eliminar Grupo��63   $
��Left=�6L   $��40,0,0,0q�6n   ���	#33E8C56A���	#33E8C56A$
	 Hand��6�   �� 5`      -   5        $ 	btn_Mod_G��5`      $��Modificar Grupo��60   $
��Left=�6J   $��40,0,0,0q�6l   ���	#33E8C56A���	#33E8C56A$
	 Hand��6�   5a      �� 5b      -   5        $ btn_Data_Sc��5b      $��Datos del Colegio��6G   $
��Left=�6c   $��20,0,0,0q�6�   ���	#66E8C56A���	#66E8C56A6�   5c      5g      �� 5i   
   -   5        $ title��5i      $��1��6$   $��0��64   $��Center=�6A   $y�Visible=�6\   .+�5k      �� $��images/brand.png��6   $	��197��6.   $��0,0,40,0q�6;   5l      �� 5o   
   ���	#FFD06E3F$��0��6,   $��2��6<   $��2��6I   .+�5p      �� $ 
Horizontal=�6   $
��Left=�62   $��	25,15,0,0q�6M   $��Center=�6`   .+�5r      �� -   5        $ btn_twitter��5r      $��Center=�6.   ���	#00F0F8FF���	#00E8C56A$��	16,4,16,4q�6�   $��1(�6�   $��46��6�   $��72��6�   $
	 Hand��6�   ��5s      "  FontAwesome.WPF.ImageAwesome  5t      
   Icon$
 Twitter=�6*      
Foreground
 ��� �$��40��6K   $��40��6V   6d   5v      �� 5x      -   5        $ 	btn_Insta��5x      $��Center=�6,   ���	#00F0F8FF���	#00E8C56A$��48��6�   ��5y        5z      $
 	Instagram=�6*    �	#FFD100FF$��40��6R   $��40��6]   6k   5|      �� 5~      -    5        $ btn_Facebook��5~      $��Center=�6/   $��Center=�6L   ���	#00F0F8FF���	#00E8C56A$��46��6�   ��5        5�      $
 FacebookOfficial=�6*   
 ��  �$��40��6T   $��40��6_    J� RenderTransformOrigin$ 0.601,-0.133&�6k   5�      5�      5�       � 5�   
   -!   5          �Name$ parent��5�      $��1��6    $��1��60     � NavigationUIVisibility$ Hidden=�6=   6]   5�      5�      