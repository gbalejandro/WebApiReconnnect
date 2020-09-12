using Microsoft.Extensions.Configuration;
using ReconnectAPI.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ReconnectAPI.Data
{
    public class RegistroJugadoresRepository
    {
        private readonly IConfiguration _configuration;

        public RegistroJugadoresRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<RegistroJugadores> GetById(int id)
        {
            using (SqlConnection conn = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                using (SqlCommand cmd = new SqlCommand("sp_InformacionRegistro", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id_RegistroJugador", id));
                    RegistroJugadores response = null;
                    await conn.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response = MapToValue(reader);
                        }
                    }
                    return response;
                }
            }
        }

        private RegistroJugadores MapToValue(SqlDataReader reader)
        {
            return new RegistroJugadores()
            {
                Jugador = reader["Jugador"].ToString(),
                Personaje = reader["Personaje"].ToString(),
                Categoria = reader["Categoria"].ToString(),
                Familia = reader["Familia"].ToString(),
                Nivel = reader["Nivel"].ToString(),
                Puntos = (int)reader["Puntos"]
            };
        }
    }
}
