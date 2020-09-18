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
    public class EquiposController : ControllerBase
    {
        private readonly ApplicationDbContext context;

        public EquiposController(ApplicationDbContext context)
        {
            this.context = context;
        }

        // GET: api/Equipos
        [HttpGet]
        public ActionResult<IEnumerable<Cat_Equipos>> Get()
        {
            return context.Cat_Equipos.ToList();
        }

        // GET: api/Equipos/5
        [HttpGet("{id}")]
        public ActionResult<Cat_Equipos> Get(int id)
        {
            var equipo = context.Cat_Equipos.FirstOrDefault(x => x.Id_Equipo == id);

            if (equipo == null)
            {
                return NotFound();
            }

            return equipo;
        }

        // POST: api/Equipos
        [HttpPost]
        public ActionResult Post([FromBody] Cat_Equipos equipo)
        {
            context.Cat_Equipos.Add(equipo);
            context.SaveChanges();
            return Ok();
        }

        // PUT: api/Equipos/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Cat_Equipos value)
        {
            if (id != value.Id_Equipo)
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
