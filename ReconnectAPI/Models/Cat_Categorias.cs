using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Models
{
    public class Cat_Categorias
    {
        [Key]
        public int Id_Categoria { get; set; }
        [Display(Name = "Nivel")]
        public int? Id_Nivel { get; set; }
        [Required]
        [Display(Name = "Descripción Categoría")]
        [StringLength(50, ErrorMessage = "El campo Nombre Descripción de Categoría debe tener 50 caracteres o menos")]
        public string Descripcion_Categoria { get; set; }
        [Required]
        [Display(Name = "Descripción del Badge")]
        [StringLength(70, ErrorMessage = "El campo Descripción del Badge debe tener 70 caracteres o menos")]
        public string Descripcion_Badge { get; set; }
        [Required]
        [Display(Name = "Puntos")]
        public int Puntos { get; set; }
        [Required]
        [Display(Name = "Activo")]
        public bool Activo { get; set; }
        [Required]
        [Display(Name = "Fecha del Registro")]
        public DateTime Fecha_Registro { get; set; }
        [Display(Name = "Fecha de la Actualización")]
        public DateTime? Fecha_Actualizacion { get; set; }
    }
}
