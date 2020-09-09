


Use Reconnect_DCG
go

-- Seleccion todas las familias

Select	Id_Familia
		, Descripcion as Familia
From Cat_Familias with (nolock)

-- Todos los niveles

Select Id_Nivel
,Descripcion as Nivel
,Puntaje_Maximo
,Tipo
From Cat_Niveles with (nolock)

-- Todas las categorias

Select
Id_Categoria
,Descripcion_Categoria	as Categoria
,Descripcion_Badge		as Badge
,n.Id_Nivel
,n.Descripcion			as Nivel_Categoria
,Puntos
From Cat_Niveles			as n with (nolock)
Inner Join Cat_Categorias	as c with (nolock) on n.Id_Nivel = c.Id_Nivel

-- Selección de Personajes por Familia y Nivel

Select p.Descripcion	as Personaje
	,f.Descripcion		as Familia
	,n.Descripcion		as Nivel
from Cat_Familias			as f with (nolock) 
inner join Cat_Personajes	as p with (nolock) on f.Id_Familia = p.Id_Familia
Inner join Cat_Niveles		as n with (nolock) on p.Id_Nivel = n.Id_Nivel
Where f.Id_Familia = 2 and n.Id_Nivel = 2


-- Todos los jugadores

Select Id_Jugador
,EmpleadoID
,UsuarioID
,Nombre_Completo
from Cat_Jugadores with (nolock)

-- Jugadores con registro por categoria, personajes y Nivel

Select j.Id_Jugador
, j.EmpleadoID
, j.UsuarioID
, j.Nombre_Completo			as Nombre_Jugador
, p.Descripcion				as Personaje
, np.Descripcion			as Nivel_Personaje
, f.Descripcion				as Familia_Personaje
, c.Descripcion_Categoria	as Categoria
, c.Descripcion_Badge		as Badge
, nc.Descripcion			as Nivel_Categoria
, rj.Fecha_Inicio
, rj.Fecha_Fecha_Fin
From Cat_Familias					as f  with(nolock)
inner join Cat_Personajes			as p  with(nolock) on f.Id_Familia = p.Id_Familia
Inner Join Cat_Niveles				as np with(nolock) on p.Id_Nivel = np.Id_Nivel
Inner join Tbl_RegistrosJugadores	as rj with(nolock) on p.Id_Personaje = rj.Id_Personaje
Inner join Cat_Jugadores			as j  with(nolock) on j.Id_Jugador = rj.Id_Jugador
Inner join Cat_Categorias			as c  with(nolock) on c.Id_Categoria = rj.Id_Categoria
Inner join Cat_Niveles				as nc with(nolock) on nc.Id_Nivel = c.Id_Nivel

--Todas las frecuencias

Select Id_Frecuencia
,Descripcion as Frecuencia
,Puntos 
from Cat_Frecuencias with (nolock)

-- Todas las activiades

Select Id_Actividad
,Id_Frecuencia
,Codigo
,Descripcion as Frecuencia
,Puntos
,Horas_Vigencia 
from Cat_Actividades with (nolock)

-- Actividades registradas por jugador

Select j.Id_Jugador
, j.EmpleadoID
, j.UsuarioID
, j.Nombre_Completo			as Nombre_Jugador
, p.Descripcion				as Personaje
, np.Descripcion			as Nivel_Personaje
, f.Descripcion				as Familia_Personaje
, c.Descripcion_Categoria	as Categoria
, c.Descripcion_Badge		as Badge
, nc.Descripcion			as Nivel_Categoria
, rj.Fecha_Inicio
, rj.Fecha_Fecha_Fin
, a.Codigo					as Codigo_Actividad
, a.Descripcion				as Actividad
, a.Codigo
, a.Descripcion				as Nombre_Actividad
, a.Puntos					as Puntos_Actividad
, a.Horas_Vigencia			as Vigencia_Actividad	
From Cat_Familias					as f  with(nolock)
inner join Cat_Personajes			as p  with(nolock) on f.Id_Familia = p.Id_Familia
Inner Join Cat_Niveles				as np with(nolock) on p.Id_Nivel = np.Id_Nivel
Inner join Tbl_RegistrosJugadores	as rj with(nolock) on p.Id_Personaje = rj.Id_Personaje
Inner join Cat_Jugadores			as j  with(nolock) on j.Id_Jugador = rj.Id_Jugador
Inner join Cat_Categorias			as c  with(nolock) on c.Id_Categoria = rj.Id_Categoria
Inner join Cat_Niveles				as nc with(nolock) on nc.Id_Nivel = c.Id_Nivel
Left  join Tbl_RegistrosActividades as ra with(nolock) on rj.Id_RegistroJugador = ra.Id_RegistroJugador
inner join Cat_Actividades			as a  with(nolock) on a.Id_Actividad = ra.Id_Actividad

-- Suma de puntos de jugadores por Categoria

Select 
Count (ra.Id_RegistroActividad) as Numero_Actividades
, sum(a.Puntos) as Suma_Puntos
,j.Id_Jugador
,EmpleadoID
,UsuarioID
,Nombre_Completo as Nombre_Jugador
,c.Descripcion_Categoria
,c.Descripcion_Badge
From Cat_Jugadores as j  with(nolock)
Inner join  Tbl_RegistrosJugadores	as rj with(nolock) on j.Id_Jugador = rj.Id_Jugador 
Inner join Cat_Categorias			as c  with(nolock) on c.Id_Categoria = rj.Id_Categoria
Inner join Cat_Niveles				as nc with(nolock) on nc.Id_Nivel = c.Id_Nivel
Left  join Tbl_RegistrosActividades as ra with(nolock) on rj.Id_RegistroJugador = ra.Id_RegistroJugador
inner join Cat_Actividades			as a  with(nolock) on a.Id_Actividad = ra.Id_Actividad
Group by j.Id_Jugador,EmpleadoID,UsuarioID,Nombre_Completo,c.Descripcion_Categoria,c.Descripcion_Badge



-- Suma de puntos de jugadores por Nivel

Select 
Count (ra.Id_RegistroActividad)	as Numero_Actividades
, sum(a.Puntos)					as Suma_Puntos
,j.Id_Jugador
,EmpleadoID
,UsuarioID
,Nombre_Completo				as Nombre_Jugador
,nc.Id_Nivel
,nc.Descripcion					as Nivel_Categoria
From Cat_Jugadores					as j  with(nolock)
Inner join  Tbl_RegistrosJugadores	as rj with(nolock) on j.Id_Jugador = rj.Id_Jugador 
Inner join Cat_Categorias			as c  with(nolock) on c.Id_Categoria = rj.Id_Categoria
Inner join Cat_Niveles				as nc with(nolock) on nc.Id_Nivel = c.Id_Nivel
Left  join Tbl_RegistrosActividades as ra with(nolock) on rj.Id_RegistroJugador = ra.Id_RegistroJugador
inner join Cat_Actividades			as a  with(nolock) on a.Id_Actividad = ra.Id_Actividad
Group by j.Id_Jugador,EmpleadoID,UsuarioID,Nombre_Completo,nc.Id_Nivel,nc.Descripcion

-- Jugadores por equipo


Select EmpleadoID
,UsuarioID
,Nombre_Completo
,p.Descripcion	as Personaje
,np.Descripcion as Nivel_Personaje
,f.Descripcion	as Familia_Personaje
,e.Descripcion	as Equipo
,ej.Lider
From Cat_Familias					as f  with(nolock)
inner join Cat_Personajes			as p  with(nolock) on f.Id_Familia = p.Id_Familia
Inner Join Cat_Niveles				as np with(nolock) on p.Id_Nivel = np.Id_Nivel
Inner join Tbl_RegistrosJugadores	as rj with(nolock) on p.Id_Personaje = rj.Id_Personaje
Inner join Cat_Jugadores			as j  with(nolock) on j.Id_Jugador = rj.Id_Jugador
Inner Join Tbl_EquiposJugadores		as ej with(nolock) on ej.Id_RegistroJugador = rj.Id_RegistroJugador
Inner Join Cat_Equipos				as e with (nolock) on e.Id_Equipo = ej.Id_Equipo


-- top 10 de jugadores por puntos  Personaje, categoria y nivel

Select top 10
Count (ra.Id_RegistroActividad) as Numero_Actividades
, sum(a.Puntos)					as Suma_Puntos
,j.Id_Jugador
,EmpleadoID
,UsuarioID
,Nombre_Completo				as Nombre_Jugador
,p.Descripcion					as Personaje
From Cat_Jugadores as j  with(nolock)
Inner join  Tbl_RegistrosJugadores	as rj with(nolock) on j.Id_Jugador = rj.Id_Jugador 
Inner join Cat_Categorias			as c  with(nolock) on c.Id_Categoria = rj.Id_Categoria
Inner join Cat_Niveles				as nc with(nolock) on nc.Id_Nivel = c.Id_Nivel
Inner Join Cat_Personajes			as p  with(nolock) on rj.Id_Personaje = p.Id_Personaje
Left  join Tbl_RegistrosActividades as ra with(nolock) on rj.Id_RegistroJugador = ra.Id_RegistroJugador
inner join Cat_Actividades			as a  with(nolock) on a.Id_Actividad = ra.Id_Actividad
where nc.Id_Nivel = 1
Group by j.Id_Jugador,EmpleadoID,UsuarioID,Nombre_Completo,p.Descripcion
order by Suma_Puntos desc

-- Top 10 de equipos por Nivel y general

Select top 10
Count (ra.Id_RegistroActividad) as Numero_Actividades
, sum(a.Puntos)					as Suma_Puntos
,nc.Id_Nivel
,e.Descripcion					as Equipo
From Cat_Jugadores as j  with(nolock)
Inner join  Tbl_RegistrosJugadores	as rj with(nolock) on j.Id_Jugador = rj.Id_Jugador 
Inner join Cat_Categorias			as c  with(nolock) on c.Id_Categoria = rj.Id_Categoria
Inner join Cat_Niveles				as nc with(nolock) on nc.Id_Nivel = c.Id_Nivel
Inner Join Cat_Personajes			as p  with(nolock) on rj.Id_Personaje = p.Id_Personaje
Left  join Tbl_RegistrosActividades as ra with(nolock) on rj.Id_RegistroJugador = ra.Id_RegistroJugador
inner join Cat_Actividades			as a  with(nolock) on a.Id_Actividad = ra.Id_Actividad
Inner Join Tbl_EquiposJugadores		as ej with(nolock) on ej.Id_RegistroJugador = rj.Id_RegistroJugador
Inner Join Cat_Equipos				as e with (nolock) on e.Id_Equipo = ej.Id_Equipo
Group by nc.Id_Nivel,e.Descripcion
Order by Suma_Puntos desc