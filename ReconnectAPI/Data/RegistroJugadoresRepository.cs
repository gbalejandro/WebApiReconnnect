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

        public async Task<RankingJugador> GetByRanking(int id)
        {
            using (SqlConnection conn = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                using (SqlCommand cmd = new SqlCommand("sp_RankingJugador", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id_Jugador", id));
                    RankingJugador response = null;
                    await conn.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response = MapToRanking(reader);
                        }
                    }
                    return response;
                }
            }
        }

        private RankingJugador MapToRanking(SqlDataReader reader)
        {
            return new RankingJugador()
            {
                Jugador = reader["Jugador"].ToString(),
                Familia = reader["Familia"].ToString(),
                Imagen = reader["Imagen"].ToString(),
                Ruta = reader["Ruta"].ToString()
            };
        }

        public async Task<ActividadJugador> GetByActivity(int id)
        {
            using (SqlConnection conn = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ActividadesPorJugador", conn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id_Jugador", id));
                    ActividadJugador response = null;
                    await conn.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response = MapToActivity(reader);
                        }
                    }
                    return response;
                }
            }
        }

        private ActividadJugador MapToActivity(SqlDataReader reader)
        {
            return new ActividadJugador()
            {
                EmpleadoID = reader["EmpleadoID"].ToString(),
                UsuarioID = reader["UsuarioID"].ToString(),
                Nombre_Jugador = reader["Nombre_Jugador"].ToString(),
                Codigo_Actividad = reader["Codigo_Actividad"].ToString(),
                Descripcion_Actividad = reader["Descripcion_Actividad"].ToString(),
                Puntos = (int)reader["Puntos"]
            };
        }
    }
}
