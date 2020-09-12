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
    public class AtomosController : ControllerBase
    {
        private readonly ApplicationDbContext context;

        public AtomosController(ApplicationDbContext context)
        {
            this.context = context;
        }

        // GET: api/Atomos
        [HttpGet]
        public ActionResult<IEnumerable<Cat_Atomos>> Get()
        {
            return context.Cat_Atomos.ToList();
        }

        // GET: api/Atomos/5
        [HttpGet("{id}")]
        public ActionResult<Cat_Atomos> Get(int id)
        {
            var atomo = context.Cat_Atomos.FirstOrDefault(x => x.Id_Atomo == id);

            if (atomo == null)
            {
                return NotFound();
            }

            return atomo;
        }

        // POST: api/Atomos
        [HttpPost]
        public ActionResult Post([FromBody] Cat_Atomos atomo)
        {
            context.Cat_Atomos.Add(atomo);
            context.SaveChanges();
            return Ok();
        }

        // PUT: api/Atomos/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Cat_Atomos value)
        {
            if (id != value.Id_Atomo)
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
