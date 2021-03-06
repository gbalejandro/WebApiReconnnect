USE [Reconnect_DCG]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_RegistrosJugadores]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_RegistrosJugadores] DROP CONSTRAINT IF EXISTS [FK_RegistrosJ_Personajes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_RegistrosJugadores]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_RegistrosJugadores] DROP CONSTRAINT IF EXISTS [FK_RegistrosJ_Jugadores]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_RegistrosJugadores]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_RegistrosJugadores] DROP CONSTRAINT IF EXISTS [FK_RegistrosJ_Categorias]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_RegistrosActividades]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_RegistrosActividades] DROP CONSTRAINT IF EXISTS [FK_RegistrosA_RegistrosJ]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_RegistrosActividades]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_RegistrosActividades] DROP CONSTRAINT IF EXISTS [FK_RegistrosA_Actividades]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_EquiposJugadores]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_EquiposJugadores] DROP CONSTRAINT IF EXISTS [FK_EquiposJugadores_RegistroJugadores]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_EquiposJugadores]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_EquiposJugadores] DROP CONSTRAINT IF EXISTS [FK_EquiposJugadores_Equipos]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_AsignacionPermisos]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_AsignacionPermisos] DROP CONSTRAINT IF EXISTS [FK_AsignacionRol_Usuario]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tbl_AsignacionPermisos]') AND type in (N'U'))
ALTER TABLE [dbo].[Tbl_AsignacionPermisos] DROP CONSTRAINT IF EXISTS [FK_AsignacionRol_Rol]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cat_Personajes]') AND type in (N'U'))
ALTER TABLE [dbo].[Cat_Personajes] DROP CONSTRAINT IF EXISTS [FK_Personajes_Niveles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cat_Personajes]') AND type in (N'U'))
ALTER TABLE [dbo].[Cat_Personajes] DROP CONSTRAINT IF EXISTS [FK_Personajes_Familias]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cat_Equipos]') AND type in (N'U'))
ALTER TABLE [dbo].[Cat_Equipos] DROP CONSTRAINT IF EXISTS [FK_Equipos_Atomos]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cat_Categorias]') AND type in (N'U'))
ALTER TABLE [dbo].[Cat_Categorias] DROP CONSTRAINT IF EXISTS [FK_Categorias_Niveles]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cat_Actividades]') AND type in (N'U'))
ALTER TABLE [dbo].[Cat_Actividades] DROP CONSTRAINT IF EXISTS [FK_Actividades_Frecuencias]
GO
/****** Object:  Table [dbo].[Tbl_RegistrosJugadores]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Tbl_RegistrosJugadores]
GO
/****** Object:  Table [dbo].[Tbl_RegistrosActividades]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Tbl_RegistrosActividades]
GO
/****** Object:  Table [dbo].[Tbl_EquiposJugadores]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Tbl_EquiposJugadores]
GO
/****** Object:  Table [dbo].[Tbl_AsignacionPermisos]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Tbl_AsignacionPermisos]
GO
/****** Object:  Table [dbo].[Cat_Usuarios]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cat_Usuarios]
GO
/****** Object:  Table [dbo].[Cat_Roles]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cat_Roles]
GO
/****** Object:  Table [dbo].[Cat_Personajes]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cat_Personajes]
GO
/****** Object:  Table [dbo].[Cat_Niveles]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cat_Niveles]
GO
/****** Object:  Table [dbo].[Cat_Jugadores]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cat_Jugadores]
GO
/****** Object:  Table [dbo].[Cat_Frecuencias]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cat_Frecuencias]
GO
/****** Object:  Table [dbo].[Cat_Familias]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cat_Familias]
GO
/****** Object:  Table [dbo].[Cat_Equipos]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cat_Equipos]
GO
/****** Object:  Table [dbo].[Cat_Categorias]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cat_Categorias]
GO
/****** Object:  Table [dbo].[Cat_Atomos]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cat_Atomos]
GO
/****** Object:  Table [dbo].[Cat_Actividades]    Script Date: 01/09/2020 05:52:36 p. m. ******/
DROP TABLE IF EXISTS [dbo].[Cat_Actividades]
GO
/****** Object:  Table [dbo].[Cat_Actividades]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Actividades](
	[Id_Actividad] [int] IDENTITY(1,1) NOT NULL,
	[Id_Frecuencia] [int] NULL,
	[Codigo] [varchar](25) NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Puntos] [int] NOT NULL,
	[Horas_Vigencia] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_Actividades] PRIMARY KEY CLUSTERED 
(
	[Id_Actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Actividades] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Atomos]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Atomos](
	[Id_Atomo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Ruta] [varchar](200) NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_Atomos] PRIMARY KEY CLUSTERED 
(
	[Id_Atomo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Atomos] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Categorias]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Categorias](
	[Id_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Id_Nivel] [int] NULL,
	[Descripcion_Categoria] [varchar](50) NOT NULL,
	[Descripcion_Badge] [varchar](70) NOT NULL,
	[Puntos] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Id_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Categorias] UNIQUE NONCLUSTERED 
(
	[Id_Nivel] ASC,
	[Descripcion_Categoria] ASC,
	[Descripcion_Badge] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Equipos]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Equipos](
	[Id_Equipo] [int] IDENTITY(1,1) NOT NULL,
	[Id_Atomo] [int] NOT NULL,
	[Descripcion] [varchar](60) NOT NULL,
	[Numero_Integrantes] [int] NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_Equipos] PRIMARY KEY CLUSTERED 
(
	[Id_Equipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Equipos] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Familias]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Familias](
	[Id_Familia] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](40) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_Familias] PRIMARY KEY CLUSTERED 
(
	[Id_Familia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Familias] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Frecuencias]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Frecuencias](
	[Id_Frecuencia] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](40) NOT NULL,
	[Puntos] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_Frecuencias] PRIMARY KEY CLUSTERED 
(
	[Id_Frecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Frecuencias] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Jugadores]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Jugadores](
	[Id_Jugador] [int] IDENTITY(1,1) NOT NULL,
	[EmpleadoID] [varchar](30) NOT NULL,
	[UsuarioID] [varchar](30) NOT NULL,
	[Nombre_Completo] [varchar](60) NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_Jugadores] PRIMARY KEY CLUSTERED 
(
	[Id_Jugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Jugadores] UNIQUE NONCLUSTERED 
(
	[EmpleadoID] ASC,
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Niveles]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Niveles](
	[Id_Nivel] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](35) NOT NULL,
	[Puntaje_Maximo] [int] NOT NULL,
	[Tipo] [varchar](35) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_Niveles] PRIMARY KEY CLUSTERED 
(
	[Id_Nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Niveles] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Personajes]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Personajes](
	[Id_Personaje] [int] IDENTITY(1,1) NOT NULL,
	[Id_Familia] [int] NOT NULL,
	[Id_Nivel] [int] NOT NULL,
	[Descripcion] [varchar](40) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_Personajes] PRIMARY KEY CLUSTERED 
(
	[Id_Personaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Personajes] UNIQUE NONCLUSTERED 
(
	[Id_Familia] ASC,
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Roles]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Roles](
	[Id_Rol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](40) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Roles] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cat_Usuarios]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cat_Usuarios](
	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[EmpleadoID] [varchar](30) NOT NULL,
	[UsuarioID] [varchar](30) NOT NULL,
	[Nombre_Completo] [varchar](60) NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Usuarios] UNIQUE NONCLUSTERED 
(
	[EmpleadoID] ASC,
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_AsignacionPermisos]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_AsignacionPermisos](
	[Id_Usuario] [int] NOT NULL,
	[Id_Rol] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_AsignacionPermisos] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC,
	[Id_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_EquiposJugadores]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_EquiposJugadores](
	[Id_EquipoJugador] [int] IDENTITY(1,1) NOT NULL,
	[Id_Equipo] [int] NOT NULL,
	[Id_RegistroJugador] [int] NOT NULL,
	[Lider] [bit] NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_EquiposJugadores] PRIMARY KEY CLUSTERED 
(
	[Id_EquipoJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_EquiposJugadores] UNIQUE NONCLUSTERED 
(
	[Id_Equipo] ASC,
	[Id_RegistroJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_RegistrosActividades]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_RegistrosActividades](
	[Id_RegistroActividad] [int] IDENTITY(1,1) NOT NULL,
	[Id_RegistroJugador] [int] NOT NULL,
	[Id_Actividad] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Registro] [smalldatetime] NOT NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_RegistrosActividades] PRIMARY KEY CLUSTERED 
(
	[Id_RegistroActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_RegistrosActividades] UNIQUE NONCLUSTERED 
(
	[Id_RegistroJugador] ASC,
	[Id_Actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_RegistrosJugadores]    Script Date: 01/09/2020 05:52:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_RegistrosJugadores](
	[Id_RegistroJugador] [int] IDENTITY(1,1) NOT NULL,
	[Id_Jugador] [int] NOT NULL,
	[Id_Categoria] [int] NOT NULL,
	[Id_Personaje] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Fecha_Inicio] [smalldatetime] NOT NULL,
	[Fecha_Fin] [smalldatetime] NULL,
	[Fecha_Actualizacion] [smalldatetime] NULL,
 CONSTRAINT [PK_RegistrosJugadores] PRIMARY KEY CLUSTERED 
(
	[Id_RegistroJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_RegistrosJugadores] UNIQUE NONCLUSTERED 
(
	[Id_Jugador] ASC,
	[Id_Categoria] ASC,
	[Id_Personaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cat_Actividades]  WITH CHECK ADD  CONSTRAINT [FK_Actividades_Frecuencias] FOREIGN KEY([Id_Frecuencia])
REFERENCES [dbo].[Cat_Frecuencias] ([Id_Frecuencia])
GO
ALTER TABLE [dbo].[Cat_Actividades] CHECK CONSTRAINT [FK_Actividades_Frecuencias]
GO
ALTER TABLE [dbo].[Cat_Categorias]  WITH CHECK ADD  CONSTRAINT [FK_Categorias_Niveles] FOREIGN KEY([Id_Nivel])
REFERENCES [dbo].[Cat_Niveles] ([Id_Nivel])
GO
ALTER TABLE [dbo].[Cat_Categorias] CHECK CONSTRAINT [FK_Categorias_Niveles]
GO
ALTER TABLE [dbo].[Cat_Equipos]  WITH CHECK ADD  CONSTRAINT [FK_Equipos_Atomos] FOREIGN KEY([Id_Atomo])
REFERENCES [dbo].[Cat_Atomos] ([Id_Atomo])
GO
ALTER TABLE [dbo].[Cat_Equipos] CHECK CONSTRAINT [FK_Equipos_Atomos]
GO
ALTER TABLE [dbo].[Cat_Personajes]  WITH CHECK ADD  CONSTRAINT [FK_Personajes_Familias] FOREIGN KEY([Id_Familia])
REFERENCES [dbo].[Cat_Familias] ([Id_Familia])
GO
ALTER TABLE [dbo].[Cat_Personajes] CHECK CONSTRAINT [FK_Personajes_Familias]
GO
ALTER TABLE [dbo].[Cat_Personajes]  WITH CHECK ADD  CONSTRAINT [FK_Personajes_Niveles] FOREIGN KEY([Id_Nivel])
REFERENCES [dbo].[Cat_Niveles] ([Id_Nivel])
GO
ALTER TABLE [dbo].[Cat_Personajes] CHECK CONSTRAINT [FK_Personajes_Niveles]
GO
ALTER TABLE [dbo].[Tbl_AsignacionPermisos]  WITH CHECK ADD  CONSTRAINT [FK_AsignacionRol_Rol] FOREIGN KEY([Id_Rol])
REFERENCES [dbo].[Cat_Roles] ([Id_Rol])
GO
ALTER TABLE [dbo].[Tbl_AsignacionPermisos] CHECK CONSTRAINT [FK_AsignacionRol_Rol]
GO
ALTER TABLE [dbo].[Tbl_AsignacionPermisos]  WITH CHECK ADD  CONSTRAINT [FK_AsignacionRol_Usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Cat_Usuarios] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Tbl_AsignacionPermisos] CHECK CONSTRAINT [FK_AsignacionRol_Usuario]
GO
ALTER TABLE [dbo].[Tbl_EquiposJugadores]  WITH CHECK ADD  CONSTRAINT [FK_EquiposJugadores_Equipos] FOREIGN KEY([Id_Equipo])
REFERENCES [dbo].[Cat_Equipos] ([Id_Equipo])
GO
ALTER TABLE [dbo].[Tbl_EquiposJugadores] CHECK CONSTRAINT [FK_EquiposJugadores_Equipos]
GO
ALTER TABLE [dbo].[Tbl_EquiposJugadores]  WITH CHECK ADD  CONSTRAINT [FK_EquiposJugadores_RegistroJugadores] FOREIGN KEY([Id_RegistroJugador])
REFERENCES [dbo].[Tbl_RegistrosJugadores] ([Id_RegistroJugador])
GO
ALTER TABLE [dbo].[Tbl_EquiposJugadores] CHECK CONSTRAINT [FK_EquiposJugadores_RegistroJugadores]
GO
ALTER TABLE [dbo].[Tbl_RegistrosActividades]  WITH CHECK ADD  CONSTRAINT [FK_RegistrosA_Actividades] FOREIGN KEY([Id_Actividad])
REFERENCES [dbo].[Cat_Actividades] ([Id_Actividad])
GO
ALTER TABLE [dbo].[Tbl_RegistrosActividades] CHECK CONSTRAINT [FK_RegistrosA_Actividades]
GO
ALTER TABLE [dbo].[Tbl_RegistrosActividades]  WITH CHECK ADD  CONSTRAINT [FK_RegistrosA_RegistrosJ] FOREIGN KEY([Id_RegistroJugador])
REFERENCES [dbo].[Tbl_RegistrosJugadores] ([Id_RegistroJugador])
GO
ALTER TABLE [dbo].[Tbl_RegistrosActividades] CHECK CONSTRAINT [FK_RegistrosA_RegistrosJ]
GO
ALTER TABLE [dbo].[Tbl_RegistrosJugadores]  WITH CHECK ADD  CONSTRAINT [FK_RegistrosJ_Categorias] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[Cat_Categorias] ([Id_Categoria])
GO
ALTER TABLE [dbo].[Tbl_RegistrosJugadores] CHECK CONSTRAINT [FK_RegistrosJ_Categorias]
GO
ALTER TABLE [dbo].[Tbl_RegistrosJugadores]  WITH CHECK ADD  CONSTRAINT [FK_RegistrosJ_Jugadores] FOREIGN KEY([Id_Jugador])
REFERENCES [dbo].[Cat_Jugadores] ([Id_Jugador])
GO
ALTER TABLE [dbo].[Tbl_RegistrosJugadores] CHECK CONSTRAINT [FK_RegistrosJ_Jugadores]
GO
ALTER TABLE [dbo].[Tbl_RegistrosJugadores]  WITH CHECK ADD  CONSTRAINT [FK_RegistrosJ_Personajes] FOREIGN KEY([Id_Personaje])
REFERENCES [dbo].[Cat_Personajes] ([Id_Personaje])
GO
ALTER TABLE [dbo].[Tbl_RegistrosJugadores] CHECK CONSTRAINT [FK_RegistrosJ_Personajes]
GO

-- nuevos scripts

-- 10092020 AGB
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UsuarioLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_UsuarioLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Procedimientos Almacenados

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_InformacionRegistro] 
	@Id_RegistroJugador int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.Nombre_Completo Jugador, c.Descripcion Personaje, d.Descripcion_Categoria Categoria,
	e.Descripcion Familia, f.Descripcion Nivel, d.Puntos, h.Descripcion Equipo
	from Cat_Jugadores a inner join Tbl_RegistrosJugadores b on a.Id_Jugador = b.Id_Jugador 
	inner join Cat_Personajes c on b.Id_Personaje = c.Id_Personaje
	inner join Cat_Categorias d on b.Id_Categoria = d.Id_Categoria
	inner join Cat_Familias e on c.Id_Familia = e.Id_Familia
	inner join Cat_Niveles f on d.Id_Nivel = f.Id_Nivel
	left outer join Tbl_EquiposJugadores g on b.Id_RegistroJugador = g.Id_RegistroJugador
	left outer join Cat_Equipos h on g.Id_Equipo = h.Id_Equipo
	where b.Id_RegistroJugador = @Id_RegistroJugador
END
GO

-----------------------------------------------------------------

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_ActividadesPorJugador] 
	@Id_Jugador int
AS
BEGIN

	SET NOCOUNT ON;

    select a.EmpleadoID, a.UsuarioID, a.Nombre_Completo Nombre_Jugador, d.Codigo Codigo_Actividad, 
	d.Descripcion Descripcion_Actividad, d.Puntos
	from Cat_Jugadores a inner join Tbl_RegistrosJugadores b on a.Id_Jugador = b.Id_Jugador
	inner join Tbl_RegistrosActividades c on b.Id_RegistroJugador = c.Id_RegistroJugador
	inner join Cat_Actividades d on c.Id_Actividad = d.Id_Actividad
	where a.Id_Jugador = @Id_Jugador
END
GO

---------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_RankingJugador] 
	@Id_Jugador int
AS
BEGIN

	SET NOCOUNT ON;

	select distinct a.Nombre_Completo Jugador, d.Descripcion Familia, g.Descripcion Imagen, g.Ruta
	from Cat_Jugadores a inner join  Tbl_RegistrosJugadores b on a.Id_Jugador = b.Id_Jugador
	inner join Cat_Personajes c on b.Id_Personaje = c.Id_Personaje
	inner join Cat_Familias d on c.Id_Familia = d.Id_Familia
	inner join Tbl_EquiposJugadores e on b.Id_RegistroJugador = e.Id_RegistroJugador
	inner join Cat_Equipos f on e.Id_Equipo = f.Id_Equipo
	inner join Cat_Atomos g on f.Id_Atomo = g.Id_Atomo
	left outer join Tbl_RegistrosActividades h on b.Id_RegistroJugador = h.Id_RegistroJugador
	inner join Cat_Actividades i on h.Id_Actividad = i.Id_Actividad
	where a.Id_Jugador = @Id_Jugador and d.Activo = 1
END
GO

------------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_RankingGeneralTop10] 

AS
BEGIN

	SET NOCOUNT ON;

	select top 10 row_number() over(order by sum(f.Puntos)desc) Posicion, a.Nombre_Completo Jugador, c.Descripcion Personaje, 
	d.Descripcion Familia, SUM(f.Puntos) Puntos 
	from Cat_Jugadores a inner join Tbl_RegistrosJugadores b on a.Id_Jugador = b.Id_Jugador
	inner join Cat_Personajes c on b.Id_Personaje = c.Id_Personaje
	inner join Cat_Familias d on c.Id_Familia = d.Id_Familia
	inner join Tbl_RegistrosActividades e on b.Id_RegistroJugador = e.Id_RegistroJugador
	right outer join Cat_Actividades f on e.Id_Actividad = f.Id_Actividad
	where a.Activo = 1 
	group by a.Nombre_Completo, c.Descripcion, d.Descripcion
	order by sum(f.Puntos) desc
END
GO
