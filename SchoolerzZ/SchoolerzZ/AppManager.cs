using System.Collections.Generic;
using System.Windows.Media;

namespace CapaAccDatosB
{
    internal class AppManager
    {
        private AccesoDatos accData = new AccesoDatos();
        private MediaPlayer mpMusic = new MediaPlayer();
        private MediaPlayer mpSFX = new MediaPlayer();


        public AppManager()
        {


        }

        public List<object> InsertarPelicula(List<object> pelicula)
        {
            return accData.EjecutarProcedimiento("AgregarPelicula", pelicula);
        }
        public void ActualizarActor(string nuevo_nombre,
                                    string nuevo_apellido,
                                    string old_nombre,
                                    string old_apellido)
        {

        }



    }
}