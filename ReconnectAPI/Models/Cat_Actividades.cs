using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Models
{
    public class Cat_Actividades
    {
        [Key]
        public int Id_Actividad { get; set; }
        public int? Id_Frecuencia { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public int Puntos { get; set; }
        public int Horas_Vigencia { get; set; }
        public bool Activo { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime? Fecha_Actualizacion { get; set; }
    }
}
