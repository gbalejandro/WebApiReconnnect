using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Models
{
    public class RegistroJugadores
    {
        public string Jugador { get; set; }
        public string Personaje { get; set; }
        public string Categoria { get; set; }
        public string Familia { get; set; }
        public string Nivel { get; set; }
        public int Puntos { get; set; }
        public string Equipo { get; set; }
    }
}
