using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Models
{
    public class Cat_Atomos
    {
        [Key]
        public int Id_Atomo { get; set; }
        public string Descripcion { get; set; }
        public string Ruta { get; set; }
        public bool Activo { get; set; }
        public DateTime Fecha_Registro { get; set; }
        public DateTime? Fecha_Actualizacion { get; set; }
    }
}
