using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ReconnectAPI.Data;
using ReconnectAPI.Models;

namespace ReconnectAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SPRegistroJugadoresController : ControllerBase
    {
        private readonly RegistroJugadoresRepository _repository;

        public SPRegistroJugadoresController(RegistroJugadoresRepository repository)
        {
            _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }
        // GET: api/SPRegistroJugadores
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/SPRegistroJugadores/5
        [HttpGet("{id}")]
        public async Task<Object> Get(int id)
        {
            var info = await _repository.GetById(id);
            var ranking = await _repository.GetByRanking(id);
            var activity = await _repository.GetByActivity(id);
            var result = new Object[] { info, ranking, activity };
            //var response = await _repository.GetById(id);
            if (info == null && ranking == null && activity == null) { return NotFound(); }
            return result;
        }

        [HttpGet("{id}/getbyranking")]
        public async Task<ActionResult<RankingJugador>> GetByRanking(int id)
        {
            var response = await _repository.GetByRanking(id);
            if (response == null) { return NotFound(); }
            return response;
        }

        [HttpGet("{id}/getbyactivity")]
        public async Task<ActionResult<ActividadJugador>> GetByActivity(int id)
        {
            var response = await _repository.GetByActivity(id);
            if (response == null) { return NotFound(); }
            return response;
        }

        // POST: api/SPRegistroJugadores
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/SPRegistroJugadores/5
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
