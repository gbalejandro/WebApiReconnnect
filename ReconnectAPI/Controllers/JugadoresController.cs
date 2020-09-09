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
    public class JugadoresController : ControllerBase
    {
        private readonly ApplicationDbContext context;

        public JugadoresController(ApplicationDbContext context)
        {
            this.context = context;
        }

        // GET: api/Jugadores
        [HttpGet]
        public ActionResult<IEnumerable<Cat_Jugadores>> Get()
        {
            return context.Cat_Jugadores.ToList();
        }

        // GET: api/Jugadores/5
        [HttpGet("{id}")]
        public ActionResult<Cat_Jugadores> Get(int id)
        {
            var jugador = context.Cat_Jugadores.FirstOrDefault(x => x.Id_Jugador == id);

            if (jugador == null)
            {
                return NotFound();
            }

            return jugador;
        }

        // POST: api/Jugadores
        [HttpPost]
        public ActionResult Post([FromBody] Cat_Jugadores jugador)
        {
            context.Cat_Jugadores.Add(jugador);
            context.SaveChanges();
            return Ok(); 
        }

        // PUT: api/Jugadores/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Cat_Jugadores value)
        {
            if (id != value.Id_Jugador)
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
