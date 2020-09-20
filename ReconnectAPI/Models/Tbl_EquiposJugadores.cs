using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Models
{
    public class Tbl_EquiposJugadores
    {
        [Key]
        public int Id_EquipoJugador { get; set; }
        public int Id_Equipo { get; set; }
        public int Id_RegistroJugador { get; set; }
        public bool? Lider { get; set; }
        public bool Activo { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime? Fecha_Actualizacion { get; set; }
    }
}
