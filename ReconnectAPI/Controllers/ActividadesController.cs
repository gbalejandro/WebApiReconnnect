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
    public class ActividadesController : ControllerBase
    {
        private readonly ApplicationDbContext context;

        public ActividadesController(ApplicationDbContext context)
        {
            this.context = context;
        }

        // GET: api/Actividades
        [HttpGet]
        public ActionResult<IEnumerable<Cat_Actividades>> Get()
        {
            return context.Cat_Actividades.ToList();
        }

        // GET: api/Actividades/5
        [HttpGet("{id}")]
        public ActionResult<Cat_Actividades> Get(int id)
        {
            var actividad = context.Cat_Actividades.FirstOrDefault(x => x.Id_Actividad == id);

            if (actividad == null)
            {
                return NotFound();
            }

            return actividad;
        }

        // POST: api/Actividades
        [HttpPost]
        public ActionResult Post([FromBody] Cat_Actividades actividad)
        {
            context.Cat_Actividades.Add(actividad);
            context.SaveChanges();
            return Ok();
        }

        // PUT: api/Actividades/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Cat_Actividades value)
        {
            if (id != value.Id_Actividad)
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
