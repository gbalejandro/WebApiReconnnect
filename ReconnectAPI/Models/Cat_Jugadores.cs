using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Models
{
    public class Cat_Jugadores
    {
        [Key]
        public int Id_Jugador { get; set; }
        [Required]
        [Display(Name = "Empleado")]
        public string EmpleadoID { get; set; }
        [Required]
        [Display(Name = "Usuario")]
        public string UsuarioID { get; set; }
        [StringLength(60, ErrorMessage = "El campo Nombre Completo debe tener 60 caracteres o menos")]
        public string Nombre_Completo { get; set; }
        [Required]
        public bool Activo { get; set; }
        [Required]
        [Display(Name = "Fecha de Registro")]
        public DateTime Fecha_Registro { get; set; }
        [Display(Name = "Fecha de Actualización")]
        public DateTime? Fecha_Actualizacion { get; set; }
    }
}
