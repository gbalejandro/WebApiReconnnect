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
    public class FamiliasController : ControllerBase
    {
        private readonly ApplicationDbContext context;

        public FamiliasController(ApplicationDbContext context)
        {
            this.context = context;
        }

        // GET: api/Familias
        [HttpGet]
        public ActionResult<IEnumerable<Cat_Familias>> Get()
        {
            return context.Cat_Familias.ToList();
        }

        // GET: api/Familias/5
        [HttpGet("{id}")]
        public ActionResult<Cat_Familias> Get(int id)
        {
            var familia = context.Cat_Familias.FirstOrDefault(x => x.Id_Familia == id);

            if (familia == null)
            {
                return NotFound();
            }

            return familia;
        }

        // POST: api/Familias
        [HttpPost]
        public ActionResult Post([FromBody] Cat_Familias familia)
        {
            context.Cat_Familias.Add(familia);
            context.SaveChanges();
            return Ok();
        }

        // PUT: api/Familias/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Cat_Familias value)
        {
            if (id != value.Id_Familia)
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
