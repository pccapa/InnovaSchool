USE [master]
GO
/****** Object:  Database [InnovaSchool]    Script Date: 03/10/2016 17:17:29 ******/
CREATE DATABASE [InnovaSchool] 
go
USE [InnovaSchool]
GO
/****** Object:  Table [dbo].[GAA_Apoderado]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_Apoderado](
	[idApoderado] [int] NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[idVinculoApoderado] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[numeroDocumento] [varchar](100) NOT NULL,
	[ocupacion] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[telefono] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GAA_Apoderado] PRIMARY KEY CLUSTERED 
(
	[idApoderado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_CitaAdmision]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAA_CitaAdmision](
	[idCitaAdmision] [int] NOT NULL,
	[idSolicitudAdmision] [int] NOT NULL,
	[idEstadoCita] [int] NOT NULL,
	[fechaCita] [datetime] NULL,
	[numeroIntento] [int] NOT NULL,
 CONSTRAINT [PK_GAA_CitaAdmision_1] PRIMARY KEY CLUSTERED 
(
	[idCitaAdmision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GAA_Ciudad]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_Ciudad](
	[idCiudad] [int] NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_Departamento]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_Departamento](
	[idDepartamento] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GAA_Departamento] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_DocumentosExpediente]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_DocumentosExpediente](
	[idDocumentosExpediente] [int] NOT NULL,
	[idExpediente] [int] NOT NULL,
	[fechaDocumento] [datetime] NOT NULL,
	[observacion] [varchar](100) NULL,
	[ruta] [varchar](500) NULL,
	[tipo] [varchar](20) NULL,
 CONSTRAINT [PK_GAA_DocumentosExpediente] PRIMARY KEY CLUSTERED 
(
	[idDocumentosExpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_EstadoCita]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_EstadoCita](
	[idEstadoCita] [int] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GAA_EstadoCita] PRIMARY KEY CLUSTERED 
(
	[idEstadoCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_EstadoExpediente]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_EstadoExpediente](
	[idEstadoExpediente] [int] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GAA_EstadoExpediente] PRIMARY KEY CLUSTERED 
(
	[idEstadoExpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_Expediente]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAA_Expediente](
	[idExpediente] [int] NOT NULL,
	[idCitaAdmision] [int] NOT NULL,
	[idEstadoExpediente] [int] NOT NULL,
 CONSTRAINT [PK_GAA_Expediente] PRIMARY KEY CLUSTERED 
(
	[idExpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GAA_FechaCitaAdmision]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAA_FechaCitaAdmision](
	[idFechaCitaAdmision] [int] NOT NULL,
	[fechaCita] [datetime] NOT NULL,
	[estado] [int] NOT NULL,
 CONSTRAINT [PK_GAA_FechaCitaAdmision] PRIMARY KEY CLUSTERED 
(
	[idFechaCitaAdmision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GAA_Genero]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_Genero](
	[idGenero] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GAA_Genero] PRIMARY KEY CLUSTERED 
(
	[idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_Grado]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_Grado](
	[idGrado] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GAA_Grado] PRIMARY KEY CLUSTERED 
(
	[idGrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_Postulante]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_Postulante](
	[idPostulante] [int] NOT NULL,
	[idApoderado] [int] NOT NULL,
	[idCiudad] [int] NOT NULL,
	[idGenero] [int] NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[numeroDocumento] [varchar](100) NOT NULL,
	[fechaNacimiento] [datetime] NOT NULL,
	[lugarNacimiento] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GAA_Postulante_1] PRIMARY KEY CLUSTERED 
(
	[idPostulante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_ResultadoEvaluacion]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_ResultadoEvaluacion](
	[idResultadoEvaluacion] [int] NOT NULL,
	[idExpediente] [int] NOT NULL,
	[resultadoPrueba] [varchar](50) NULL,
	[tipoEvaluacion] [varchar](50) NULL,
	[evaluador] [varchar](50) NULL,
	[cargoEvaluador] [varchar](50) NULL,
	[fechaEvaluacion] [varchar](50) NULL,
 CONSTRAINT [PK_GAA_ResultadoEvaluacion] PRIMARY KEY CLUSTERED 
(
	[idResultadoEvaluacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_ResultadoProceso]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_ResultadoProceso](
	[idResultadoProceso] [int] NOT NULL,
	[idExpediente] [int] NOT NULL,
	[resultado] [varchar](50) NULL,
	[fechaResultado] [varchar](50) NULL,
	[observacionResultado] [varchar](50) NULL,
 CONSTRAINT [PK_GAA_ResultadoProceso] PRIMARY KEY CLUSTERED 
(
	[idResultadoProceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_SolicitudAdmision]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAA_SolicitudAdmision](
	[idSolicitudAdmision] [int] NOT NULL,
	[idPostulante] [int] NOT NULL,
	[idGrado] [int] NOT NULL,
	[idSucursal] [int] NOT NULL,
	[fechaSolicitud] [datetime] NOT NULL,
 CONSTRAINT [PK_GAA_SolicitudAdmision] PRIMARY KEY CLUSTERED 
(
	[idSolicitudAdmision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GAA_Sucursal]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_Sucursal](
	[idSucursal] [int] NOT NULL,
	[idCiudad] [int] NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GAA_Sucursal] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_TipoDocumento]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_TipoDocumento](
	[idTipoDocumento] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GAA_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[idTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GAA_VinculoApoderado]    Script Date: 03/10/2016 17:17:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAA_VinculoApoderado](
	[idVinculoApoderado] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GAA_VinculoApoderado] PRIMARY KEY CLUSTERED 
(
	[idVinculoApoderado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[GAA_Apoderado] ([idApoderado], [idTipoDocumento], [idVinculoApoderado], [nombre], [apellido], [numeroDocumento], [ocupacion], [email], [telefono], [direccion]) VALUES (5, 2, 1, N'Marcoss', N'Floress', N'20236547', N'Chofer', N'mflores@hotmail.com', N'987456321', N'Av. Santa Catalina 256')
GO
INSERT [dbo].[GAA_Apoderado] ([idApoderado], [idTipoDocumento], [idVinculoApoderado], [nombre], [apellido], [numeroDocumento], [ocupacion], [email], [telefono], [direccion]) VALUES (6, 1, 1, N'Nombres Apoderado ', N'Apellidos Apoderado', N'09855222', N'ocupacion apoderado', N'email@hotmai.com', N'5607226', N'direccion')
GO
INSERT [dbo].[GAA_Apoderado] ([idApoderado], [idTipoDocumento], [idVinculoApoderado], [nombre], [apellido], [numeroDocumento], [ocupacion], [email], [telefono], [direccion]) VALUES (7, 1, 1, N'Nombres Apoderado', N'Apellidos Apoderado ', N'098569874', N'Ocupacion Apoderad', N'email@hotmail.com', N'6523654', N'direcccion')
GO
INSERT [dbo].[GAA_Apoderado] ([idApoderado], [idTipoDocumento], [idVinculoApoderado], [nombre], [apellido], [numeroDocumento], [ocupacion], [email], [telefono], [direccion]) VALUES (8, 1, 1, N'nombres2', N'apellidos2', N'56985632', N'ocupacion2', N'email2@hotmail.com', N'98756325', N'direccion2')
GO
INSERT [dbo].[GAA_Apoderado] ([idApoderado], [idTipoDocumento], [idVinculoApoderado], [nombre], [apellido], [numeroDocumento], [ocupacion], [email], [telefono], [direccion]) VALUES (9, 1, 3, N'ASFASDAS', N'sfsdfsdf', N'23423424', N'essdfs', N'dsdfsd@hotmail.com', N'23234234', N'direccion22')
GO
INSERT [dbo].[GAA_CitaAdmision] ([idCitaAdmision], [idSolicitudAdmision], [idEstadoCita], [fechaCita], [numeroIntento]) VALUES (1, 1, 2, CAST(N'2016-01-09 10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[GAA_CitaAdmision] ([idCitaAdmision], [idSolicitudAdmision], [idEstadoCita], [fechaCita], [numeroIntento]) VALUES (2, 2, 1, NULL, 0)
GO
INSERT [dbo].[GAA_CitaAdmision] ([idCitaAdmision], [idSolicitudAdmision], [idEstadoCita], [fechaCita], [numeroIntento]) VALUES (3, 3, 3, CAST(N'2016-01-10 16:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (1, 1, N'Arequipa')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (2, 2, N'Chiclayo')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (3, 3, N'Chimbote')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (4, 4, N'Huacho')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (5, 4, N'Santa Clara')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (6, 4, N'Ate')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (7, 4, N'Callao')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (8, 4, N'Chorrillos')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (9, 4, N'Comas')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (10, 4, N'San Miguel')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (11, 4, N'SJL')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (12, 4, N'San Martin de Porres')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (13, 4, N'Surco')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (14, 5, N'Huancayo')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (15, 6, N'Chincha')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (16, 6, N'Ica')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (17, 7, N'Piura')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (18, 8, N'Trujillo')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (19, 9, N'Tacna')
GO
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (1, N'Arequipa')
GO
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (2, N'Chiclayo')
GO
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (3, N'Ancash')
GO
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (4, N'Lima')
GO
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (5, N'Huancayo')
GO
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (6, N'Ica')
GO
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (7, N'Piura')
GO
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (8, N'La Libertad')
GO
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (9, N'Tacna')
GO
INSERT [dbo].[GAA_DocumentosExpediente] ([idDocumentosExpediente], [idExpediente], [fechaDocumento], [observacion], [ruta], [tipo]) VALUES (1, 1, CAST(N'2016-09-15 00:49:21.000' AS DateTime), N'plantilla', N'86Plantilla Especificacion de caso de uso del sistema.doc', N'1')
GO
INSERT [dbo].[GAA_DocumentosExpediente] ([idDocumentosExpediente], [idExpediente], [fechaDocumento], [observacion], [ruta], [tipo]) VALUES (2, 1, CAST(N'2016-09-15 00:47:52.000' AS DateTime), N'gestion de riesgos', N'80Gestión de Riesgos.docx', N'2')
GO
INSERT [dbo].[GAA_EstadoCita] ([idEstadoCita], [descripcion]) VALUES (1, N'Pendiente')
GO
INSERT [dbo].[GAA_EstadoCita] ([idEstadoCita], [descripcion]) VALUES (2, N'Aprobada')
GO
INSERT [dbo].[GAA_EstadoCita] ([idEstadoCita], [descripcion]) VALUES (3, N'Realizada')
GO
INSERT [dbo].[GAA_EstadoCita] ([idEstadoCita], [descripcion]) VALUES (4, N'Eliminada')
GO
INSERT [dbo].[GAA_EstadoExpediente] ([idEstadoExpediente], [descripcion]) VALUES (1, N'Pendiente')
GO
INSERT [dbo].[GAA_EstadoExpediente] ([idEstadoExpediente], [descripcion]) VALUES (2, N'Aprobado')
GO
INSERT [dbo].[GAA_EstadoExpediente] ([idEstadoExpediente], [descripcion]) VALUES (3, N'Rechazado')
GO
INSERT [dbo].[GAA_Expediente] ([idExpediente], [idCitaAdmision], [idEstadoExpediente]) VALUES (1, 3, 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (1, CAST(N'2016-01-01 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (2, CAST(N'2016-01-01 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (3, CAST(N'2016-01-01 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (4, CAST(N'2016-01-01 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (5, CAST(N'2016-01-01 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (6, CAST(N'2016-01-01 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (7, CAST(N'2016-01-01 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (8, CAST(N'2016-01-01 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (9, CAST(N'2016-01-01 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (10, CAST(N'2016-01-01 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (11, CAST(N'2016-01-02 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (12, CAST(N'2016-01-02 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (13, CAST(N'2016-01-02 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (14, CAST(N'2016-01-02 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (15, CAST(N'2016-01-02 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (16, CAST(N'2016-01-02 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (17, CAST(N'2016-01-02 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (18, CAST(N'2016-01-02 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (19, CAST(N'2016-01-02 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (20, CAST(N'2016-01-02 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (21, CAST(N'2016-01-03 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (22, CAST(N'2016-01-03 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (23, CAST(N'2016-01-03 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (24, CAST(N'2016-01-03 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (25, CAST(N'2016-01-03 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (26, CAST(N'2016-01-03 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (27, CAST(N'2016-01-03 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (28, CAST(N'2016-01-03 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (29, CAST(N'2016-01-03 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (30, CAST(N'2016-01-03 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (31, CAST(N'2016-01-04 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (32, CAST(N'2016-01-04 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (33, CAST(N'2016-01-04 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (34, CAST(N'2016-01-04 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (35, CAST(N'2016-01-04 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (36, CAST(N'2016-01-04 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (37, CAST(N'2016-01-04 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (38, CAST(N'2016-01-04 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (39, CAST(N'2016-01-04 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (40, CAST(N'2016-01-04 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (41, CAST(N'2016-01-05 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (42, CAST(N'2016-01-05 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (43, CAST(N'2016-01-05 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (44, CAST(N'2016-01-05 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (45, CAST(N'2016-01-05 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (46, CAST(N'2016-01-05 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (47, CAST(N'2016-01-05 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (48, CAST(N'2016-01-05 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (49, CAST(N'2016-01-05 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (50, CAST(N'2016-01-05 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (51, CAST(N'2016-01-06 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (52, CAST(N'2016-01-06 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (53, CAST(N'2016-01-06 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (54, CAST(N'2016-01-06 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (55, CAST(N'2016-01-06 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (56, CAST(N'2016-01-06 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (57, CAST(N'2016-01-06 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (58, CAST(N'2016-01-06 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (59, CAST(N'2016-01-06 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (60, CAST(N'2016-01-06 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (61, CAST(N'2016-01-07 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (62, CAST(N'2016-01-07 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (63, CAST(N'2016-01-07 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (64, CAST(N'2016-01-07 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (65, CAST(N'2016-01-07 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (66, CAST(N'2016-01-07 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (67, CAST(N'2016-01-07 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (68, CAST(N'2016-01-07 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (69, CAST(N'2016-01-07 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (70, CAST(N'2016-01-07 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (71, CAST(N'2016-01-08 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (72, CAST(N'2016-01-08 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (73, CAST(N'2016-01-08 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (74, CAST(N'2016-01-08 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (75, CAST(N'2016-01-08 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (76, CAST(N'2016-01-08 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (77, CAST(N'2016-01-08 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (78, CAST(N'2016-01-08 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (79, CAST(N'2016-01-08 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (80, CAST(N'2016-01-08 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (81, CAST(N'2016-01-09 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (82, CAST(N'2016-01-09 10:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (83, CAST(N'2016-01-09 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (84, CAST(N'2016-01-09 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (85, CAST(N'2016-01-09 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (86, CAST(N'2016-01-09 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (87, CAST(N'2016-01-09 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (88, CAST(N'2016-01-09 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (89, CAST(N'2016-01-09 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (90, CAST(N'2016-01-09 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (91, CAST(N'2016-01-10 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (92, CAST(N'2016-01-10 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (93, CAST(N'2016-01-10 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (94, CAST(N'2016-01-10 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (95, CAST(N'2016-01-10 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (96, CAST(N'2016-01-10 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (97, CAST(N'2016-01-10 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (98, CAST(N'2016-01-10 16:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (99, CAST(N'2016-01-10 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (100, CAST(N'2016-01-10 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (101, CAST(N'2016-01-11 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (102, CAST(N'2016-01-11 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (103, CAST(N'2016-01-11 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (104, CAST(N'2016-01-11 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (105, CAST(N'2016-01-11 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (106, CAST(N'2016-01-11 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (107, CAST(N'2016-01-11 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (108, CAST(N'2016-01-11 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (109, CAST(N'2016-01-11 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (110, CAST(N'2016-01-11 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (111, CAST(N'2016-01-12 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (112, CAST(N'2016-01-12 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (113, CAST(N'2016-01-12 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (114, CAST(N'2016-01-12 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (115, CAST(N'2016-01-12 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (116, CAST(N'2016-01-12 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (117, CAST(N'2016-01-12 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (118, CAST(N'2016-01-12 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (119, CAST(N'2016-01-12 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (120, CAST(N'2016-01-12 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (121, CAST(N'2016-01-13 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (122, CAST(N'2016-01-13 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (123, CAST(N'2016-01-13 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (124, CAST(N'2016-01-13 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (125, CAST(N'2016-01-13 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (126, CAST(N'2016-01-13 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (127, CAST(N'2016-01-13 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (128, CAST(N'2016-01-13 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (129, CAST(N'2016-01-13 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (130, CAST(N'2016-01-13 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (131, CAST(N'2016-01-14 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (132, CAST(N'2016-01-14 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (133, CAST(N'2016-01-14 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (134, CAST(N'2016-01-14 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (135, CAST(N'2016-01-14 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (136, CAST(N'2016-01-14 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (137, CAST(N'2016-01-14 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (138, CAST(N'2016-01-14 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (139, CAST(N'2016-01-14 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (140, CAST(N'2016-01-14 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (141, CAST(N'2016-01-15 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (142, CAST(N'2016-01-15 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (143, CAST(N'2016-01-15 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (144, CAST(N'2016-01-15 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (145, CAST(N'2016-01-15 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (146, CAST(N'2016-01-15 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (147, CAST(N'2016-01-15 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (148, CAST(N'2016-01-15 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (149, CAST(N'2016-01-15 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (150, CAST(N'2016-01-15 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (151, CAST(N'2016-01-16 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (152, CAST(N'2016-01-16 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (153, CAST(N'2016-01-16 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (154, CAST(N'2016-01-16 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (155, CAST(N'2016-01-16 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (156, CAST(N'2016-01-16 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (157, CAST(N'2016-01-16 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (158, CAST(N'2016-01-16 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (159, CAST(N'2016-01-16 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (160, CAST(N'2016-01-16 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (161, CAST(N'2016-01-17 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (162, CAST(N'2016-01-17 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (163, CAST(N'2016-01-17 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (164, CAST(N'2016-01-17 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (165, CAST(N'2016-01-17 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (166, CAST(N'2016-01-17 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (167, CAST(N'2016-01-17 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (168, CAST(N'2016-01-17 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (169, CAST(N'2016-01-17 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (170, CAST(N'2016-01-17 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (171, CAST(N'2016-01-18 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (172, CAST(N'2016-01-18 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (173, CAST(N'2016-01-18 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (174, CAST(N'2016-01-18 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (175, CAST(N'2016-01-18 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (176, CAST(N'2016-01-18 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (177, CAST(N'2016-01-18 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (178, CAST(N'2016-01-18 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (179, CAST(N'2016-01-18 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (180, CAST(N'2016-01-18 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (181, CAST(N'2016-01-19 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (182, CAST(N'2016-01-19 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (183, CAST(N'2016-01-19 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (184, CAST(N'2016-01-19 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (185, CAST(N'2016-01-19 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (186, CAST(N'2016-01-19 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (187, CAST(N'2016-01-19 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (188, CAST(N'2016-01-19 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (189, CAST(N'2016-01-19 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (190, CAST(N'2016-01-19 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (191, CAST(N'2016-01-20 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (192, CAST(N'2016-01-20 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (193, CAST(N'2016-01-20 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (194, CAST(N'2016-01-20 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (195, CAST(N'2016-01-20 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (196, CAST(N'2016-01-20 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (197, CAST(N'2016-01-20 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (198, CAST(N'2016-01-20 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (199, CAST(N'2016-01-20 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (200, CAST(N'2016-01-20 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (201, CAST(N'2016-01-21 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (202, CAST(N'2016-01-21 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (203, CAST(N'2016-01-21 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (204, CAST(N'2016-01-21 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (205, CAST(N'2016-01-21 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (206, CAST(N'2016-01-21 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (207, CAST(N'2016-01-21 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (208, CAST(N'2016-01-21 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (209, CAST(N'2016-01-21 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (210, CAST(N'2016-01-21 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (211, CAST(N'2016-01-22 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (212, CAST(N'2016-01-22 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (213, CAST(N'2016-01-22 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (214, CAST(N'2016-01-22 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (215, CAST(N'2016-01-22 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (216, CAST(N'2016-01-22 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (217, CAST(N'2016-01-22 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (218, CAST(N'2016-01-22 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (219, CAST(N'2016-01-22 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (220, CAST(N'2016-01-22 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (221, CAST(N'2016-01-23 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (222, CAST(N'2016-01-23 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (223, CAST(N'2016-01-23 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (224, CAST(N'2016-01-23 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (225, CAST(N'2016-01-23 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (226, CAST(N'2016-01-23 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (227, CAST(N'2016-01-23 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (228, CAST(N'2016-01-23 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (229, CAST(N'2016-01-23 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (230, CAST(N'2016-01-23 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (231, CAST(N'2016-01-24 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (232, CAST(N'2016-01-24 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (233, CAST(N'2016-01-24 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (234, CAST(N'2016-01-24 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (235, CAST(N'2016-01-24 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (236, CAST(N'2016-01-24 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (237, CAST(N'2016-01-24 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (238, CAST(N'2016-01-24 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (239, CAST(N'2016-01-24 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (240, CAST(N'2016-01-24 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (241, CAST(N'2016-01-25 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (242, CAST(N'2016-01-25 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (243, CAST(N'2016-01-25 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (244, CAST(N'2016-01-25 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (245, CAST(N'2016-01-25 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (246, CAST(N'2016-01-25 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (247, CAST(N'2016-01-25 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (248, CAST(N'2016-01-25 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (249, CAST(N'2016-01-25 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (250, CAST(N'2016-01-25 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (251, CAST(N'2016-01-26 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (252, CAST(N'2016-01-26 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (253, CAST(N'2016-01-26 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (254, CAST(N'2016-01-26 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (255, CAST(N'2016-01-26 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (256, CAST(N'2016-01-26 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (257, CAST(N'2016-01-26 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (258, CAST(N'2016-01-26 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (259, CAST(N'2016-01-26 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (260, CAST(N'2016-01-26 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (261, CAST(N'2016-01-27 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (262, CAST(N'2016-01-27 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (263, CAST(N'2016-01-27 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (264, CAST(N'2016-01-27 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (265, CAST(N'2016-01-27 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (266, CAST(N'2016-01-27 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (267, CAST(N'2016-01-27 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (268, CAST(N'2016-01-27 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (269, CAST(N'2016-01-27 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (270, CAST(N'2016-01-27 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (271, CAST(N'2016-01-28 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (272, CAST(N'2016-01-28 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (273, CAST(N'2016-01-28 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (274, CAST(N'2016-01-28 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (275, CAST(N'2016-01-28 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (276, CAST(N'2016-01-28 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (277, CAST(N'2016-01-28 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (278, CAST(N'2016-01-28 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (279, CAST(N'2016-01-28 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (280, CAST(N'2016-01-28 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (281, CAST(N'2016-01-29 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (282, CAST(N'2016-01-29 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (283, CAST(N'2016-01-29 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (284, CAST(N'2016-01-29 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (285, CAST(N'2016-01-29 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (286, CAST(N'2016-01-29 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (287, CAST(N'2016-01-29 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (288, CAST(N'2016-01-29 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (289, CAST(N'2016-01-29 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (290, CAST(N'2016-01-29 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (291, CAST(N'2016-01-30 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (292, CAST(N'2016-01-30 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (293, CAST(N'2016-01-30 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (294, CAST(N'2016-01-30 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (295, CAST(N'2016-01-30 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (296, CAST(N'2016-01-30 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (297, CAST(N'2016-01-30 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (298, CAST(N'2016-01-30 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (299, CAST(N'2016-01-30 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (300, CAST(N'2016-01-30 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (301, CAST(N'2016-01-31 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (302, CAST(N'2016-01-31 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (303, CAST(N'2016-01-31 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (304, CAST(N'2016-01-31 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (305, CAST(N'2016-01-31 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (306, CAST(N'2016-01-31 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (307, CAST(N'2016-01-31 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (308, CAST(N'2016-01-31 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (309, CAST(N'2016-01-31 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (310, CAST(N'2016-01-31 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (311, CAST(N'2016-02-01 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (312, CAST(N'2016-02-01 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (313, CAST(N'2016-02-01 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (314, CAST(N'2016-02-01 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (315, CAST(N'2016-02-01 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (316, CAST(N'2016-02-01 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (317, CAST(N'2016-02-01 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (318, CAST(N'2016-02-01 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (319, CAST(N'2016-02-01 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (320, CAST(N'2016-02-01 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (321, CAST(N'2016-02-02 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (322, CAST(N'2016-02-02 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (323, CAST(N'2016-02-02 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (324, CAST(N'2016-02-02 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (325, CAST(N'2016-02-02 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (326, CAST(N'2016-02-02 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (327, CAST(N'2016-02-02 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (328, CAST(N'2016-02-02 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (329, CAST(N'2016-02-02 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (330, CAST(N'2016-02-02 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (331, CAST(N'2016-02-03 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (332, CAST(N'2016-02-03 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (333, CAST(N'2016-02-03 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (334, CAST(N'2016-02-03 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (335, CAST(N'2016-02-03 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (336, CAST(N'2016-02-03 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (337, CAST(N'2016-02-03 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (338, CAST(N'2016-02-03 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (339, CAST(N'2016-02-03 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (340, CAST(N'2016-02-03 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (341, CAST(N'2016-02-04 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (342, CAST(N'2016-02-04 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (343, CAST(N'2016-02-04 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (344, CAST(N'2016-02-04 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (345, CAST(N'2016-02-04 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (346, CAST(N'2016-02-04 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (347, CAST(N'2016-02-04 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (348, CAST(N'2016-02-04 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (349, CAST(N'2016-02-04 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (350, CAST(N'2016-02-04 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (351, CAST(N'2016-02-05 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (352, CAST(N'2016-02-05 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (353, CAST(N'2016-02-05 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (354, CAST(N'2016-02-05 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (355, CAST(N'2016-02-05 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (356, CAST(N'2016-02-05 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (357, CAST(N'2016-02-05 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (358, CAST(N'2016-02-05 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (359, CAST(N'2016-02-05 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (360, CAST(N'2016-02-05 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (361, CAST(N'2016-02-06 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (362, CAST(N'2016-02-06 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (363, CAST(N'2016-02-06 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (364, CAST(N'2016-02-06 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (365, CAST(N'2016-02-06 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (366, CAST(N'2016-02-06 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (367, CAST(N'2016-02-06 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (368, CAST(N'2016-02-06 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (369, CAST(N'2016-02-06 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (370, CAST(N'2016-02-06 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (371, CAST(N'2016-02-07 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (372, CAST(N'2016-02-07 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (373, CAST(N'2016-02-07 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (374, CAST(N'2016-02-07 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (375, CAST(N'2016-02-07 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (376, CAST(N'2016-02-07 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (377, CAST(N'2016-02-07 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (378, CAST(N'2016-02-07 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (379, CAST(N'2016-02-07 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (380, CAST(N'2016-02-07 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (381, CAST(N'2016-02-08 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (382, CAST(N'2016-02-08 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (383, CAST(N'2016-02-08 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (384, CAST(N'2016-02-08 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (385, CAST(N'2016-02-08 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (386, CAST(N'2016-02-08 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (387, CAST(N'2016-02-08 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (388, CAST(N'2016-02-08 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (389, CAST(N'2016-02-08 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (390, CAST(N'2016-02-08 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (391, CAST(N'2016-02-09 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (392, CAST(N'2016-02-09 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (393, CAST(N'2016-02-09 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (394, CAST(N'2016-02-09 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (395, CAST(N'2016-02-09 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (396, CAST(N'2016-02-09 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (397, CAST(N'2016-02-09 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (398, CAST(N'2016-02-09 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (399, CAST(N'2016-02-09 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (400, CAST(N'2016-02-09 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (401, CAST(N'2016-02-10 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (402, CAST(N'2016-02-10 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (403, CAST(N'2016-02-10 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (404, CAST(N'2016-02-10 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (405, CAST(N'2016-02-10 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (406, CAST(N'2016-02-10 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (407, CAST(N'2016-02-10 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (408, CAST(N'2016-02-10 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (409, CAST(N'2016-02-10 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (410, CAST(N'2016-02-10 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (411, CAST(N'2016-02-11 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (412, CAST(N'2016-02-11 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (413, CAST(N'2016-02-11 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (414, CAST(N'2016-02-11 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (415, CAST(N'2016-02-11 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (416, CAST(N'2016-02-11 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (417, CAST(N'2016-02-11 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (418, CAST(N'2016-02-11 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (419, CAST(N'2016-02-11 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (420, CAST(N'2016-02-11 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (421, CAST(N'2016-02-12 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (422, CAST(N'2016-02-12 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (423, CAST(N'2016-02-12 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (424, CAST(N'2016-02-12 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (425, CAST(N'2016-02-12 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (426, CAST(N'2016-02-12 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (427, CAST(N'2016-02-12 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (428, CAST(N'2016-02-12 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (429, CAST(N'2016-02-12 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (430, CAST(N'2016-02-12 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (431, CAST(N'2016-02-13 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (432, CAST(N'2016-02-13 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (433, CAST(N'2016-02-13 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (434, CAST(N'2016-02-13 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (435, CAST(N'2016-02-13 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (436, CAST(N'2016-02-13 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (437, CAST(N'2016-02-13 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (438, CAST(N'2016-02-13 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (439, CAST(N'2016-02-13 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (440, CAST(N'2016-02-13 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (441, CAST(N'2016-02-14 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (442, CAST(N'2016-02-14 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (443, CAST(N'2016-02-14 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (444, CAST(N'2016-02-14 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (445, CAST(N'2016-02-14 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (446, CAST(N'2016-02-14 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (447, CAST(N'2016-02-14 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (448, CAST(N'2016-02-14 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (449, CAST(N'2016-02-14 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (450, CAST(N'2016-02-14 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (451, CAST(N'2016-02-15 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (452, CAST(N'2016-02-15 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (453, CAST(N'2016-02-15 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (454, CAST(N'2016-02-15 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (455, CAST(N'2016-02-15 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (456, CAST(N'2016-02-15 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (457, CAST(N'2016-02-15 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (458, CAST(N'2016-02-15 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (459, CAST(N'2016-02-15 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (460, CAST(N'2016-02-15 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (461, CAST(N'2016-02-16 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (462, CAST(N'2016-02-16 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (463, CAST(N'2016-02-16 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (464, CAST(N'2016-02-16 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (465, CAST(N'2016-02-16 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (466, CAST(N'2016-02-16 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (467, CAST(N'2016-02-16 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (468, CAST(N'2016-02-16 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (469, CAST(N'2016-02-16 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (470, CAST(N'2016-02-16 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (471, CAST(N'2016-02-17 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (472, CAST(N'2016-02-17 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (473, CAST(N'2016-02-17 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (474, CAST(N'2016-02-17 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (475, CAST(N'2016-02-17 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (476, CAST(N'2016-02-17 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (477, CAST(N'2016-02-17 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (478, CAST(N'2016-02-17 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (479, CAST(N'2016-02-17 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (480, CAST(N'2016-02-17 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (481, CAST(N'2016-02-18 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (482, CAST(N'2016-02-18 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (483, CAST(N'2016-02-18 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (484, CAST(N'2016-02-18 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (485, CAST(N'2016-02-18 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (486, CAST(N'2016-02-18 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (487, CAST(N'2016-02-18 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (488, CAST(N'2016-02-18 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (489, CAST(N'2016-02-18 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (490, CAST(N'2016-02-18 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (491, CAST(N'2016-02-19 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (492, CAST(N'2016-02-19 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (493, CAST(N'2016-02-19 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (494, CAST(N'2016-02-19 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (495, CAST(N'2016-02-19 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (496, CAST(N'2016-02-19 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (497, CAST(N'2016-02-19 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (498, CAST(N'2016-02-19 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (499, CAST(N'2016-02-19 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (500, CAST(N'2016-02-19 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (501, CAST(N'2016-02-20 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (502, CAST(N'2016-02-20 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (503, CAST(N'2016-02-20 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (504, CAST(N'2016-02-20 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (505, CAST(N'2016-02-20 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (506, CAST(N'2016-02-20 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (507, CAST(N'2016-02-20 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (508, CAST(N'2016-02-20 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (509, CAST(N'2016-02-20 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (510, CAST(N'2016-02-20 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (511, CAST(N'2016-02-21 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (512, CAST(N'2016-02-21 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (513, CAST(N'2016-02-21 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (514, CAST(N'2016-02-21 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (515, CAST(N'2016-02-21 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (516, CAST(N'2016-02-21 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (517, CAST(N'2016-02-21 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (518, CAST(N'2016-02-21 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (519, CAST(N'2016-02-21 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (520, CAST(N'2016-02-21 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (521, CAST(N'2016-02-22 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (522, CAST(N'2016-02-22 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (523, CAST(N'2016-02-22 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (524, CAST(N'2016-02-22 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (525, CAST(N'2016-02-22 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (526, CAST(N'2016-02-22 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (527, CAST(N'2016-02-22 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (528, CAST(N'2016-02-22 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (529, CAST(N'2016-02-22 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (530, CAST(N'2016-02-22 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (531, CAST(N'2016-02-23 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (532, CAST(N'2016-02-23 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (533, CAST(N'2016-02-23 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (534, CAST(N'2016-02-23 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (535, CAST(N'2016-02-23 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (536, CAST(N'2016-02-23 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (537, CAST(N'2016-02-23 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (538, CAST(N'2016-02-23 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (539, CAST(N'2016-02-23 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (540, CAST(N'2016-02-23 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (541, CAST(N'2016-02-24 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (542, CAST(N'2016-02-24 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (543, CAST(N'2016-02-24 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (544, CAST(N'2016-02-24 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (545, CAST(N'2016-02-24 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (546, CAST(N'2016-02-24 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (547, CAST(N'2016-02-24 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (548, CAST(N'2016-02-24 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (549, CAST(N'2016-02-24 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (550, CAST(N'2016-02-24 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (551, CAST(N'2016-02-25 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (552, CAST(N'2016-02-25 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (553, CAST(N'2016-02-25 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (554, CAST(N'2016-02-25 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (555, CAST(N'2016-02-25 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (556, CAST(N'2016-02-25 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (557, CAST(N'2016-02-25 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (558, CAST(N'2016-02-25 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (559, CAST(N'2016-02-25 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (560, CAST(N'2016-02-25 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (561, CAST(N'2016-02-26 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (562, CAST(N'2016-02-26 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (563, CAST(N'2016-02-26 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (564, CAST(N'2016-02-26 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (565, CAST(N'2016-02-26 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (566, CAST(N'2016-02-26 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (567, CAST(N'2016-02-26 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (568, CAST(N'2016-02-26 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (569, CAST(N'2016-02-26 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (570, CAST(N'2016-02-26 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (571, CAST(N'2016-02-27 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (572, CAST(N'2016-02-27 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (573, CAST(N'2016-02-27 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (574, CAST(N'2016-02-27 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (575, CAST(N'2016-02-27 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (576, CAST(N'2016-02-27 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (577, CAST(N'2016-02-27 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (578, CAST(N'2016-02-27 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (579, CAST(N'2016-02-27 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (580, CAST(N'2016-02-27 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (581, CAST(N'2016-02-28 09:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (582, CAST(N'2016-02-28 10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (583, CAST(N'2016-02-28 11:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (584, CAST(N'2016-02-28 12:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (585, CAST(N'2016-02-28 13:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (586, CAST(N'2016-02-28 14:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (587, CAST(N'2016-02-28 15:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (588, CAST(N'2016-02-28 16:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (589, CAST(N'2016-02-28 17:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_FechaCitaAdmision] ([idFechaCitaAdmision], [fechaCita], [estado]) VALUES (590, CAST(N'2016-02-28 18:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[GAA_Genero] ([idGenero], [descripcion]) VALUES (1, N'Masculino')
GO
INSERT [dbo].[GAA_Genero] ([idGenero], [descripcion]) VALUES (2, N'Femenino')
GO
INSERT [dbo].[GAA_Grado] ([idGrado], [descripcion]) VALUES (1, N'1 Grado')
GO
INSERT [dbo].[GAA_Grado] ([idGrado], [descripcion]) VALUES (2, N'2 Grado')
GO
INSERT [dbo].[GAA_Grado] ([idGrado], [descripcion]) VALUES (3, N'3 Grado')
GO
INSERT [dbo].[GAA_Postulante] ([idPostulante], [idApoderado], [idCiudad], [idGenero], [idTipoDocumento], [nombre], [apellido], [numeroDocumento], [fechaNacimiento], [lugarNacimiento]) VALUES (1, 7, 8, 1, 1, N'Nombres Postulante', N'Apellidos Postulant', N'44569874', CAST(N'1984-04-10 00:00:00.000' AS DateTime), N'Lugar de Nacimiento')
GO
INSERT [dbo].[GAA_Postulante] ([idPostulante], [idApoderado], [idCiudad], [idGenero], [idTipoDocumento], [nombre], [apellido], [numeroDocumento], [fechaNacimiento], [lugarNacimiento]) VALUES (2, 8, 3, 1, 1, N'postulante2', N'postulant apellido2', N'12345678', CAST(N'1994-11-23 00:00:00.000' AS DateTime), N'lugar2')
GO
INSERT [dbo].[GAA_Postulante] ([idPostulante], [idApoderado], [idCiudad], [idGenero], [idTipoDocumento], [nombre], [apellido], [numeroDocumento], [fechaNacimiento], [lugarNacimiento]) VALUES (3, 9, 2, 1, 1, N'aasdads', N'adasdas', N'87654321', CAST(N'1994-09-09 00:00:00.000' AS DateTime), N'luarr')
GO
INSERT [dbo].[GAA_ResultadoEvaluacion] ([idResultadoEvaluacion], [idExpediente], [resultadoPrueba], [tipoEvaluacion], [evaluador], [cargoEvaluador], [fechaEvaluacion]) VALUES (1, 1, N'Pendiente', N'Pendiente', N'Pendiente', N'Pendiente', N'Pendiente')
GO
INSERT [dbo].[GAA_ResultadoProceso] ([idResultadoProceso], [idExpediente], [resultado], [fechaResultado], [observacionResultado]) VALUES (1, 1, N'Pendiente', N'Pendiente', NULL)
GO
INSERT [dbo].[GAA_SolicitudAdmision] ([idSolicitudAdmision], [idPostulante], [idGrado], [idSucursal], [fechaSolicitud]) VALUES (1, 1, 1, 17, CAST(N'2016-09-15 00:05:20.000' AS DateTime))
GO
INSERT [dbo].[GAA_SolicitudAdmision] ([idSolicitudAdmision], [idPostulante], [idGrado], [idSucursal], [fechaSolicitud]) VALUES (2, 2, 2, 18, CAST(N'2016-09-15 00:41:49.000' AS DateTime))
GO
INSERT [dbo].[GAA_SolicitudAdmision] ([idSolicitudAdmision], [idPostulante], [idGrado], [idSucursal], [fechaSolicitud]) VALUES (3, 3, 1, 13, CAST(N'2016-09-15 00:42:16.000' AS DateTime))
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (1, 1, N'Arequipa 1- Bustamente')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (2, 1, N'Arequipa 1- Cerro Colorado')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (3, 2, N'Sede Chiclayo')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (4, 3, N'Sede Chimbote')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (5, 4, N'Sede Huacho')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (6, 4, N'Sede Santa Clara')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (7, 4, N'Sede Ate')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (8, 4, N'Sede Callao')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (9, 4, N'Sede Chorrillos')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (10, 4, N'Sede Comas')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (11, 4, N'Sede San Miguel')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (12, 4, N'Sede SJL')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (13, 4, N'Sede Sam Martin de Porres')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (14, 4, N'Sede Surco')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (15, 5, N'Sede Huancayo')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (16, 6, N'Sede Chincha')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (17, 6, N'Sede Ica')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (18, 7, N'Sede Piura')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (19, 8, N'Sede Trujillo')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (20, 9, N'Sede Tacna')
GO
INSERT [dbo].[GAA_TipoDocumento] ([idTipoDocumento], [descripcion]) VALUES (1, N'DNI')
GO
INSERT [dbo].[GAA_TipoDocumento] ([idTipoDocumento], [descripcion]) VALUES (2, N'Carnet Extranjería')
GO
INSERT [dbo].[GAA_VinculoApoderado] ([idVinculoApoderado], [descripcion]) VALUES (1, N'Padre')
GO
INSERT [dbo].[GAA_VinculoApoderado] ([idVinculoApoderado], [descripcion]) VALUES (2, N'Madre')
GO
INSERT [dbo].[GAA_VinculoApoderado] ([idVinculoApoderado], [descripcion]) VALUES (3, N'Tutor Legal')
GO
ALTER TABLE [dbo].[GAA_Apoderado]  WITH CHECK ADD  CONSTRAINT [FK_GAA_Apoderado_GAA_TipoDocumento] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[GAA_TipoDocumento] ([idTipoDocumento])
GO
ALTER TABLE [dbo].[GAA_Apoderado] CHECK CONSTRAINT [FK_GAA_Apoderado_GAA_TipoDocumento]
GO
ALTER TABLE [dbo].[GAA_Apoderado]  WITH CHECK ADD  CONSTRAINT [FK_GAA_Apoderado_GAA_VinculoApoderado] FOREIGN KEY([idVinculoApoderado])
REFERENCES [dbo].[GAA_VinculoApoderado] ([idVinculoApoderado])
GO
ALTER TABLE [dbo].[GAA_Apoderado] CHECK CONSTRAINT [FK_GAA_Apoderado_GAA_VinculoApoderado]
GO
ALTER TABLE [dbo].[GAA_CitaAdmision]  WITH CHECK ADD  CONSTRAINT [FK_GAA_CitaAdmision_GAA_EstadoCita] FOREIGN KEY([idEstadoCita])
REFERENCES [dbo].[GAA_EstadoCita] ([idEstadoCita])
GO
ALTER TABLE [dbo].[GAA_CitaAdmision] CHECK CONSTRAINT [FK_GAA_CitaAdmision_GAA_EstadoCita]
GO
ALTER TABLE [dbo].[GAA_CitaAdmision]  WITH CHECK ADD  CONSTRAINT [FK_GAA_CitaAdmision_GAA_SolicitudAdmision] FOREIGN KEY([idSolicitudAdmision])
REFERENCES [dbo].[GAA_SolicitudAdmision] ([idSolicitudAdmision])
GO
ALTER TABLE [dbo].[GAA_CitaAdmision] CHECK CONSTRAINT [FK_GAA_CitaAdmision_GAA_SolicitudAdmision]
GO
ALTER TABLE [dbo].[GAA_Ciudad]  WITH CHECK ADD  CONSTRAINT [FK_GAA_Ciudad_GAA_Departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[GAA_Departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[GAA_Ciudad] CHECK CONSTRAINT [FK_GAA_Ciudad_GAA_Departamento]
GO
ALTER TABLE [dbo].[GAA_DocumentosExpediente]  WITH CHECK ADD  CONSTRAINT [FK_GAA_DocumentosExpediente_GAA_Expediente] FOREIGN KEY([idExpediente])
REFERENCES [dbo].[GAA_Expediente] ([idExpediente])
GO
ALTER TABLE [dbo].[GAA_DocumentosExpediente] CHECK CONSTRAINT [FK_GAA_DocumentosExpediente_GAA_Expediente]
GO
ALTER TABLE [dbo].[GAA_Expediente]  WITH CHECK ADD FOREIGN KEY([idEstadoExpediente])
REFERENCES [dbo].[GAA_EstadoExpediente] ([idEstadoExpediente])
GO
ALTER TABLE [dbo].[GAA_Expediente]  WITH CHECK ADD  CONSTRAINT [FK_GAA_Expediente_GAA_CitaAdmision] FOREIGN KEY([idCitaAdmision])
REFERENCES [dbo].[GAA_CitaAdmision] ([idCitaAdmision])
GO
ALTER TABLE [dbo].[GAA_Expediente] CHECK CONSTRAINT [FK_GAA_Expediente_GAA_CitaAdmision]
GO
ALTER TABLE [dbo].[GAA_Postulante]  WITH CHECK ADD  CONSTRAINT [FK_GAA_Postulante_GAA_Apoderado] FOREIGN KEY([idApoderado])
REFERENCES [dbo].[GAA_Apoderado] ([idApoderado])
GO
ALTER TABLE [dbo].[GAA_Postulante] CHECK CONSTRAINT [FK_GAA_Postulante_GAA_Apoderado]
GO
ALTER TABLE [dbo].[GAA_Postulante]  WITH CHECK ADD  CONSTRAINT [FK_GAA_Postulante_GAA_Ciudad] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[GAA_Ciudad] ([idCiudad])
GO
ALTER TABLE [dbo].[GAA_Postulante] CHECK CONSTRAINT [FK_GAA_Postulante_GAA_Ciudad]
GO
ALTER TABLE [dbo].[GAA_Postulante]  WITH CHECK ADD  CONSTRAINT [FK_GAA_Postulante_GAA_Genero] FOREIGN KEY([idGenero])
REFERENCES [dbo].[GAA_Genero] ([idGenero])
GO
ALTER TABLE [dbo].[GAA_Postulante] CHECK CONSTRAINT [FK_GAA_Postulante_GAA_Genero]
GO
ALTER TABLE [dbo].[GAA_Postulante]  WITH CHECK ADD  CONSTRAINT [FK_GAA_Postulante_GAA_TipoDocumento] FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[GAA_TipoDocumento] ([idTipoDocumento])
GO
ALTER TABLE [dbo].[GAA_Postulante] CHECK CONSTRAINT [FK_GAA_Postulante_GAA_TipoDocumento]
GO
ALTER TABLE [dbo].[GAA_ResultadoEvaluacion]  WITH CHECK ADD  CONSTRAINT [FK__GAA_Resul__idExp__05D8E0BE] FOREIGN KEY([idExpediente])
REFERENCES [dbo].[GAA_Expediente] ([idExpediente])
GO
ALTER TABLE [dbo].[GAA_ResultadoEvaluacion] CHECK CONSTRAINT [FK__GAA_Resul__idExp__05D8E0BE]
GO
ALTER TABLE [dbo].[GAA_ResultadoProceso]  WITH CHECK ADD  CONSTRAINT [FK__GAA_Resul__idExp__06CD04F7] FOREIGN KEY([idExpediente])
REFERENCES [dbo].[GAA_Expediente] ([idExpediente])
GO
ALTER TABLE [dbo].[GAA_ResultadoProceso] CHECK CONSTRAINT [FK__GAA_Resul__idExp__06CD04F7]
GO
ALTER TABLE [dbo].[GAA_SolicitudAdmision]  WITH CHECK ADD  CONSTRAINT [FK_GAA_SolicitudAdmision_GAA_Grado] FOREIGN KEY([idGrado])
REFERENCES [dbo].[GAA_Grado] ([idGrado])
GO
ALTER TABLE [dbo].[GAA_SolicitudAdmision] CHECK CONSTRAINT [FK_GAA_SolicitudAdmision_GAA_Grado]
GO
ALTER TABLE [dbo].[GAA_SolicitudAdmision]  WITH CHECK ADD  CONSTRAINT [FK_GAA_SolicitudAdmision_GAA_Postulante] FOREIGN KEY([idPostulante])
REFERENCES [dbo].[GAA_Postulante] ([idPostulante])
GO
ALTER TABLE [dbo].[GAA_SolicitudAdmision] CHECK CONSTRAINT [FK_GAA_SolicitudAdmision_GAA_Postulante]
GO
ALTER TABLE [dbo].[GAA_SolicitudAdmision]  WITH CHECK ADD  CONSTRAINT [FK_GAA_SolicitudAdmision_GAA_Sucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[GAA_Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[GAA_SolicitudAdmision] CHECK CONSTRAINT [FK_GAA_SolicitudAdmision_GAA_Sucursal]
GO
USE [master]
GO
ALTER DATABASE [InnovaSchool] SET  READ_WRITE 
GO


--DECLARE @VarDate Datetime = '20170101 09:00:00'
--WHILE @VarDate <= '20170228 18:00:00'
--BEGIN
--        insert into GAA_FechaCita ( fechaCita,estado  ) values (@VarDate,1)
--  SET @VarDate = DATEADD(HOUR, 1, @VarDate)
--END 

--go

--delete GAA_FechaCita 
--where DATEPART(HOUR,fechaCita)  between 19 and 23

--go
--delete GAA_FechaCita 
--where DATEPART(HOUR,fechaCita)  between 0 and 8

