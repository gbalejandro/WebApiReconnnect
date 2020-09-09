using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ReconnectAPI.Models;

namespace ReconnectAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonajesController : ControllerBase
    {
        private readonly ApplicationDbContext context;

        public PersonajesController(ApplicationDbContext context)
        {
            this.context = context;
        }
        // GET: api/Personajes
        [HttpGet]
        public ActionResult<IEnumerable<Cat_Personajes>> Get()
        {
            return context.Cat_Personajes.ToList();
        }

        // GET: api/Personajes/5
        [HttpGet("{id}")]
        public ActionResult<Cat_Personajes> Get(int id)
        {
            var personaje = context.Cat_Personajes.FirstOrDefault(x => x.Id_Personaje == id);

            if (personaje == null)
            {
                return NotFound();
            }

            return personaje;
        }

        // POST: api/Personajes
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Personajes/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
