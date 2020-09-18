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
    public class FrecuenciasController : ControllerBase
    {

        private readonly ApplicationDbContext context;

        public FrecuenciasController(ApplicationDbContext context)
        {
            this.context = context;
        }

        // GET: api/Frecuencias
        [HttpGet]
        public ActionResult<IEnumerable<Cat_Frecuencias>> Get()
        {
            return context.Cat_Frecuencias.ToList();
        }

        // GET: api/Frecuencias/5
        [HttpGet("{id}")]
        public ActionResult<Cat_Frecuencias> Get(int id)
        {
            var frecuencia = context.Cat_Frecuencias.FirstOrDefault(x => x.Id_Frecuencia == id);

            if (frecuencia == null)
            {
                return NotFound();
            }

            return frecuencia;
        }

        // POST: api/Frecuencias
        [HttpPost]
        public ActionResult Post([FromBody] Cat_Frecuencias frecuencia)
        {
            context.Cat_Frecuencias.Add(frecuencia);
            context.SaveChanges();
            return Ok();
        }

        // PUT: api/Frecuencias/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Cat_Frecuencias value)
        {
            if (id != value.Id_Frecuencia)
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
