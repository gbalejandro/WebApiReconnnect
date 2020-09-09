using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Models
{
    public class Cat_Personajes
    {
        [Key]
        public int Id_Personaje { get; set; }
        [Display(Name = "Familia")]
        public int? Id_Familia { get; set; }
        [Required]
        [Display(Name = "Descripción")]
        [StringLength(40, ErrorMessage = "El campo Descripción del Badge debe tener 40 caracteres o menos")]
        public string Descripcion { get; set; }
        [Required]
        [Display(Name = "Activo")]
        public bool Activo { get; set; }
        [Required]
        [Display(Name = "Fecha Registro")]
        public DateTime Fecha_Registro { get; set; }
        [Display(Name = "Fecha Actualización")]
        public DateTime? Fecha_Actualizacion { get; set; }
    }
}
