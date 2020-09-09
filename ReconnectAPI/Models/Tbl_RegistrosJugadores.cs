using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Models
{
    public class Tbl_RegistrosJugadores
    {
        [Key]
        public int Id_RegistroJugador { get; set; }
        [Required]
        [Display(Name = "Jugador")]
        public int Id_Jugador { get; set; }
        [Required]
        [Display(Name = "Categoría")]
        public int Id_Categoria { get; set; }
        [Required]
        [Display(Name = "Personaje")]
        public int Id_Personaje { get; set; }
        [Required]
        [Display(Name = "Activo")]
        public bool Activo { get; set; }
        [Required]
        [Display(Name = "Fecha Inicio")]
        public DateTime Fecha_Inicio { get; set; }
        [Display(Name = "Fecha Fin")]
        public DateTime Fecha_Fin { get; set; }
        [Display(Name = "Fecha Actualización")]
        public DateTime? Fecha_Actualizacion { get; set; }
    }
}
