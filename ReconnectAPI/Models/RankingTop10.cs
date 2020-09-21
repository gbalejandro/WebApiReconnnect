using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Models
{
    public class RankingTop10
    {
        public int Posicion { get; set; }
        public string Jugador { get; set; }
        public string Personaje { get; set; }
        public string Familia { get; set; }
        public int Puntos { get; set; }
    }
}
