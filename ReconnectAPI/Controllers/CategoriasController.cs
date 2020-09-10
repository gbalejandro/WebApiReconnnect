using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ReconnectAPI.Models;

namespace ReconnectAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class CategoriasController : ControllerBase
    {
        private readonly ApplicationDbContext context;

        public CategoriasController(ApplicationDbContext context)
        {
            this.context = context;
        }

        // GET: api/Categorias
        [HttpGet]
        public ActionResult<IEnumerable<Cat_Categorias>> Get()
        {
            return context.Cat_Categorias.ToList();
        }

        // GET: api/Categorias/5
        [HttpGet("{id}")]
        public ActionResult<Cat_Categorias> Get(int id)
        {
            var categoria = context.Cat_Categorias.FirstOrDefault(x => x.Id_Categoria == id);

            if (categoria == null)
            {
                return NotFound();
            }

            return categoria;
        }

        // POST: api/Categorias
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Categorias/5
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
