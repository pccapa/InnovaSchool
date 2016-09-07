USE [master]
GO
/****** Object:  Database [InnovaSchool]    Script Date: 06/09/2016 19:15:02 ******/
CREATE DATABASE [InnovaSchool] 
GO 
USE [InnovaSchool]
GO
/****** Object:  Table [dbo].[GAA_Apoderado]    Script Date: 06/09/2016 19:15:02 ******/
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
	[numeroDocumento] [int] NOT NULL,
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
/****** Object:  Table [dbo].[GAA_CitaAdmision]    Script Date: 06/09/2016 19:15:02 ******/
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
/****** Object:  Table [dbo].[GAA_Ciudad]    Script Date: 06/09/2016 19:15:02 ******/
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
/****** Object:  Table [dbo].[GAA_Departamento]    Script Date: 06/09/2016 19:15:02 ******/
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
/****** Object:  Table [dbo].[GAA_EstadoCita]    Script Date: 06/09/2016 19:15:02 ******/
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
/****** Object:  Table [dbo].[GAA_Genero]    Script Date: 06/09/2016 19:15:02 ******/
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
/****** Object:  Table [dbo].[GAA_Grado]    Script Date: 06/09/2016 19:15:02 ******/
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
/****** Object:  Table [dbo].[GAA_Postulante]    Script Date: 06/09/2016 19:15:02 ******/
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
	[numeroDocumento] [int] NOT NULL,
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
/****** Object:  Table [dbo].[GAA_SolicitudAdmision]    Script Date: 06/09/2016 19:15:02 ******/
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
/****** Object:  Table [dbo].[GAA_Sucursal]    Script Date: 06/09/2016 19:15:02 ******/
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
/****** Object:  Table [dbo].[GAA_TipoDocumento]    Script Date: 06/09/2016 19:15:02 ******/
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
/****** Object:  Table [dbo].[GAA_VinculoApoderado]    Script Date: 06/09/2016 19:15:02 ******/
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
INSERT [dbo].[GAA_Apoderado] ([idApoderado], [idTipoDocumento], [idVinculoApoderado], [nombre], [apellido], [numeroDocumento], [ocupacion], [email], [telefono], [direccion]) VALUES (5, 2, 1, N'Marcoss', N'Floress', 20236547, N'Chofer', N'mflores@hotmail.com', N'987456321', N'Av. Santa Catalina 256')
GO
INSERT [dbo].[GAA_CitaAdmision] ([idCitaAdmision], [idSolicitudAdmision], [idEstadoCita], [fechaCita], [numeroIntento]) VALUES (2, 2, 4, NULL, 0)
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (1, 1, N'Lima')
GO
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (2, 2, N'Chimbote')
GO
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (1, N'Lima')
GO
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (2, N'Ancash')
GO
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (3, N'Arequipa')
GO
INSERT [dbo].[GAA_EstadoCita] ([idEstadoCita], [descripcion]) VALUES (1, N'Pendiente')
GO
INSERT [dbo].[GAA_EstadoCita] ([idEstadoCita], [descripcion]) VALUES (2, N'Aprobada')
GO
INSERT [dbo].[GAA_EstadoCita] ([idEstadoCita], [descripcion]) VALUES (3, N'Rechazada')
GO
INSERT [dbo].[GAA_EstadoCita] ([idEstadoCita], [descripcion]) VALUES (4, N'Eliminada')
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
INSERT [dbo].[GAA_Postulante] ([idPostulante], [idApoderado], [idCiudad], [idGenero], [idTipoDocumento], [nombre], [apellido], [numeroDocumento], [fechaNacimiento], [lugarNacimiento]) VALUES (2, 5, 2, 1, 1, N'Jose', N'Flores', 44523695, CAST(N'1994-05-23 00:00:00.000' AS DateTime), N'Hospital de la Victoria')
GO
INSERT [dbo].[GAA_SolicitudAdmision] ([idSolicitudAdmision], [idPostulante], [idGrado], [idSucursal], [fechaSolicitud]) VALUES (2, 2, 2, 2, CAST(N'2016-09-06 11:41:42.000' AS DateTime))
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (1, 1, N'San Isidro')
GO
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (2, 2, N'Colegio Chimbote')
GO
INSERT [dbo].[GAA_TipoDocumento] ([idTipoDocumento], [descripcion]) VALUES (1, N'DNI')
GO
INSERT [dbo].[GAA_TipoDocumento] ([idTipoDocumento], [descripcion]) VALUES (2, N'Carnet Extrangería')
GO
INSERT [dbo].[GAA_VinculoApoderado] ([idVinculoApoderado], [descripcion]) VALUES (1, N'Padre')
GO
INSERT [dbo].[GAA_VinculoApoderado] ([idVinculoApoderado], [descripcion]) VALUES (2, N'Madre')
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
