USE [master]
GO
CREATE DATABASE [InnovaSchool] 
go
USE [InnovaSchool]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAA_Apoderado](
	[idApoderado] [int] NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[idCiudad] [int] NOT NULL,
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAA_CitaAdmision](
	[idCitaAdmision] [int] NOT NULL,
	[idSolicitudAdmision] [int] NOT NULL,
	[fechaCita] [datetime] NOT NULL,
	[numeroIntento] [int] NOT NULL,
 CONSTRAINT [PK_GAA_CitaAdmision] PRIMARY KEY CLUSTERED 
(
	[idCitaAdmision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAA_Postulante](
	[idPostulante] [int] NOT NULL,
	[idApoderado] [int] NOT NULL,
	[idGenero] [int] NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[numeroDocumento] [int] NOT NULL,
	[fechaNacimiento] [datetime] NOT NULL,
	[lugarNacimiento] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GAA_Postulante] PRIMARY KEY CLUSTERED 
(
	[idPostulante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
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
	[estado] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GAA_SolicitudAdmision] PRIMARY KEY CLUSTERED 
(
	[idSolicitudAdmision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GAA_Sucursal](
	[idSucursal] [int] NOT NULL,
	[idCiudad] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_GAA_Sucursal] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (1, 1, N'Lima')
INSERT [dbo].[GAA_Ciudad] ([idCiudad], [idDepartamento], [descripcion]) VALUES (2, 2, N'Chimbote')
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (1, N'Lima')
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (2, N'Ancash')
INSERT [dbo].[GAA_Departamento] ([idDepartamento], [descripcion]) VALUES (3, N'Arequipa')
INSERT [dbo].[GAA_Genero] ([idGenero], [descripcion]) VALUES (1, N'Masculino')
INSERT [dbo].[GAA_Genero] ([idGenero], [descripcion]) VALUES (2, N'Femenino')
INSERT [dbo].[GAA_Grado] ([idGrado], [descripcion]) VALUES (1, N'1 Grado')
INSERT [dbo].[GAA_Grado] ([idGrado], [descripcion]) VALUES (2, N'2 Grado')
INSERT [dbo].[GAA_Grado] ([idGrado], [descripcion]) VALUES (3, N'3 Grado')
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (1, 1, N'San Isidro')
INSERT [dbo].[GAA_Sucursal] ([idSucursal], [idCiudad], [descripcion]) VALUES (2, 2, N'Colegio Chimbote')
INSERT [dbo].[GAA_TipoDocumento] ([idTipoDocumento], [descripcion]) VALUES (1, N'DNI')
INSERT [dbo].[GAA_TipoDocumento] ([idTipoDocumento], [descripcion]) VALUES (2, N'Carnet Extrangería')
INSERT [dbo].[GAA_VinculoApoderado] ([idVinculoApoderado], [descripcion]) VALUES (1, N'Padre')
INSERT [dbo].[GAA_VinculoApoderado] ([idVinculoApoderado], [descripcion]) VALUES (2, N'Madre')
INSERT [dbo].[GAA_VinculoApoderado] ([idVinculoApoderado], [descripcion]) VALUES (3, N'Tio')
USE [master]
GO
ALTER DATABASE [InnovaSchool] SET  READ_WRITE 
GO
