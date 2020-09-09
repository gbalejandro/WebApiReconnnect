using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {

        }

        public DbSet<Cat_Jugadores> Cat_Jugadores { get; set; }
        public DbSet<Tbl_RegistrosJugadores> Tbl_RegistrosJugadores { get; set; }
        public DbSet<Cat_Categorias> Cat_Categorias { get; set; }
        public DbSet<Cat_Personajes> Cat_Personajes { get; set; }
    }
}
