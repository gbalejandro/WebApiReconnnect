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
    public class NivelesController : ControllerBase
    {
        private readonly ApplicationDbContext context;

        public NivelesController(ApplicationDbContext context)
        {
            this.context = context;
        }

        // GET: api/Niveles
        [HttpGet]
        public ActionResult<IEnumerable<Cat_Niveles>> Get()
        {
            return context.Cat_Niveles.ToList();
        }

        // GET: api/Niveles/5
        [HttpGet("{id}")]
        public ActionResult<Cat_Niveles> Get(int id)
        {
            var nivel = context.Cat_Niveles.FirstOrDefault(x => x.Id_Nivel == id);

            if (nivel == null)
            {
                return NotFound();
            }

            return nivel;
        }

        // POST: api/Niveles
        [HttpPost]
        public ActionResult Post([FromBody] Cat_Niveles nivel)
        {
            context.Cat_Niveles.Add(nivel);
            context.SaveChanges();
            return Ok();
        }

        // PUT: api/Niveles/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Cat_Niveles value)
        {
            if (id != value.Id_Nivel)
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
