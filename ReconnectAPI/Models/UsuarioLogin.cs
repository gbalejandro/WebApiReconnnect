﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Models
{
    public class UsuarioLogin
    {
        [Key]
        public int Id { get; set; }
        public string Usuario { get; set; }
        public string Password { get; set; }
    }
}
