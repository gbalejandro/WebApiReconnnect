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
    public class RegistroJugadoresController : ControllerBase
    {
        private readonly ApplicationDbContext context;

        public RegistroJugadoresController(ApplicationDbContext context)
        {
            this.context = context;
        }

        // GET: api/RegistroJugadores
        [HttpGet]
        public ActionResult<IEnumerable<Tbl_RegistrosJugadores>> Get()
        {
            return context.Tbl_RegistrosJugadores.ToList();
        }

        // GET: api/RegistroJugadores/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/RegistroJugadores
        [HttpPost]
        public ActionResult Post([FromBody] Tbl_RegistrosJugadores registro)
        {
            context.Tbl_RegistrosJugadores.Add(registro);
            context.SaveChanges();
            return Ok();
        }

        // PUT: api/RegistroJugadores/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Tbl_RegistrosJugadores value)
        {
            if (id != value.Id_RegistroJugador)
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
