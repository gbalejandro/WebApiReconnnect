using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Models
{
    public class ActividadJugador
    {
        public string EmpleadoID { get; set; }
        public string UsuarioID { get; set; }
        public string Nombre_Jugador { get; set; }
        public string Codigo_Actividad { get; set; }
        public string Descripcion_Actividad { get; set; }
        public int Puntos { get; set; }
    }
}
