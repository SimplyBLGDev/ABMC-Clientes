USE [master]
GO
/****** Object:  Database [BugsTracker]    Script Date: 10/11/2020 23:31:51 ******/
CREATE DATABASE [BugsTracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BugsTracker', FILENAME = N'C:\BugsTracker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BugsTracker_log', FILENAME = N'C:\BugsTracker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BugsTracker] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BugsTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BugsTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BugsTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BugsTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BugsTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BugsTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [BugsTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BugsTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BugsTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BugsTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BugsTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BugsTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BugsTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BugsTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BugsTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BugsTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BugsTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BugsTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BugsTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BugsTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BugsTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BugsTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BugsTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BugsTracker] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BugsTracker] SET  MULTI_USER 
GO
ALTER DATABASE [BugsTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BugsTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BugsTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BugsTracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BugsTracker] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BugsTracker] SET QUERY_STORE = OFF
GO
USE [BugsTracker]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BugsTracker]
GO
/****** Object:  Table [dbo].[Barrios]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barrios](
	[id_barrio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[borrado] [bit] NULL,
 CONSTRAINT [PK_Barrios] PRIMARY KEY CLUSTERED 
(
	[id_barrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasosDePrueba]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasosDePrueba](
	[id_caso_prueba] [int] IDENTITY(1,1) NOT NULL,
	[id_plan_prueba] [int] NOT NULL,
	[titulo] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
	[id_responsable] [int] NULL,
	[borrado] [bit] NULL,
 CONSTRAINT [PK_CasosDePrueba_1] PRIMARY KEY CLUSTERED 
(
	[id_caso_prueba] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CiclosPrueba]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CiclosPrueba](
	[id_ciclo_prueba] [int] IDENTITY(1,1) NOT NULL,
	[fecha_inicio_ejecucion] [datetime] NULL,
	[fecha_fin_ejecucion] [datetime] NULL,
	[id_responsable] [int] NULL,
	[id_plan_prueba] [int] NULL,
	[aceptado] [bit] NULL,
	[borrado] [bit] NULL,
 CONSTRAINT [PK_CiclosPrueba] PRIMARY KEY CLUSTERED 
(
	[id_ciclo_prueba] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CiclosPruebaDetalle]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CiclosPruebaDetalle](
	[id_ciclo_prueba_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_ciclo_prueba] [int] NULL,
	[id_caso_prueba] [int] NULL,
	[id_usuario_tester] [int] NULL,
	[cantidad_horas] [decimal](18, 0) NULL,
	[fecha_ejecucion] [datetime] NULL,
	[aceptado] [bit] NULL,
	[borrado] [bit] NULL,
 CONSTRAINT [PK_CiclosPruebaDetalle] PRIMARY KEY CLUSTERED 
(
	[id_ciclo_prueba_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[cuit] [varchar](50) NULL,
	[razon_social] [varchar](50) NULL,
	[borrado] [bit] NULL,
	[calle] [varchar](500) NULL,
	[numero] [varchar](50) NULL,
	[fecha_alta] [datetime] NULL,
	[id_barrio] [int] NULL,
	[id_contacto] [int] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contactos]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contactos](
	[id_contacto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[borrado] [bit] NULL,
 CONSTRAINT [PK_Contactos] PRIMARY KEY CLUSTERED 
(
	[id_contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[id_factura] [int] IDENTITY(1,1) NOT NULL,
	[numero_factura] [varchar](50) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_usuario_creador] [int] NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturasDetalle]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturasDetalle](
	[id_detalle_factura] [int] IDENTITY(1,1) NOT NULL,
	[id_factura] [int] NULL,
	[numero_orden] [int] NULL,
	[id_producto] [int] NULL,
	[id_proyecto] [int] NULL,
	[id_ciclo_prueba] [int] NULL,
	[precio] [decimal](18, 0) NULL,
	[borrado] [bit] NULL,
 CONSTRAINT [PK_FacturaDetalles] PRIMARY KEY CLUSTERED 
(
	[id_detalle_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfiles](
	[id_perfil] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanesDePrueba]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanesDePrueba](
	[id_plan_prueba] [int] IDENTITY(1,1) NOT NULL,
	[id_proyecto] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[id_responsable] [int] NULL,
	[descripcion] [varchar](100) NULL,
	[borrado] [bit] NULL,
 CONSTRAINT [PK_PlanesDePrueba] PRIMARY KEY CLUSTERED 
(
	[id_plan_prueba] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[borrado] [bit] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proyectos]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyectos](
	[id_proyecto] [int] NOT NULL,
	[id_producto] [int] NULL,
	[descripcion] [varchar](50) NULL,
	[version] [varchar](50) NULL,
	[alcance] [varchar](50) NULL,
	[id_responsable] [int] NULL,
	[borrado] [bit] NULL,
 CONSTRAINT [PK_Proyectos] PRIMARY KEY CLUSTERED 
(
	[id_proyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 10/11/2020 23:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_perfil] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[password] [varchar](10) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[borrado] [bit] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Barrios] ON 

INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (1, N'BarrioA_', 1)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (2, N'Barrio2', 1)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (1002, N'Bruh', 1)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (2002, N'Barra321312312', 1)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (3002, N'Bruh', 1)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (4002, N'AAAAB', 1)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (5002, N'Alberdi', 0)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (5003, N'Alta Cordoba', 0)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (5004, N'Yofre', 0)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (5005, N'Guemes', 0)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (5006, N'Nueva Cordoba', 0)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (5007, N'San Martin', 0)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (5008, N'Belgrano', 0)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (5009, N'Parque montecristo', 0)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (5010, N'General Paz', 0)
INSERT [dbo].[Barrios] ([id_barrio], [nombre], [borrado]) VALUES (5011, N'Cofico', 0)
SET IDENTITY_INSERT [dbo].[Barrios] OFF
GO
SET IDENTITY_INSERT [dbo].[CasosDePrueba] ON 

INSERT [dbo].[CasosDePrueba] ([id_caso_prueba], [id_plan_prueba], [titulo], [descripcion], [id_responsable], [borrado]) VALUES (1, 2, N'who', N'what', 0, 1)
INSERT [dbo].[CasosDePrueba] ([id_caso_prueba], [id_plan_prueba], [titulo], [descripcion], [id_responsable], [borrado]) VALUES (2, 3, N'why', N'how', 0, 1)
INSERT [dbo].[CasosDePrueba] ([id_caso_prueba], [id_plan_prueba], [titulo], [descripcion], [id_responsable], [borrado]) VALUES (1002, 3002, N'Gerencia wrong password', N'La gerencia ingresa una contraseña invalida', 2, 0)
INSERT [dbo].[CasosDePrueba] ([id_caso_prueba], [id_plan_prueba], [titulo], [descripcion], [id_responsable], [borrado]) VALUES (1003, 3003, N'No authorized acces', N'Un usuario sin privilegios intenta acceder a los elementos de cobro', 2, 0)
INSERT [dbo].[CasosDePrueba] ([id_caso_prueba], [id_plan_prueba], [titulo], [descripcion], [id_responsable], [borrado]) VALUES (1004, 3004, N'Air block', N'Un objeto bloquea un tubo completamente', 7, 0)
INSERT [dbo].[CasosDePrueba] ([id_caso_prueba], [id_plan_prueba], [titulo], [descripcion], [id_responsable], [borrado]) VALUES (1005, 3005, N'Non existent employee', N'Se intenta crear un jefe para un empleado inexistente', 4, 0)
INSERT [dbo].[CasosDePrueba] ([id_caso_prueba], [id_plan_prueba], [titulo], [descripcion], [id_responsable], [borrado]) VALUES (1006, 3006, N'No data', N'No hay datos para mostrar', 5, 0)
INSERT [dbo].[CasosDePrueba] ([id_caso_prueba], [id_plan_prueba], [titulo], [descripcion], [id_responsable], [borrado]) VALUES (1007, 3007, N'Missassigned pay', N'Valor de sueldo no corresponde a usuario', 6, 0)
INSERT [dbo].[CasosDePrueba] ([id_caso_prueba], [id_plan_prueba], [titulo], [descripcion], [id_responsable], [borrado]) VALUES (1008, 3008, N'Invalid ticket format', N'Guiones mal colocados en la string', 7, 0)
INSERT [dbo].[CasosDePrueba] ([id_caso_prueba], [id_plan_prueba], [titulo], [descripcion], [id_responsable], [borrado]) VALUES (1009, 3009, N'Invalid CUIL format', N'Exceso de cantidad de digitos', 7, 0)
INSERT [dbo].[CasosDePrueba] ([id_caso_prueba], [id_plan_prueba], [titulo], [descripcion], [id_responsable], [borrado]) VALUES (1012, 3002, N'Auth token timed out', N'El permiso de acceso caducado por tiempo ', 4, 0)
INSERT [dbo].[CasosDePrueba] ([id_caso_prueba], [id_plan_prueba], [titulo], [descripcion], [id_responsable], [borrado]) VALUES (1013, 3006, N'Access granted', N'El cliente tiene acceso a sus propios datos privados', 2, 0)
SET IDENTITY_INSERT [dbo].[CasosDePrueba] OFF
GO
SET IDENTITY_INSERT [dbo].[CiclosPrueba] ON 

INSERT [dbo].[CiclosPrueba] ([id_ciclo_prueba], [fecha_inicio_ejecucion], [fecha_fin_ejecucion], [id_responsable], [id_plan_prueba], [aceptado], [borrado]) VALUES (15, CAST(N'2020-10-13T11:42:46.000' AS DateTime), CAST(N'2020-10-13T11:42:46.000' AS DateTime), 2, 2, 1, 1)
INSERT [dbo].[CiclosPrueba] ([id_ciclo_prueba], [fecha_inicio_ejecucion], [fecha_fin_ejecucion], [id_responsable], [id_plan_prueba], [aceptado], [borrado]) VALUES (1013, CAST(N'2020-10-14T09:36:59.000' AS DateTime), CAST(N'2020-10-14T09:36:59.000' AS DateTime), 2, 2, 1, 1)
INSERT [dbo].[CiclosPrueba] ([id_ciclo_prueba], [fecha_inicio_ejecucion], [fecha_fin_ejecucion], [id_responsable], [id_plan_prueba], [aceptado], [borrado]) VALUES (2012, CAST(N'2020-11-07T09:07:10.000' AS DateTime), CAST(N'2020-11-07T09:07:10.000' AS DateTime), 1, 2, 1, 1)
INSERT [dbo].[CiclosPrueba] ([id_ciclo_prueba], [fecha_inicio_ejecucion], [fecha_fin_ejecucion], [id_responsable], [id_plan_prueba], [aceptado], [borrado]) VALUES (3012, CAST(N'2020-10-01T10:35:26.000' AS DateTime), CAST(N'2020-11-10T10:35:26.000' AS DateTime), 1, 3004, 1, 0)
INSERT [dbo].[CiclosPrueba] ([id_ciclo_prueba], [fecha_inicio_ejecucion], [fecha_fin_ejecucion], [id_responsable], [id_plan_prueba], [aceptado], [borrado]) VALUES (3013, CAST(N'2020-08-01T10:35:26.000' AS DateTime), CAST(N'2020-11-10T10:35:26.000' AS DateTime), 1, 3002, 1, 0)
INSERT [dbo].[CiclosPrueba] ([id_ciclo_prueba], [fecha_inicio_ejecucion], [fecha_fin_ejecucion], [id_responsable], [id_plan_prueba], [aceptado], [borrado]) VALUES (3014, CAST(N'2020-10-15T10:38:36.000' AS DateTime), CAST(N'2020-10-31T10:38:36.000' AS DateTime), 6, 3009, 1, 0)
INSERT [dbo].[CiclosPrueba] ([id_ciclo_prueba], [fecha_inicio_ejecucion], [fecha_fin_ejecucion], [id_responsable], [id_plan_prueba], [aceptado], [borrado]) VALUES (3015, CAST(N'2020-08-01T10:38:36.000' AS DateTime), CAST(N'2020-08-29T10:38:36.000' AS DateTime), 6, 3006, 1, 0)
SET IDENTITY_INSERT [dbo].[CiclosPrueba] OFF
GO
SET IDENTITY_INSERT [dbo].[CiclosPruebaDetalle] ON 

INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (4, 15, 1, 1, CAST(1 AS Decimal(18, 0)), CAST(N'2020-10-13T11:42:46.000' AS DateTime), 1, 1)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (1003, 1013, 1, 1, CAST(1 AS Decimal(18, 0)), CAST(N'2020-10-14T09:36:59.000' AS DateTime), 1, 1)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (2002, 2012, 1, 2, CAST(3 AS Decimal(18, 0)), CAST(N'2020-11-07T09:07:10.000' AS DateTime), 1, 1)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (2003, 2012, 2, 5, CAST(4 AS Decimal(18, 0)), CAST(N'2020-11-07T09:07:10.000' AS DateTime), 1, 1)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (3002, 3012, 1004, 2, CAST(3 AS Decimal(18, 0)), CAST(N'2020-10-02T10:35:26.000' AS DateTime), 1, 0)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (3003, 3012, 1004, 2, CAST(5 AS Decimal(18, 0)), CAST(N'2020-10-09T10:35:26.000' AS DateTime), 1, 0)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (3004, 3012, 1004, 6, CAST(1 AS Decimal(18, 0)), CAST(N'2020-10-23T10:35:26.000' AS DateTime), 1, 0)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (3005, 3013, 1002, 4, CAST(2 AS Decimal(18, 0)), CAST(N'2020-11-10T12:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (3006, 3013, 1012, 4, CAST(4 AS Decimal(18, 0)), CAST(N'2020-09-17T12:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (3007, 3014, 1009, 7, CAST(3 AS Decimal(18, 0)), CAST(N'2020-10-23T10:38:36.000' AS DateTime), 1, 0)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (3008, 3014, 1009, 5, CAST(1 AS Decimal(18, 0)), CAST(N'2020-10-24T10:38:36.000' AS DateTime), 1, 0)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (3009, 3015, 1006, 2, CAST(2 AS Decimal(18, 0)), CAST(N'2020-08-13T12:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (3010, 3015, 1006, 2, CAST(2 AS Decimal(18, 0)), CAST(N'2020-08-14T12:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[CiclosPruebaDetalle] ([id_ciclo_prueba_detalle], [id_ciclo_prueba], [id_caso_prueba], [id_usuario_tester], [cantidad_horas], [fecha_ejecucion], [aceptado], [borrado]) VALUES (3011, 3015, 1006, 5, CAST(3 AS Decimal(18, 0)), CAST(N'2020-08-25T12:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[CiclosPruebaDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (1, N'AAAAAAC', N'AAAAAAAAA____', 1, N'AAAAAAAAAAAA', N'AAAAAAAAB', CAST(N'2020-09-13T08:22:44.000' AS DateTime), 1, 1)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (2, N'AAAAAA', N'AAAAAAAAAAAAAA', 1, N'AAAAAAAAAAAA', N'C', CAST(N'2020-09-13T08:22:44.000' AS DateTime), 1, 1)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (3, N'AAAAAA', N'AAAAAAAAAAAAAA', 1, N'AAAAAAAAAAAA', N'AAAAAAAAB', CAST(N'2020-09-13T08:22:44.000' AS DateTime), 1, 1)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (4, N'AAAAAA', N'AAAAAAAAAAAAAA', 1, N'AAAAAAAAAAAA', N'D', CAST(N'2020-09-13T08:22:44.000' AS DateTime), 1, 1)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (5, N'AAAAAA', N'AAAAAAAAAAAAAA', 1, N'AAAAAAAAAAAA', N'AAAAAAAAB', CAST(N'2020-09-13T08:22:44.000' AS DateTime), 1, 1)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6, N'123-456-789', N'JP', 1, N'Rivadavia', N'388', CAST(N'2020-09-13T21:26:28.630' AS DateTime), 1, 1)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (7, N'456-789-123', N'Otra razon social', 1, N'Alberdi', N'123', CAST(N'2020-09-13T09:27:02.000' AS DateTime), 1, 1)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (8, N'213123', N'JP', 1, N'Roca', N'1234', CAST(N'2020-09-13T21:27:29.287' AS DateTime), 1, 1)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (9, N'456-789-132132132132', N'JR2', 1, N'Sarmiento', N'12456', CAST(N'2020-09-13T09:29:28.000' AS DateTime), 2, 2)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (1002, N'456-987-123', N'Test', 1, N'Calle Falsa', N'123', CAST(N'2020-09-15T15:37:40.330' AS DateTime), 2, 2)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (1003, N'987-456-123', N'Test2', 1, N'Calle Falsa', N'123', CAST(N'2020-09-15T03:44:42.000' AS DateTime), 2, 2)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (1004, N'987-456-321', N'Test', 1, N'Calle Falsa', N'123', CAST(N'2020-09-15T15:47:31.063' AS DateTime), 1, 2)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (2002, N'4656546546', N'kkkkkk', 1, N'Calle real', N'321', CAST(N'2020-09-22T21:01:50.753' AS DateTime), 2002, 1002)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (3002, N'99999', N'nnnn', 1, N'123', N'111', CAST(N'2020-10-01T19:16:44.257' AS DateTime), 2002, 1002)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (4002, N'Bruh', N'Bruh', 1, N'AAAA', N'333', CAST(N'2020-11-07T12:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (5005, N'64-31654987-8', N'La metaleria', 0, N'Lima', N'512', CAST(N'2016-12-01T00:00:00.000' AS DateTime), 5002, 4002)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (5006, N'32-12368712-9', N'Los pollos hermanos', 0, N'Peru', N'123', CAST(N'2005-03-05T00:00:00.000' AS DateTime), 5004, 4004)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (5007, N'12-12547861-1', N'Banco Provincia', 0, N'Sarmiento', N'489', CAST(N'1998-01-05T00:00:00.000' AS DateTime), 5004, 4003)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (5008, N'97-24569875-6', N'Four Seasons hotel', 0, N'Alberdi', N'789', CAST(N'1980-02-03T00:00:00.000' AS DateTime), 5004, 4003)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6002, N'05-42169125-7', N'UTN FRC', 0, N'Mitre', N'254', CAST(N'2010-05-04T00:00:00.000' AS DateTime), 5002, 4008)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6003, N'12-45612389-9', N'Estudio Juridico "Genesis"', 0, N'San Martin', N'123', CAST(N'2001-03-09T00:00:00.000' AS DateTime), 5003, 4008)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6004, N'04-28169125-7', N'Restaurante el holandes volador', 0, N'La Pampa', N'698', CAST(N'2010-04-23T00:00:00.000' AS DateTime), 5011, 4007)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6005, N'48-78945623-4', N'Pizzeria mario''s bros.', 0, N'Corrientes', N'751', CAST(N'2012-06-13T00:00:00.000' AS DateTime), 5002, 4006)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6006, N'09-36169125-7', N'Hamburgueseria crustaceo cascarudo', 0, N'Misiones', N'458', CAST(N'2019-09-15T00:00:00.000' AS DateTime), 5010, 4005)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6007, N'05-66789125-7', N'Banco Stark', 0, N'Catamarca', N'652', CAST(N'2012-11-11T00:00:00.000' AS DateTime), 5009, 4004)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6008, N'05-42169369-8', N'Escuela superior Hogwarts', 0, N'Formosa', N'128', CAST(N'2012-12-12T00:00:00.000' AS DateTime), 5008, 4003)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6009, N'16-95162348-7', N'West India Company', 0, N'Santa Fe', N'354', CAST(N'2001-01-01T00:00:00.000' AS DateTime), 5009, 4004)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6010, N'05-41462525-1', N'Garcia Armenteros', 0, N'25 de mayo', N'128', CAST(N'2008-10-12T00:00:00.000' AS DateTime), 5011, 4003)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6011, N'07-48961225-7', N'McDondons', 0, N'9 de julio', N'129', CAST(N'1971-02-17T00:00:00.000' AS DateTime), 5010, 4007)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6012, N'05-11121314-9', N'Medoz', 0, N'Bv San Juan', N'714', CAST(N'2013-06-23T00:00:00.000' AS DateTime), 5004, 4008)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6013, N'05-50164444-6', N'Pfizer', 0, N'Bv Juan Domingo Peron', N'365', CAST(N'1956-12-12T00:00:00.000' AS DateTime), 5005, 4008)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6014, N'06-15161718-8', N'Microsoft', 0, N'Av Poeta Lugones', N'458', CAST(N'1987-01-05T00:00:00.000' AS DateTime), 5003, 4007)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6015, N'05-56369125-2', N'Utilisima TV', 0, N'Av Cruz Roja', N'215', CAST(N'1999-12-12T00:00:00.000' AS DateTime), 5006, 4006)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6016, N'07-10069125-7', N'Mercantilistas S.A.', 0, N'Velez Sarsfield', N'64', CAST(N'2016-05-25T00:00:00.000' AS DateTime), 5007, 4005)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6017, N'12-42305230-7', N'Tienda mayorista los chinos', 0, N'Jujuy', N'32', CAST(N'2015-11-08T00:00:00.000' AS DateTime), 5007, 4005)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6018, N'08-44169125-0', N'Agencia de viaje "Yeet"', 0, N'Salta', N'1511', CAST(N'2015-11-09T00:00:00.000' AS DateTime), 5010, 4004)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6019, N'07-15369125-7', N'BioPharma Inc.', 0, N'Mendoza', N'1680', CAST(N'1965-07-06T00:00:00.000' AS DateTime), 5008, 4006)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6020, N'56-33445566-8', N'Cooperativa Salgado', 0, N'Corrientes', N'1720', CAST(N'1950-12-31T00:00:00.000' AS DateTime), 5011, 4006)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6021, N'05-42141256-2', N'Farmacias Umbrella', 0, N'Jujuy', N'1699', CAST(N'2014-12-14T00:00:00.000' AS DateTime), 5009, 4007)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6022, N'05-12569125-8', N'David & Sons', 0, N'Mendoza', N'987', CAST(N'2000-01-12T00:00:00.000' AS DateTime), 5008, 4008)
INSERT [dbo].[Clientes] ([id_cliente], [cuit], [razon_social], [borrado], [calle], [numero], [fecha_alta], [id_barrio], [id_contacto]) VALUES (6023, N'01-25689741-3', N'Pam & Unger', 0, N'25 de mayo', N'988', CAST(N'2014-04-08T00:00:00.000' AS DateTime), 5004, 4003)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Contactos] ON 

INSERT [dbo].[Contactos] ([id_contacto], [nombre], [apellido], [email], [telefono], [borrado]) VALUES (1, N'Juan', N'Perez', N'juan@gmail.com', N'1224434', 1)
INSERT [dbo].[Contactos] ([id_contacto], [nombre], [apellido], [email], [telefono], [borrado]) VALUES (2, N'Joan', N'Raddish', N'joan@gmail.com', N'1224434', 1)
INSERT [dbo].[Contactos] ([id_contacto], [nombre], [apellido], [email], [telefono], [borrado]) VALUES (1002, N'Test2', N'Bruh', N'test@google.org', N'123-456-789-1', 1)
INSERT [dbo].[Contactos] ([id_contacto], [nombre], [apellido], [email], [telefono], [borrado]) VALUES (2002, N'aaas', N'bbb', N'sss', N'444', 1)
INSERT [dbo].[Contactos] ([id_contacto], [nombre], [apellido], [email], [telefono], [borrado]) VALUES (3002, N'AAB', N'BBB', N'bruh@bruh.bruh', N'5555', 1)
INSERT [dbo].[Contactos] ([id_contacto], [nombre], [apellido], [email], [telefono], [borrado]) VALUES (4002, N'Sancho', N'Panza', N'sanchopanza@yahoo.com.ar', N'+54 9 351 712 4898', 0)
INSERT [dbo].[Contactos] ([id_contacto], [nombre], [apellido], [email], [telefono], [borrado]) VALUES (4003, N'Pepe', N'Grillo', N'pepegrillo@hotmail.com', N'+1 54 369 9874', 0)
INSERT [dbo].[Contactos] ([id_contacto], [nombre], [apellido], [email], [telefono], [borrado]) VALUES (4004, N'Maxi', N'Saleh', N'maxisaleh@gmail.com', N'+54 9 351 789 1234', 0)
INSERT [dbo].[Contactos] ([id_contacto], [nombre], [apellido], [email], [telefono], [borrado]) VALUES (4005, N'Fabri', N'Logares', N'fabrilogares@gmail.com', N'+54 9 625 7894', 0)
INSERT [dbo].[Contactos] ([id_contacto], [nombre], [apellido], [email], [telefono], [borrado]) VALUES (4006, N'Homer', N'Sinson', N'HomeroSinson@hotmail.us', N'+9 8 745 65214', 0)
INSERT [dbo].[Contactos] ([id_contacto], [nombre], [apellido], [email], [telefono], [borrado]) VALUES (4007, N'Santiago', N'Landa', N'santiland@gmail.com', N'+54 9 351 264 5698', 0)
INSERT [dbo].[Contactos] ([id_contacto], [nombre], [apellido], [email], [telefono], [borrado]) VALUES (4008, N'Alberto', N'Fernandez', N'Albertofernandes@aol.com.ar', N'+54 9 351 258 7412', 0)
SET IDENTITY_INSERT [dbo].[Contactos] OFF
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 

INSERT [dbo].[Facturas] ([id_factura], [numero_factura], [id_cliente], [fecha], [id_usuario_creador], [borrado]) VALUES (1003, N'1', 6, CAST(N'2020-09-28T05:31:45.000' AS DateTime), 1, 1)
INSERT [dbo].[Facturas] ([id_factura], [numero_factura], [id_cliente], [fecha], [id_usuario_creador], [borrado]) VALUES (2002, N'1', 6, CAST(N'2020-10-01T07:38:53.000' AS DateTime), 1, 1)
INSERT [dbo].[Facturas] ([id_factura], [numero_factura], [id_cliente], [fecha], [id_usuario_creador], [borrado]) VALUES (2003, N'', 6, CAST(N'2020-10-01T07:38:53.000' AS DateTime), 1, 1)
INSERT [dbo].[Facturas] ([id_factura], [numero_factura], [id_cliente], [fecha], [id_usuario_creador], [borrado]) VALUES (3002, N'2', 6, CAST(N'2020-11-10T03:41:36.000' AS DateTime), 1, 1)
INSERT [dbo].[Facturas] ([id_factura], [numero_factura], [id_cliente], [fecha], [id_usuario_creador], [borrado]) VALUES (4002, N'AAAA0001', 6018, CAST(N'2020-11-10T11:12:30.000' AS DateTime), 1, 0)
INSERT [dbo].[Facturas] ([id_factura], [numero_factura], [id_cliente], [fecha], [id_usuario_creador], [borrado]) VALUES (4003, N'AAAA0002', 5006, CAST(N'2020-11-10T11:12:30.000' AS DateTime), 1, 0)
INSERT [dbo].[Facturas] ([id_factura], [numero_factura], [id_cliente], [fecha], [id_usuario_creador], [borrado]) VALUES (4004, N'AAAA0003', 6002, CAST(N'2020-11-10T11:12:30.000' AS DateTime), 1, 0)
INSERT [dbo].[Facturas] ([id_factura], [numero_factura], [id_cliente], [fecha], [id_usuario_creador], [borrado]) VALUES (4005, N'AAAA0004', 6021, CAST(N'2020-11-10T11:12:30.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[FacturasDetalle] ON 

INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (1002, 1003, 1, 1, NULL, NULL, CAST(5 AS Decimal(18, 0)), 1)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (2002, 2002, 1, 1, NULL, NULL, CAST(5 AS Decimal(18, 0)), 1)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (2003, 2002, 2, NULL, 1, NULL, CAST(6 AS Decimal(18, 0)), 1)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (2004, 2003, 1, NULL, 0, NULL, CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (3002, 2003, 2, NULL, NULL, 15, CAST(7 AS Decimal(18, 0)), 1)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (3003, 2003, 3, NULL, NULL, 1013, CAST(12 AS Decimal(18, 0)), 1)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (3004, 1003, 2, 1, NULL, NULL, CAST(4 AS Decimal(18, 0)), 1)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (4002, 3002, 1, 1, NULL, NULL, CAST(25 AS Decimal(18, 0)), 1)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (4003, 3002, 2, NULL, 0, NULL, CAST(50 AS Decimal(18, 0)), 1)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (5002, 4002, 1, 4, NULL, NULL, CAST(25000 AS Decimal(18, 0)), 0)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (5003, 4002, 2, NULL, 6, NULL, CAST(5000 AS Decimal(18, 0)), 0)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (5004, 4002, 3, NULL, NULL, 3013, CAST(1800 AS Decimal(18, 0)), 0)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (5005, 4003, 1, 1, NULL, NULL, CAST(1800 AS Decimal(18, 0)), 0)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (5006, 4003, 2, NULL, 3, NULL, CAST(2600 AS Decimal(18, 0)), 0)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (5007, 4003, 3, NULL, 5, NULL, CAST(8000 AS Decimal(18, 0)), 0)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (5008, 4004, 1, NULL, 6, NULL, CAST(1500 AS Decimal(18, 0)), 0)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (5009, 4005, 1, NULL, NULL, 3015, CAST(2500 AS Decimal(18, 0)), 0)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (5010, 4005, 2, NULL, 5, NULL, CAST(8010 AS Decimal(18, 0)), 0)
INSERT [dbo].[FacturasDetalle] ([id_detalle_factura], [id_factura], [numero_orden], [id_producto], [id_proyecto], [id_ciclo_prueba], [precio], [borrado]) VALUES (5011, 4005, 3, NULL, 4, NULL, CAST(1500 AS Decimal(18, 0)), 0)
SET IDENTITY_INSERT [dbo].[FacturasDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfiles] ON 

INSERT [dbo].[Perfiles] ([id_perfil], [nombre], [borrado]) VALUES (1, N'Administrador', 0)
INSERT [dbo].[Perfiles] ([id_perfil], [nombre], [borrado]) VALUES (2, N'Tester', 0)
INSERT [dbo].[Perfiles] ([id_perfil], [nombre], [borrado]) VALUES (3, N'Desarrollador', 0)
INSERT [dbo].[Perfiles] ([id_perfil], [nombre], [borrado]) VALUES (4, N'Responsable de Reportes', 0)
SET IDENTITY_INSERT [dbo].[Perfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[PlanesDePrueba] ON 

INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (2, 0, N'juilo', 1, N'jhjtyiweasd', 1)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (3, 1, N'bruh', 2, N'hdgfgdfgf', 1)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (4, 0, N'b', 1, N'asdasd', 1)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (5, 0, N'asd', 1, N'fasdasdasdas', 1)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (7, 0, N'sadasda', 1, N'asdasdaszxczsadas', 1)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (1002, 0, N'c', 1, N'Administracion de responsables y proyectos no incluida :)', 1)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (2002, 1, N'Bruh', 2, N'Bruh', 1)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (3002, 4, N'Gerencia', 2, N'Testear si la gerencia puede logearse correctamente', 0)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (3003, 6, N'Autorizaciones de pago', 5, N'Comprobar que los autorizados de cobro puedan ver los elementos de cobro', 0)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (3004, 3, N'Simulacion de flujo', 7, N'Comprobar que los valores resultantes correspondan a la realidad', 0)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (3005, 5, N'Asignacion de jefes', 4, N'Verificar el correcto ABMC de jefatura', 0)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (3006, 4, N'Seguridad de datos', 5, N'Verificar que los datos privados del cliente no puedan ser expuestos mediante ataques SQL injection', 0)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (3007, 5, N'Pago de sueldos', 6, N'Verificar si los pagos estan correctamente asignados', 0)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (3008, 2, N'Numeros de ticket', 6, N'Verificar que los numeros de ticket no puedan ser modificados', 0)
INSERT [dbo].[PlanesDePrueba] ([id_plan_prueba], [id_proyecto], [nombre], [id_responsable], [descripcion], [borrado]) VALUES (3009, 2, N'Formatos de CUIL', 7, N'Verificar que el CUIL siga el formato estandar', 0)
SET IDENTITY_INSERT [dbo].[PlanesDePrueba] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (1, N'Software de Gestión', 0)
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (2, N'Soft. de Gestión de Identidad', 0)
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (3, N'Software de Auditoría', 0)
INSERT [dbo].[Productos] ([id_producto], [nombre], [borrado]) VALUES (4, N'Soft. Vulnerabilidades', 0)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
INSERT [dbo].[Proyectos] ([id_proyecto], [id_producto], [descripcion], [version], [alcance], [id_responsable], [borrado]) VALUES (0, 1, N'aasdas', N'0', N'si', 1, 1)
INSERT [dbo].[Proyectos] ([id_proyecto], [id_producto], [descripcion], [version], [alcance], [id_responsable], [borrado]) VALUES (1, 2, N'sdffsdfs', N'1', N'no', 2, 1)
INSERT [dbo].[Proyectos] ([id_proyecto], [id_producto], [descripcion], [version], [alcance], [id_responsable], [borrado]) VALUES (2, 1, N'Bugfixer para software de gestion', N'0.9.8.32c', N'Usuarios', 2, 0)
INSERT [dbo].[Proyectos] ([id_proyecto], [id_producto], [descripcion], [version], [alcance], [id_responsable], [borrado]) VALUES (3, 4, N'Bugtracker para Simulador de escritorios', N'v2.1.3', N'Pantallas y funcionalidad', 4, 0)
INSERT [dbo].[Proyectos] ([id_proyecto], [id_producto], [descripcion], [version], [alcance], [id_responsable], [borrado]) VALUES (4, 3, N'Gestion de cuentas bancarias', N'1.5.4', N'ABMC', 5, 0)
INSERT [dbo].[Proyectos] ([id_proyecto], [id_producto], [descripcion], [version], [alcance], [id_responsable], [borrado]) VALUES (5, 2, N'Gestion de recursos humanos', N'1.0.0', N'Empleados', 5, 0)
INSERT [dbo].[Proyectos] ([id_proyecto], [id_producto], [descripcion], [version], [alcance], [id_responsable], [borrado]) VALUES (6, 2, N'Gestion de autorizaciones', N'1.0.0', N'Empleados', 5, 0)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [estado], [borrado]) VALUES (1, 1, N'administrador', N'12345', N'admin@gmail.com', N'S', 0)
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [estado], [borrado]) VALUES (2, 2, N'Tester Ariel', N'12345', N'ariel@gmail.com', N'N', 0)
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [estado], [borrado]) VALUES (4, 3, N'Tester Miguel', N'12345', N'miguel@gmail.com', N'S', 0)
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [estado], [borrado]) VALUES (5, 2, N'Tester Ana', N'12345', N'ana@gmail.com', N'N', 0)
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [estado], [borrado]) VALUES (6, 3, N'Tester Diego', N'12345', N'diego@gmail.com', N'N', 0)
INSERT [dbo].[Usuarios] ([id_usuario], [id_perfil], [usuario], [password], [email], [estado], [borrado]) VALUES (7, 4, N'Tester Micaela', N'12345', N'mica@gmail.com', N'S', 0)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Perfiles] ADD  CONSTRAINT [DF_Perfiles_borrado]  DEFAULT ((0)) FOR [borrado]
GO
ALTER TABLE [dbo].[Productos] ADD  CONSTRAINT [DF_Productos_borrado]  DEFAULT ((0)) FOR [borrado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_borrado]  DEFAULT ((0)) FOR [borrado]
GO
ALTER TABLE [dbo].[CasosDePrueba]  WITH CHECK ADD  CONSTRAINT [FK_CasosDePrueba_PlanesDePrueba] FOREIGN KEY([id_plan_prueba])
REFERENCES [dbo].[PlanesDePrueba] ([id_plan_prueba])
GO
ALTER TABLE [dbo].[CasosDePrueba] CHECK CONSTRAINT [FK_CasosDePrueba_PlanesDePrueba]
GO
ALTER TABLE [dbo].[CiclosPrueba]  WITH CHECK ADD  CONSTRAINT [FK_CiclosPrueba_PlanesDePrueba] FOREIGN KEY([id_plan_prueba])
REFERENCES [dbo].[PlanesDePrueba] ([id_plan_prueba])
GO
ALTER TABLE [dbo].[CiclosPrueba] CHECK CONSTRAINT [FK_CiclosPrueba_PlanesDePrueba]
GO
ALTER TABLE [dbo].[CiclosPrueba]  WITH CHECK ADD  CONSTRAINT [FK_CiclosPrueba_Usuarios] FOREIGN KEY([id_responsable])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[CiclosPrueba] CHECK CONSTRAINT [FK_CiclosPrueba_Usuarios]
GO
ALTER TABLE [dbo].[CiclosPruebaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CiclosPruebaDetalle_CasosDePrueba] FOREIGN KEY([id_caso_prueba])
REFERENCES [dbo].[CasosDePrueba] ([id_caso_prueba])
GO
ALTER TABLE [dbo].[CiclosPruebaDetalle] CHECK CONSTRAINT [FK_CiclosPruebaDetalle_CasosDePrueba]
GO
ALTER TABLE [dbo].[CiclosPruebaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CiclosPruebaDetalle_CiclosPrueba] FOREIGN KEY([id_ciclo_prueba])
REFERENCES [dbo].[CiclosPrueba] ([id_ciclo_prueba])
GO
ALTER TABLE [dbo].[CiclosPruebaDetalle] CHECK CONSTRAINT [FK_CiclosPruebaDetalle_CiclosPrueba]
GO
ALTER TABLE [dbo].[CiclosPruebaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CiclosPruebaDetalle_Usuarios] FOREIGN KEY([id_usuario_tester])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[CiclosPruebaDetalle] CHECK CONSTRAINT [FK_CiclosPruebaDetalle_Usuarios]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Barrios] FOREIGN KEY([id_barrio])
REFERENCES [dbo].[Barrios] ([id_barrio])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Barrios]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Contactos] FOREIGN KEY([id_contacto])
REFERENCES [dbo].[Contactos] ([id_contacto])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Contactos]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Clientes]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Usuarios] FOREIGN KEY([id_usuario_creador])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Usuarios]
GO
ALTER TABLE [dbo].[FacturasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturasDetalle_CiclosPrueba] FOREIGN KEY([id_ciclo_prueba])
REFERENCES [dbo].[CiclosPrueba] ([id_ciclo_prueba])
GO
ALTER TABLE [dbo].[FacturasDetalle] CHECK CONSTRAINT [FK_FacturasDetalle_CiclosPrueba]
GO
ALTER TABLE [dbo].[FacturasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturasDetalle_Facturas] FOREIGN KEY([id_factura])
REFERENCES [dbo].[Facturas] ([id_factura])
GO
ALTER TABLE [dbo].[FacturasDetalle] CHECK CONSTRAINT [FK_FacturasDetalle_Facturas]
GO
ALTER TABLE [dbo].[FacturasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturasDetalle_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO
ALTER TABLE [dbo].[FacturasDetalle] CHECK CONSTRAINT [FK_FacturasDetalle_Productos]
GO
ALTER TABLE [dbo].[FacturasDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturasDetalle_Proyectos] FOREIGN KEY([id_proyecto])
REFERENCES [dbo].[Proyectos] ([id_proyecto])
GO
ALTER TABLE [dbo].[FacturasDetalle] CHECK CONSTRAINT [FK_FacturasDetalle_Proyectos]
GO
ALTER TABLE [dbo].[PlanesDePrueba]  WITH CHECK ADD  CONSTRAINT [FK_PlanesDePrueba_Proyectos] FOREIGN KEY([id_proyecto])
REFERENCES [dbo].[Proyectos] ([id_proyecto])
GO
ALTER TABLE [dbo].[PlanesDePrueba] CHECK CONSTRAINT [FK_PlanesDePrueba_Proyectos]
GO
ALTER TABLE [dbo].[PlanesDePrueba]  WITH CHECK ADD  CONSTRAINT [FK_PlanesDePrueba_Usuarios] FOREIGN KEY([id_responsable])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[PlanesDePrueba] CHECK CONSTRAINT [FK_PlanesDePrueba_Usuarios]
GO
ALTER TABLE [dbo].[Proyectos]  WITH CHECK ADD  CONSTRAINT [FK_Proyectos_Producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO
ALTER TABLE [dbo].[Proyectos] CHECK CONSTRAINT [FK_Proyectos_Producto]
GO
ALTER TABLE [dbo].[Proyectos]  WITH CHECK ADD  CONSTRAINT [FK_Proyectos_Responsable] FOREIGN KEY([id_responsable])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[Proyectos] CHECK CONSTRAINT [FK_Proyectos_Responsable]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[Perfiles] ([id_perfil])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Perfiles]
GO
USE [master]
GO
ALTER DATABASE [BugsTracker] SET  READ_WRITE 
GO
