using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ReconnectAPI.Models;

namespace ReconnectAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EquiposJugadoresController : ControllerBase
    {

        private readonly ApplicationDbContext context;

        public EquiposJugadoresController(ApplicationDbContext context)
        {
            this.context = context;
        }

        // GET: api/EquiposJugadores
        [HttpGet]
        public ActionResult<IEnumerable<Tbl_EquiposJugadores>> Get()
        {
            return context.Tbl_EquiposJugadores.ToList();
        }

        // GET: api/EquiposJugadores/5
        [HttpGet("{id}")]
        public ActionResult<Tbl_EquiposJugadores> Get(int id)
        {
            var equipo = context.Tbl_EquiposJugadores.FirstOrDefault(x => x.Id_EquipoJugador == id);

            if (equipo == null)
            {
                return NotFound();
            }

            return equipo;
        }

        // POST: api/EquiposJugadores
        [HttpPost]
        public ActionResult Post([FromBody] Tbl_EquiposJugadores equipo)
        {
            context.Tbl_EquiposJugadores.Add(equipo);
            context.SaveChanges();
            return Ok();
        }

        // PUT: api/EquiposJugadores/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Tbl_EquiposJugadores value)
        {
            if (id != value.Id_EquipoJugador)
            {
                return BadRequest();
            }

            context.Entry(value).State = EntityState.Modified;
            context.SaveChanges();
            return Ok();
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
