   M S B A M L   `   `   `  ����E  ASchoolerzZ, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:SchoolerzZ.PagesSchoolerzZ.Pages  5      !    SchoolerzZ.Pages.AddStudent   5      W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      0localclr-namespace:SchoolerzZ.Pages     5      _ [MaterialDesignThemes.Wpf, Version=4.3.0.3, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5         MaterialDesignBody#���   5      $��Regular"�5	   	   $��13(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper N� 
Background# �  5   	     MaterialDesignFont N� 
FontFamily# �  5   	    N� Title$ 
AddStudent��5      .��5      � ���	#7FE8C56A � ColumnDefinitions 5   
   �� 5      $��4* �6   �� 5      $��* �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��8* �6   �� 5      $��2* �6   .+�5   
   �� $��0��6   $��0��6"   $��Center=�62   .+�5      �� $��Registro de Estudiante��6   $��50(�65   $��Bernard MT Condensed)�6C   5       � 5!   
   $��1��6   $��0��6!   .+�5"      �� -   5         ��Name$ tb_Name��5"      $��32(�6'   $	��280��65   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Nombre��6A   $��Bernard MT Condensed)�6i   $��30q�6�   �� 5#      -   5        $ tb_Surname1��5#      $��32(�6+   $	��280��69   $ 
Apellido 1��6E   $��Bernard MT Condensed)�6q   $��30q�6�   �� 5$      -   5        $ tb_Surname2��5$      $��32(�6+   $	��280��69   $ 
Apellido 2��6E   $��Bernard MT Condensed)�6q   $��30q�6�   �� 5&      -   5        $ tb_Nationality��5&      $��32(�6.   $	��280��6<   $ Nacionalidad��6H   $��Bernard MT Condensed)�6v   $��30q�6�   �� 5'      -   5        $ 
tb_Country��5'      $��32(�6*   $	��280��68   $ País��6D   $��Bernard MT Condensed)�6j   $��30q�6�   �� 5(      -   5        $ tb_City��5(      $��32(�6'   $	��280��65   $ Ciudad��6A   $��Bernard MT Condensed)�6i   $��30q�6�   �� 5)      -   5        $ tb_PostalCode��5)      $��32(�6-   $	��280��6;   $ Código Postal��6G   $��Bernard MT Condensed)�6v   $��30q�6�   �� 5*      -   5        $ 
tb_Address��5*      $��32(�6*   $	��280��68   $ 
Dirección��6D   $��Bernard MT Condensed)�6o   $��30q�6�   �� 5+      -	   5        $ tb_Email��5+      $��32(�6(   $	��280��66   $ Email��6B   $��Bernard MT Condensed)�6i   $��30q�6�   �� 5,      -
   5        $ 
tb_Medical��5,      $��24(�6*   $	��280��68   $ Observaciones Médicas��6D   $��Bernard MT Condensed)�6{   $��30q�6�   $
��Auto=�6�   	 �� TextWrapping$
	 Wrap=�6�   $	��172��6�   �� 5-      -   5        $ tb_Observations��5-      $��24(�6/   $	��280��6=   $ Observaciones��6I   $��Bernard MT Condensed)�6x   $��30q�6�   $
��Auto=�6�   $
	 Wrap=�6�   $	��172��6�   5.      �� 5/   
   $��1��6   $��1��6"   $	��Top=�63   $��Center=�6K   .+�50      �� -   5        
 ��Name$
 	img_Photo��50   .   $��/Images/mojo.png��6   $	��150��6A   �� 51      -   5         ��Name$ 	btn_Image��51      $��Center=�6(   $��20(�6C   ���	#FFCC6649���	#FFCC6649
�������$��30q�6�   $��50��6�   $	��170��6�   $��
Bernard MT)�6�    � Cursor$
 Hand��6�   .��6�   Agregar Imagen6  52      �� 53   
   $��1��6   $��2��6"   $
��Left=�62   $	��Top=�6M   $��0,0,10,0q�6e   .+�54      �� $��Fecha de Nacimiento��6   $��32(�62   $��Bernard MT Condensed)�6@   &   System.Windows.Controls.Calendar  55      -   5          Name$ 	cal_Birth��55   7    J� RenderTransformOrigin$ 0.1,0.1&�6   z�56      V� 57      .~�58      ��  �� ScaleX$ 1Q�6)    �� ScaleY$ 1Q�64   �� 59      �� 5:       �� Angle$ -0.241Q�6*   T� 5;      5<      5>      5?      �� 5A   
   -   5        $ 
btn_SignUp��5A      $��Center=�6?   $��10q�6\   $	��Top=�6h   $��20(�6�   ���	#FFCC6649���	#FFCC6649
�������$��50��6�   $	��170��6�   $��
Bernard MT)�6�   $
 Hand��6  $��2��6  $��2��6  .��6,  	Registrar67  5B      5C      