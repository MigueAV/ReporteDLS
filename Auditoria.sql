USE [AUDITORIA]
GO
/****** Object:  User [SBDOMAIN\Grupo Desarrollo]    Script Date: 30/03/2022 8:53:50 ******/
CREATE USER [SBDOMAIN\Grupo Desarrollo] FOR LOGIN [SBDOMAIN\Grupo Desarrollo]
GO
/****** Object:  User [SBDOMAIN\jcallupea]    Script Date: 30/03/2022 8:53:50 ******/
CREATE USER [SBDOMAIN\jcallupea] FOR LOGIN [SBDOMAIN\jcallupea] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sighos_leshly]    Script Date: 30/03/2022 8:53:50 ******/
CREATE USER [sighos_leshly] FOR LOGIN [sighos_leshly] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [user_sighoshsb]    Script Date: 30/03/2022 8:53:50 ******/
CREATE USER [user_sighoshsb] FOR LOGIN [user_sighoshsb] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'SBDOMAIN\Grupo Desarrollo'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'SBDOMAIN\Grupo Desarrollo'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'SBDOMAIN\jcallupea'
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'sighos_leshly'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'sighos_leshly'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'user_sighoshsb'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'user_sighoshsb'
GO
/****** Object:  UserDefinedFunction [dbo].[dfu_edad]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
-- select dbo.dfu_edad(29/11/1995,'15/03/2022')
CREATE FUNCTION [dbo].[dfu_edad]
(
@pfec_nac as smalldatetime,@pfec_hoy as smalldatetime)
Returns int
AS
BEGIN

--SET @pfec_hoy = GETDATE()
--SET @pfec_nac = '14/03/2021'

   Declare @edad Char(10)
   Declare @nEdad_Dias int
   Declare @nEdad_Meses int
   Declare @nEdad_Anhos int

   set @nEdad_Dias = datediff(day,@pFec_Nac,@pFec_Hoy)
   set @nEdad_Anhos = floor(@nEdad_Dias / 365.25)

   set @nEdad_Dias  = @nEdad_Dias % 365.25
   set @nEdad_Meses = floor(@nEdad_Dias / 30.44)
   set @nEdad_Dias  = @nEdad_Dias % 30.44
   
   Set @edad = rtrim(cast(@nEdad_Anhos as char(3)))+''+
   rtrim(cast(replicate('0',2-len(@nEdad_Meses)) as char(2)))+rtrim(cast(@nEdad_Meses as char(2)))+''+
   rtrim(cast(replicate('0',2-len(@nEdad_Dias)) as char(2)))+rtrim(cast(@nEdad_Dias as char(2)))


   --SELECT @EDAD,@nEdad_Anhos,@nEdad_Meses,@nEdad_Dias
--SELECT convert(int,@edad)

	 
----IF EXISTS(
--SELECT * FROM RC_53
--WHERE @edad >=EDADmin and @edad <=Edadmax and CondicionMaterna <> 1
----)

----PRINT '1'

----IF EXISTS(
--SELECT * FROM RC_53
--WHERE @edad >=EDADmin and @edad <=Edadmax and CondicionMaterna =1
--AND codigo in (select Codigo  from SIS_DIAGNOSTICO)
----)
----PRINT '1'

   Return @edad


END
GO
/****** Object:  Table [dbo].[MOR_Fallecidos]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOR_Fallecidos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tcdef] [varchar](80) NULL,
	[CDEF] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[TSeguro] [varchar](50) NULL,
	[FPaterno] [varchar](50) NULL,
	[FMaterno] [varchar](50) NULL,
	[FNombres] [varchar](50) NULL,
	[TDoc] [varchar](50) NULL,
	[NDoc] [varchar](50) NULL,
	[Sexo] [varchar](50) NULL,
	[Etnia] [varchar](50) NULL,
	[FEdad] [int] NULL,
	[FTiempo] [varchar](50) NULL,
	[FEstadoCivil] [varchar](50) NULL,
	[FNInstruccion] [varchar](50) NULL,
	[FOcupacion] [varchar](250) NULL,
	[CodUbiDomicilio] [varchar](50) NULL,
	[UbigeoDomicilio] [varchar](250) NULL,
	[Direccion] [varchar](250) NULL,
	[FContinente] [varchar](50) NULL,
	[FPais] [varchar](50) NULL,
	[FDepartamento] [varchar](50) NULL,
	[FProvincia] [varchar](250) NULL,
	[FDistrito] [varchar](250) NULL,
	[Fecha] [date] NULL,
	[Anio] [int] NULL,
	[Mes] [char](2) NULL,
	[Hora] [char](10) NULL,
	[DebidoCausaA] [varchar](250) NULL,
	[CausaACIEX] [char](5) NULL,
	[TiempoA] [varchar](50) NULL,
	[DebidoCausaB] [varchar](250) NULL,
	[CausaBCIEX] [char](5) NULL,
	[TiempoB] [varchar](50) NULL,
	[DebidoCausaC] [varchar](250) NULL,
	[CausaCCIEX] [char](5) NULL,
	[TiempoC] [varchar](50) NULL,
	[DebidoCausaD] [varchar](250) NULL,
	[CausaDCIEX] [char](5) NULL,
	[TiempoD] [varchar](50) NULL,
	[DebidoCausaE] [varchar](250) NULL,
	[CausaECIEX] [char](5) NULL,
	[TiempoE] [varchar](50) NULL,
	[DebidoCausaF] [varchar](250) NULL,
	[CausaFCIEX] [char](5) NULL,
	[TiempoF] [varchar](50) NULL,
	[TipoLugar] [varchar](50) NULL,
	[CodLugar] [varchar](150) NULL,
	[Continente] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[Institucion] [varchar](50) NULL,
	[DISA] [varchar](50) NULL,
	[Departamento] [varchar](50) NULL,
	[Provincia] [varchar](50) NULL,
	[Distrito] [varchar](250) NULL,
	[DesLugar] [varchar](250) NULL,
	[DirecLugar] [varchar](250) NULL,
	[MuerteViolenta] [varchar](50) NULL,
	[Necropsia] [varchar](250) NULL,
	[MuerteDurante] [varchar](50) NULL,
	[EGestacional] [varchar](50) NULL,
	[ControlPrenatal] [varchar](50) NULL,
	[THospitalizacion] [varchar](50) NULL,
	[LRTLugar] [varchar](50) NULL,
	[LRCodLugar] [varchar](50) NULL,
	[LRInstitucion] [varchar](50) NULL,
	[LRDepartamento] [varchar](50) NULL,
	[LRDesLugar] [varchar](300) NULL,
	[PPaterno] [varchar](50) NULL,
	[PMaterno] [varchar](50) NULL,
	[PNombres] [varchar](50) NULL,
	[PTDoc] [varchar](7) NULL,
	[PNDoc] [char](8) NULL,
	[PDeclara] [varchar](150) NULL,
	[PColegiatura] [varchar](50) NULL,
	[ORegistro] [datetime] NULL,
	[OAnio] [int] NULL,
	[OMes] [char](2) NULL,
	[OPaterno] [varchar](50) NULL,
	[OMaterno] [varchar](50) NULL,
	[ONombres] [varchar](50) NULL,
	[ODNI] [varchar](50) NULL,
	[Migracion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEO_RNacidos]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEO_RNacidos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CNV] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[M_Paterno] [varchar](50) NULL,
	[M_Materno] [varchar](50) NULL,
	[M_Nombres] [varchar](50) NULL,
	[M_Edad] [int] NULL,
	[M_FecNac] [datetime] NULL,
	[Gestacion] [int] NULL,
	[TDocumento] [varchar](50) NULL,
	[NDocumento] [varchar](50) NULL,
	[CodEESSPrenatal] [varchar](50) NULL,
	[EESSPrenatal] [varchar](250) NULL,
	[Fecha] [datetime] NULL,
	[Hora] [char](8) NULL,
	[Sexo] [char](1) NULL,
	[Peso_g] [int] NULL,
	[Talla_cm] [decimal](18, 1) NULL,
	[Apgar] [nvarchar](255) NULL,
	[Apgar1] [int] NULL,
	[Apgar2] [int] NULL,
	[PCefalico] [decimal](18, 2) NULL,
	[PToraxico] [decimal](18, 2) NULL,
	[MCongenita] [char](2) NULL,
	[TiempoLigCord] [varchar](50) NULL,
	[LactanciaPrecoz] [char](2) NULL,
	[Paterno] [varchar](50) NULL,
	[Materno] [varchar](50) NULL,
	[Nombres] [varchar](50) NULL,
	[Profesion] [varchar](50) NULL,
	[Colegiatura] [varchar](50) NULL,
	[Registro] [datetime] NULL,
	[O_Paterno] [varchar](50) NULL,
	[O_Materno] [varchar](50) NULL,
	[O_Nombres] [varchar](50) NULL,
	[Cesarea] [bit] NOT NULL,
	[Migracion] [datetime] NOT NULL,
 CONSTRAINT [PK_NEO_RNacidos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RC_53]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RC_53](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [char](4) NOT NULL,
	[Sexo] [char](1) NULL,
	[EdadMin] [int] NULL,
	[EdadMax] [int] NULL,
	[CondicionMaterna] [int] NULL,
	[Tipo] [int] NULL,
	[Acccion] [int] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_RC_53] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_AnulacionesFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_AnulacionesFua](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPrestaciones] [int] NOT NULL,
	[Lote] [int] NOT NULL,
	[Fua] [int] NOT NULL,
	[IdUsuario] [int] NULL,
	[Registro] [datetime] NOT NULL,
 CONSTRAINT [PK__SIS_Anul__3214EC0784C56B15] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_CONSULTORIOSE]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_CONSULTORIOSE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodConsult] [nchar](10) NOT NULL,
	[DesConsult] [varchar](200) NULL,
 CONSTRAINT [PK_SIS_CONSULTORIOSE] PRIMARY KEY CLUSTERED 
(
	[CodConsult] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_Consumo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_Consumo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Codigo] [varchar](50) NULL,
	[Item] [varchar](350) NOT NULL,
	[Unidad] [varchar](10) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[Importe] [float] NOT NULL,
	[Cie10] [int] NOT NULL,
	[Digita] [bit] NOT NULL,
	[Lote] [int] NOT NULL,
	[Fua] [int] NOT NULL,
	[Caja] [int] NOT NULL,
	[Registro] [datetime] NULL,
	[Migrado] [bit] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Reg_anula] [datetime] NOT NULL,
	[UsuAnula] [int] NOT NULL,
	[Sismed] [varchar](50) NULL,
	[IdUsuario] [int] NOT NULL,
	[NumFactura] [varchar](10) NOT NULL,
	[TipFactura] [varchar](1) NOT NULL,
	[IdPaquetePerfil] [int] NULL,
	[TipTarifa] [int] NULL,
	[CPT] [char](8) NULL,
 CONSTRAINT [PK_SIS_Consumo_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_ConsumoFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_ConsumoFua](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[FActualizacion] [datetime] NULL,
	[Lote_antiguo] [int] NULL,
	[Fua_antiguo] [int] NULL,
	[Lote_nuevo] [int] NULL,
	[Fua_nuevo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_DIAGNOSTICO]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_DIAGNOSTICO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [char](4) NULL,
	[Descripcion] [varchar](500) NULL,
	[Estado] [bit] NULL,
	[Registro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_ESPECIALIDADES]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_ESPECIALIDADES](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodEspecialidad] [varchar](2) NULL,
	[Descripcion] [varchar](300) NULL,
	[Estado] [bit] NULL,
	[Registro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_FUAAUDITADOS]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_FUAAUDITADOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lote] [int] NULL,
	[Fua] [int] NULL,
	[Auditado] [bit] NULL,
	[Registro] [datetime] NULL,
	[UsuAudita] [int] NULL,
	[Estado] [bit] NULL,
	[Ingreso] [int] NOT NULL,
	[ModAudita] [int] NOT NULL,
	[RegModAudita] [datetime] NOT NULL,
	[Anulado] [bit] NOT NULL,
	[RegAnulado] [datetime] NOT NULL,
	[UsuAnulado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_FUAOBSERVACIONES]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_FUAOBSERVACIONES](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lote] [int] NULL,
	[Fua] [int] NULL,
	[Observacion] [varchar](200) NULL,
	[DetalleObservacion] [varchar](max) NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_SIS_FUAOBSERVACIONES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_HistorialConsumo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_HistorialConsumo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Item] [varchar](350) NOT NULL,
	[Unidad] [varchar](10) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [float] NOT NULL,
	[Importe] [float] NOT NULL,
	[Cie10] [int] NOT NULL,
	[Digita] [bit] NOT NULL,
	[Lote] [int] NOT NULL,
	[Fua] [int] NOT NULL,
	[Caja] [int] NOT NULL,
	[Registro] [datetime] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Reg_anula] [datetime] NULL,
	[UsuAnula] [int] NOT NULL,
	[Sismed] [varchar](50) NULL,
	[IdUsuario] [int] NOT NULL,
	[IdPaquetePerfil] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_HistorialPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_HistorialPrestaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodPrestacion] [varchar](3) NOT NULL,
	[Registro] [datetime] NULL,
	[IdUsuario] [int] NULL,
	[lote] [int] NULL,
	[fua] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_PAQUETEPERFILES]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_PAQUETEPERFILES](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar](500) NOT NULL,
	[CAJA] [int] NOT NULL,
	[ESTADO] [bit] NULL,
	[REGISTRO] [datetime] NULL,
	[CODIGO] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_PAQUETESPERFILES_DETALLE]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_PAQUETESPERFILES_DETALLE](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPaquete] [int] NOT NULL,
	[Codigo] [varchar](100) NOT NULL,
	[Estado] [bit] NULL,
	[Registro] [datetime] NULL,
	[Codigo_Sismed] [varchar](100) NULL,
	[Caja] [int] NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_Perfiles]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_Perfiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Estado] [bit] NULL,
	[Registro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_Prestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_Prestaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[Alta] [bit] NOT NULL,
	[TDocumento] [int] NULL,
	[NDocumento] [varchar](50) NULL,
	[Historia] [varchar](50) NULL,
	[Lote] [int] NULL,
	[FUA] [int] NULL,
	[IdProcedencia] [int] NULL,
	[Disa] [char](3) NULL,
	[TFormato] [char](3) NULL,
	[NContrato] [varchar](50) NULL,
	[Turno] [int] NULL,
	[Tipo] [int] NULL,
	[Prestacion] [int] NULL,
	[Componente] [int] NULL,
	[Establecimiento] [int] NULL,
	[IdEspecialidad] [int] NULL,
	[IdProfesional] [int] NULL,
	[IdUsuario] [int] NULL,
	[Registro] [datetime] NULL,
	[IdUsuMod] [int] NOT NULL,
	[RegMod] [datetime] NOT NULL,
	[gestante] [bit] NULL,
	[levantamiento] [bit] NULL,
	[estado] [bit] NOT NULL,
	[habilitado] [bit] NOT NULL,
	[rec_habi] [datetime] NULL,
	[idplan] [int] NOT NULL,
	[du] [bit] NOT NULL,
	[FechaAlta] [datetime] NULL,
	[IdusuAlta] [int] NOT NULL,
	[Aval] [int] NULL,
	[Auditado] [bit] NULL,
	[Condicion] [int] NULL,
	[TAlta] [int] NULL,
	[Cama] [varchar](50) NOT NULL,
	[RegistroFAlta] [datetime] NOT NULL,
	[IdUsuAltaMod] [int] NULL,
	[FechaHMA] [date] NULL,
	[RegAltaMod] [datetime] NULL,
	[Masiva] [int] NULL,
	[FMasiva] [datetime] NULL,
	[Visible] [bit] NOT NULL,
	[IdUsuAnula] [int] NULL,
	[RegAnula] [datetime] NULL,
	[IdUsuHabi] [int] NULL,
	[IdRetAnula] [int] NULL,
	[RegRetiAnula] [datetime] NULL,
	[FechaCierre] [datetime] NULL,
	[Impreso] [bit] NOT NULL,
	[FechaImpresion] [datetime] NULL,
	[IdQuitaAudi] [int] NOT NULL,
	[RegQuitaAudi] [datetime] NULL,
	[IdUsuQuitaAnula] [int] NULL,
	[RegUsuQuitaAnula] [datetime] NULL,
	[IdAtencion] [int] NOT NULL,
	[IdUsuAuditado] [int] NOT NULL,
	[migracion] [bit] NOT NULL,
 CONSTRAINT [PK_SIS_Prestaciones_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_ResultadoLab]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_ResultadoLab](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lote] [int] NOT NULL,
	[Fua] [int] NOT NULL,
	[Cod_Lab] [int] NOT NULL,
	[cantidad] [float] NULL,
	[Idusuario] [int] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_ROLES]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_ROLES](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[anio] [int] NOT NULL,
	[mes] [int] NOT NULL,
	[cod_usuario] [varchar](50) NULL,
	[prestacion] [varchar](3) NULL,
	[dia] [int] NULL,
	[Reg_usuario] [int] NULL,
	[estado] [bit] NULL,
	[Registro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_SeguroDiagnostico]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_SeguroDiagnostico](
	[id_diagnostico] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](7) NULL,
	[Tipo] [char](1) NULL,
	[Orden] [int] NOT NULL,
	[Tipo2] [int] NULL,
	[lote] [int] NULL,
	[fua] [int] NULL,
	[Estado] [bit] NOT NULL,
	[Registro] [datetime] NOT NULL,
	[Reg_Anula] [datetime] NOT NULL,
	[UsuAnula] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Migrado] [bit] NOT NULL,
	[Digita] [bit] NOT NULL,
 CONSTRAINT [PK_SIS_SeguroDiagnostico] PRIMARY KEY CLUSTERED 
(
	[id_diagnostico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_Tarifario]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_Tarifario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CPT] [varchar](10) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Precio] [decimal](18, 2) NULL,
	[Categoria] [varchar](3) NOT NULL,
	[RX] [int] NOT NULL,
	[Tomografia] [bit] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_SIS_Tarifario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIS_Trama]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIS_Trama](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Disa] [varchar](50) NOT NULL,
	[Lote] [varchar](50) NOT NULL,
	[Numero] [varchar](50) NOT NULL,
	[UDR] [varchar](50) NOT NULL,
	[IPRESS] [varchar](50) NOT NULL,
	[IPRESS_Cat] [varchar](50) NOT NULL,
	[IPRESS_Niv] [varchar](50) NOT NULL,
	[PDigitacion] [int] NOT NULL,
	[Reconsideracion] [varchar](50) NOT NULL,
	[RDisa] [varchar](50) NOT NULL,
	[RLote] [varchar](50) NOT NULL,
	[RNumero] [varchar](50) NOT NULL,
	[IdConvenio] [int] NOT NULL,
	[Componente] [int] NOT NULL,
	[DFormato] [varchar](3) NOT NULL,
	[DLote] [varchar](50) NOT NULL,
	[DNumero] [int] NOT NULL,
	[NInscripcion] [int] NOT NULL,
	[CTabla] [varchar](1) NULL,
	[CIdentificador] [int] NULL,
	[CPlan] [int] NULL,
	[CPoblacional] [char](2) NULL,
	[TDocumento] [int] NULL,
	[NDocumento] [varchar](10) NULL,
	[APaterno] [varchar](40) NULL,
	[AMaterno] [varchar](40) NULL,
	[PNombre] [varchar](35) NULL,
	[ONombres] [varchar](35) NULL,
	[FNacimiento] [date] NULL,
	[IdSexo] [int] NULL,
	[Ubigeo] [int] NULL,
	[Historia] [varchar](20) NULL,
	[TAtencion] [int] NULL,
	[SMaterna] [int] NULL,
	[MAtencion] [int] NULL,
	[NAutorizacion] [varchar](15) NULL,
	[Monto] [int] NULL,
	[FAtencion] [datetime] NULL,
	[IReferencia] [varchar](10) NULL,
	[NReferencia] [varchar](20) NULL,
	[CPrestacional] [varchar](3) NULL,
	[PAtiende] [int] NULL,
	[LAtencion] [int] NULL,
	[Destino] [int] NOT NULL,
	[FIngreso] [date] NULL,
	[FAlta] [varchar](10) NULL,
	[IDestino] [varchar](20) NULL,
	[NRefConD] [varchar](50) NULL,
	[FPParto] [date] NULL,
	[HVB] [int] NULL,
	[IEducativa] [int] NULL,
	[NEducativo] [int] NULL,
	[GEducativo] [varchar](30) NULL,
	[SEducativo] [int] NULL,
	[TEducativo] [int] NULL,
	[EEspecial] [int] NULL,
	[AnexoIIEE] [varchar](50) NULL,
	[FFallecimiento] [varchar](8) NULL,
	[COFlexible] [varchar](10) NULL,
	[IdEtnia] [varchar](2) NULL,
	[IdIAFAS] [varchar](20) NULL,
	[CSIAFA] [varchar](6) NULL,
	[IdUps] [varchar](10) NULL,
	[FCAdministrativo] [varchar](3) NULL,
	[UDRAutorizaFUA] [varchar](2) NULL,
	[LAutorizaFUA] [varchar](6) NULL,
	[SAutorizaFUA] [varchar](3) NULL,
	[DFUAVinculado] [varchar](3) NULL,
	[LFUAVinculado] [int] NULL,
	[NFUAVinculado] [int] NULL,
	[TDocumentoR] [varchar](10) NULL,
	[NDocumentoR] [varchar](50) NULL,
	[TPersonal] [varchar](9) NULL,
	[Especialidad] [int] NULL,
	[Egresado] [int] NULL,
	[Colegiatura] [int] NULL,
	[num_colegiatura] [int] NULL,
	[RNE] [int] NULL,
	[Periodo] [int] NULL,
	[Mes] [int] NULL,
	[TDDigitador] [int] NOT NULL,
	[NDDigitador] [char](8) NOT NULL,
	[Registro] [datetime] NOT NULL,
	[Observacion] [varchar](250) NOT NULL,
	[Version] [char](3) NOT NULL,
	[CAuto_SITEDS] [varchar](50) NOT NULL,
	[codestablecimiento] [varchar](20) NULL,
	[establecimiento] [varchar](200) NULL,
	[sv_num_oper] [char](10) NULL,
	[idestadofua] [int] NULL,
 CONSTRAINT [PK__atencion__D0A402365007F6D8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodUsuario] [varchar](30) NOT NULL,
	[Dni] [varchar](8) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Registro] [datetime] NULL,
	[Clave] [varchar](100) NOT NULL,
	[Perfil] [int] NOT NULL,
	[ApellidoP] [varchar](500) NOT NULL,
	[Nombres] [varchar](500) NOT NULL,
	[ApellidoM] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MOR_Fallecidos] ADD  DEFAULT (getdate()) FOR [Migracion]
GO
ALTER TABLE [dbo].[NEO_RNacidos] ADD  CONSTRAINT [DF_Obtetricia_Apgar1]  DEFAULT ((0)) FOR [Apgar1]
GO
ALTER TABLE [dbo].[NEO_RNacidos] ADD  CONSTRAINT [DF_Obtetricia_Apgar2]  DEFAULT ((0)) FOR [Apgar2]
GO
ALTER TABLE [dbo].[NEO_RNacidos] ADD  CONSTRAINT [DF_NEO_RNacidos_Cesarea]  DEFAULT ((0)) FOR [Cesarea]
GO
ALTER TABLE [dbo].[NEO_RNacidos] ADD  CONSTRAINT [DF_Obtetricia_Migracion]  DEFAULT (getdate()) FOR [Migracion]
GO
ALTER TABLE [dbo].[RC_53] ADD  CONSTRAINT [DF_RC_53_Estado]  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[SIS_AnulacionesFua] ADD  CONSTRAINT [DF_SIS_AnulacionesFua_Registro]  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_Cie10]  DEFAULT ((0)) FOR [Cie10]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_Digita]  DEFAULT ((0)) FOR [Digita]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_Lote]  DEFAULT ((0)) FOR [Lote]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_Fua]  DEFAULT ((0)) FOR [Fua]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_Registro]  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_Migrado]  DEFAULT ((0)) FOR [Migrado]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_Estado]  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_Reg_anula]  DEFAULT ('') FOR [Reg_anula]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_UsuAnula]  DEFAULT ((0)) FOR [UsuAnula]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_IdUsuario]  DEFAULT ((0)) FOR [IdUsuario]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_NumFactura]  DEFAULT ('') FOR [NumFactura]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_TipFactura]  DEFAULT ('') FOR [TipFactura]
GO
ALTER TABLE [dbo].[SIS_Consumo] ADD  CONSTRAINT [DF_SIS_Consumo_IdPaquetePerfil]  DEFAULT ((0)) FOR [IdPaquetePerfil]
GO
ALTER TABLE [dbo].[SIS_ConsumoFua] ADD  DEFAULT (getdate()) FOR [FActualizacion]
GO
ALTER TABLE [dbo].[SIS_DIAGNOSTICO] ADD  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[SIS_DIAGNOSTICO] ADD  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_ESPECIALIDADES] ADD  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[SIS_ESPECIALIDADES] ADD  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_FUAAUDITADOS] ADD  DEFAULT ((1)) FOR [Auditado]
GO
ALTER TABLE [dbo].[SIS_FUAAUDITADOS] ADD  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_FUAAUDITADOS] ADD  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[SIS_FUAAUDITADOS] ADD  CONSTRAINT [DF_SIS_FUAAUDITADOS_Ingreso]  DEFAULT ((0)) FOR [Ingreso]
GO
ALTER TABLE [dbo].[SIS_FUAAUDITADOS] ADD  CONSTRAINT [DF_SIS_FUAAUDITADOS_ModAudita]  DEFAULT ((0)) FOR [ModAudita]
GO
ALTER TABLE [dbo].[SIS_FUAAUDITADOS] ADD  CONSTRAINT [DF_SIS_FUAAUDITADOS_RegModAudita]  DEFAULT ('') FOR [RegModAudita]
GO
ALTER TABLE [dbo].[SIS_FUAAUDITADOS] ADD  CONSTRAINT [DF_SIS_FUAAUDITADOS_Anulado]  DEFAULT ((0)) FOR [Anulado]
GO
ALTER TABLE [dbo].[SIS_FUAAUDITADOS] ADD  CONSTRAINT [DF_SIS_FUAAUDITADOS_RegAnulado]  DEFAULT ('') FOR [RegAnulado]
GO
ALTER TABLE [dbo].[SIS_FUAAUDITADOS] ADD  CONSTRAINT [DF_SIS_FUAAUDITADOS_UsuAnulado]  DEFAULT ((0)) FOR [UsuAnulado]
GO
ALTER TABLE [dbo].[SIS_FUAOBSERVACIONES] ADD  CONSTRAINT [DF_SIS_FUAOBSERVACIONES_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[SIS_HistorialConsumo] ADD  DEFAULT ('') FOR [Fecha]
GO
ALTER TABLE [dbo].[SIS_HistorialConsumo] ADD  DEFAULT ((1)) FOR [Cie10]
GO
ALTER TABLE [dbo].[SIS_HistorialConsumo] ADD  DEFAULT ((0)) FOR [Digita]
GO
ALTER TABLE [dbo].[SIS_HistorialConsumo] ADD  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_HistorialConsumo] ADD  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[SIS_HistorialConsumo] ADD  DEFAULT ('') FOR [Reg_anula]
GO
ALTER TABLE [dbo].[SIS_HistorialConsumo] ADD  DEFAULT ((0)) FOR [UsuAnula]
GO
ALTER TABLE [dbo].[SIS_HistorialConsumo] ADD  DEFAULT ('') FOR [Sismed]
GO
ALTER TABLE [dbo].[SIS_HistorialConsumo] ADD  CONSTRAINT [DF_SIS_HistorialConsumo_IdUsuario]  DEFAULT ((0)) FOR [IdUsuario]
GO
ALTER TABLE [dbo].[SIS_HistorialConsumo] ADD  CONSTRAINT [DF_SIS_HistorialConsumo_IdPaquetePerfil]  DEFAULT ((0)) FOR [IdPaquetePerfil]
GO
ALTER TABLE [dbo].[SIS_HistorialPrestaciones] ADD  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_PAQUETEPERFILES] ADD  DEFAULT ((0)) FOR [ESTADO]
GO
ALTER TABLE [dbo].[SIS_PAQUETEPERFILES] ADD  DEFAULT (getdate()) FOR [REGISTRO]
GO
ALTER TABLE [dbo].[SIS_PAQUETESPERFILES_DETALLE] ADD  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[SIS_PAQUETESPERFILES_DETALLE] ADD  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_PAQUETESPERFILES_DETALLE] ADD  CONSTRAINT [DF_SIS_PAQUETESPERFILES_DETALLE_Caja]  DEFAULT ((0)) FOR [Caja]
GO
ALTER TABLE [dbo].[SIS_Perfiles] ADD  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[SIS_Perfiles] ADD  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_Alta]  DEFAULT ((0)) FOR [Alta]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_Registro]  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_IdUsuMod]  DEFAULT ((0)) FOR [IdUsuMod]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_RegMod]  DEFAULT ('') FOR [RegMod]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_gestante]  DEFAULT ((0)) FOR [gestante]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_estado]  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_habilitado]  DEFAULT ((0)) FOR [habilitado]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF__SIS_Prest__rec_h__01D345B0]  DEFAULT ('') FOR [rec_habi]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_idplan]  DEFAULT ((1)) FOR [idplan]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_du]  DEFAULT ((0)) FOR [du]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_FechaAlta]  DEFAULT ('1900-01-01 00:00:00.000') FOR [FechaAlta]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_IdusuAlta]  DEFAULT ((0)) FOR [IdusuAlta]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF__SIS_Presta__Aval__6D58170E]  DEFAULT ((0)) FOR [Aval]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF__SIS_Prest__Audit__6E4C3B47]  DEFAULT ((0)) FOR [Auditado]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF__SIS_Prest__Condi__6F405F80]  DEFAULT ((0)) FOR [Condicion]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF__SIS_Prest__TAlta__703483B9]  DEFAULT ((0)) FOR [TAlta]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_Cama]  DEFAULT ('0') FOR [Cama]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_RegistroFAlta]  DEFAULT ('') FOR [RegistroFAlta]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_IdUsuAltaMod]  DEFAULT ('') FOR [IdUsuAltaMod]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_RegAltaMod]  DEFAULT ('1900-01-01 00:00:00.000') FOR [RegAltaMod]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_Masiva]  DEFAULT ((0)) FOR [Masiva]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_FMasiva]  DEFAULT ('') FOR [FMasiva]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_Continuador]  DEFAULT ((0)) FOR [Visible]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_RegRetiAnula]  DEFAULT (' ') FOR [RegRetiAnula]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_FechaCierre]  DEFAULT ('') FOR [FechaCierre]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_Impreso]  DEFAULT ((0)) FOR [Impreso]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_FechaImpresion]  DEFAULT ('') FOR [FechaImpresion]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_IdQuitaAudi]  DEFAULT ('') FOR [IdQuitaAudi]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_RegQuitaAudi]  DEFAULT ('') FOR [RegQuitaAudi]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_IdUsuQuitaAnula]  DEFAULT ((0)) FOR [IdUsuQuitaAnula]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_RegUsuQuitaAnula]  DEFAULT ('') FOR [RegUsuQuitaAnula]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_IdAtencion]  DEFAULT ((0)) FOR [IdAtencion]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_IdAuditado]  DEFAULT ((0)) FOR [IdUsuAuditado]
GO
ALTER TABLE [dbo].[SIS_Prestaciones] ADD  CONSTRAINT [DF_SIS_Prestaciones_migracion]  DEFAULT ((0)) FOR [migracion]
GO
ALTER TABLE [dbo].[SIS_ResultadoLab] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[SIS_ROLES] ADD  DEFAULT ((0)) FOR [estado]
GO
ALTER TABLE [dbo].[SIS_ROLES] ADD  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_SeguroDiagnostico] ADD  CONSTRAINT [DF_SIS_SeguroDiagnostico_Orden]  DEFAULT ((1)) FOR [Orden]
GO
ALTER TABLE [dbo].[SIS_SeguroDiagnostico] ADD  CONSTRAINT [DF_SIS_SeguroDiagnostico_Estado]  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[SIS_SeguroDiagnostico] ADD  CONSTRAINT [DF_SIS_SeguroDiagnostico_Registro]  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_SeguroDiagnostico] ADD  CONSTRAINT [DF_SIS_SeguroDiagnostico_Reg_Anula]  DEFAULT ('') FOR [Reg_Anula]
GO
ALTER TABLE [dbo].[SIS_SeguroDiagnostico] ADD  CONSTRAINT [DF_SIS_SeguroDiagnostico_UsuAnula]  DEFAULT ((0)) FOR [UsuAnula]
GO
ALTER TABLE [dbo].[SIS_SeguroDiagnostico] ADD  CONSTRAINT [DF_SIS_SeguroDiagnostico_IdUsuario]  DEFAULT ((0)) FOR [IdUsuario]
GO
ALTER TABLE [dbo].[SIS_SeguroDiagnostico] ADD  CONSTRAINT [DF_SIS_SeguroDiagnostico_Migrado]  DEFAULT ((0)) FOR [Migrado]
GO
ALTER TABLE [dbo].[SIS_SeguroDiagnostico] ADD  CONSTRAINT [DF_SIS_SeguroDiagnostico_Digita]  DEFAULT ((0)) FOR [Digita]
GO
ALTER TABLE [dbo].[SIS_Tarifario] ADD  CONSTRAINT [DF_SIS_Tarifario_Tarifario]  DEFAULT ((0)) FOR [Tomografia]
GO
ALTER TABLE [dbo].[SIS_Tarifario] ADD  CONSTRAINT [DF_SIS_Tarifario_Estado]  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Disa]  DEFAULT ('350') FOR [Disa]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_UDR]  DEFAULT ('038') FOR [UDR]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_IPRESS]  DEFAULT ('00006215') FOR [IPRESS]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_IPRESS_Cat]  DEFAULT ('07') FOR [IPRESS_Cat]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_IPRESS_Niv]  DEFAULT ('3') FOR [IPRESS_Niv]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_PDigitacion]  DEFAULT ((111)) FOR [PDigitacion]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Reconsideracion]  DEFAULT ('N') FOR [Reconsideracion]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_RDisa]  DEFAULT ('') FOR [RDisa]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_RLote]  DEFAULT ('') FOR [RLote]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_RNumero]  DEFAULT ('''  +''|''+') FOR [RNumero]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_IdConvenio]  DEFAULT ((0)) FOR [IdConvenio]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Componente]  DEFAULT ((0)) FOR [Componente]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_DFormato]  DEFAULT ((230)) FOR [DFormato]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_DLote]  DEFAULT ('2') FOR [DLote]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_DNumero]  DEFAULT ((0)) FOR [DNumero]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_NInscripcion]  DEFAULT ((0)) FOR [NInscripcion]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_CTabla]  DEFAULT ('') FOR [CTabla]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_CIdentificador]  DEFAULT ((0)) FOR [CIdentificador]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_CPlan]  DEFAULT ((0)) FOR [CPlan]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_CPoblacional]  DEFAULT ('') FOR [CPoblacional]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_TDocumento]  DEFAULT ((0)) FOR [TDocumento]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_NDocumento]  DEFAULT ('') FOR [NDocumento]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_APaterno]  DEFAULT ('') FOR [APaterno]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_AMaterno]  DEFAULT ('') FOR [AMaterno]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_PNombre]  DEFAULT ('') FOR [PNombre]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_ONombres]  DEFAULT ('') FOR [ONombres]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_FNacimiento]  DEFAULT ('') FOR [FNacimiento]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_IdSexo]  DEFAULT ((0)) FOR [IdSexo]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Ubigeo]  DEFAULT ((0)) FOR [Ubigeo]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Historia]  DEFAULT ('') FOR [Historia]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_TAtencion]  DEFAULT ((0)) FOR [TAtencion]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_SMaterna]  DEFAULT ((0)) FOR [SMaterna]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_MAtencion]  DEFAULT ((0)) FOR [MAtencion]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_NAutorizacion]  DEFAULT ('') FOR [NAutorizacion]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Monto]  DEFAULT ((0)) FOR [Monto]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_IReferencia]  DEFAULT ('') FOR [IReferencia]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_NReferencia]  DEFAULT ('') FOR [NReferencia]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_CPrestacional]  DEFAULT ('') FOR [CPrestacional]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_PAtiende]  DEFAULT ((0)) FOR [PAtiende]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_LAtencion]  DEFAULT ((0)) FOR [LAtencion]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Destino_1]  DEFAULT ((0)) FOR [Destino]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_FIngreso]  DEFAULT ('') FOR [FIngreso]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_FAlta]  DEFAULT ('') FOR [FAlta]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_IDestino]  DEFAULT ('') FOR [IDestino]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_NRefConD_1]  DEFAULT (' ') FOR [NRefConD]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_HVB]  DEFAULT ('') FOR [HVB]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_IEducativa]  DEFAULT ('') FOR [IEducativa]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_NEducativo]  DEFAULT ('') FOR [NEducativo]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_GEducativo]  DEFAULT ('') FOR [GEducativo]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_SEducativo]  DEFAULT ('') FOR [SEducativo]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_TEducativo]  DEFAULT ('') FOR [TEducativo]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_EEspecial]  DEFAULT ('') FOR [EEspecial]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_AnexoIIEE]  DEFAULT ('') FOR [AnexoIIEE]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_FFallecimiento]  DEFAULT ('') FOR [FFallecimiento]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_COFlexible]  DEFAULT ('') FOR [COFlexible]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_IdEtnia]  DEFAULT ('83') FOR [IdEtnia]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_IdIAFAS]  DEFAULT ('4') FOR [IdIAFAS]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_CSIAFA]  DEFAULT ('01') FOR [CSIAFA]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_IdUps_1]  DEFAULT ('(")') FOR [IdUps]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_FCAdministrativo]  DEFAULT ('') FOR [FCAdministrativo]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_UDRAutorizaFUA]  DEFAULT ('') FOR [UDRAutorizaFUA]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_LAutorizaFUA]  DEFAULT ('') FOR [LAutorizaFUA]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_SAutorizaFUA]  DEFAULT ('') FOR [SAutorizaFUA]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_DFUAVinculado]  DEFAULT ('') FOR [DFUAVinculado]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_TDocumentoR]  DEFAULT ('') FOR [TDocumentoR]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_NDocumentoR]  DEFAULT ('') FOR [NDocumentoR]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_TPersonal]  DEFAULT ('') FOR [TPersonal]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Especialidad]  DEFAULT ('') FOR [Especialidad]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Egresado]  DEFAULT ('') FOR [Egresado]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Colegiatura]  DEFAULT ('') FOR [Colegiatura]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_num_colegiatura]  DEFAULT ('') FOR [num_colegiatura]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_RNE]  DEFAULT ('') FOR [RNE]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Periodo]  DEFAULT ('') FOR [Periodo]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Mes]  DEFAULT ('') FOR [Mes]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_TDDigitador]  DEFAULT ((1)) FOR [TDDigitador]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_NDDigitador]  DEFAULT ('00000000') FOR [NDDigitador]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Registro]  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Observacion]  DEFAULT ('') FOR [Observacion]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_Version]  DEFAULT ('3.0') FOR [Version]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_CAuto_SITEDS]  DEFAULT (' ') FOR [CAuto_SITEDS]
GO
ALTER TABLE [dbo].[SIS_Trama] ADD  CONSTRAINT [DF_SIS_Trama_idestadofua]  DEFAULT ((0)) FOR [idestadofua]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ('') FOR [Dni]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [Registro]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Clave]  DEFAULT ((0)) FOR [Clave]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Perfil]  DEFAULT ((0)) FOR [Perfil]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Apellidos]  DEFAULT ('') FOR [ApellidoP]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Nombres]  DEFAULT ('') FOR [Nombres]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_ApellidoM]  DEFAULT ('') FOR [ApellidoM]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_SIS_Perfiles] FOREIGN KEY([Perfil])
REFERENCES [dbo].[SIS_Perfiles] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_SIS_Perfiles]
GO
/****** Object:  StoredProcedure [dbo].[BusquedaxIdAuditoria]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BusquedaxIdAuditoria]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select s.Id, Ingreso, Lote, Fua, Prestacion, Historia, Paciente, NAfiliacion, Fecha,IdEspecialidad, IdUsuario, s.DNI, 
	Auditado, s.Registro,IdUsuario,u.Alias as Usuario from SIS_FUA s
	left join hma.dbo.Usu_Usuarios u on s.IdUsuario=u.ID
	 where s.Id=@id;
END

GO
/****** Object:  StoredProcedure [dbo].[IngresarSistema]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IngresarSistema]
	@usuario varchar(50),
	@pass varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id,CodUsuario,Dni,Clave,Perfil,ApellidoP+' '+ApellidoM+' '+Nombres as Nombres from Usuarios where CodUsuario=@usuario and Estado=0 --and Clave =@pass
END
GO
/****** Object:  StoredProcedure [dbo].[MOR_BusquedaFallecidosTDocNDoc]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MOR_BusquedaFallecidosTDocNDoc]
	@tdoc varchar(50),
	@ndoc varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	if @tdoc=1
		set @tdoc='DNI/LE';
	else if @tdoc=2
		set @tdoc='ACTA DE NACIMIENTO';
	else if @tdoc=3
		set @tdoc='PASAPORTE';
	else if @tdoc=4
		set @tdoc='IGNORADO';

    SELECT [Id], [Tcdef], [CDEF], [Estado], [TSeguro], [FPaterno], [FMaterno], [FNombres], [TDoc], [NDoc], [Sexo], [Etnia], [FEdad], [FTiempo], [FEstadoCivil], [FNInstruccion], [FOcupacion], [CodUbiDomicilio], [UbigeoDomicilio],
	[Direccion], [FContinente], [FPais], [FDepartamento], [FProvincia], [FDistrito], [Fecha], [Anio], [Mes], [Hora], [DebidoCausaA], [CausaACIEX], [TiempoA], [DebidoCausaB], [CausaBCIEX], [TiempoB], [DebidoCausaC], [CausaCCIEX],
	[TiempoC], [DebidoCausaD], [CausaDCIEX], [TiempoD], [DebidoCausaE], [CausaECIEX], [TiempoE], [DebidoCausaF], [CausaFCIEX], [TiempoF], [TipoLugar], [CodLugar], [Continente], [Pais], [Institucion], [DISA], [Departamento], 
	[Provincia], [Distrito], [DesLugar], [DirecLugar], [MuerteViolenta], [Necropsia], [MuerteDurante], [EGestacional], [ControlPrenatal], [THospitalizacion], [LRTLugar], [LRCodLugar], [LRInstitucion], [LRDepartamento], [LRDesLugar],
	[PPaterno], [PMaterno], [PNombres], [PTDoc], [PNDoc], [PDeclara], [PColegiatura], [ORegistro], [OAnio], [OMes], [OPaterno], [OMaterno], [ONombres], [ODNI], [Migracion]
	FROM MOR_Fallecidos
	WHERE TDoc=@tdoc and NDoc=@ndoc
END
GO
/****** Object:  StoredProcedure [dbo].[NEO_BusquedaRangoxFecha]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NEO_BusquedaRangoxFecha]
	-- Add the parameters for the stored procedure here
	@fini date,
	@ffin date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id, CNV, Estado, M_Paterno, M_Materno, M_Nombres, M_Edad, M_FecNac, Gestacion, TDocumento, NDocumento, CodEESSPrenatal, 
	EESSPrenatal, left(convert(varchar(25), Fecha, 120),10) as Fecha, Hora, Sexo, Peso_g, Talla_cm, Apgar, Apgar1, Apgar2, PCefalico, PToraxico, MCongenita, TiempoLigCord, LactanciaPrecoz,
	 Paterno, Materno, Nombres, Profesion, Colegiatura, Registro, O_Paterno, O_Materno, O_Nombres, case Cesarea when 0 then 'NO' when 1 then 'SI' end as Cesarea, Migracion 
	 from NEO_RNacidos 
	 where Fecha between @fini and @ffin
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizaCie10DigitaPorId]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizaCie10DigitaPorId] 
	-- Add the parameters for the stored procedure here
	@Cie10 int,
	@Digitado int,
	@Fua int,
	@Lote int,
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE SIS_Consumo
set
Cie10 = @Cie10 ,
Digita= @Digitado
where Id = @Id
and Fua = @Fua and Lote = @Lote
end

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizaConsumoxId]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_ActualizaConsumoxId] 
	-- Add the parameters for the stored procedure here
	@cantidad int,
	@Id int,
	@idusuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_Consumo set Cantidad=@cantidad,Importe=@cantidad* Precio where Id=@Id

	insert into SIS_HistorialConsumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,  Estado,  Reg_anula, UsuAnula, Sismed,IdUsuario)
		select  Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,  Estado,  Reg_anula, UsuAnula, Sismed,@idusuario as IdUsuario
		from SIS_Consumo where Id=@id 

END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizaOrdenDiagnosticoCodigo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizaOrdenDiagnosticoCodigo]
	-- Add the parameters for the stored procedure here
	@orden int,
	@id int,
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_SeguroDiagnostico set Orden=@orden where id_diagnostico=@id and lote=@lote and fua=@fua
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizaPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizaPrestaciones]
	-- Add the parameters for the stored procedure here
	 @id int,
	@especialidad int,
	@medico int,
	@usuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_Prestaciones set IdEspecialidad=@especialidad, IdProfesional=@medico,RegMod=GETDATE(),IdUsuMod=@usuario where Id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizaPrestaciones1]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--SIS_ActualizaPrestaciones1 751, '132', '','2020-04-30','2020-04-30','6','0','0','1','1900-01-01','','','1','',0,'62242678'
--select * from SIS_Prestaciones where id = 751
CREATE PROCEDURE [dbo].[SIS_ActualizaPrestaciones1]
	-- Add the parameters for the stored procedure here
	@id int,
	@especialidad int,
	@medico int,
	@fechahma date,
	@fechasis date,
	@prestacion int,
	@auditado bit,
	@cama varchar(50),
	@tipoalta int,
	@fechalta date,
	@establecimiento int,
	@condicion int,
	@idusumod int,
	@aval int,
	@valor int,
	@codigo2 varchar(50)

AS

declare @aval2 int=0

if @valor = 0
begin
  
	update SIS_Prestaciones set IdEspecialidad=@especialidad, FechaHMA=@fechahma,Fecha=@fechasis,
	Prestacion=@prestacion,Auditado=@auditado,Cama=@cama, TAlta=@tipoalta,NContrato=@codigo2,IdUsuMod=@idusumod,RegMod=GETDATE()
	where Id=@id;
	select Aval as AvalTotal from SIS_Prestaciones WHERE Id=@id;
end 
else
if @valor > 0
begin
	
	declare @aval3 int=0
	select  @aval2=max(Aval)+1 
	from SIS_Prestaciones where IdProcedencia=3;
	if @aval>0
	select @aval3=@aval
	else
	if @aval=0
	 select @aval3=@aval2
	update SIS_Prestaciones set IdEspecialidad=@especialidad, FechaHMA=@fechahma,Fecha=@fechasis,
	Prestacion=@prestacion,Auditado=@auditado,Cama=@cama, TAlta=@tipoalta,NContrato=@codigo2,
	FechaAlta=@fechalta,Establecimiento=@establecimiento,IdProfesional=@medico,
	Condicion=@condicion,IdUsuMod=@idusumod,IdusuAlta=@idusumod,Aval=@aval3,Alta=1,RegistroFAlta=GETDATE()
	where Id=@id

	select Aval as AvalTotal from SIS_Prestaciones WHERE Id=@id
end




GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarAltaSisPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizarAltaSisPrestaciones]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@idusuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @aval2 int=0
	select  @aval2=max(Aval)+1 from SIS_Prestaciones where IdProcedencia=2;
    -- Insert statements for procedure here
	update SIS_Prestaciones set Alta=1,FechaAlta=GETDATE(),RegistroFAlta=GETDATE(),IdusuAlta=@idusuario,Aval=@aval2 where Lote=@lote and Fua=@fua and IdProcedencia=2
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarAtendidoTomografia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizarAtendidoTomografia]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@idticket int,
	@usuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_TOMOGRAFIA set Atendido=1,IdUsuAtendido=@usuario, RegAtendido=GETDATE() where Lote=@lote and Fua=@fua and IdTomografia=@idticket
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarCie10DigitaPorCodigo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SIS_ActualizarCie10DigitaPorCodigo]
@Cie10 int,
@Digitado int,
@Fua int,
@Lote int,
@Codigo varchar(50)
as
UPDATE SIS_Consumo
set
Cie10 = @Cie10 ,
Digita= @Digitado
where Codigo = @Codigo
and Fua = @Fua and Lote = @Lote
GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarConsolidadoxCodigo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizarConsolidadoxCodigo]
	-- Add the parameters for the stored procedure here
	@Cie10 int,
@Digitado int,
@Fua int,
@Lote int,
@Codigo varchar(50),
@cantidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE SIS_Consumo
set
Cie10 = @Cie10 ,
Digita= @Digitado,
Cantidad=@cantidad
where Codigo = @Codigo
and Fua = @Fua and Lote = @Lote
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarConsumoDetalladoFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizarConsumoDetalladoFua]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@newlote int,
	@newfua int,
	@idconsumo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_Consumo set Lote=@newlote, Fua=@newfua where Lote=@lote and Fua=@fua and Id=@idconsumo
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarConsumoporFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_ActualizarConsumoporFua] 
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@nlote int,
	@nfua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_Consumo set Lote=@nlote , Fua=@nfua where Lote=@lote and Fua=@fua
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarDarAltaxIdPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizarDarAltaxIdPrestaciones]
	-- Add the parameters for the stored procedure here
	@id int,
	@usuario int,
	@idprocedencia int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @aval2 int=0
	select  @aval2=max(Aval)+1 from SIS_Prestaciones where IdProcedencia= @idprocedencia;
	update SIS_Prestaciones set Alta=1, IdusuAlta=@usuario,Aval=@aval2,FechaAlta=GETDATE(),RegistroFAlta=GETDATE() 
	where Id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarDatosPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizarDatosPrestaciones]
	-- Add the parameters for the stored procedure here
	@id int,
	@prestacion int,
	@idusuarioactualizado int,
	@fechaactualizado date,
	@idespecialidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_Prestaciones set Prestacion=@prestacion,IdUsuMod=@idusuarioactualizado,
	RegMod=GETDATE(),IdEspecialidad=@idespecialidad where Id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarDiagnosticoFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_ActualizarDiagnosticoFua]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@newlote int,
	@newfua int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_SeguroDiagnostico set Lote=@newlote, Fua=@newfua where Lote=@lote and Fua=@fua
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizaResultadoLab]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_ActualizaResultadoLab]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@codigo int,
	@cantidad float,
	@idusu int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select @codigo = '85027' where @codigo = '85031'
    -- Insert statements for procedure here
	UPDATE SIS_ResultadoLab set cantidad=@cantidad,Idusuario=@idusu where Lote=@lote and Fua=@fua and Cod_Lab=@codigo
end

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarFuaLoteTrama]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_ActualizarFuaLoteTrama] 
	-- Add the parameters for the stored procedure here
	@lote varchar(2),
	@fua varchar(8),
	@observacion varchar(250),
	@prestacion varchar(3),
	@especialidad int,
	@fecha date,
	@falta date,
	@tdoc int,
	@dni varchar(10),
	@apate varchar(40),
	@amate varchar(40),
	@nombre varchar(35),
	@onombre varchar(35),
	@rdisa char(3),
	@rlote char(2),
	@rnumero char(10),
	@idconve int,
	@compo int,
	@dformato int,
	@ninscri int,
	@ctabla varchar(1),
	@cidenti int,
	@cplan int,
	@cpobla int,
	@fnaci date,
	@idsexo int,
	@ubigeo int,
	@historia varchar(20),
	@tatencion int,
	@smaterna int,
	@matencion int,
	@nauto varchar(15),
	@monto int,
	@fatencion date,
	@irefe varchar(8),
	@nrefe varchar(20),
	@patiende int,
	@latencion int,
	@destino int,
	@idestino varchar(20),
	@nrefcon varchar(50),
	@fpparto date,
	@hvb int,
	@ieducativa int,
	@neducativo int,
	@geducativo varchar(30),
	@seducativo int,
	@teducativo int,
	@eespecial int,
	@anexoiiee date,
	@fallecimiento varchar(8),
	@coflexible varchar(10),
	@idetnia varchar(2),
	@idiafas varchar(20),
	@csiafa varchar(6),
	@idups varchar(10),
	@fcadmin varchar(3),
	@udraufua varchar(2),
	@laufua varchar(6),
	@saufua varchar(3),
	@dfuavinculado varchar(3),
	@tdocr varchar(10),
	@ndocr int,
	@tpersonal varchar(9),
	@egresado int,
	@colegiatura int,
	@num_cole int,
	@rne int,
	@periodo int,
	@mes int,
	@idusuario int,
	@codestable varchar(20),
	@establecimiento varchar(200),
	@num_oper char(10),
	@dlote varchar(50) ='',
	@dnumero int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_Trama set Observacion=@observacion,CPrestacional=@prestacion, Especialidad=@especialidad,FIngreso=@fecha,FAlta=@falta,TDocumento=@tdoc,
	NDocumento=@dni,APaterno=@apate,AMaterno=@amate,PNombre=@nombre,ONombres=@onombre,RDisa=@rdisa,RLote=@rlote,RNumero=@rnumero,IdConvenio=@idconve,Componente=@compo,
	DFormato=@dformato,NInscripcion=@ninscri,CTabla=@ctabla,CIdentificador=@cidenti,CPlan=@cplan,CPoblacional=@cpobla,FNacimiento=@fnaci,IdSexo=@idsexo,Ubigeo=@ubigeo,
	Historia=@historia,TAtencion=@tatencion,SMaterna=@smaterna,MAtencion=@matencion,NAutorizacion=@nauto,Monto=@monto,IReferencia=@irefe,NReferencia=@nrefe,
	PAtiende=@patiende,LAtencion=@latencion,Destino=@destino,IDestino=@idestino,NRefConD=@nrefcon,FPParto=@fpparto,HVB=@hvb,IEducativa=@ieducativa,NEducativo=@neducativo,
	GEducativo=@geducativo,SEducativo=@seducativo,TEducativo=@teducativo,EEspecial=@eespecial,AnexoIIEE=@anexoiiee,FFallecimiento=@fallecimiento,COFlexible=@coflexible,
	IdEtnia=@idetnia,IdIAFAS=@idiafas,CSIAFA=@csiafa,IdUps=@idups,FCAdministrativo=@fcadmin,UDRAutorizaFUA=@udraufua,LAutorizaFUA=@laufua,SAutorizaFUA=@saufua,
	DFUAVinculado=@dfuavinculado,TDocumentoR=@tdocr,NDocumentoR=@ndocr,TPersonal=@tpersonal,Egresado=@egresado,Colegiatura=@colegiatura,num_colegiatura=@num_cole,
	RNE=@rne,Periodo=@periodo,Mes=@mes,codestablecimiento=@codestable,establecimiento=@establecimiento,sv_num_oper=@num_oper,DLote=@dlote,DNumero=@dnumero
	 where Lote=@lote and Numero=@fua ;


	 
	 update db_sighoshsb.dbo.SV_SIS_FILIACION set sv_Cod_Prestacion=@prestacion where sv_Num_FUA_Lote=@lote and sv_Num_Fua_Corr=@fua

	 insert into SIS_HistorialPrestaciones ( CodPrestacion, IdUsuario,lote,fua) values(@prestacion,@idusuario,@lote,@fua);
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarFuaLoteTrama1]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_ActualizarFuaLoteTrama1]
	-- Add the parameters for the stored procedure here
	@lote varchar(2),
	@fua varchar(8),
	@observacion varchar(250),
	@prestacion varchar(3),
	@idusuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_Trama set Observacion=@observacion,CPrestacional=@prestacion where Lote=@lote and Numero=@fua 
	update db_sighoshsb.dbo.SV_SIS_FILIACION set sv_Cod_Prestacion=@prestacion where sv_Num_FUA_Lote=@lote and sv_Num_Fua_Corr=@fua

	
	 insert into SIS_HistorialPrestaciones ( CodPrestacion, IdUsuario,lote,fua) values(@prestacion,@idusuario,@lote,@fua);

END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarFuaLoteTrama2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizarFuaLoteTrama2] 
	-- Add the parameters for the stored procedure here
	@lote varchar(2),
	@fua varchar(8),
	@observacion varchar(250),
	@prestacion varchar(3),
	@especialidad int,
	@fecha date,
	@falta date,
	@tdoc int,
	@dni varchar(10),
	@apate varchar(40),
	@amate varchar(40),
	@nombre varchar(35),
	@onombre varchar(35),
	@rdisa char(3),
	@rlote char(2),
	@rnumero char(10),
	@idconve int,
	@compo int,
	@dformato int,
	@ninscri int,
	@ctabla varchar(1),
	@cidenti int,
	@cplan int,
	@cpobla int,
	@fnaci date,
	@idsexo int,
	@ubigeo int,
	@historia varchar(20),
	@tatencion int,
	@smaterna int,
	@matencion int,
	@nauto varchar(15),
	@monto int,
	@fatencion date,
	@irefe varchar(8),
	@nrefe varchar(20),
	@patiende int,
	@latencion int,
	@destino int,
	@idestino varchar(20),
	@nrefcon varchar(50),
	@fpparto date,
	@hvb int,
	@ieducativa int,
	@neducativo int,
	@geducativo varchar(30),
	@seducativo int,
	@teducativo int,
	@eespecial int,
	@anexoiiee date,
	@fallecimiento varchar(8),
	@coflexible varchar(10),
	@idetnia varchar(2),
	@idiafas varchar(20),
	@csiafa varchar(6),
	@idups varchar(10),
	@fcadmin varchar(3),
	@udraufua varchar(2),
	@laufua varchar(6),
	@saufua varchar(3),
	@dfuavinculado varchar(3),
	@tdocr varchar(10),
	@ndocr int,
	@tpersonal varchar(9),
	@egresado int,
	@colegiatura int,
	@num_cole int,
	@rne int,
	@periodo int,
	@mes int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_Trama1 set Observacion=@observacion,CPrestacional=@prestacion, Especialidad=@especialidad,FIngreso=@fecha,FAlta=@falta,TDocumento=@tdoc,
	NDocumento=@dni,APaterno=@apate,AMaterno=@amate,PNombre=@nombre,ONombres=@onombre,RDisa=@rdisa,RLote=@rlote,RNumero=@rnumero,IdConvenio=@idconve,Componente=@compo,
	DFormato=@dformato,NInscripcion=@ninscri,CTabla=@ctabla,CIdentificador=@cidenti,CPlan=@cplan,CPoblacional=@cpobla,FNacimiento=@fnaci,IdSexo=@idsexo,Ubigeo=@ubigeo,
	Historia=@historia,TAtencion=@tatencion,SMaterna=@smaterna,MAtencion=@matencion,NAutorizacion=@nauto,Monto=@monto,IReferencia=@irefe,NReferencia=@nrefe,
	PAtiende=@patiende,LAtencion=@latencion,Destino=@destino,IDestino=@idestino,NRefConD=@nrefcon,FPParto=@fpparto,HVB=@hvb,IEducativa=@ieducativa,NEducativo=@neducativo,
	GEducativo=@geducativo,SEducativo=@seducativo,TEducativo=@teducativo,EEspecial=@eespecial,AnexoIIEE=@anexoiiee,FFallecimiento=@fallecimiento,COFlexible=@coflexible,
	IdEtnia=@idetnia,IdIAFAS=@idiafas,CSIAFA=@csiafa,IdUps=@idups,FCAdministrativo=@fcadmin,UDRAutorizaFUA=@udraufua,LAutorizaFUA=@laufua,SAutorizaFUA=@saufua,
	DFUAVinculado=@dfuavinculado,TDocumentoR=@tdocr,NDocumentoR=@ndocr,TPersonal=@tpersonal,Egresado=@egresado,Colegiatura=@colegiatura,num_colegiatura=@num_cole,
	RNE=@rne,Periodo=@periodo,Mes=@mes
	 where Lote=@lote and Numero=@fua 
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarHospitalizacion]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizarHospitalizacion]
	@Id int,
	@FechaHMA date,
	@FechaSIS date,
	@IdProcedencia int,
	@Prestacion int,
	@Auditado int,
	@Cama varchar(50),
	@FAlta date,
	@TAlta int,
	@Aval int,
	@Condicion int,
	@IdUsuAlta int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update SIS_Hospitalizacion 
	set 
	FechaHMA = @FechaHMA,
	FechaSIS = @FechaSIS,
	IdProcedencia = @IdProcedencia,
	Prestacion = @Prestacion,
	Auditado = @Auditado,
	Cama = @Cama,
	FAlta = @FAlta,
	TAlta = @TAlta,
	Aval = @Aval,
	Condicion = @Condicion,
	IdUsuAlta = @IdUsuAlta
	where 
	IdPrestaciones = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarPacientesRestringidos]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizarPacientesRestringidos]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	CREATE TABLE #TablaTemporal (Fecha_atencion date, Id int)
	insert into #TablaTemporal (Fecha_atencion,Id)
	select Fecha_atencion,Id from sis_PacientesRestringidos where Estado=0 and DATEDIFF(month,Fecha_atencion, getdate())>5;
	--select * from #TablaTemporal
	update   s
	set s.Estado=1
	from sis_pacientesRestringidos s
	inner join #TablaTemporal t
	on s.Id=t.Id;
END
DROP TABLE #TablaTemporal

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarPrestacionSISFUA]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizarPrestacionSISFUA] 
	-- Add the parameters for the stored procedure here
	@id int,
	@prestacion char(3),
	@idusuarioactualizado int,
	@fechaactualizado date,
	@idespecialidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_FUA set Prestacion=@prestacion,IdUsuarioActualizado=@idusuarioactualizado,FechaRegistroActualizado=GETDATE(),IdEspecialidad=@idespecialidad where Id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarValidacionImpresionFUA]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizarValidacionImpresionFUA]
	-- Add the parameters for the stored procedure here
	@idauditoria int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE SIS_FUA set Impreso=1, FechaImpresion=GETDATE() where Fua=@idauditoria and Lote=20
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ActualizarValidacionImpresionFuaPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ActualizarValidacionImpresionFuaPrestaciones]
	-- Add the parameters for the stored procedure here
	@idauditoria int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE SIS_Prestaciones set Impreso=1, FechaImpresion=GETDATE() where Fua=@idauditoria and Lote=20
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AgregarPerfilesConsumo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Leshly Pastor Herrera
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec [dbo].[SIS_AgregarPerfilesConsumo] 15,22,65950,1
CREATE PROCEDURE [dbo].[SIS_AgregarPerfilesConsumo]
	@id_perfil int,
	@lote int ,
	@fua int,
	@idusuario int
AS
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @CODIGO varchar(10) =''
	DECLARE @NUMFACTURA varchar(10)=''
	DECLARE @TIPOFACTURA VARCHAR(1)=''

   select @CODIGO=CODIGO from SIS_PAQUETEPERFILES where Id=@id_perfil;

   select top 1 @NUMFACTURA=NumFactura,@TIPOFACTURA=TipFactura from SIS_Consumo where Lote=@lote and Fua=@fua and Codigo=@CODIGO

   --------ACTUALIZAR EL PERFIL COMO NO DIGITADO EN EL SIS CONSUMO-------------------------------
   update SIS_Consumo set Digita=1 where Lote=@lote and Fua=@fua and Codigo=@CODIGO;
   ----------------------------------------------------------------------------------------------

   --------------------------------------------------INSERTAR EL DETALLE DEL PERFIL AL SIS_CONSUMO DEL LOTE Y FUA QUE CORRESPONDE----------------------------------------------------------------------------
   insert into SIS_Consumo(Fecha,Codigo,Item,Unidad,Cantidad,Precio,Importe,Cie10,Lote,Fua,Caja,IdUsuario,Sismed,NumFactura,TipFactura,IdPaquetePerfil,Digita,CPT)
	    SELECT GETDATE() as Fecha, Codigo,gt.gm_Des_Breve as Item, t.descor as Unidad, Cantidad,tp.gm_Imp_Tarifa as Precio, Cantidad*tp.gm_Imp_Tarifa as Importe, 1 as Cie10,@lote as Lote,@fua as Fua,spd.Caja,@idusuario as IdUsuario, 
	   Codigo_Sismed as Sismed,@NUMFACTURA as NumFactura,@TIPOFACTURA as TipFactura,@id_perfil as IdPaquetePerfil,0 as Digita,ma.codcpt as CPT
	   FROM SIS_PAQUETESPERFILES_DETALLE SPD
	   inner join db_sighoshsb.dbo.GM_TARIFA gt on gt.gm_Cod_Tarifa collate modern_spanish_ci_as =spd.Codigo
	   INNER JOIN db_sighoshsb.dbo.MAcatalogoHomologacion ma on ma.Id=gt.gm_idcatalogo
	   inner join db_sighoshsb.dbo.GT_UMEDIDA_TAR t on t.codtab=gt.gm_Cod_UndM  AND t.tiptab='U'
	   left join db_sighoshsb.dbo.GM_TARIFA_TPAC tp on tp.gm_Cod_Tarifa=gt.gm_Cod_Tarifa and tp.gm_Tip_Paciente=6 AND tp.gm_Tip_tarifa=2
	   WHERE IdPaquete=@id_perfil AND gt.gm_Tip_tarifa=2 and SPD.Estado=0
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	insert into AUDITORIA.dbo.SIS_HistorialConsumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,  Estado, Sismed,IdUsuario,IdPaquetePerfil)
		SELECT GETDATE() as Fecha, Codigo,gt.gm_Des_Breve as Item, t.descor as Unidad, Cantidad,tp.gm_Imp_Tarifa as Precio, Cantidad*tp.gm_Imp_Tarifa as Importe, 1 as Cie10,0 as Digita,@lote as Lote,@fua as Fua,
		spd.Caja,0 as Estado, Codigo_Sismed as Sismed,@idusuario as IdUsuario,@id_perfil as IdPaquetePerfil
	   FROM SIS_PAQUETESPERFILES_DETALLE SPD
	   inner join db_sighoshsb.dbo.GM_TARIFA gt on gt.gm_Cod_Tarifa collate modern_spanish_ci_as =spd.Codigo
	   inner join db_sighoshsb.dbo.GT_UMEDIDA_TAR t on t.codtab=gt.gm_Cod_UndM  AND t.tiptab='U'
	   left join db_sighoshsb.dbo.GM_TARIFA_TPAC tp on tp.gm_Cod_Tarifa=gt.gm_Cod_Tarifa and tp.gm_Tip_Paciente=6
	   WHERE IdPaquete=@id_perfil AND gt.gm_Tip_tarifa=2 and SPD.Estado=0


END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AnulacionesFuaPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_AnulacionesFuaPrestaciones]
	-- Add the parameters for the stored procedure here
		@idprestaciones int,
		@lote int,
		@fua int,
		@idusuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_AnulacionesFua(IdPrestaciones,Lote,Fua,IdUsuario) values(@idprestaciones,@lote,@fua,@idusuario)
	update SIS_Prestaciones set Estado=1, Fua=0,RegAnula=GETDATE(),IdUsuAnula=@idusuario,Alta=1 where Id= @idprestaciones
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AnularFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_AnularFua]
	@lote int,
	@fua int,
	@idusuario int,
	@ingreso int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  if not exists(select Fua,Lote from SIS_FUAAUDITADOS where Fua=@fua and Lote=@lote)
  begin
  INSERT INTO SIS_FUAAUDITADOS([Lote], [Fua], [Auditado], [UsuAudita], [Estado], [Ingreso], [Anulado], [RegAnulado], [UsuAnulado])  VALUES(@lote,@fua,0,0,0,@ingreso,1,GETDATE(),@idusuario);
  end
  else
  begin
	update SIS_FUAAUDITADOS set Anulado=1, RegAnulado=getdate(),UsuAnulado=@idusuario where lote=@lote and Fua=@fua
  end
  update db_sighoshsb.dbo.SV_SIS_FILIACION set sg_Est_Registro='*' where sv_Num_FUA_Lote=@lote and sv_Num_Fua_Corr=@fua
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_AnularSISFUA]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_AnularSISFUA] 
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@usuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_FUA set Anulado=1, IdUsuAnula=@usuario,RAnula=GETDATE() where Lote=@lote and Fua=@fua;
	update SIS_Prestaciones set estado=1,IdUsuAnula=@usuario,RegAnula=GETDATE(),Alta=1 where Lote=@lote and Fua=@fua;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AnularTicketConsumo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_AnularTicketConsumo]
	-- Add the parameters for the stored procedure here
	@id int,
	@idusuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_ConsumoTicket set Anulado=1,UsuAnula=@idusuario,RegAnu=GETDATE() where Id=@id
	update SIS_TOMOGRAFIA set Anulado=1,UsuAnula=@idusuario,RegAnu=GETDATE() where IdTomografia=@id
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaBSangreConsolidado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaBSangreConsolidado] 
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
 SET NOCOUNT ON;
	
	select  ltrim(rtrim(Codigo)) as Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe,  Cie10,  Digita,  Lote, Fua, Caja, 1 as principal,Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=5 and d.Estado=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item
end
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaBSangreConsolidado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaBSangreConsolidado2] 
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN

 SET NOCOUNT ON;

	select  ltrim(rtrim(Codigo)) as Codigo ,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe,Cie10,  Digita,  Lote, Fua, Caja, 1 as principal,Sismed as sismed

	from AUDITORIA.dbo.SIS_Consumo  d

	where  Fua=@fua and Lote=@lote and Caja=5 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,  Digita,Sismed
	ORDER BY Item
end
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaBSangreDetallado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaBSangreDetallado]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

   select  Id,Fecha,Codigo,  Item,  Unidad, Cantidad as Cantidad, Precio , Importe, Cie10, Digita, Lote, Fua, 1 as codCaja, Caja, 1 as principal,Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=5 and d.Estado=0
	order  by Fecha 
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaBSangreDetallado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaBSangreDetallado2] 
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN

 SET NOCOUNT ON;
	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe,Cie10,  Digita,  Lote, Fua, Caja, 1 as principal,Sismed as sismed, TipFactura as TFac,NumFactura as NumFac
	from SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=5 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,  Digita,Sismed,TipFactura,NumFactura
	ORDER BY Item asc
	

end
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaConsolidado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaConsolidado] 
@lote char(2),
	@fua int,
	@proc int
AS
BEGIN

 SET NOCOUNT ON;

   select  Id,Fecha,Codigo,  Item,  Unidad, Cantidad as Cantidad, Precio , Importe, Cie10, Digita, Lote, Fua, 1 as codCaja, Caja, 1 as principal,0 as codArea,'0000' as subClase,'' as TFac, '0000000000' as NumFac
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and d.Estado=0
	order  by Fecha 

END
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaEcoGinecoConsolidado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaEcoGinecoConsolidado]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

	

	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe, Cie10, Digita,  Lote, Fua, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=7 and d.Estado=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item
	
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaEcoGinecoConsolidado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaEcoGinecoConsolidado2]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe, Cie10, Digita,  Lote, Fua, Caja, 1 as principal,Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=7 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item
	
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaEcoGinecoDetallado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaEcoGinecoDetallado]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;
	
   select  Id,Fecha,Codigo,  Item,  Unidad, Cantidad as Cantidad, Precio , Importe, Cie10, Digita, Lote, Fua, 1 as codCaja, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=7 and d.Estado=0
	order  by Fecha 
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaEcoGinecoDetallado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaEcoGinecoDetallado2]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe, Cie10, Digita,  Lote, Fua, Caja, 1 as principal,Sismed as sismed, TipFactura as TFac,NumFactura as NumFac
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=7 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed,TipFactura,NumFactura
	ORDER BY Item asc
	
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaFarmaciaConsolidado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaFarmaciaConsolidado]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@proc int
AS
BEGIN

	SET NOCOUNT ON;
	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad,0 as PAQ,0 as Resta
	, min(Precio) as Precio, sum(Importe) as Importe, Cie10 , Digita,  Lote, Fua, 
	1 as codCaja, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=1 and d.Estado=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Digita,Cie10,Sismed
	order by Item asc

END
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaFarmaciaConsolidado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaFarmaciaConsolidado2]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@proc int
AS
BEGIN

	SET NOCOUNT ON;


	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad,0 as PAQ,0 as Resta
	, min(Precio) as Precio, sum(Importe) as Importe, Cie10 , Digita,  Lote, Fua, 
	1 as codCaja, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=1 and d.Estado=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Digita,Cie10,Sismed
	order by Item asc
	
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaFarmaciaDetallado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaFarmaciaDetallado]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	select  Id,Fecha,Codigo,  Item,  Unidad, Cantidad as Cantidad, Precio , Importe, Cie10, Digita, Lote, Fua, 1 as codCaja, Caja, 1 as principal,Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=1 and d.Estado=0
	order  by Fecha 

END
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaFarmaciaDetallado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaFarmaciaDetallado2]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@proc int
	
AS
BEGIN

	SET NOCOUNT ON;

	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad,0 as PAQ,0 as Resta
	, min(Precio) as Precio, sum(Importe) as Importe, Cie10 , Digita,  Lote, Fua, 
	1 as codCaja, Caja, 1 as principal, Sismed as sismed,  TipFactura as TFac,NumFactura as NumFac
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=1 and d.Estado=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Digita,Cie10,Sismed,TipFactura,NumFactura
	order by Item asc
	
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaLaboratorioConsolidado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaLaboratorioConsolidado]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

	
	select  ltrim(rtrim(Codigo)) as Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe, Cie10 , Digita ,  Lote, Fua, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=2 and d.Estado=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item
	
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaLaboratorioConsolidado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaLaboratorioConsolidado2]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe, Cie10 , Digita ,  Lote, Fua, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=2 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item
	
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaLaboratorioDetallado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaLaboratorioDetallado]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;
	
   select  Id,Fecha,Codigo,  Item,  Unidad, Cantidad as Cantidad, Precio , Importe, Cie10, Digita, Lote, Fua, 1 as codCaja, Caja, 1 as principal,Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=2 and d.Estado=0 
	order  by Fecha 
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaLaboratorioDetallado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaLaboratorioDetallado2]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe, Cie10 , Digita ,  Lote, Fua, Caja, 1 as principal, Sismed as sismed, TipFactura as TFac,NumFactura as NumFac
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=2 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed,TipFactura,NumFactura
	ORDER BY Item asc
	
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaPatologiaConsolidado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaPatologiaConsolidado]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

	
	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe,  Cie10,  Digita,  Lote, Fua, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=6 and d.Estado=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item

END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaPatologiaConsolidado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaPatologiaConsolidado2]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe,  Cie10,  Digita,  Lote, Fua, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=6 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item

END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaPatologiaDetallado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaPatologiaDetallado]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

   SET NOCOUNT ON;
	
	
	select Id,Fecha,Codigo,  Item,  Unidad, Cantidad as Cantidad, Precio , Importe, Cie10, Digita, Lote, Fua, 1 as codCaja, Caja, 1 as principal,Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=6 and d.Estado=0
	ORDER BY Fecha DESC;
end

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaPatologiaDetallado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaPatologiaDetallado2]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe,  Cie10,  Digita,  Lote, Fua, Caja, 1 as principal, Sismed as sismed, TipFactura as TFac,NumFactura as NumFac
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=6 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed,TipFactura,NumFactura
	ORDER BY Item asc

END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaProcedimientoConsolidado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaProcedimientoConsolidado]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;


	select  Codigo,  upper(Item) as Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe,  Cie10,  Digita,  Lote, Fua, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=3 and d.Estado=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item
	
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaProcedimientoConsolidado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaProcedimientoConsolidado2]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

	
	select  Codigo,  upper(Item) as Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe,  Cie10,  Digita,  Lote, Fua, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=3 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item	
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaProcedimientoDetallado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaProcedimientoDetallado]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@proc int
AS
BEGIN
	
   SET NOCOUNT ON;
	
	select Id,Fecha,Codigo,  Item,  Unidad, Cantidad as Cantidad, Precio , Importe, Cie10, Digita, Lote, Fua, 1 as codCaja, Caja, 1 as principal,Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=3 and d.Estado=0
	ORDER BY Fecha DESC;
	
end

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaProcedimientoDetallado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaProcedimientoDetallado2]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;

	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, max(Precio) as Precio, sum(Importe) as Importe,  Cie10,  Digita,  Lote, Fua, Caja, 1 as principal, Sismed as sismed,  TipFactura as TFac,NumFactura as NumFac
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=3 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed,TipFactura,NumFactura
	ORDER BY Item asc

END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaRadioEcografiaConsolidado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaRadioEcografiaConsolidado] 
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN

 SET NOCOUNT ON;
	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe,  Cie10, Digita,  Lote, Fua, Caja, 1 as principal,Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=8 and d.Estado=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item
	

end
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaRadioEcografiaConsolidado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaRadioEcografiaConsolidado2] 
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN

 SET NOCOUNT ON;
	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe,  Cie10, Digita,  Lote, Fua, Caja, 1 as principal,Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=8 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item
	

end
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaRadioEcografiaDetallado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaRadioEcografiaDetallado]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@proc int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	
   select  Id,Fecha,Codigo,  Item,  Unidad, Cantidad as Cantidad, Precio , Importe, Cie10, Digita, Lote, Fua, 1 as codCaja, Caja, 1 as principal,Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=8 and d.Estado=0
	order  by Fecha 
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaRadioEcografiaDetallado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaRadioEcografiaDetallado2] 
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN

 SET NOCOUNT ON;
	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe,  Cie10, Digita,  Lote, Fua, Caja, 1 as principal,Sismed as sismed, TipFactura as TFac,NumFactura as NumFac
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=8 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed,TipFactura,NumFactura
	ORDER BY Item asc

end
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaRadiologiaConsolidado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaRadiologiaConsolidado] 
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN

 SET NOCOUNT ON;
	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, max(Precio) as Precio, sum(Importe) as Importe,  Cie10, Digita,  Lote, Fua, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=4 and d.Estado=0 
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item
	

end
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaRadiologiaConsolidado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaRadiologiaConsolidado2] 
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN

 SET NOCOUNT ON;
	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, max(Precio) as Precio, sum(Importe) as Importe,  Cie10, Digita,  Lote, Fua, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=4 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item
	

end
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaRadiologiaDetallado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaRadiologiaDetallado]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@proc int
AS
BEGIN
	
	
   select  Id,Fecha,Codigo,  Item,  Unidad, Cantidad as Cantidad, Precio , Importe, Cie10, Digita, Lote, Fua, 1 as codCaja, Caja, 1 as principal,Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=4 and d.Estado=0
	order  by Fecha 
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaRadiologiaDetallado2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaRadiologiaDetallado2] 
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN

 SET NOCOUNT ON;
	
	select  Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, max(Precio) as Precio, sum(Importe) as Importe,  Cie10, Digita,  Lote, Fua, Caja, 1 as principal, Sismed as sismed,  TipFactura as TFac,NumFactura as NumFac
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja=4 and d.Estado=0 AND D.Digita=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed,TipFactura,NumFactura
	ORDER BY Item asc
	
end
GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaServicioDetallado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_AuditoriaServicioDetallado]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int
AS
BEGIN
	
	SET NOCOUNT ON;
	
   select  Id,Fecha,Codigo,  Item,  Unidad, Cantidad as Cantidad, Precio , Importe, Cie10, Digita, Lote, Fua, 1 as codCaja, Caja, 1 as principal,Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and d.Estado=0 and Caja>=2
	order  by Fecha 
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_AuditoriaServiciosConsolidado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_AuditoriaServiciosConsolidado]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select  ltrim(rtrim(Codigo)) as Codigo,  Item,  Unidad, sum(Cantidad) as Cantidad, min(Precio) as Precio, sum(Importe) as Importe, Cie10 , Digita ,  Lote, Fua, Caja, 1 as principal, Sismed as sismed
	from AUDITORIA.dbo.SIS_Consumo  d
	where  Fua=@fua and Lote=@lote and Caja>=2 and d.Estado=0
	group by Codigo, Item, Unidad,Lote, Fua,Caja,Cie10,Digita,Sismed
	ORDER BY Item
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_BorrarProcedimientoAnaPatologia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_BorrarProcedimientoAnaPatologia]
	-- Add the parameters for the stored procedure here
	@id int,
	@lote int,
	@fua int,
	@usuanula int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  SIS_Consumo set Estado=1, Reg_anula=getdate(), UsuAnula=@usuanula where Id= @id and Lote=@lote and Fua= @fua and Caja=6;
	insert into SIS_HistorialConsumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,  Estado,  Reg_anula, UsuAnula, Sismed,Idusuario)
		select  Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja, 1 as Estado, getdate() as  Reg_anula, UsuAnula, Sismed,IdUsuario
		from SIS_Consumo where Id=@id and Lote=@lote and Fua= @fua and Caja=6
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BorrarProcedimientoBSangre]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_BorrarProcedimientoBSangre]
	-- Add the parameters for the stored procedure here
	@id int,
	@lote int,
	@fua int,
	@usuanula int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  SIS_Consumo set Estado=1, Reg_anula=getdate(), UsuAnula=@usuanula where Id= @id and Lote=@lote and Fua= @fua and Caja=5;
	insert into SIS_HistorialConsumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,  Estado,  Reg_anula, UsuAnula, Sismed,IdUsuario)
		select  Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja, 1 as Estado, getdate() as  Reg_anula, UsuAnula, Sismed,IdUsuario
		from SIS_Consumo where Id=@id and Lote=@lote and Fua= @fua and Caja=5
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BorrarProcedimientoConsolidado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_BorrarProcedimientoConsolidado]
	-- Add the parameters for the stored procedure here
	@id int,
	@lote int,
	@fua int,
	@usuanula int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  SIS_Consumo set Estado=1, Reg_anula=getdate(), UsuAnula=@usuanula where Id= @id and Lote=@lote and Fua= @fua and Caja=3;
	insert into SIS_HistorialConsumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,  Estado,  Reg_anula, UsuAnula, Sismed,IdUsuario)
		select  Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja, 1 as Estado, getdate() as  Reg_anula, UsuAnula, Sismed,IdUsuario
		from SIS_Consumo where Id=@id and Lote=@lote and Fua= @fua and Caja=3
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BorrarProcedimientoEcoGinecologia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_BorrarProcedimientoEcoGinecologia] 
	-- Add the parameters for the stored procedure here
		@id int,
		@lote int,
		@fua int,
		@usuanula int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  SIS_Consumo set Estado=1, Reg_anula=getdate(), UsuAnula=@usuanula where Id= @id and Lote=@lote and Fua= @fua and Caja=7;
	insert into SIS_HistorialConsumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,  Estado,  Reg_anula, UsuAnula, Sismed,IdUsuario)
		select  Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja, 1 as Estado, getdate() as  Reg_anula, UsuAnula, Sismed,IdUsuario
		from SIS_Consumo where Id=@id and Lote=@lote and Fua= @fua and Caja=7
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BorrarProcedimientoFarmacia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [dbo].[SIS_BorrarProcedimientoFarmacia] 113,21,6042702,1
CREATE PROCEDURE [dbo].[SIS_BorrarProcedimientoFarmacia]
	-- Add the parameters for the stored procedure here
	@id int,
	@lote int,
	@fua int,
	@usuanula int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  SIS_Consumo set Estado=1, Reg_anula=getdate(), UsuAnula=@usuanula where Id= @id and Lote=@lote and Fua= @fua and Caja=1;

	insert into SIS_HistorialConsumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,  Estado,  Reg_anula, UsuAnula, Sismed,IdUsuario)
		select  Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja, 1 as Estado, getdate() as  Reg_anula, UsuAnula, Sismed,IdUsuario
		from SIS_Consumo where Id=@id and Lote=@lote and Fua= @fua and Caja=1

END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BorrarProcedimientoLaboratorio]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_BorrarProcedimientoLaboratorio] 
	-- Add the parameters for the stored procedure here
		@id int,
		@lote int,
		@fua int,
		@usuanula int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  SIS_Consumo set Estado=1, Reg_anula=getdate(), UsuAnula=@usuanula where Id= @id and Lote=@lote and Fua= @fua and Caja=2;
	insert into SIS_HistorialConsumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,  Estado,  Reg_anula, UsuAnula, Sismed,IdUsuario)
		select  Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja, 1 as Estado, getdate() as  Reg_anula, UsuAnula, Sismed,IdUsuario
		from SIS_Consumo where Id=@id and Lote=@lote and Fua= @fua and Caja=2
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BorrarProcedimientoRadioEcografia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_BorrarProcedimientoRadioEcografia]
	-- Add the parameters for the stored procedure here
	@id int,
	@lote int,
	@fua int,
	@usuanula int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  SIS_Consumo set Estado=1, Reg_anula=getdate(), UsuAnula=@usuanula where Id= @id and Lote=@lote and Fua= @fua and Caja=8;
	insert into SIS_HistorialConsumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,  Estado,  Reg_anula, UsuAnula, Sismed,IdUsuario)
		select  Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja, 1 as Estado, getdate() as  Reg_anula, UsuAnula, Sismed,IdUsuario
		from SIS_Consumo where Id=@id and Lote=@lote and Fua= @fua and Caja=8
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BorrarProcedimientoRadiologia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_BorrarProcedimientoRadiologia]
	-- Add the parameters for the stored procedure here
	@id int,
	@lote int,
	@fua int,
	@usuanula int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  SIS_Consumo set Estado=1, Reg_anula=getdate(), UsuAnula=@usuanula where Id= @id and Lote=@lote and Fua= @fua and Caja=4;
	insert into SIS_HistorialConsumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,  Estado,  Reg_anula, UsuAnula, Sismed,IdUsuario)
		select  Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja, 1 as Estado, getdate() as  Reg_anula, UsuAnula, Sismed,IdUsuario
		from SIS_Consumo where Id=@id and Lote=@lote and Fua= @fua and Caja=4
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BorrarProcedimientoServicios]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_BorrarProcedimientoServicios] 
	-- Add the parameters for the stored procedure here
		@id int,
		@lote int,
		@fua int,
		@usuanula int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  SIS_Consumo set Estado=1, Reg_anula=getdate(), UsuAnula=@usuanula where Id= @id and Lote=@lote and Fua= @fua;
	insert into SIS_HistorialConsumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,  Estado,  Reg_anula, UsuAnula, Sismed,IdUsuario)
		select  Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja, 1 as Estado, getdate() as  Reg_anula, UsuAnula, Sismed,IdUsuario
		from SIS_Consumo where Id=@id and Lote=@lote and Fua= @fua 
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BuscarConsumoporFuayCaja]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BuscarConsumoporFuayCaja] 
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@caja int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id, Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita,
	 Lote, Fua, Caja, Registro from SIS_Consumo where Lote=@lote and 
	Fua=@fua and Caja=@caja and Digita=0
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BuscarDiagnosticoPorFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BuscarDiagnosticoPorFua]
	@Lote int,
	@Fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_diagnostico, Codigo, Tipo,Orden, Tipo2, lote, fua
	from SIS_SeguroDiagnostico
	where lote = @Lote and fua = @Fua
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BuscarFuaParaBancoDeSangre]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SIS_BuscarFuaParaBancoDeSangre]
@Lote int,
@Fua int
as
select s.Fecha,convert(char(8),s.Registro,108) as Hora,h.Historia,h.NDocumento,h.Paciente,s.idprocedencia as Procedencia,
s.IdEspecialidad,e.Descripcion as Especialidad,3 as Financiador,s.Componente as IdSeguro,
case s.Componente when 1 THEN 'SIS GRATUITO' when 2 THEN 'SIS INDEPENDIENTE' when 3 then 'SIS MICROEMPRESAS' WHEN 4 THEN 'SIS EMPRENDEDOR'ELSE 'SIS GRATUITO' END as TSeguro,
S.idplan,s.du,Lote,FUA
from SIS_Prestaciones s
inner join hma.dbo.ADM_Historia h on h.Historia = s.Historia
inner join hma.dbo.HMA_Especialidad e on e.Id = s.IdEspecialidad
where lote = @Lote and fua = @Fua
ORDER BY S.IdProcedencia DESC
GO
/****** Object:  StoredProcedure [dbo].[SIS_BuscarIpressRestringidaPorNIpress]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SIS_BuscarIpressRestringidaPorNIpress ''
CREATE proc [dbo].[SIS_BuscarIpressRestringidaPorNIpress]
@Ipress int
as
select ipress from [dbo].[SIS_IPressRestringidas]
where ipress = @Ipress and estado = 0
GO
/****** Object:  StoredProcedure [dbo].[SIS_BuscarPrestacionPorFUA]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--SIS_BuscarPrestacionPorFUA 20 ,5254515
CREATE PROCEDURE [dbo].[SIS_BuscarPrestacionPorFUA]
	-- Add the parameters for the stored procedure here
	@Lote int,
	@FUA int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select pres.Id,pres.Fecha, pres.Alta, pres.TDocumento, pres.NDocumento, pres.Historia, pres.Lote, pres.FUA, pres.IdProcedencia,
	pres.Disa, pres.TFormato, pres.NContrato, pres.Turno, pres.Tipo, presi.Codigo as Prestacion,pres.Prestacion as IdPrestacion,
	presi.Descripcion as NPrestacion, pres.Componente,pres.Establecimiento, es.Codigo as EESSUbigeo, es.Establecimiento as DescEESS, pres.Aval,
	pres.IdEspecialidad, e.Descripcion as Especialidad, pres.IdProfesional, prof.DOCUMENTO, prof.COLEGIATURA, prof.NOMBRE as Profesional,pres.idplan,
	pres.du,pres.FechaHMA,pres.FechaAlta,pres.Condicion,pres.Cama,adm.FNacimiento,adm.Paterno,adm.Materno,adm.Nombres,espr.RNE
	from SIS_Prestaciones pres
	left join hma.dbo.CI_Citas c on c.Historia = pres.Historia and c.Cita = pres.Fecha and pres.IdEspecialidad = c.IdEspecialidad
	left join hma.dbo.HMA_Especialidad e on e.Id = c.IdEspecialidad
	left join hma.dbo.HMA_Profesionales prof on prof.COLEGIATURA = c.Colegiatura
	left join hma.dbo.HMA_EspProfesional espr on espr.IdProfesional = prof.Id and espr.IdEspecialidad = pres.IdEspecialidad
	left join HMA_Establecimientos es on es.Id=pres.Establecimiento
	left join hma.dbo.ADM_Historia adm on adm.Historia=pres.Historia
	left join SIS_Prestacion presi on presi.Id=pres.Prestacion
	where pres.Lote = @Lote and pres.FUA = @FUA
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BuscarPrestacionPorFUA2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--SIS_BuscarPrestacionPorFUA 20 ,5254515
CREATE PROCEDURE [dbo].[SIS_BuscarPrestacionPorFUA2]
	-- Add the parameters for the stored procedure here
	@Lote int,
	@FUA int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select pres.Id,pres.Fecha, pres.Alta, pres.TDocumento, pres.NDocumento, pres.Historia, pres.Lote, pres.FUA, pres.IdProcedencia,
	pres.Disa, pres.TFormato, pres.NContrato, pres.Turno, pres.Tipo, presi.Codigo as Prestacion,pres.Prestacion as IdPrestacion,
	presi.Descripcion as NPrestacion, pres.Componente,pres.Establecimiento, es.Codigo as EESSUbigeo, es.Establecimiento as DescEESS, pres.Aval,
	pres.IdEspecialidad, e.Descripcion as Especialidad, pres.IdProfesional, prof.DOCUMENTO, prof.COLEGIATURA, prof.NOMBRE as Profesional,pres.idplan,
	pres.du,pres.FechaHMA,pres.FechaAlta,pres.Condicion,pres.Cama,adm.FNacimiento,adm.Paterno,adm.Materno,adm.Nombres,espr.RNE
	from SIS_Prestaciones pres
	left join hma.dbo.HMA_Especialidad e on e.Id = pres.IdEspecialidad
	left join hma.dbo.HMA_Profesionales prof on prof.Id = pres.IdProfesional
	left join hma.dbo.HMA_EspProfesional espr on espr.IdProfesional = pres.IdProfesional and espr.IdEspecialidad = prof.IDESP
	left join HMA_Establecimientos es on es.Id=pres.Establecimiento
	left join hma.dbo.ADM_Historia adm on adm.Historia=pres.Historia
	left join SIS_Prestacion presi on presi.Id=pres.Prestacion
	where pres.Lote = @Lote and pres.FUA = @FUA
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BuscarSisprestacionesAdmision]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BuscarSisprestacionesAdmision]
	@historia varchar(7),
	@fecha date,
	@idprocedencia int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id, Fecha, Alta, TDocumento, NDocumento, Historia, Lote, FUA, IdProcedencia, Disa, TFormato, NContrato, Turno, Tipo, 
	Prestacion, Componente, Establecimiento, IdEspecialidad, IdProfesional, IdUsuario, Registro, IdUsuMod, RegMod, gestante, 
	levantamiento, estado, habilitado, rec_habi, idplan, du, FechaAlta, IdusuAlta, Aval, Auditado, Condicion, TAlta, Cama, RegistroFAlta,
	 IdUsuAltaMod, FechaHMA, RegAltaMod, Masiva, FMasiva, Visible, IdUsuAnula, RegAnula, IdUsuHabi, IdRetAnula, RegRetiAnula, FechaCierre, 
	 Impreso, FechaImpresion, IdQuitaAudi, RegQuitaAudi, IdUsuQuitaAnula, RegUsuQuitaAnula, IdAtencion, IdUsuAuditado, migracion
	  from sis_prestaciones 
	  where Historia=@historia and Fecha=@fecha and Prestacion in (6,26,23) and IdProcedencia=@idprocedencia and estado = 0;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaAnuladosFUA]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaAnuladosFUA]
	-- Add the parameters for the stored procedure here
	 @finicial date,
	 @ffinal date
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select s.Id, Fecha, Alta, TDocumento, s.NDocumento, s.Historia, Lote, FUA, case s.IdProcedencia  when 1 then 'CONSULTA EXTERNA' when 2 then 'EMERGENCIA'
	when 3 then 'HOSPITALIZACION' end IdProcedencia, Disa, TFormato, NContrato, Turno, a.Paciente as Paciente,
	Tipo, Prestacion, Componente, Establecimiento, s.IdEspecialidad, IdProfesional, s.IdUsuario, s.Registro, s.IdUsuMod, s.RegMod, gestante, 
	levantamiento, s.estado, habilitado, rec_habi, idplan, du, FechaAlta, IdusuAlta, Aval, Auditado, Condicion, TAlta, Cama, RegistroFAlta,
	 IdUsuAltaMod, FechaHMA, RegAltaMod, Masiva, FMasiva, Visible, IdUsuAnula, isnull(RegAnula,'') as RegAnula, IdUsuHabi, IdRetAnula, RegRetiAnula, FechaCierre, 
	 Impreso, FechaImpresion, IdQuitaAudi, RegQuitaAudi, IdUsuQuitaAnula, RegUsuQuitaAnula, IdAtencion, IdUsuAuditado, migracion,u.Alias as UsuAnulado 
	 from SIS_Prestaciones s
	 inner join hma.dbo.ADM_Historia a on s.Historia=a.Historia
	 inner join hma.dbo.Usu_Usuarios u on s.IdUsuAnula=u.ID
	  where s.estado=1 and Fecha between @finicial and @ffinal
	  order by RegAnula desc;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaDatosFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaDatosFua]
	-- Add the parameters for the stored procedure here
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select s.Ingreso, s.Lote, s.Fua, Prestacion, Historia, Paciente, Fecha,IdEspecialidad, IdUsuario, s.DNI, 
	Auditado, s.Registro,IdUsuario,u.Alias as Usuario from SIS_FUA s
	left join hma.dbo.Usu_Usuarios u on s.IdUsuario=u.ID
	 where s.Fua=@fua;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaDatosFuaPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaDatosFuaPrestaciones]
	-- Add the parameters for the stored procedure here
		@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select s.IdProcedencia, s.Lote, s.Fua, Prestacion, s.Historia, h.Paciente, Fecha,s.IdEspecialidad, s.IdUsuario, s.NDocumento, 
	Auditado, s.Registro,s.IdUsuario,u.Alias as Usuario from SIS_Prestaciones s
	left join hma.dbo.Usu_Usuarios u on s.IdUsuAuditado=u.ID
	 left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	 where s.Fua=@fua;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaDesdeHastaMonto]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaDesdeHastaMonto] 
	-- Add the parameters for the stored procedure here
	@importemenor float,
	@importemayor float,
	@fini date,
	@ffin date,
	@impreso bit,
	@idusuario int,
	@filtro int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @filtro =1
   begin
   select s.Id, case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso  from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where isnull( (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)>=@importemenor and isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)<=@importemayor and Fecha between @fini and @ffin and Auditado=1 and Impreso=@impreso and IdUsuario=@idusuario ORDER BY Paciente;
END
else
if @filtro =2
  
   select s.Id, case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso  from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where isnull( (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)>=@importemenor and isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)<=@importemayor and Fecha between @fini and @ffin and Auditado=1 and Impreso=@impreso and IdUsuario=@idusuario ORDER BY FechaCierre;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaEspecialidadFuaAuditado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaEspecialidadFuaAuditado]
	-- Add the parameters for the stored procedure here
	@fini date,
	@ffin date,
	@servicio int,
	@idespecialidad int,
	@impreso bit,
	@idusuario int,
	@filtro int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @filtro =1
   begin
   
	select  case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where Ingreso=@servicio and Fecha between @fini and @ffin and IdEspecialidad=@idespecialidad and Auditado=1  and Impreso=@impreso and IdUsuario=@idusuario GROUP BY Ingreso, Lote,Fua,Historia,Paciente,Fecha, e.Descripcion,u.Alias,Impreso  ORDER BY Paciente;
END 
else if @filtro=2
select  case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where Ingreso=@servicio and Fecha between @fini and @ffin and IdEspecialidad=@idespecialidad and Auditado=1  and Impreso=@impreso and IdUsuario=@idusuario GROUP BY Ingreso, Lote,Fua,Historia,Paciente,Fecha, e.Descripcion,u.Alias,Impreso,FechaCierre  ORDER BY Paciente;
END 

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaEspecialidadPrestacionesAuditado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaEspecialidadPrestacionesAuditado]
	-- Add the parameters for the stored procedure here
@fini date,
	@ffin date,
	@servicio int,
	@idespecialidad int,
	@impreso bit,
	@idusuario int,
	@filtro int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @filtro =1
   begin
   
	select  case S.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, S.Historia, H.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	   	     left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where S.IdProcedencia=@servicio and convert(date,Fecha) between @fini and @ffin and S.IdEspecialidad=@idespecialidad and Auditado=1  and 
	  Impreso=@impreso and S.IdUsuario=@idusuario GROUP BY S.IdProcedencia, Lote,Fua,S.Historia,H.Paciente,Fecha, e.Descripcion,u.Alias,Impreso  
	  ORDER BY Paciente;
END 
else if @filtro=2
select  case S.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, S.Historia, H.Paciente,
 Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	   	     left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where S.IdProcedencia=@servicio and convert(date,Fecha) between @fini and @ffin and S.IdEspecialidad=@idespecialidad and Auditado=1  
	  and Impreso=@impreso and S.IdUsuario=@idusuario GROUP BY S.IdProcedencia, Lote,Fua,S.Historia,H.Paciente,Fecha, e.Descripcion,u.Alias,
	  Impreso,FechaCierre  ORDER BY Paciente;
END 



GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaFuaAuditado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaFuaAuditado]
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select * from SIS_FUAAUDITADOS where Lote =@lote and Fua=@fua and Estado=0 and Auditado=1;
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaFuaConsumo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --EXEC [dbo].[SIS_BusquedaFuaConsumo] '21','45325',1
--EXEC [dbo].[SIS_BusquedaFuaConsumo] '21','34827',1
CREATE PROCEDURE [dbo].[SIS_BusquedaFuaConsumo]
	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@proc int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		select  Id,  Importe,  Caja, 0 as Codcaja,0 as CodArea,0 as SubClase,1 as principal,'' as gm_Des_Breve
			from AUDITORIA.dbo.SIS_Consumo  
			where  Fua=@fua and Lote=@lote  and Estado=0


END




GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaFuaLote]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaFuaLote] 
	-- Add the parameters for the stored procedure here
	@FUA int,
	@lote int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT S.Id, Ingreso, Lote, Fua, Prestacion, Historia, NAfiliacion, Fecha,  e.Descripcion as IdEspecialidad,u.APELLIDOS+' '+u.NOMBRES as IdUsuario,
	 s.DNI, Auditado, s.Registro, Paciente,FechaCierre,FAlta,Anulado FROM SIS_FUA S
	  inner join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	  left join hma.dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where Lote=@lote and Fua=@FUA order by Id desc;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaFuaPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_BusquedaFuaPrestaciones]
	-- Add the parameters for the stored procedure here
	@opcion int,
	@fua int,
	@fini date,
	@ffin date,
	@hc varchar(8),
	@servicio int,
	@especialidad int,
	@idusuario int

AS
BEGIN
	
	if @opcion=1
	begin
	select s.sv_Num_Oper as Id, s.sv_Fec_Atencion as Fecha, s.sv_Tip_Atencion as IdProcedencia,s.sv_Num_FUA_Lote as Lote,his.rm_Tip_DocId as TDocumento,ltrim(rtrim(his.rm_Num_DocId )) as NDocumento, s.sv_Num_Fua_Corr as Fua,
	s.sv_Cod_Prestacion as Prestacion, s.sv_Cod_HCli as Historia,his.rm_Nom_ApPat as Paterno,his.rm_Nom_ApMat as Materno, his.rm_Nom_Primer as PNombre, his.rm_Nom_Segundo as SNombre, case his.rm_Num_Afil_Corr_SIS when '0' 
	then his.rm_Num_Afil_Sis_tmp else convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Estab_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Lote_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Corr_SIS))) 
	end as Afiliacion,his.rm_Fec_Nac as FNacimiento,'0' as habilitado,t.gt_des_larga as Especialidad, s.sv_cod_Consult as IdEspecialidad,s.sg_Log_Cre_Usuario as IdUsuario,s.sv_CodTur as Turno,0 as Auditado, 
	case s.sg_Est_Registro when '*' then 1 else 0 end as Anulado,s.sg_Log_Cre_Feh as Registro, case s.sv_Tip_Atencion when '1' then 1 else case ep.sg_Est_Registro when 'A' then 1 else 0 end end as Alta,
	case s.sv_Tip_Atencion when '1' then 1 else ep.hv_Fec_Alta end as FechaAlta, 0 as IdusuAlta,s.sv_Cod_Estab_Referido as codestable, es.Re_Nombre as Establecimiento,
	 isnull(  (select sum(d.tv_Imp_SubTotal)  from db_sighoshsb_pruebas.dbo.TV_CCTE_DET d
	 where ep.hv_Num_Episodio=s.sv_Num_Hsp and d.tv_Num_Registro!='' and d.tv_Cod_Hcli=s.sv_Cod_HCli and d.sg_Est_Registro!='*' and ep.hv_Num_Episodio=d.tv_Num_Episodio),0)
	 as Importe 
	 from db_sighoshsb_pruebas.dbo.SV_SIS_FILIACION s
	 left join db_sighoshsb_pruebas.dbo.GT_CONSULT t on t.gt_cod_consult=s.sv_cod_Consult
	  inner join db_sighoshsb_pruebas.dbo.RM_HCLINICA his on his.rm_Cod_HCli=s.sv_Cod_HCli
	  left JOIN db_sighoshsb_pruebas.dbo.HV_EPISODIO ep on ep.hv_Num_Episodio=s.sv_Num_Hsp
	   left join db_sighoshsb_pruebas.MA.RENAES es on es.Re_IdRenaes=s.sv_Cod_Estab_Referido
	  where (CONVERT(DATE, s.sv_Fec_Atencion) BETWEEN @fini AND @ffin)  
	  ORDER BY s.sg_Log_Cre_Feh desc;
	end
	else if @opcion=2
	begin 
	select s.sv_Num_Oper as Id, s.sv_Fec_Atencion as Fecha, s.sv_Tip_Atencion as IdProcedencia,s.sv_Num_FUA_Lote as Lote,his.rm_Tip_DocId as TDocumento,ltrim(rtrim(his.rm_Num_DocId )) as NDocumento, s.sv_Num_Fua_Corr as Fua,
	s.sv_Cod_Prestacion as Prestacion, s.sv_Cod_HCli as Historia,his.rm_Nom_ApPat as Paterno,his.rm_Nom_ApMat as Materno, his.rm_Nom_Primer as PNombre, his.rm_Nom_Segundo as SNombre, case his.rm_Num_Afil_Corr_SIS when '0' 
	then his.rm_Num_Afil_Sis_tmp else convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Estab_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Lote_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Corr_SIS))) 
	end as Afiliacion,his.rm_Fec_Nac as FNacimiento,'0' as habilitado,t.gt_des_larga as Especialidad, s.sv_cod_Consult as IdEspecialidad,s.sg_Log_Cre_Usuario as IdUsuario,s.sv_CodTur as Turno,0 as Auditado, 
	case s.sg_Est_Registro when '*' then 1 else 0 end as Anulado,s.sg_Log_Cre_Feh as Registro, case s.sv_Tip_Atencion when '1' then 1 else case ep.sg_Est_Registro when 'A' then 1 else 0 end end as Alta,
	case s.sv_Tip_Atencion when '1' then 1 else ep.hv_Fec_Alta end as FechaAlta, 0 as IdusuAlta,s.sv_Cod_Estab_Referido as codestable, es.Re_Nombre as Establecimiento,
	 isnull(  (select sum(d.tv_Imp_SubTotal)  from db_sighoshsb_pruebas.dbo.TV_CCTE_DET d
	 where ep.hv_Num_Episodio=s.sv_Num_Hsp and d.tv_Num_Registro!='' and d.tv_Cod_Hcli=s.sv_Cod_HCli and d.sg_Est_Registro!='*' and ep.hv_Num_Episodio=d.tv_Num_Episodio),0)
	 as Importe 
	 from db_sighoshsb_pruebas.dbo.SV_SIS_FILIACION s
	 left join db_sighoshsb_pruebas.dbo.GT_CONSULT t on t.gt_cod_consult=s.sv_cod_Consult
	  inner join db_sighoshsb_pruebas.dbo.RM_HCLINICA his on his.rm_Cod_HCli=s.sv_Cod_HCli
	  left JOIN db_sighoshsb_pruebas.dbo.HV_EPISODIO ep on ep.hv_Num_Episodio=s.sv_Num_Hsp
	   left join db_sighoshsb_pruebas.MA.RENAES es on es.Re_IdRenaes=s.sv_Cod_Estab_Referido
	   where s.sv_Cod_HCli=@hc 
	   order by s.sg_Log_Cre_Feh desc;
	end
	else if @opcion=3
	begin
	select s.sv_Num_Oper as Id, s.sv_Fec_Atencion as Fecha, s.sv_Tip_Atencion as IdProcedencia,s.sv_Num_FUA_Lote as Lote,his.rm_Tip_DocId as TDocumento,ltrim(rtrim(his.rm_Num_DocId )) as NDocumento, s.sv_Num_Fua_Corr as Fua,
	s.sv_Cod_Prestacion as Prestacion, s.sv_Cod_HCli as Historia,his.rm_Nom_ApPat as Paterno,his.rm_Nom_ApMat as Materno, his.rm_Nom_Primer as PNombre, his.rm_Nom_Segundo as SNombre, case his.rm_Num_Afil_Corr_SIS when '0' 
	then his.rm_Num_Afil_Sis_tmp else convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Estab_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Lote_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Corr_SIS))) 
	end as Afiliacion,his.rm_Fec_Nac as FNacimiento,'0' as habilitado,t.gt_des_larga as Especialidad, s.sv_cod_Consult as IdEspecialidad,s.sg_Log_Cre_Usuario as IdUsuario,s.sv_CodTur as Turno,0 as Auditado, 
	case s.sg_Est_Registro when '*' then 1 else 0 end as Anulado,s.sg_Log_Cre_Feh as Registro, case s.sv_Tip_Atencion when '1' then 1 else case ep.sg_Est_Registro when 'A' then 1 else 0 end end as Alta,
	case s.sv_Tip_Atencion when '1' then 1 else ep.hv_Fec_Alta end as FechaAlta, 0 as IdusuAlta,s.sv_Cod_Estab_Referido as codestable, es.Re_Nombre as Establecimiento,
	 isnull(  (select sum(d.tv_Imp_SubTotal)  from db_sighoshsb_pruebas.dbo.TV_CCTE_DET d
	 where ep.hv_Num_Episodio=s.sv_Num_Hsp and d.tv_Num_Registro!='' and d.tv_Cod_Hcli=s.sv_Cod_HCli and d.sg_Est_Registro!='*' and ep.hv_Num_Episodio=d.tv_Num_Episodio),0)
	 as Importe 
	 from db_sighoshsb_pruebas.dbo.SV_SIS_FILIACION s
	 left join db_sighoshsb_pruebas.dbo.GT_CONSULT t on t.gt_cod_consult=s.sv_cod_Consult
	  inner join db_sighoshsb_pruebas.dbo.RM_HCLINICA his on his.rm_Cod_HCli=s.sv_Cod_HCli
	  left JOIN db_sighoshsb_pruebas.dbo.HV_EPISODIO ep on ep.hv_Num_Episodio=s.sv_Num_Hsp
	   left join db_sighoshsb_pruebas.MA.RENAES es on es.Re_IdRenaes=s.sv_Cod_Estab_Referido
	   where s.sv_Num_Fua_Corr=@fua	 
	   order by s.sg_Log_Cre_Feh desc;
	end
	else if @opcion=4
	begin
	select s.sv_Num_Oper as Id, s.sv_Fec_Atencion as Fecha, s.sv_Tip_Atencion as IdProcedencia,s.sv_Num_FUA_Lote as Lote,his.rm_Tip_DocId as TDocumento,ltrim(rtrim(his.rm_Num_DocId )) as NDocumento, s.sv_Num_Fua_Corr as Fua,
	s.sv_Cod_Prestacion as Prestacion, s.sv_Cod_HCli as Historia,his.rm_Nom_ApPat as Paterno,his.rm_Nom_ApMat as Materno, his.rm_Nom_Primer as PNombre, his.rm_Nom_Segundo as SNombre, case his.rm_Num_Afil_Corr_SIS when '0' 
	then his.rm_Num_Afil_Sis_tmp else convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Estab_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Lote_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Corr_SIS))) 
	end as Afiliacion,his.rm_Fec_Nac as FNacimiento,'0' as habilitado,t.gt_des_larga as Especialidad, s.sv_cod_Consult as IdEspecialidad,s.sg_Log_Cre_Usuario as IdUsuario,s.sv_CodTur as Turno,0 as Auditado, 
	case s.sg_Est_Registro when '*' then 1 else 0 end as Anulado,s.sg_Log_Cre_Feh as Registro, case s.sv_Tip_Atencion when '1' then 1 else case ep.sg_Est_Registro when 'A' then 1 else 0 end end as Alta,
	case s.sv_Tip_Atencion when '1' then 1 else ep.hv_Fec_Alta end as FechaAlta, 0 as IdusuAlta,s.sv_Cod_Estab_Referido as codestable, es.Re_Nombre as Establecimiento,
	 isnull(  (select sum(d.tv_Imp_SubTotal)  from db_sighoshsb_pruebas.dbo.TV_CCTE_DET d
	 where ep.hv_Num_Episodio=s.sv_Num_Hsp and d.tv_Num_Registro!='' and d.tv_Cod_Hcli=s.sv_Cod_HCli and d.sg_Est_Registro!='*' and ep.hv_Num_Episodio=d.tv_Num_Episodio),0)
	 as Importe 
	 from db_sighoshsb_pruebas.dbo.SV_SIS_FILIACION s
	 left join db_sighoshsb_pruebas.dbo.GT_CONSULT t on t.gt_cod_consult=s.sv_cod_Consult
	  inner join db_sighoshsb_pruebas.dbo.RM_HCLINICA his on his.rm_Cod_HCli=s.sv_Cod_HCli
	  left JOIN db_sighoshsb_pruebas.dbo.HV_EPISODIO ep on ep.hv_Num_Episodio=s.sv_Num_Hsp
	   left join db_sighoshsb_pruebas.MA.RENAES es on es.Re_IdRenaes=s.sv_Cod_Estab_Referido
	   where s.sv_Tip_Atencion=@servicio and s.sv_cod_Consult=@especialidad and s.sv_Fec_Atencion between @fini and @ffin 
	   order by s.sg_Log_Cre_Feh desc;
	end
	else if @opcion=5
	begin
	select s.sv_Num_Oper as Id, s.sv_Fec_Atencion as Fecha, s.sv_Tip_Atencion as IdProcedencia,s.sv_Num_FUA_Lote as Lote,his.rm_Tip_DocId as TDocumento,ltrim(rtrim(his.rm_Num_DocId )) as NDocumento, s.sv_Num_Fua_Corr as Fua,
	s.sv_Cod_Prestacion as Prestacion, s.sv_Cod_HCli as Historia,his.rm_Nom_ApPat as Paterno,his.rm_Nom_ApMat as Materno, his.rm_Nom_Primer as PNombre, his.rm_Nom_Segundo as SNombre, case his.rm_Num_Afil_Corr_SIS when '0' 
	then his.rm_Num_Afil_Sis_tmp else convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Estab_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Lote_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Corr_SIS))) 
	end as Afiliacion,his.rm_Fec_Nac as FNacimiento,'0' as habilitado,t.gt_des_larga as Especialidad, s.sv_cod_Consult as IdEspecialidad,s.sg_Log_Cre_Usuario as IdUsuario,s.sv_CodTur as Turno,0 as Auditado, 
	case s.sg_Est_Registro when '*' then 1 else 0 end as Anulado,s.sg_Log_Cre_Feh as Registro, case s.sv_Tip_Atencion when '1' then 1 else case ep.sg_Est_Registro when 'A' then 1 else 0 end end as Alta,
	case s.sv_Tip_Atencion when '1' then 1 else ep.hv_Fec_Alta end as FechaAlta, 0 as IdusuAlta,s.sv_Cod_Estab_Referido as codestable, es.Re_Nombre as Establecimiento,
	 isnull(  (select sum(d.tv_Imp_SubTotal)  from db_sighoshsb_pruebas.dbo.TV_CCTE_DET d
	 where ep.hv_Num_Episodio=s.sv_Num_Hsp and d.tv_Num_Registro!='' and d.tv_Cod_Hcli=s.sv_Cod_HCli and d.sg_Est_Registro!='*' and ep.hv_Num_Episodio=d.tv_Num_Episodio),0)
	 as Importe 
	 from db_sighoshsb_pruebas.dbo.SV_SIS_FILIACION s
	 left join db_sighoshsb_pruebas.dbo.GT_CONSULT t on t.gt_cod_consult=s.sv_cod_Consult
	  inner join db_sighoshsb_pruebas.dbo.RM_HCLINICA his on his.rm_Cod_HCli=s.sv_Cod_HCli
	  left JOIN db_sighoshsb_pruebas.dbo.HV_EPISODIO ep on ep.hv_Num_Episodio=s.sv_Num_Hsp
	   left join db_sighoshsb_pruebas.MA.RENAES es on es.Re_IdRenaes=s.sv_Cod_Estab_Referido
	   where s.sv_Tip_Atencion=@servicio and s.sv_Fec_Atencion between @fini and @ffin  
	   order by s.sg_Log_Cre_Feh desc;
	end
	else if @opcion=6
	begin
	select s.sv_Num_Oper as Id, s.sv_Fec_Atencion as Fecha, s.sv_Tip_Atencion as IdProcedencia,s.sv_Num_FUA_Lote as Lote,his.rm_Tip_DocId as TDocumento,ltrim(rtrim(his.rm_Num_DocId )) as NDocumento, s.sv_Num_Fua_Corr as Fua,
	s.sv_Cod_Prestacion as Prestacion, s.sv_Cod_HCli as Historia,his.rm_Nom_ApPat as Paterno,his.rm_Nom_ApMat as Materno, his.rm_Nom_Primer as PNombre, his.rm_Nom_Segundo as SNombre, case his.rm_Num_Afil_Corr_SIS when '0' 
	then his.rm_Num_Afil_Sis_tmp else convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Estab_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Lote_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Corr_SIS))) 
	end as Afiliacion,his.rm_Fec_Nac as FNacimiento,'0' as habilitado,t.gt_des_larga as Especialidad, s.sv_cod_Consult as IdEspecialidad,s.sg_Log_Cre_Usuario as IdUsuario,s.sv_CodTur as Turno,0 as Auditado, 
	case s.sg_Est_Registro when '*' then 1 else 0 end as Anulado,s.sg_Log_Cre_Feh as Registro, case s.sv_Tip_Atencion when '1' then 1 else case ep.sg_Est_Registro when 'A' then 1 else 0 end end as Alta,
	case s.sv_Tip_Atencion when '1' then 1 else ep.hv_Fec_Alta end as FechaAlta, 0 as IdusuAlta,s.sv_Cod_Estab_Referido as codestable, es.Re_Nombre as Establecimiento,
	 isnull(  (select sum(d.tv_Imp_SubTotal)  from db_sighoshsb_pruebas.dbo.TV_CCTE_DET d
	 where ep.hv_Num_Episodio=s.sv_Num_Hsp and d.tv_Num_Registro!='' and d.tv_Cod_Hcli=s.sv_Cod_HCli and d.sg_Est_Registro!='*' and ep.hv_Num_Episodio=d.tv_Num_Episodio),0)
	 as Importe 
	 from db_sighoshsb_pruebas.dbo.SV_SIS_FILIACION s
	 left join db_sighoshsb_pruebas.dbo.GT_CONSULT t on t.gt_cod_consult=s.sv_cod_Consult
	  inner join db_sighoshsb_pruebas.dbo.RM_HCLINICA his on his.rm_Cod_HCli=s.sv_Cod_HCli
	  left JOIN db_sighoshsb_pruebas.dbo.HV_EPISODIO ep on ep.hv_Num_Episodio=s.sv_Num_Hsp
	   left join db_sighoshsb_pruebas.MA.RENAES es on es.Re_IdRenaes=s.sv_Cod_Estab_Referido
	   where s.sv_Fec_Atencion between @fini and @ffin and isnull(  (select sum(d.tv_Imp_SubTotal)  from db_sighoshsb_pruebas.dbo.TV_CCTE_DET d
	 where ep.hv_Num_Episodio=s.sv_Num_Hsp and d.tv_Num_Registro!='' and d.tv_Cod_Hcli=s.sv_Cod_HCli and d.sg_Est_Registro!='*' and ep.hv_Num_Episodio=d.tv_Num_Episodio),0)>@fua 
	  ORDER BY s.sg_Log_Cre_Feh desc;
	end
	else if @opcion=8
	begin
	select s.sv_Num_Oper as Id, s.sv_Fec_Atencion as Fecha, s.sv_Tip_Atencion as IdProcedencia,s.sv_Num_FUA_Lote as Lote,his.rm_Tip_DocId as TDocumento,ltrim(rtrim(his.rm_Num_DocId )) as NDocumento, s.sv_Num_Fua_Corr as Fua,
	s.sv_Cod_Prestacion as Prestacion, s.sv_Cod_HCli as Historia,his.rm_Nom_ApPat as Paterno,his.rm_Nom_ApMat as Materno, his.rm_Nom_Primer as PNombre, his.rm_Nom_Segundo as SNombre, case his.rm_Num_Afil_Corr_SIS when '0' 
	then his.rm_Num_Afil_Sis_tmp else convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Estab_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Lote_SIS)))+'-'+convert(varchar,LTRIM(RTRIM(his.rm_Num_Afil_Corr_SIS))) 
	end as Afiliacion,his.rm_Fec_Nac as FNacimiento,'0' as habilitado,t.gt_des_larga as Especialidad, s.sv_cod_Consult as IdEspecialidad,s.sg_Log_Cre_Usuario as IdUsuario,s.sv_CodTur as Turno,0 as Auditado, 
	case s.sg_Est_Registro when '*' then 1 else 0 end as Anulado,s.sg_Log_Cre_Feh as Registro, case s.sv_Tip_Atencion when '1' then 1 else case ep.sg_Est_Registro when 'A' then 1 else 0 end end as Alta,
	case s.sv_Tip_Atencion when '1' then 1 else ep.hv_Fec_Alta end as FechaAlta, 0 as IdusuAlta,s.sv_Cod_Estab_Referido as codestable, es.Re_Nombre as Establecimiento,
	 isnull(  (select sum(d.tv_Imp_SubTotal) 
	 from db_sighoshsb_pruebas.dbo.TV_CCTE_DET d
	 where ep.hv_Num_Episodio=s.sv_Num_Hsp and d.tv_Num_Registro!='' and d.tv_Cod_Hcli=s.sv_Cod_HCli and d.sg_Est_Registro!='*' and ep.hv_Num_Episodio=d.tv_Num_Episodio),0)
	 as Importe 
	 from db_sighoshsb_pruebas.dbo.SV_SIS_FILIACION s
	 left join db_sighoshsb_pruebas.dbo.GT_CONSULT t on t.gt_cod_consult=s.sv_cod_Consult
	  inner join db_sighoshsb_pruebas.dbo.RM_HCLINICA his on his.rm_Cod_HCli=s.sv_Cod_HCli
	  left JOIN db_sighoshsb_pruebas.dbo.HV_EPISODIO ep on ep.hv_Num_Episodio=s.sv_Num_Hsp
	   left join db_sighoshsb_pruebas.MA.RENAES es on es.Re_IdRenaes=s.sv_Cod_Estab_Referido
	   where s.sv_Fec_Atencion between @fini and @ffin /*and Auditado=1 and IdUsuAuditado=@idusuario*/
	   ORDER BY s.sg_Log_Cre_Feh desc;
	end
	
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaFuaPrestacionesAuditado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaFuaPrestacionesAuditado]
	-- Add the parameters for the stored procedure here
	@fua int,
	@impreso bit,
	@filtro int,
	@procedencia int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	if @filtro =1
   begin
    -- Insert statements for procedure here
	select  case s.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, s.Historia, h.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	   left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where  Fua= @fua and Auditado=1 and Impreso=@impreso and s.IdProcedencia=@procedencia and s.estado=0
	   GROUP BY s.IdProcedencia, Lote,Fua,s.Historia,h.Paciente,Fecha, e.Descripcion,u.Alias,Impreso ORDER BY Paciente;
END
else 
if @filtro =2

    -- Insert statements for procedure here
	select case s.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, s.Historia, h.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	   left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where  Fua= @fua and Auditado=1 and Impreso=@impreso and s.IdProcedencia=@procedencia  and s.estado=0
	  GROUP BY s.IdProcedencia, Lote,Fua,s.Historia,h.Paciente,Fecha, e.Descripcion,u.Alias,Impreso,FechaCierre ORDER BY FechaCierre;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaHC]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaHC]	-- Add the parameters for the stored procedure here
	@hc int,
	@f_ini date,
	@f_fin date

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select s.Id, Ingreso, Lote, Fua, Prestacion, Historia, Paciente, NAfiliacion, Fecha, RegFUA, e.Descripcion as IdEspecialidad, IdUsuario, DNI,
	 Auditado, Anulado, Registro from SIS_FUA s
	  inner join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   where Historia=@hc and Fecha between @f_ini and @f_fin
	
	
	
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaHistoriaAuditado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaHistoriaAuditado] 
	-- Add the parameters for the stored procedure here
	@historia varchar(50),
	@impreso bit,
	@filtro int,
	@procedencia int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @filtro =1
   begin
   select  case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where  Historia= @historia and Auditado=1 and Impreso=@impreso and Ingreso=@procedencia GROUP BY Ingreso, Lote,Fua,Historia,Paciente,Fecha, e.Descripcion,u.Alias,Impreso ORDER BY Paciente;
END
else
if @filtro =2

   select  case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where  Historia= @historia and Auditado=1 and Impreso=@impreso and Ingreso=@procedencia GROUP BY Ingreso, Lote,Fua,Historia,Paciente,Fecha, e.Descripcion,u.Alias,Impreso,FechaCierre ORDER BY FechaCierre;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaHistoriaPrestacion1]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaHistoriaPrestacion1] 
	-- Add the parameters for the stored procedure here
@historia char(7),
	@procedencia int
AS
BEGIN
	if @procedencia = 3 or @procedencia = 2
	begin
		select  S.Id, s.Fecha as Atencion,s.fechahma,s.Fecha as fechasis,
		s.FechaAlta as FechaAlta, s.NDocumento
		,Lote, FUA, case s.IdProcedencia when 1 then 'CONSULTA EXTERNA' WHEN 2 THEN 'EMERGENCIA' ELSE 'HOSPITALIZACION' END AS Procedencia, s.IdProcedencia,
		 s.Disa, TFormato, NContrato, s.Prestacion,s.Componente, case Componente  when 1 then 'SIS GRATUITO' when 2 then 'SIS INDEPENDIENTE'  when 3 then 'SIS MICROEMPRESAS' when 4 THEN 'EMPRENDEDOR' END AS TSEGURO, 
		s.Establecimiento as IdEstablecimiento,es.Codigo as CodEstablecimiento, es.Establecimiento as Establecimiento, e.Descripcion as Especialidad,s.IdEspecialidad,
		 f.nombre as Profesional,s.IdProfesional, s.Prestacion as IdPrestacion,p.Codigo as CodPrestacion,
		 u.Alias as Usuario, s.DU,isnull(f.COLEGIATURA,'') as COLEGIATURA ,s.Tipo,s.Turno,s.gestante,s.levantamiento,s.DU,s.Aval,s.Cama, s.Condicion,S.estado,
		 S.Registro, IdUsuMod, s.RegMod, s.Condicion,s.Cama,s.idplan,s.Aval as AvalPres,s.Cama as CamaPres,s.Auditado as AuditadoPres,s.Condicion as Condicionpres,s.TAlta as TAltaPres,s.FechaHMA  as FechaHMAPres,s.Alta as AltaPres  from SIS_Prestaciones S
		 left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
		 left join HMA.DBO.HMA_Profesionales f on  f.Id = s.IdProfesional
		  left join SIS_Prestacion p on p.Id=s.Prestacion
		   left join HMA_Establecimientos es on es.Id=s.Establecimiento
		 left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
		 --left join sis_hospitalizacion h on h.IdPrestaciones = s.id
		 where Historia=@historia and s.IdProcedencia=@procedencia;
	 end
	 else
		 select  S.Id, s.Fecha as Atencion,h.fechahma,h.fechasis,s.FechaAlta,Lote, FUA,s.NDocumento,
		 case s.IdProcedencia when 1 then 'CONSULTA EXTERNA' WHEN 2 THEN 'EMERGENCIA' ELSE 'HOSPITALIZACION' END AS Procedencia, s.IdProcedencia,
		 s.Disa, TFormato, NContrato, s.Prestacion as IdPrestacion,p.Codigo as CodPrestacion,p.Descripcion as Prestacion, s.Componente,
		 case Componente when 1 then 'SIS GRATUITO' when 2 then 'SIS INDEPENDIENTE'  when 3 then 'SIS MICROEMPRESAS' when 4 THEN 'EMPRENDEDOR' END AS TSEGURO, 
		 s.Establecimiento as IdEstablecimiento,es.Codigo as CodEstablecimiento, es.Establecimiento as Establecimiento,
		  e.Descripcion as Especialidad,s.IdEspecialidad,s.IdProfesional,
		 f.nombre as Profesional, f.COLEGIATURA,
		 u.Alias as Usuario, s.Tipo,s.Turno,s.gestante,s.levantamiento,s.DU,
		 S.Registro, IdUsuMod, s.RegMod,S.estado, s.idplan,s.Aval as AvalPres,s.Cama as CamaPres,s.Auditado as AuditadoPres,s.Condicion as Condicionpres,s.TAlta as TAltaPres,s.FechaHMA  as FechaHMAPres,s.Alta as AltaPres   from SIS_Prestaciones S
		 left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
		 left join SIS_Prestacion p on p.Id=s.Prestacion
		 left join HMA_Establecimientos es on es.Id=s.Establecimiento
		 left join HMA.DBO.HMA_Profesionales f on  f.Id = s.IdProfesional
		 left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
		 left join sis_hospitalizacion h on h.IdPrestaciones = s.id
		 where Historia=@historia 
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaHistoriaPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select * from sis_hospitalizacion
--[SIS_BusquedaHistoriaPrestaciones] '1904709',3
CREATE PROCEDURE [dbo].[SIS_BusquedaHistoriaPrestaciones]
	-- Add the parameters for the stored procedure here
	@historia char(7),
	@procedencia int
AS
BEGIN

    -- Insert statements for procedure here
	if @procedencia = 3 or @procedencia = 2
	begin
		select  S.Id, s.Fecha as Atencion,s.fechahma,s.Fecha as fechasis,
		s.FechaAlta as FechaAlta, s.NDocumento,s.Historia
		,Lote, FUA, case s.IdProcedencia when 1 then 'CONSULTA EXTERNA' WHEN 2 THEN 'EMERGENCIA' ELSE 'HOSPITALIZACION' END AS Procedencia, s.IdProcedencia,
		 s.Disa, TFormato, NContrato, s.Prestacion,s.Componente, case Componente  when 1 then 'SIS GRATUITO' when 2 then 'SIS INDEPENDIENTE'  when 3 then 'SIS MICROEMPRESAS' when 4 THEN 'EMPRENDEDOR' END AS TSEGURO, 
		s.Establecimiento as IdEstablecimiento,es.Codigo as CodEstablecimiento, es.Establecimiento as Establecimiento, e.Descripcion as Especialidad,s.IdEspecialidad,
		 f.nombre as Profesional,s.IdProfesional, s.Prestacion as IdPrestacion,p.Codigo as CodPrestacion,s.habilitado,
		 u.Alias as Usuario, s.DU,isnull(f.COLEGIATURA,'') as COLEGIATURA ,s.Tipo,s.Turno,s.gestante,s.levantamiento,s.DU,s.Aval,s.Cama, s.Condicion,
		 S.Registro, IdUsuMod, s.RegMod, s.Condicion,s.Cama,s.idplan,s.Aval as AvalPres,s.Cama as CamaPres,s.Auditado as AuditadoPres,
		 s.Condicion as Condicionpres,s.TAlta as TAltaPres,s.FechaHMA  as FechaHMAPres,s.Alta as AltaPres
		   from SIS_Prestaciones S
		 left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
		 left join HMA.DBO.HMA_Profesionales f on  f.Id = s.IdProfesional
		  left join SIS_Prestacion p on p.Id=s.Prestacion
		   left join HMA_Establecimientos es on es.Id=s.Establecimiento
		 left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
		 --left join sis_hospitalizacion h on h.IdPrestaciones = s.id
		 where Historia=@historia and s.IdProcedencia=@procedencia and s.Alta=0 and s.estado=0;
	 end
	 else
		 select  S.Id, s.Fecha as Atencion,h.fechahma,h.fechasis,s.FechaAlta,Lote, FUA,s.NDocumento,
		 case s.IdProcedencia when 1 then 'CONSULTA EXTERNA' WHEN 2 THEN 'EMERGENCIA' ELSE 'HOSPITALIZACION' END AS Procedencia, s.IdProcedencia,
		 s.Disa, TFormato, NContrato, s.Prestacion as IdPrestacion,p.Codigo as CodPrestacion,p.Descripcion as Prestacion, s.Componente,
		 case Componente when 1 then 'SIS GRATUITO' when 2 then 'SIS INDEPENDIENTE'  when 3 then 'SIS MICROEMPRESAS' when 4 THEN 'EMPRENDEDOR' END AS TSEGURO, 
		 s.Establecimiento as IdEstablecimiento,es.Codigo as CodEstablecimiento, es.Establecimiento as Establecimiento,
		  e.Descripcion as Especialidad,s.IdEspecialidad,s.IdProfesional,
		 f.nombre as Profesional, f.COLEGIATURA,s.habilitado,
		 u.Alias as Usuario, s.Tipo,s.Turno,s.gestante,s.levantamiento,s.DU,
		 S.Registro, IdUsuMod, s.RegMod,S.estado, s.idplan,s.Aval as AvalPres,s.Cama as CamaPres,s.Auditado as AuditadoPres,s.Condicion as Condicionpres,s.TAlta as TAltaPres,s.FechaHMA  as FechaHMAPres,s.Alta as AltaPres   from SIS_Prestaciones S
		 left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
		 left join SIS_Prestacion p on p.Id=s.Prestacion
		 left join HMA_Establecimientos es on es.Id=s.Establecimiento
		 left join HMA.DBO.HMA_Profesionales f on  f.Id = s.IdProfesional
		 left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
		 left join sis_hospitalizacion h on h.IdPrestaciones = s.id
		 where Historia=@historia order by s.Fecha desc

END
GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaHistoriaPrestacionesAuditado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaHistoriaPrestacionesAuditado]
	-- Add the parameters for the stored procedure here
	@historia varchar(50),
	@impreso bit,
	@filtro int,
	@procedencia int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @filtro =1
   begin
   select  case S.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, s.Historia, h.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	   left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where  s.Historia= @historia and Auditado=1 and Impreso=@impreso and S.IdProcedencia=@procedencia 
	  GROUP BY S.IdProcedencia, Lote,Fua,s.Historia,h.Paciente,Fecha, e.Descripcion,u.Alias,Impreso ORDER BY Paciente;
END
else
if @filtro =2

   select  case S.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, s.Historia, h.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	   left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where  s.Historia= @historia and Auditado=1 and Impreso=@impreso and S.IdProcedencia=@procedencia 
	  GROUP BY S.IdProcedencia, Lote,Fua,s.Historia,h.Paciente,Fecha, e.Descripcion,u.Alias,Impreso,FechaCierre ORDER BY FechaCierre;
END


GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaLoteFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaLoteFua]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id, Fecha, Alta, TDocumento, NDocumento, Historia, Lote, FUA,case IdProcedencia when 1 then 'CONSULTA EXTERNA' when 2 then 'EMERGENCIA' when 3 then 'HOSPITALIZACION' end Procedencia,
	 Disa, TFormato, NContrato, Turno, Tipo, Prestacion,
	 Componente, Establecimiento, IdEspecialidad, IdProfesional, IdUsuario, Registro, IdUsuMod, RegMod, gestante, levantamiento, estado, habilitado,
	  rec_habi, idplan, du, FechaAlta, IdusuAlta, Aval, Auditado, Condicion, TAlta, Cama, RegistroFAlta, IdUsuAltaMod, FechaHMA
	   from SIS_Prestaciones 
	   where Lote=@lote and Fua=@fua and estado=0
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaLoteFuaTrama]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_BusquedaLoteFuaTrama] 
	-- Add the parameters for the stored procedure here
	@lote varchar(2),
	@fua varchar(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Lote,Numero,Observacion from SIS_Trama where Lote=@lote and Numero=@fua

	end
	
GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaMontoMayorAuditado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaMontoMayorAuditado] 
	-- Add the parameters for the stored procedure here
	@importemayor float,
	@fini date,
	@ffin date,
	@impreso bit,
	@idusuario int,
	@filtro int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @filtro =1
   begin
    -- Insert statements for procedure here
	select s.Id, case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso  from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)>@importemayor and Fecha between @fini and @ffin and Auditado=1 and Impreso=@impreso and IdUsuario=@idusuario ORDER BY Paciente;
END
else
if @filtro =2
   
    -- Insert statements for procedure here
	select s.Id, case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso  from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)>@importemayor and Fecha between @fini and @ffin and Auditado=1 and Impreso=@impreso and IdUsuario=@idusuario ORDER BY FechaCierre;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaMontoMenorAuditado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaMontoMenorAuditado] 
	-- Add the parameters for the stored procedure here
	@importemenor float,
	@fini date,
	@ffin date,
	@impreso bit,
	@idusuario int,
	@filtro int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @filtro =1
   begin
    -- Insert statements for procedure here
select s.Id, case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)<@importemenor and Fecha between @fini and @ffin and Auditado=1 and Impreso=@impreso and IdUsuario=@idusuario ORDER BY Paciente;
END
 else
 if @filtro =2
   
    -- Insert statements for procedure here
select s.Id, case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)<@importemenor and Fecha between @fini and @ffin and Auditado=1 and Impreso=@impreso and IdUsuario=@idusuario ORDER BY FechaCierre;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaPacientesRestringidos]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaPacientesRestringidos] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select S.Id, s.Historia, s.Dni,  e.Descripcion as Especialidad, s.Fecha_registro, s.Idusuario, u.Alias as Usuario, Fecha_atencion,s.Estado
	from SIS_PacientesRestringidos S
	 inner join HMA.DBO.HMA_Especialidad e on e.Id=s.Especialidad
	 left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.Idusuario
	 where s.Estado=0;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaPaciRestrinxHistoria]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaPaciRestrinxHistoria] 
	-- Add the parameters for the stored procedure here
	@historia int,
	@fecha date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id, Historia, Dni, Especialidad, Fecha_registro, Idusuario, Estado, Fecha_atencion from SIS_PacientesRestringidos 
	where Historia=@historia and 
	Fecha_atencion=@fecha and Estado=0
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaPrestacionesDatosxId]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaPrestacionesDatosxId]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select s.Id, Fecha, Alta, TDocumento, s.NDocumento, s.Historia, Lote, FUA, case s.IdProcedencia when 1 then 'CONSULTA EXTERNA' when 2 then 'EMERGENCIA' when
	3 then 'HOSPITALIZACION' end Procedencia, s.IdProcedencia, Disa, TFormato, NContrato, Turno, Tipo, Prestacion, u1.Alias as Usuario,
	Componente, Establecimiento, s.IdEspecialidad, IdProfesional, s.IdUsuario, s.Registro, s.IdUsuMod, s.RegMod, gestante, levantamiento, s.estado, habilitado, 
	rec_habi, idplan, du, FechaAlta, IdusuAlta, Aval, Auditado, Condicion, TAlta, Cama, RegistroFAlta, IdUsuAltaMod, FechaHMA, RegAltaMod, Masiva,
	 FMasiva, Visible, IdUsuAnula, RegAnula, IdUsuHabi, IdRetAnula, RegRetiAnula, FechaCierre, Impreso, FechaImpresion, IdQuitaAudi, RegQuitaAudi,
	  his.Paciente as  Paciente, IdUsuQuitaAnula, RegUsuQuitaAnula, IdAtencion,u.Alias as UsuarioAuditado,DATEDIFF(yy,his.FNacimiento,GETDATE() ) AS Edad,
	  es.Descripcion as Especialidad
	  from SIS_Prestaciones s  
	   inner join HMA.DBO.ADM_Historia his on his.Historia=s.Historia
	   left join hma.dbo.Usu_Usuarios u1 on u1.ID=s.IdUsuario
	   left join hma.dbo.Usu_Usuarios u on u.ID=s.IdUsuAuditado
	   left join hma.dbo.HMA_Especialidad es on es.Id=s.IdEspecialidad
	   where s.Id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaPrestacionesDesdeHastaMontoAuditado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaPrestacionesDesdeHastaMontoAuditado]
	-- Add the parameters for the stored procedure here
@importemenor float,
	@importemayor float,
	@fini date,
	@ffin date,
	@impreso bit,
	@idusuario int,
	@filtro int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	if @filtro =1
   begin
   select s.Id, case S.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, S.Historia, H.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso  from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	   left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where isnull( (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)>=@importemenor and
	   isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)<=@importemayor and 
	   convert(date,Fecha) between @fini and @ffin and Auditado=1 and Impreso=@impreso and S.IdUsuAuditado=@idusuario ORDER BY Paciente;
END
else
if @filtro =2
  
   select s.Id, case S.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, S.Historia, H.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso  from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	   left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where isnull( (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)>=@importemenor 
	  and isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)<=@importemayor and
	   convert(date,Fecha) between @fini and @ffin and Auditado=1 and Impreso=@impreso and S.IdUsuAuditado=@idusuario ORDER BY FechaCierre;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaPrestacionesEmergencia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--SIS_BusquedaPrestacionesEmergencia '1786022'
CREATE PROCEDURE [dbo].[SIS_BusquedaPrestacionesEmergencia]
	-- Add the parameters for the stored procedure here
	@historia char(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 1  S.Id, s.Fecha as Atencion,s.fechahma,s.Fecha as fechasis,
		s.FechaAlta as FechaAlta, ltrim(RTRIM(s.NDocumento)) as NDocumento,s.Historia
		,Lote, FUA, case s.IdProcedencia when 1 then 'CONSULTA EXTERNA' WHEN 2 THEN 'EMERGENCIA' ELSE 'HOSPITALIZACION' END AS Procedencia, s.IdProcedencia,
		 s.Disa, TFormato, NContrato, s.Prestacion,s.Componente, case Componente  when 1 then 'SIS GRATUITO' when 2 then 'SIS INDEPENDIENTE'  when 3 then 'SIS MICROEMPRESAS' when 4 THEN 'EMPRENDEDOR' END AS TSEGURO, 
		s.Establecimiento as IdEstablecimiento,es.Codigo as CodEstablecimiento, es.Establecimiento as Establecimiento, e.Descripcion as Especialidad,s.IdEspecialidad,
		 f.nombre as Profesional,s.IdProfesional, s.Prestacion as IdPrestacion,p.Codigo as CodPrestacion,s.habilitado,
		 u.Alias as Usuario, s.DU,isnull(f.COLEGIATURA,'') as COLEGIATURA ,s.Tipo,s.Turno,s.gestante,s.levantamiento,s.DU,s.Aval,s.Cama, s.Condicion,
		 S.Registro, IdUsuMod, s.RegMod, s.Condicion,s.Cama,s.idplan,s.Aval as AvalPres,s.Cama as CamaPres,s.Auditado as AuditadoPres,
		 s.Condicion as Condicionpres,s.TAlta as TAltaPres,s.FechaHMA  as FechaHMAPres,s.Alta as AltaPres
		   from SIS_Prestaciones S
		 left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
		 left join HMA.DBO.HMA_Profesionales f on  f.Id = s.IdProfesional
		  left join SIS_Prestacion p on p.Id=s.Prestacion
		   left join HMA_Establecimientos es on es.Id=s.Establecimiento
		 left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
		 --left join sis_hospitalizacion h on h.IdPrestaciones = s.id
		 where Historia=@historia and s.Prestacion=8 and s.estado=0 and Historia NOT IN ('1923247')
		 and DATEDIFF(dd,s.Fecha,GETDATE()) < 3
		 order by s.Id desc;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaPrestacionesHospitalizacionPorHistoriaYFecha]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaPrestacionesHospitalizacionPorHistoriaYFecha]
	-- Add the parameters for the stored procedure here
	@Historia char(7),
	@Fecha date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT p.Id, CONVERT(char(10), p.Fecha, 103) AS Fecha, p.TDocumento,
	CASE p.TDocumento WHEN 1 THEN 'CARNET DE EXTRANJERIA' WHEN 2 THEN 'DNI' WHEN 3 THEN 'SIN DOCUMENTO'
	WHEN 4 THEN 'HISTORIA' WHEN 5 THEN 'CEDULA' WHEN 6 THEN 'PTP' WHEN 7 THEN 'PASAPORTE'
	WHEN 8 THEN 'RECIEN NACIDO' END AS TipoDoc, p.NDocumento, p.Historia, h.Paciente, p.Lote, p.FUA,
	p.IdProcedencia, p.IdEspecialidad, p.IdProfesional, p.Cama
	FROM SIS_Prestaciones p
	LEFT JOIN HMA.dbo.ADM_Historia h on h.Historia = p.Historia
	WHERE p.Historia = @Historia AND MONTH(p.Fecha) = MONTH(@Fecha) AND YEAR(p.Fecha) = YEAR(@Fecha)
	AND p.IdProcedencia = 3
	ORDER BY p.Fecha DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaPrestacionesMontoMayorAuditado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaPrestacionesMontoMayorAuditado]
	-- Add the parameters for the stored procedure here
	@importemayor float,
	@fini date,
	@ffin date,
	@impreso bit,
	@idusuario int,
	@filtro int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	if @filtro =1
   begin
    -- Insert statements for procedure here
	select s.Id, case S.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, S.Historia, H.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso  from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	   left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)>@importemayor and 
	  convert(date,Fecha) between @fini and @ffin and Auditado=1 and Impreso=@impreso and S.IdUsuAuditado=@idusuario ORDER BY Paciente;
END
else
if @filtro =2
   
    -- Insert statements for procedure here
	select s.Id, case S.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, S.Historia, H.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso  from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	   left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)>@importemayor 
	  and convert(date,Fecha) between @fini and @ffin and Auditado=1 and Impreso=@impreso and S.IdUsuAuditado=@idusuario ORDER BY FechaCierre;
END


GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaPrestacionesMontoMenorAuditado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaPrestacionesMontoMenorAuditado]
	-- Add the parameters for the stored procedure here
	@importemenor float,
	@fini date,
	@ffin date,
	@impreso bit,
	@idusuario int,
	@filtro int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
		if @filtro =1
   begin
    -- Insert statements for procedure here
select s.Id, case S.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, S.Historia, H.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	      left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where isnull(  (select sum(Importe) 
	  from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)<@importemenor and convert(date,Fecha) between @fini and @ffin and Auditado=1 and Impreso=@impreso and 
	  S.IdUsuAuditado=@idusuario ORDER BY Paciente;
END
 else
 if @filtro =2
   
    -- Insert statements for procedure here
select s.Id, case  S.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, S.Historia, H.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	   left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Digita=0 and c.Fua=s.Fua),0)<@importemenor and 
	  convert(date,Fecha) between @fini and @ffin and Auditado=1 and Impreso=@impreso and S.IdUsuAuditado=@idusuario ORDER BY FechaCierre;
END


GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaRangoFechaAudiPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaRangoFechaAudiPrestaciones]
	-- Add the parameters for the stored procedure here
@fini date,
	@ffin date,
	@usuario int,
	@impreso bit,
	@filtro int,
	@procedencia int
AS
BEGIN
if @filtro =1
   begin
	select  case s.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, s.Historia, h.Paciente, Fecha, e.Descripcion as IdEspecialidad
	,u.Alias as Usuario,isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe, Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	   left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where convert(date,Fecha) between @fini and @ffin and Auditado=1 and s.IdUsuAuditado=@usuario and Impreso=@impreso and s.IdProcedencia=@procedencia and s.estado=0
	   GROUP BY s.IdProcedencia, Lote,Fua,s.Historia,h.Paciente,Fecha, e.Descripcion,u.Alias,Impreso ORDER BY Paciente ;
	end
else
if @filtro = 2
	 select  case s.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, s.Historia, h.Paciente, Fecha, e.Descripcion as IdEspecialidad,
	 u.Alias as Usuario,isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe, Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	    left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where convert(date,Fecha) between @fini and @ffin and Auditado=1 and s.IdUsuAuditado=@usuario and Impreso=@impreso  and s.IdProcedencia=@procedencia  and s.estado=0
	  GROUP BY s.IdProcedencia, Lote,Fua,s.Historia,h.Paciente,Fecha, e.Descripcion,u.Alias,Impreso,FechaCierre ORDER BY FechaCierre ;
end

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaRangoFechaFuaAudiUsuario]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaRangoFechaFuaAudiUsuario]
	-- Add the parameters for the stored procedure here
@fini date,
	@ffin date,
	@usuario int,
	@impreso bit,
	@filtro int,
	@procedencia int
AS
BEGIN
	
if @filtro =1
   begin
	select  case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad
	,u.Alias as Usuario,isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe, Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where Fecha between @fini and @ffin and Auditado=1 and IdUsuario=@usuario and Impreso=@impreso and Ingreso=@procedencia
	   GROUP BY Ingreso, Lote,Fua,Historia,Paciente,Fecha, e.Descripcion,u.Alias,Impreso ORDER BY Paciente ;
	end
else
if @filtro = 2
	 select  case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,
	 u.Alias as Usuario,isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe, Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where Fecha between @fini and @ffin and Auditado=1 and IdUsuario=@usuario and Impreso=@impreso  and Ingreso=@procedencia 
	  GROUP BY Ingreso, Lote,Fua,Historia,Paciente,Fecha, e.Descripcion,u.Alias,Impreso,FechaCierre ORDER BY FechaCierre ;
end

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaResultadoLab]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_BusquedaResultadoLab]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@codigo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id, Lote, Fua, Cod_Lab, cantidad, Idusuario, fechaRegistro from SIS_ResultadoLab where Lote=@lote and Fua=@fua and Cod_Lab=@codigo
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaServicioFUAudi]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaServicioFUAudi]
	-- Add the parameters for the stored procedure here
	@fini date,
	@ffin date,
	@servicio int,
	@impreso bit,
	@idusuario int,
	@filtro int
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @filtro =1
   begin
 
	select case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,  Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso  from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where Ingreso=@servicio and Fecha between @fini and @ffin  and Auditado=1 and Impreso=@impreso and IdUsuario=@idusuario   GROUP BY Ingreso, Lote,Fua,Historia,Paciente,Fecha, e.Descripcion,u.Alias,Impreso ORDER BY Paciente;
END 
else if @filtro=2
select  case Ingreso when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, Historia, Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,  Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso  from SIS_FUA s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuario
	  where Ingreso=@servicio and Fecha between @fini and @ffin  and Auditado=1 and Impreso=@impreso and IdUsuario=@idusuario  GROUP BY Ingreso, Lote,Fua,Historia,Paciente,Fecha, e.Descripcion,u.Alias,Impreso,FechaCierre ORDER BY FechaCierre;
end

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaServicioPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaServicioPrestaciones]
	-- Add the parameters for the stored procedure here
	@fini date,
	@ffin date,
	@servicio int,
	@impreso bit,
	@idusuario int,
	@filtro int
	
AS
BEGIN
	if @filtro =1
   begin
 
	select case S.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, S.Historia, H.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,  Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso  from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	     left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where S.IdProcedencia=@servicio and convert(date,Fecha) between @fini and @ffin  and Auditado=1 and Impreso=@impreso and S.IdUsuario=@idusuario   
	  GROUP BY S.IdProcedencia, Lote,Fua,S.Historia,H.Paciente,Fecha, e.Descripcion,u.Alias,Impreso ORDER BY Paciente;
END 
else if @filtro=2
select  case S.IdProcedencia when 1 then 'C' when 2 then 'E' when 3 then 'H' end as Ingreso, Lote, Fua, S.Historia, H.Paciente, Fecha, e.Descripcion as IdEspecialidad,u.Alias as Usuario,
	 isnull(  (select sum(Importe) from SIS_Consumo c where c.Lote=s.Lote and c.Fua=s.Fua and c.Digita=0 and c.Lote <> 0 and c.Fua <> 0),0) 
	 as Importe,  Case Impreso when 0 then 'NO' when 1 then 'SI' end as Impreso  from SIS_Prestaciones s
	  left join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	   left JOIN HMA.Dbo.Usu_Usuarios u on u.ID = s.IdUsuAuditado
	     left JOIN HMA.Dbo.ADM_Historia h on h.Historia= s.Historia
	  where S.IdProcedencia=@servicio and convert(date,Fecha) between @fini and @ffin  and Auditado=1 and Impreso=@impreso and S.IdUsuario=@idusuario  
	  GROUP BY S.IdProcedencia, Lote,Fua,S.Historia,H.Paciente,Fecha, e.Descripcion,u.Alias,Impreso,FechaCierre ORDER BY FechaCierre;
end



GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaTomografiaporCodigo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaTomografiaporCodigo]
	-- Add the parameters for the stored procedure here
	@CPT varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id, CPT, Descripcion, Precio, Categoria, RX, Tomografia, Estado from SIS_Tarifario 
	where 
	--(cpt='7125001' or cpt='70450') AND 
	CPT=@CPT and estado=0
	and id in (
	92,
98,
99,
100,
111,
117,
118,
136,
563,
564,
709,
761,
1337,
1348,
1354,
1424,
1539,
1551,
1552,
1553,
1563,
1577,
1578,
1583,
1584,
1586,
1587,
1589,
1590,
1602,
1603,
1615,
1616,
1617,
1618,
1619,
1628,
1650,
1666,
1670,
1671,
1692,
1697,
1717,
1788,
2415,
2494,
2495,
2496,
2497,
2498,
2499,
2500,
2501,
2502,
2503,
2504,
2505,
2506,
2522,
2523,
2528,
2529,
2532,
2534,
2535,
2536,
2537,
2538,
2539,
2540,
2541,
2542,
2543,
2544,
2545,
2560,
2561,
2562,
2563,
2564,
2565,
2566,
2567,
2568,
2569,
2582,
2583,
2584,
2593,
2594,
2599,
2641,
2642,
1585,
1588,
1601,
1649,
1665,
1816,
1817,
1840,
1846,
1849,
1865,
2593,
2594
	)
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaTomografiaporDescripcion]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_BusquedaTomografiaporDescripcion] 
	-- Add the parameters for the stored procedure here
	@descripcion varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id, CPT, Descripcion, Precio, Categoria, RX, Tomografia, Estado from SIS_Tarifario 
	where 
	--(cpt='7125001' or cpt='70450') AND 
	Descripcion like '%'+@descripcion+'%' and Estado=0
	and id in (
	92,
98,
99,
100,
111,
117,
118,
136,
563,
564,
709,
761,
1337,
1348,
1354,
1424,
1539,
1551,
1552,
1553,
1563,
1577,
1578,
1583,
1584,
1586,
1587,
1589,
1590,
1602,
1603,
1615,
1616,
1617,
1618,
1619,
1628,
1650,
1666,
1670,
1671,
1692,
1697,
1717,
1788,
2415,
2494,
2495,
2496,
2497,
2498,
2499,
2500,
2501,
2502,
2503,
2504,
2505,
2506,
2522,
2523,
2528,
2529,
2532,
2534,
2535,
2536,
2537,
2538,
2539,
2540,
2541,
2542,
2543,
2544,
2545,
2560,
2561,
2562,
2563,
2564,
2565,
2566,
2567,
2568,
2569,
2582,
2583,
2584,
2593,
2594,
2599,
2641,
2642,
1585,
1588,
1601,
1649,
1665,
1816,
1817,
1840,
1846,
1849,
1865,
2593,
2594
	)
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_BusquedaWebservicexDNI]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--[SIS_BusquedaWebservicexDNI] '45469793','09/03/2020'
CREATE PROCEDURE [dbo].[SIS_BusquedaWebservicexDNI]
	-- Add the parameters for the stored procedure here
	@dni VARCHAR(50),
	@fecha date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 1 s.Id, Fecha, Registro, DNIConsulta, ApeMaterno, ApePaterno, Contrato, Correlativo, DescEESS, DescEESSUbigeo,
	DescTipoSeguro, s.Direccion, s.Disa, EESS,es.Id as IdEstablecimiento, EESSUbigeo, s.Estado, FecAfiliacion, FecCaducidad, FecNacimiento, Genero, IdError,
	 IdGrupoPoblacional, IdNumReg, IdPlan, IdUbigeo, MsgConfidencial, Nombres, NroContrato, NroDocumento, Regimen, 
	 Resultado, Tabla, TipoDocumento, TipoFormato, TipoSeguro from SIS_ConsultaWService s
	  left join HMA_Establecimientos es on es.Codigo=s.EESS
	 where DNIConsulta=@dni and Fecha=@fecha
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_CerrarFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_CerrarFua]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@idusuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_FUA set Auditado=1, IdUsuario=@idusuario,FechaCierre=GETDATE() where Lote=@lote and Fua=@fua
end

GO
/****** Object:  StoredProcedure [dbo].[SIS_CerrarFUAPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_CerrarFUAPrestaciones]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@idusuario int,
	@ingreso int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @valor int =0;

	select @valor=Fua from SIS_FUAAUDITADOS where Lote=@lote and Fua=@fua;  

	if(@valor!=0) begin
	update SIS_FUAAUDITADOS set Auditado=1,Registro=GETDATE(),UsuAudita=@idusuario,Ingreso=@ingreso where Lote=@lote and Fua=@fua
	end
	else
	begin
	INSERT INTO SIS_FUAAUDITADOS(Lote,Fua,UsuAudita,Ingreso) values(@lote,@fua,@idusuario,@ingreso);
	end
    
	
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ConsumoporFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ConsumoporFua] 
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select Fecha,Caja,Codigo,Item,Cantidad,Precio,Importe from SIS_Consumo 

	where 
	Lote=@lote and Fua=@fua and Estado=0

END
GO
/****** Object:  StoredProcedure [dbo].[SIS_CualiCuantiConsumoProcedimiento]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_CualiCuantiConsumoProcedimiento]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT       c.Id, CPT,s.Codigo , SISMED, c.ITEM, c.CANTIDAD, s.caja
FROM            SIS_Cualicuanti c inner join SIS_Consumo s on s.Caja=3 and c.CPT=s.Codigo where s.Lote=@lote and s.Fua=@fua;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_DatoSisNumeracion]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_DatoSisNumeracion]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 1 s.Fin,  p.FUA from sis_numeracion s left join SIS_Prestaciones p on s.Fin<=p.FUA where S.Fin<=p.Fua and p.Lote=20 and p.estado=0 and p.migracion=0 order by p.Fua desc;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_DatospersonalMedico]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_DatospersonalMedico]
	-- Add the parameters for the stored procedure here
	@dni varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id, CODPSAL, DOC, FNacimiento, NOMBRE, PATERNO, MATERNO, NOMBRES, Sexo, COD_PROF, IdProfesion, COLEGIATURA,
	 DOCUMENTO, PLAZA, IDESP, FECHA_ING, FECHA_BAJA, COD_COL, CONDICION, ESTADO, USU_ING, USU_BAJA, Registro
	  from hma.dbo.HMA_Profesionales
	   where DOCUMENTO=@dni
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_EditarDiagnostico]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_EditarDiagnostico]
	@id int,
	@orden int,
	@digita bit,
	@total int,
	@tipo char(1)
AS
BEGIN
	
	SET NOCOUNT ON;
	declare @dato int =0;
	declare @lote int
	declare @fua int
	declare @dig bit =0;

	select @lote=lote,@fua=fua,@dig=Digita from SIS_SeguroDiagnostico where id_diagnostico=@id
	
	 if @tipo<>''
		update  SIS_SeguroDiagnostico set Tipo=@tipo where id_diagnostico=@id

	 if  @dig<>@digita
		update  SIS_SeguroDiagnostico set Digita=@digita where id_diagnostico=@id
	

   if @total=0
   begin
	update SIS_SeguroDiagnostico set @dato=Orden= @dato+1 where  lote=@lote and fua=@fua and estado=0  and Digita=0;
   end
   else
   begin
    update  SIS_SeguroDiagnostico set Orden=@orden where id_diagnostico=@id
   end
   

END
GO
/****** Object:  StoredProcedure [dbo].[SIS_EliminarAlta]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_EliminarAlta] 
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@idusuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_Prestaciones set Alta=0,FechaAlta='1900-01-01 00:00:00.000', 
	IdUsuAltaMod=@idusuario,RegAltaMod=GETDATE() WHERE Lote=@lote and Fua=@fua and IdProcedencia=3 
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_EliminarConsumoFarmacia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_EliminarConsumoFarmacia]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	DELETE FROM SIS_Consumo WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_EliminarConsumoFarmaciaPorLoteYFUA]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_EliminarConsumoFarmaciaPorLoteYFUA]
	-- Add the parameters for the stored procedure here
	@Lote int,
	@FUA int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	DELETE FROM SIS_Consumo WHERE Lote = @Lote AND Fua = @FUA
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_EliminarConsumoTicketDet]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_EliminarConsumoTicketDet]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from SIS_ConsumoTicketDet where Id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_EliminarDiagnostico]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SIS_EliminarDiagnostico 881,1;
CREATE PROCEDURE [dbo].[SIS_EliminarDiagnostico]
	-- Add the parameters for the stored procedure here
	@id int,
	@idusuario int =0
AS
BEGIN
	
	SET NOCOUNT ON;
	declare @lote int
	declare @fua int
	declare @dato int =0;
    select @lote=lote,@fua=fua from SIS_SeguroDiagnostico where id_diagnostico=@id

	update  SIS_SeguroDiagnostico set Estado=1,Reg_Anula=getdate(),UsuAnula=@idusuario where id_diagnostico=@id

	select @dato=d.sv_Num_Item 
			from db_sighoshsb.dbo.SV_SIS_ATENCION_DIAG d
			inner join db_sighoshsb.dbo.SV_SIS_FILIACION f on d.sv_Num_Oper collate modern_spanish_ci_as =f.sv_Num_Oper collate modern_spanish_ci_as and d.sg_Est_Registro!='*' 
			where f.sv_Num_Fua_Corr=@fua and f.sv_Num_FUA_Lote=@lote 
 
	
	select id_diagnostico 
	into #temp
	from SIS_SeguroDiagnostico 
	where  lote=@lote and fua=@fua and estado=0 and Digita=0 order by Orden asc; 

	DECLARE @ID_DIAG INT=0;

	DECLARE AUXILIAR CURSOR FOR SELECT id_diagnostico FROM #temp
	OPEN AUXILIAR
	FETCH NEXT FROM AUXILIAR INTO @ID_DIAG

	WHILE @@FETCH_STATUS =0
	BEGIN
		
		UPDATE SIS_SeguroDiagnostico SET @dato=Orden= @dato+1 WHERE id_diagnostico=@ID_DIAG
		FETCH NEXT FROM AUXILIAR INTO @ID_DIAG
	END

end


 
GO
/****** Object:  StoredProcedure [dbo].[SIS_EliminarPacienteRestringido]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_EliminarPacienteRestringido] 
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_PacientesRestringidos set Estado=1 where Id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_EliminarRegistroPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_EliminarRegistroPrestaciones]
	-- Add the parameters for the stored procedure here
	@id int,
	@idusuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE SIS_Prestaciones SET estado=1, IdUsuAnula=@idusuario,RegAnula=GETDATE() where Id=@id;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarBusquedaConsumo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarBusquedaConsumo]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select c.Id, t.Tomografia, c.Fecha,c.Lote,c.Fua,c.IdUsuario,usu.Alias,C.Especialidad as IdEspecialidad,es.Descripcion as Especialidad from SIS_ConsumoTicket c 
	left join SIS_TOMOGRAFIA t on c.Id=t.IdTomografia
	left join hma.dbo.Usu_Usuarios usu on c.IdUsuario=usu.ID
	left join hma.dbo.HMA_Especialidad es on c.Especialidad=es.Id
	 where c.Lote=@lote and c.Fua=@fua and c.Anulado=0
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarBusquedaConsumoTicket]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarBusquedaConsumoTicket]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select dc.Id, c.Fecha,c.Lote,c.Fua,dc.CPT,SUBSTRING(t.Descripcion,0,100) as Descripcion ,dc.Cantidad,dc.Precio,dc.Importe,dc.Codigo
	 from SIS_ConsumoTicket c 
	inner join SIS_ConsumoTicketDet dc on c.Id=dc.Codigo
	left join SIS_Tarifario t on dc.CPT=t.CPT
	 where c.Lote=@lote and c.Fua=@fua and Anulado=0 and dc.Codigo=@id
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarCIE10CPT]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarCIE10CPT]
-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  Id, Codigo, Descripcion from 
	SIS_DIAGNOSTICO where Estado=0 
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarCIE10CPTporCodigo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarCIE10CPTporCodigo] 
	-- Add the parameters for the stored procedure here
	@codigo varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  Codigo AS Id, Descripcion 
	from SIS_DIAGNOSTICO 
	where Codigo=@codigo
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarCIE10XID]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarCIE10XID]
	-- Add the parameters for the stored procedure here
	@codigo int,
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id_diagnostico FROM SIS_SeguroDiagnostico WHERE Codigo=@codigo and lote=@lote  and fua=@fua;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarCptConsumoTicket]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarCptConsumoTicket]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@cpt varchar(50),
	@codigo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select cpt from SIS_ConsumoTicket c 
	inner join SIS_ConsumoTicketDet t on c.Id=t.Codigo 
	where c.Lote=@lote and c.FUA=@fua and t.CPT=@cpt and Codigo=@codigo

END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarDiagnosticoPorFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC [dbo].[SIS_FiltrarDiagnosticoPorFua] '22','22707','1'
CREATE PROCEDURE [dbo].[SIS_FiltrarDiagnosticoPorFua]	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@tipo char(1)
AS
BEGIN
	
	SET NOCOUNT ON;

	begin

	select d.id_diagnostico as Id
		, d.Codigo  as Codigo
		, isnull(SD.Descripcion, ltrim(rtrim(replace(upper(c.gt_Des_Cie), '"','') ))  collate modern_spanish_ci_as )  as Descripcion 
		, d.Tipo   AS TIPO
		, '' as id_diagnostico, d.Orden as Orden, 0 as Tipo2
		, d.Digita , case when SD.Codigo=null then 0 else 1 end as mmatch
	from SIS_SeguroDiagnostico d 
	left join SIS_DIAGNOSTICO SD ON SD.Codigo= d.Codigo and SD.Estado=0
	inner join db_sighoshsb.dbo.GT_CIE10 c on c.gt_Cod_Cie collate modern_spanish_ci_as=d.Codigo 


	where d.fua=@fua and d.lote=@lote  and d.Estado=0 

	ORDER BY 6
	end
	
END




GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarDiagnosticoPorFua1]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC [dbo].[SIS_FiltrarDiagnosticoPorFua] '21','6032466','1'
CREATE PROCEDURE [dbo].[SIS_FiltrarDiagnosticoPorFua1]	-- Add the parameters for the stored procedure here
	@lote char(2),
	@fua int,
	@tipo char(1)
AS
BEGIN
	
	SET NOCOUNT ON;

	begin

	select d.id_diagnostico as Id
		, d.Codigo  collate modern_spanish_ci_as as Codigo
		, ltrim(rtrim(replace(upper(c.gt_Des_Cie), '"','') ))  collate modern_spanish_ci_as as Descripcion 
		, d.Tipo  collate modern_spanish_ci_as  AS TIPO
		, '' as id_diagnostico, d.Orden as Orden, 0 as Tipo2
		, d.Digita 
	from SIS_SeguroDiagnostico d 
	inner join db_sighoshsb.dbo.GT_CIE10 c on c.gt_Cod_Cie collate modern_spanish_ci_as=d.Codigo  collate modern_spanish_ci_as
	where d.fua=@fua and d.lote=@lote  and d.Estado=0 AND Digita=0

	ORDER BY 6
	end
	
END




GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarEspecialidadxProcedencia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarEspecialidadxProcedencia] 
	-- Add the parameters for the stored procedure here
	@procedencia int,
	@especialidad varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select distinct e.Descripcion as Especialidad,s.IdEspecialidad from SIS_FUA s 
  inner join HMA.DBO.HMA_Especialidad e on e.Id=s.IdEspecialidad
	 where Ingreso=@procedencia and e.Descripcion like '%'+@especialidad+'%'
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarEstablecimientoxCodigo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarEstablecimientoxCodigo] 
	-- Add the parameters for the stored procedure here
	@codigo char(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id,Codigo,Establecimiento from HMA_Establecimientos where Codigo=@codigo and Institucion='MINSA'
	END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarEstablecimientoxDescripcion]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarEstablecimientoxDescripcion] 
	-- Add the parameters for the stored procedure here
	@Descripcion varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 20 Codigo,Establecimiento,Id from HMA_Establecimientos
where Establecimiento like '%'+@Descripcion+'%' and (Institucion='MINSA' or Institucion='GOBIERNO REGIONAL')
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarHistoriaPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarHistoriaPrestaciones] 
	-- Add the parameters for the stored procedure here
	@historia varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select NDocumento,Historia from SIS_Prestaciones where Historia=@historia
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarIdConsumoTicket]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarIdConsumoTicket]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@idusuario int,
	@especialidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select max(Id) as Id from SIS_ConsumoTicket where Lote=@lote and Fua=@fua and Especialidad=@especialidad and IdUsuario=@idusuario;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarPrestacionesporPrestacionyAlta]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarPrestacionesporPrestacionyAlta]
	-- Add the parameters for the stored procedure here
	@codigo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select s.Id, Fecha, Alta, TDocumento, s.NDocumento, s.Historia, Lote, FUA, case s.IdProcedencia when 1 then 'C' when 2 THEN 'E'
	when 3 then 'H' end Procedencia,s.IdProcedencia, Disa, TFormato, NContrato, Turno, Tipo, his.Paciente as Paciente,
	Prestacion,pre.Codigo as CodPresta, Componente, Establecimiento, s.IdEspecialidad,es.Descripcion as Especialidad, IdProfesional, s.IdUsuario, s.Registro, s.IdUsuMod, s.RegMod, gestante, levantamiento,
	 s.estado, habilitado, rec_habi, idplan, du, FechaAlta, IdusuAlta, Aval, Auditado, Condicion, TAlta, Cama, RegistroFAlta, IdUsuAltaMod, 
	 FechaHMA, RegAltaMod, Masiva, FMasiva, IdUsuAnula, RegAnula, IdUsuHabi, IdRetAnula, RegRetiAnula, FechaCierre,
	  FechaImpresion, IdQuitaAudi, RegQuitaAudi, IdUsuQuitaAnula, RegUsuQuitaAnula, IdAtencion, IdUsuAuditado 
	  from SIS_Prestaciones S
	  inner join hma.dbo.ADM_Historia his on his.Historia=s.Historia
	   left join hma.dbo.HMA_Especialidad es on es.Id=s.IdEspecialidad
	   inner join SIS_Prestacion pre on pre.Id=s.Prestacion
	  where Prestacion=@codigo and Alta=0 and s.estado=0
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarTarifarioxCPT]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarTarifarioxCPT]
	-- Add the parameters for the stored procedure here
	@cpt char(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id, CPT, Descripcion, Precio, Categoria, RX from SIS_Tarifario where CPT=@cpt;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FiltrarTarifarioxNombre]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_FiltrarTarifarioxNombre] 
	-- Add the parameters for the stored procedure here
	@item varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 50 Id, CPT, Descripcion, Precio, Categoria, RX from SIS_Tarifario
where Descripcion like '%'+@item+'%'
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_FuaConsumoActualizacion]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_FuaConsumoActualizacion]
	-- Add the parameters for the stored procedure here
	@idusuario int,
	@lote int,
	@fua int,
	@nlote int,
	@nfua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert SIS_ConsumoFua(IdUsuario,Lote_antiguo,Fua_antiguo,Lote_nuevo,Fua_nuevo) values(@idusuario,@lote,@fua,@nlote,@nfua)
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_GrabarAnaPatologica]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_GrabarAnaPatologica]
	-- Add the parameters for the stored procedure here
 @Fecha date, 
	 @Codigo varchar(50) , 
	 @Item varchar(350),
	 @Unidad varchar(10), 
	  @Cantidad int,
	   @Precio float, 
	   @Importe float, 
	   @Cie10 int, 
	   @Digita bit,
	    @Lote int, 
		@Fua int,
		@sismed varchar(30),
		@idusuario int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_Consumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,Sismed,IdUsuario) 
	values(@Fecha,@Codigo,@Item,@Unidad,@Cantidad,@Precio,@Importe,@cie10,@Digita,@Lote,@fua,6,@sismed,@idusuario);
END


GO
/****** Object:  StoredProcedure [dbo].[SIS_GrabarBSangre]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_GrabarBSangre]
	-- Add the parameters for the stored procedure here
 @Fecha date, 
	 @Codigo varchar(50) , 
	 @Item varchar(350),
	 @Unidad varchar(10), 
	  @Cantidad int,
	   @Precio float, 
	   @Importe float, 
	   @Cie10 int, 
	   @Digita bit,
	    @Lote int, 
		@Fua int,
		@sismed varchar(30),
		@idusuario int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_Consumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,Sismed,IdUsuario,CPT) 
	values(@Fecha,ltrim(rtrim(@Codigo)),@Item,@Unidad,@Cantidad,@Precio,@Importe,@cie10,@Digita,@Lote,@fua,5,@sismed,@idusuario,@Codigo);
END


GO
/****** Object:  StoredProcedure [dbo].[SIS_GrabarEcoGineco]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_GrabarEcoGineco]
	-- Add the parameters for the stored procedure here
 @Fecha date, 
	 @Codigo varchar(50) , 
	 @Item varchar(350),
	 @Unidad varchar(10), 
	  @Cantidad int,
	   @Precio float, 
	   @Importe float, 
	   @Cie10 int, 
	   @Digita bit,
	    @Lote int, 
		@Fua int,
		@sismed varchar(30),
		@idusuario int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_Consumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,Sismed,IdUsuario) 
	values(@Fecha,@Codigo,@Item,@Unidad,@Cantidad,@Precio,@Importe,@cie10,@Digita,@Lote,@fua,7,@sismed,@idusuario);
END


GO
/****** Object:  StoredProcedure [dbo].[SIS_GrabarFarmacia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_GrabarFarmacia]
	-- Add the parameters for the stored procedure here
	 @Fecha date, 
	 @Codigo varchar(50) , 
	 @Item varchar(350),
	 @Unidad varchar(10), 
	  @Cantidad int,
	   @Precio float, 
	   @Importe float, 
	   @Cie10 int, 
	   @Digita bit,
	    @Lote int, 
		@Fua int,
		@sismed varchar(30),
		@idusuario int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_Consumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,Sismed,IdUsuario) 
	values(@Fecha,@Codigo,@Item,@Unidad,@Cantidad,@Precio,@Importe,@cie10,@Digita,@Lote,@fua,1,@sismed,@idusuario);
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_GrabarHistorial]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_GrabarHistorial]
	-- Add the parameters for the stored procedure here
 @Fecha date, 
	 @Codigo varchar(50) , 
	 @Item varchar(350),
	 @Unidad varchar(10), 
	  @Cantidad int,
	   @Precio float, 
	   @Importe float, 
	   @Cie10 int, 
	   @Digita bit,
	    @Lote int, 
		@Fua int,
		@sismed varchar(30),
		@caja int,
		@estado bit,
		@Idusuario int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_HistorialConsumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,Sismed,Estado,IdUsuario) 
	values(@Fecha,@Codigo,@Item,@Unidad,@Cantidad,@Precio,@Importe,@cie10,@Digita,@Lote,@fua,@caja,@sismed,@estado,@Idusuario);
END


GO
/****** Object:  StoredProcedure [dbo].[SIS_GrabarLaboratorio]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_GrabarLaboratorio]
	-- Add the parameters for the stored procedure here
	 @Fecha date, 
	 @Codigo varchar(50) , 
	 @Item varchar(350),
	 @Unidad varchar(10), 
	  @Cantidad int,
	   @Precio float, 
	   @Importe float, 
	   @Cie10 int, 
	   @Digita bit,
	    @Lote int, 
		@Fua int,
		@sismed varchar(30),
		@idusuario int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_Consumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,Sismed,IdUsuario,CPT) 
	values(@Fecha,@Codigo,@Item,@Unidad,@Cantidad,@Precio,@Importe,@cie10,@Digita,@Lote,@fua,2,@sismed,@idusuario,@Codigo);
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_GrabarProcedimiento]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_GrabarProcedimiento]
	-- Add the parameters for the stored procedure here
	 @Fecha date, 
	 @Codigo varchar(50) , 
	 @Item varchar(350),
	 @Unidad varchar(10), 
	  @Cantidad int,
	   @Precio float, 
	   @Importe float, 
	   @Cie10 int, 
	   @Digita bit,
	    @Lote int, 
		@Fua int,
		@sismed varchar(30),
		@idusuario int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_Consumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,Sismed,Idusuario,CPT) 
	values(@Fecha,@Codigo,@Item,@Unidad,@Cantidad,@Precio,@Importe,@cie10,@Digita,@Lote,@fua,3,@sismed,@idusuario,@Codigo);
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_GrabarRadioEcografia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_GrabarRadioEcografia]
	-- Add the parameters for the stored procedure here
 @Fecha date, 
	 @Codigo varchar(50) , 
	 @Item varchar(350),
	 @Unidad varchar(10), 
	  @Cantidad int,
	   @Precio float, 
	   @Importe float, 
	   @Cie10 int, 
	   @Digita bit,
	    @Lote int, 
		@Fua int,
		@sismed varchar(30),
		@idusuario int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_Consumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,Sismed,IdUsuario,CPT) 
	values(@Fecha,@Codigo,@Item,@Unidad,@Cantidad,@Precio,@Importe,@cie10,@Digita,@Lote,@fua,8,@sismed,@idusuario,@Codigo);
END


GO
/****** Object:  StoredProcedure [dbo].[SIS_GrabarRadiologia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_GrabarRadiologia]
	-- Add the parameters for the stored procedure here
 @Fecha date, 
	 @Codigo varchar(50) , 
	 @Item varchar(350),
	 @Unidad varchar(10), 
	  @Cantidad int,
	   @Precio float, 
	   @Importe float, 
	   @Cie10 int, 
	   @Digita bit,
	    @Lote int, 
		@Fua int,
		@sismed varchar(30),
		@idusuario int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_Consumo(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja,Sismed,IdUsuario) 
	values(@Fecha,@Codigo,@Item,@Unidad,@Cantidad,@Precio,@Importe,@cie10,@Digita,@Lote,@fua,4,@sismed,@idusuario);
END


GO
/****** Object:  StoredProcedure [dbo].[SIS_GrabarTrama]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_GrabarTrama]
	-- Add the parameters for the stored procedure here
	@lote varchar(2),
	@fua varchar(8),
	@cprestacion varchar(3),
	@observaciones varchar(250),
	@especialidad int,
	@fecha date,
	@falta date,
	@tdoc int,
	@dni varchar(10),
	@apate varchar(40),
	@amate varchar(40),
	@nombre varchar(35),
	@onombre varchar(35),
	@rdisa char(3),
	@rlote char(2),
	@rnumero char(10),
	@idconve int,
	@compo int,
	@dformato int,
	@ninscri int,
	@ctabla varchar(1),
	@cidenti int,
	@cplan int,
	@cpobla int,
	@fnaci date,
	@idsexo int,
	@ubigeo int,
	@historia varchar(20),
	@tatencion int,
	@smaterna int,
	@matencion int,
	@nauto varchar(15),
	@monto int,
	@fatencion date,
	@irefe varchar(10),
	@nrefe varchar(20),
	@patiende int,
	@latencion int,
	@destino INT,
	@idestino varchar(20),
	@nrefcon varchar(50),
	@fpparto date,
	@hvb int,
	@ieducativa int,
	@neducativo int,
	@geducativo varchar(30),
	@seducativo int,
	@teducativo int,
	@eespecial int,
	@anexoiiee date,
	@fallecimiento varchar(8),
	@coflexible varchar(10),
	@idetnia varchar(2),
	@idiafas varchar(20),
	@csiafa varchar(6),
	@idups varchar(10),
	@fcadmin varchar(3),
	@udraufua varchar(2),
	@laufua varchar(6),
	@saufua varchar(3),
	@dfuavinculado varchar(3),
	@tdocr varchar(10),
	@ndocr int,
	@tpersonal varchar(9),
	@egresado int,
	@colegiatura int,
	@num_cole int,
	@rne int,
	@periodo int,
	@mes int,
	@codestable varchar(20),
	@establecimiento varchar(200),
	@num_oper char(10),
	@dlote varchar(50),
	@dnumero int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if not exists(select Numero,Lote from SIS_Trama where Numero=@fua and Lote=@lote)
	
	begin

	insert into SIS_Trama(Lote,Numero,Observacion,CPrestacional,Especialidad,FIngreso,FAlta, TDocumento,NDocumento,APaterno,AMaterno,PNombre,ONombres,RDisa,RLote,RNumero,IdConvenio,Componente,
	DFormato,DLote,DNumero,NInscripcion,CTabla,CIdentificador,CPlan,CPoblacional,FNacimiento,IdSexo,Ubigeo,Historia,TAtencion,SMaterna,MAtencion,NAutorizacion,Monto,FAtencion,IReferencia,
	NReferencia,PAtiende,LAtencion,Destino,IDestino,NRefConD,FPParto,HVB,IEducativa,NEducativo,GEducativo,SEducativo,TEducativo,EEspecial,AnexoIIEE,FFallecimiento,COFlexible,IdEtnia,IdIAFAS,
	CSIAFA,IdUps,FCAdministrativo,UDRAutorizaFUA,LAutorizaFUA,SAutorizaFUA,DFUAVinculado,TDocumentoR,NDocumentoR,TPersonal,Egresado,Colegiatura,RNE,Periodo,Mes,codestablecimiento,
	establecimiento,sv_num_oper) 
	values(@lote,@fua,@observaciones,@cprestacion,@especialidad,@fecha,@falta,@tdoc,@dni,@apate,@amate,@nombre,@onombre,@rdisa,@rlote,@rnumero,@idconve,@compo,@dformato,@dlote,@dnumero,
	@ninscri,@ctabla,@cidenti,@cplan,@cpobla,@fnaci,@idsexo,@ubigeo,@historia,@tatencion,@smaterna,@matencion,@nauto,@monto,@fatencion,@irefe,@nrefe,@patiende,@latencion,@destino,@idestino,
	@nrefcon,@fpparto,@hvb,@ieducativa,@neducativo,@geducativo,@seducativo,@teducativo,@eespecial,@anexoiiee,@fallecimiento,@coflexible,@idetnia,@idiafas,@csiafa,@idups,@fcadmin,@udraufua,
	@laufua,@saufua,@dfuavinculado,@tdocr,@ndocr,@tpersonal,@egresado,@colegiatura,@rne,@periodo,@mes,@codestable,@establecimiento,@num_oper)

	end
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_GrabarTrama1]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_GrabarTrama1] 
	-- Add the parameters for the stored procedure here
	@lote varchar(2),
	@fua varchar(8),
	@cprestacion varchar(3),
	@observaciones varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_Trama1(Lote,Numero,Observacion,CPrestacional) values(@lote,@fua,@observaciones,@cprestacion)
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_GrabarTrama2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_GrabarTrama2]
	-- Add the parameters for the stored procedure here
	@lote varchar(2),
	@fua varchar(8),
	@cprestacion varchar(3),
	@observaciones varchar(250),
	@especialidad int,
	@fecha date,
	@falta date,
	@tdoc int,
	@dni varchar(10),
	@apate varchar(40),
	@amate varchar(40),
	@nombre varchar(35),
	@onombre varchar(35),
	@rdisa char(3),
	@rlote char(2),
	@rnumero char(10),
	@idconve int,
	@compo int,
	@dformato int,
	@ninscri int,
	@ctabla varchar(1),
	@cidenti int,
	@cplan int,
	@cpobla int,
	@fnaci date,
	@idsexo int,
	@ubigeo int,
	@historia varchar(20),
	@tatencion int,
	@smaterna int,
	@matencion int,
	@nauto varchar(15),
	@monto int,
	@fatencion date,
	@irefe varchar(8),
	@nrefe varchar(20),
	@patiende int,
	@latencion int,
	@destino INT,
	@idestino varchar(20),
	@nrefcon varchar(50),
	@fpparto date,
	@hvb int,
	@ieducativa int,
	@neducativo int,
	@geducativo varchar(30),
	@seducativo int,
	@teducativo int,
	@eespecial int,
	@anexoiiee date,
	@fallecimiento varchar(8),
	@coflexible varchar(10),
	@idetnia varchar(2),
	@idiafas varchar(20),
	@csiafa varchar(6),
	@idups varchar(10),
	@fcadmin varchar(3),
	@udraufua varchar(2),
	@laufua varchar(6),
	@saufua varchar(3),
	@dfuavinculado varchar(3),
	@tdocr varchar(10),
	@ndocr int,
	@tpersonal varchar(9),
	@egresado int,
	@colegiatura int,
	@num_cole int,
	@rne int,
	@periodo int,
	@mes int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_Trama1(Lote,Numero,Observacion,CPrestacional,Especialidad,FIngreso,FAlta, TDocumento,NDocumento,APaterno,AMaterno,PNombre,
	ONombres,RDisa,RLote,RNumero,IdConvenio,Componente,DFormato,NInscripcion,CTabla,CIdentificador,CPlan,CPoblacional,FNacimiento,IdSexo,Ubigeo,Historia,
	TAtencion,SMaterna,MAtencion,NAutorizacion,Monto,FAtencion,IReferencia,NReferencia,PAtiende,LAtencion,Destino,IDestino,NRefConD,
	FPParto,HVB,IEducativa,NEducativo,GEducativo,SEducativo,TEducativo,EEspecial,AnexoIIEE,FFallecimiento,COFlexible,IdEtnia,IdIAFAS,CSIAFA,
	IdUps,FCAdministrativo,UDRAutorizaFUA,LAutorizaFUA,SAutorizaFUA,DFUAVinculado,TDocumentoR,NDocumentoR,TPersonal,Egresado,Colegiatura,RNE,Periodo,Mes) 
	values(@lote,@fua,@observaciones,@cprestacion,@especialidad,@fecha,@falta,@tdoc,@dni,@apate,@amate,@nombre,@onombre,@rdisa,@rlote,@rnumero,@idconve,@compo,
	@dformato,@ninscri,@ctabla,@cidenti,@cplan,@cpobla,@fnaci,@idsexo,@ubigeo,@historia,@tatencion,@smaterna,@matencion,@nauto,@monto,@fatencion,@irefe,@nrefe,
	@patiende,@latencion,@destino,@idestino,@nrefcon,@fpparto,@hvb,@ieducativa,@neducativo,@geducativo,@seducativo,@teducativo,@eespecial,@anexoiiee,@fallecimiento,
	@coflexible,@idetnia,@idiafas,@csiafa,@idups,@fcadmin,@udraufua,@laufua,@saufua,@dfuavinculado,@tdocr,@ndocr,@tpersonal,@egresado,@colegiatura,@rne,@periodo,@mes)
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_GuardarConsumo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from sis_lab_perfiles
CREATE proc [dbo].[SIS_GuardarConsumo]
@Fecha date, 
@Codigo varchar(50), 
@Item varchar(50), 
@Unidad varchar(50), 
@Cantidad int, 
@Precio decimal(18,2), 
@Importe  decimal(18,2), 
@Cie10 int, 
@Digita int, 
@Lote int, 
@Fua int, 
@Caja int
as

declare @r int  = 0

if (@Caja = 2)
begin
	SELECT @r  = 0

	if (@Codigo = (select top 1 codigo from sis_lab_perfiles where codigo = @Codigo))
	begin
		select @r = 1 from SIS_Consumo where codigo = @Codigo and fua = @Fua and lote = @Lote and Fecha = @Fecha
		if (@r = 0)
		begin
			insert into SIS_Consumo 
			(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja)
			select  @Fecha, cpt, examen, 'UND', 1, precio, precio, 1, 0, @Lote, @Fua, 2 from sis_lab_perfiles
			where codigo = @Codigo

			insert into SIS_Consumo 
		   (Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja)
		   values (@Fecha, @Codigo, @Item, @Unidad, @Cantidad, @Precio, @Importe, 1, 1, @Lote, @Fua, @Caja)
	    end
	end
	else

	select @r = 1 from SIS_Consumo where codigo = @Codigo and fua = @Fua and lote = @Lote and Fecha = @Fecha

	if (@r = 0)
	begin
		insert into SIS_Consumo 
		(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja)
		values (@Fecha, @Codigo, @Item, @Unidad, @Cantidad, @Precio, @Importe, 1, @Digita, @Lote, @Fua, @Caja)
	end
end
else
if (@Caja = 1)
begin
	SELECT @r  = 0

	select @r = 1 from SIS_Consumo where codigo = @Codigo and fua = @Fua and lote = @Lote and Fecha = @Fecha
	if (@r = 0)

	begin
		insert into SIS_Consumo 
		(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja)
		values (@Fecha, @Codigo, @Item, @Unidad, @Cantidad, @Precio, @Importe, 1, @Digita, @Lote, @Fua, @Caja)
	END
end

ELSE

if (@Caja = 3)
begin
	select @r = 1 from SIS_Consumo where codigo = @Codigo and fua = @Fua and lote = @Lote and Fecha = @Fecha

	if (@r = 0)
	begin
		insert into SIS_Consumo 
		(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja)
		values (@Fecha, @Codigo, @Item, @Unidad, @Cantidad, @Precio, @Importe, 1, @Digita, @Lote, @Fua, @Caja)
	end
end

ELSE


if (@Caja = 4)
begin
	select @r = 1 from SIS_Consumo where codigo = @Codigo and fua = @Fua and lote = @Lote and Fecha = @Fecha

	if (@r = 0)
	begin
		insert into SIS_Consumo 
		(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja)
		values (@Fecha, @Codigo, @Item, @Unidad, @Cantidad, @Precio, @Importe, 1, @Digita, @Lote, @Fua, @Caja)
	end
end

else

if (@Caja = 5)
begin
	select @r = 1 from SIS_Consumo where codigo = @Codigo and fua = @Fua and lote = @Lote and Fecha = @Fecha

	if (@r = 0)
	begin
		insert into SIS_Consumo 
		(Fecha, Codigo, Item, Unidad, Cantidad, Precio, Importe, Cie10, Digita, Lote, Fua, Caja)
		values (@Fecha, @Codigo, @Item, @Unidad, @Cantidad, @Precio, @Importe, 1, @Digita, @Lote, @Fua, @Caja)
	end
end




GO
/****** Object:  StoredProcedure [dbo].[SIS_GuardarDiagnosticoFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_GuardarDiagnosticoFua] 
	-- Add the parameters for the stored procedure here
	@idusuario int,
	@lote int,
	@fua int,
	@nlote int,
	@nfua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert SIS_DiagnosticoFua(IdUsuario,Lote_antiguo,Fua_antiguo,Lote_nuevo,Fua_nuevo) values(@idusuario,@lote,@fua,@nlote,@nfua)
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_GuardarHospitalizacion]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SIS_GuardarHospitalizacion]
@IdPrestaciones int, 
@FechaHMA date, 
@FechaSIS date, 
@IdProcedencia int, 
@Prestacion varchar(50), 
@Auditado int, 
@Cama varchar(50), 
@FAlta date, 
@TAlta int, 
@Aval int, 
@Condicion int
as
insert into [dbo].[SIS_Hospitalizacion]
(IdPrestaciones, FechaHMA, FechaSIS, IdProcedencia, Prestacion, Auditado, Cama, FAlta, TAlta, Aval, Condicion)
values 
(@IdPrestaciones, @FechaHMA, @FechaSIS, @IdProcedencia, @Prestacion, @Auditado, @Cama, @FAlta, @TAlta, @Aval, @Condicion)
GO
/****** Object:  StoredProcedure [dbo].[SIS_GuardarPacientesRestringidos]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_GuardarPacientesRestringidos]
	-- Add the parameters for the stored procedure here
	@historia int,
	@dni int,
	@especialidad int,
	@idusuario int,
	@fecha date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_PacientesRestringidos(Historia, Dni, Especialidad, Idusuario,Fecha_atencion) values(@historia,@dni,@especialidad,@idusuario,@fecha)
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_GuardarPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_GuardarPrestaciones]
    @Fecha date,
	@TDocumento int,
	@NDocumento varchar(50),
	@Historia varchar(50),
	@lote int,
	@fua int,
	@turno int,
	@tipo int,
	@disa char(3),
	@TFormato varchar(50),
	@ncontrato varchar(50),
	@prestacion varchar(50),
	@componente int,
	@establecimiento int,
	@idespecialidad int,
	@idprofesional int,
	@idusuario int,
	@gestante bit,
	@levantamiento bit,
	@procedencia int,
	@du bit,
	@idplan int
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	insert into SIS_Prestaciones(Fecha,TDocumento, NDocumento, Historia, Lote, FUA, Turno, Tipo,Disa, tformato,NContrato, Prestacion, Componente,
	 Establecimiento, IdEspecialidad, IdProfesional, IdUsuario, IdUsuMod,gestante, levantamiento,Idprocedencia,DU,idplan,FechaHMA) 
	 values(@Fecha,@TDocumento,@NDocumento,@Historia, left(year(getdate()),2),
	 (select max(fua) + 1 from SIS_Prestaciones where Lote = left(year(getdate()),2) and estado=0),@turno,@tipo,@disa,@TFormato,@ncontrato,
	 @prestacion,@componente,@establecimiento,@idespecialidad,@idprofesional,@idusuario,0,@gestante,@levantamiento,@procedencia,@du,@idplan,@Fecha);


	 select max(lote) as Lote , max(fua) as FUA, max(Id) as Id from SIS_Prestaciones where IdUsuario = @idusuario and estado=0
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_GuardarPrestaciones1]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_GuardarPrestaciones1]
	-- Add the parameters for the stored procedure here
	 @Fecha date,
	@TDocumento int,
	@NDocumento varchar(50),
	@Historia varchar(50),
	@lote int,
	@fua int,
	@turno int,
	@tipo int,
	@disa char(3),
	@TFormato varchar(50),
	@ncontrato varchar(50),
	@prestacion varchar(50),
	@componente int,
	@establecimiento int,
	@idespecialidad int,
	@idprofesional int,
	@idusuario int,
	@gestante bit,
	@levantamiento bit,
	@procedencia int,
	@du bit,
	@idplan int,
	@aval int,
	@auditado bit,
	@condicion int,
	@talta int,
	@cama varchar(50),
	@fechahma date

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--declare @r int = 0

--select @r = 1 from SIS_Prestaciones where FUA = @fua and IdProcedencia = 2 and Lote = @lote
--if @r = 1
--begin
update SIS_Prestaciones
set visible = 1
where fua = @fua and lote = @lote and estado = 0 and IdProcedencia = 2
--end

declare @Registro int = 0

select @Registro = 1 from sis_prestaciones where Historia = @Historia and fecha = @Fecha and IdEspecialidad= @idespecialidad and Prestacion = @prestacion and estado = 0


if @Registro = 0
begin
declare @valorcin int=@fua
if @valorcin=0
begin
-- Insert statements for procedure here
	
	insert into SIS_Prestaciones(Fecha,TDocumento, NDocumento, Historia, Lote, FUA, Turno, Tipo,Disa, tformato,NContrato, Prestacion, Componente,
	 Establecimiento, IdEspecialidad, IdProfesional, IdUsuario, IdUsuMod,gestante, levantamiento,Idprocedencia,DU,idplan,Aval,
	 Auditado,Condicion,TAlta,Cama,FechaHMA) 
	 values(@Fecha,@TDocumento,@NDocumento,@Historia, left(year(getdate()),2),
	 (select max(fua) + 1 from SIS_Prestaciones where Lote = left(year(getdate()),2) and estado=0),@turno,@tipo,@disa,@TFormato,@ncontrato,
	 @prestacion,@componente,@establecimiento,@idespecialidad,@idprofesional,@idusuario,0,@gestante,@levantamiento,@procedencia,@du,
	 @idplan,@aval,@auditado,@condicion,@talta,@cama,@fechahma);


	 select max(lote) as Lote , max(fua) as FUA, max(Id) as Id from SIS_Prestaciones where IdUsuario = @idusuario and estado=0
END 
else
if @valorcin <> 0
	insert into SIS_Prestaciones(Fecha,TDocumento, NDocumento, Historia, Lote, FUA, Turno, Tipo,Disa, tformato,NContrato, Prestacion, Componente,
	 Establecimiento, IdEspecialidad, IdProfesional, IdUsuario, IdUsuMod,gestante, levantamiento,Idprocedencia,DU,idplan,Aval,
	 Auditado,Condicion,TAlta,Cama,FechaHMA) 
	 values(@Fecha,@TDocumento,@NDocumento,@Historia, left(year(getdate()),2),@valorcin,@turno,@tipo,@disa,@TFormato,@ncontrato,
	 @prestacion,@componente,@establecimiento,@idespecialidad,@idprofesional,@idusuario,0,@gestante,@levantamiento,@procedencia,@du,
	 @idplan,@aval,@auditado,@condicion,@talta,@cama,@fechahma);
	 declare @aval2 int=0
	 select  @aval2=max(Aval)+1 from SIS_Prestaciones where IdProcedencia=2;
	 update SIS_Prestaciones set Alta=1,IdusuAlta=@idusuario,FechaAlta=GETDATE(),RegistroFAlta=GETDATE(),
	 Aval=@aval2 where Lote=left(year(getdate()),2) and FUA=@valorcin  and IdProcedencia=2;

	 select max(lote) as Lote , max(fua) as FUA, max(Id) as Id from SIS_Prestaciones where IdUsuario = @idusuario and estado=0
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[SIS_GuardarPrestaciones2]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_GuardarPrestaciones2]
	-- Add the parameters for the stored procedure here
	@Fecha date,
	@TDocumento int,
	@NDocumento varchar(50),
	@Historia varchar(50),
	@lote int,
	@fua int,
	@turno int,
	@tipo int,
	@disa char(3),
	@TFormato varchar(50),
	@ncontrato varchar(50),
	@prestacion varchar(50),
	@componente int,
	@establecimiento int,
	@idespecialidad int,
	@idprofesional int,
	@idusuario int,
	@gestante bit,
	@levantamiento bit,
	@procedencia int,
	@du bit,
	@idplan int,
	@masiva int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
insert into SIS_Prestaciones(Fecha,TDocumento, NDocumento, Historia, Lote, FUA, Turno, Tipo,Disa, tformato,NContrato, Prestacion, Componente,
	 Establecimiento, IdEspecialidad, IdProfesional, IdUsuario, IdUsuMod,gestante, levantamiento,Idprocedencia,DU,idplan,Masiva,FMasiva) 
	 values(@Fecha,@TDocumento,@NDocumento,@Historia, left(year(getdate()),2),
	 (select max(fua) + 1 from SIS_Prestaciones where Lote = left(year(getdate()),2) and estado=0),@turno,@tipo,@disa,@TFormato,@ncontrato,
	 @prestacion,@componente,@establecimiento,@idespecialidad,@idprofesional,@idusuario,0,@gestante,@levantamiento,@procedencia,@du,@idplan,@masiva,getdate());

	 select max(lote) as Lote , max(fua) as FUA, max(Id) as Id from SIS_Prestaciones where IdUsuario = @idusuario and estado=0 and lote=20 and Historia=@Historia
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_GuardarResultadoLab]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_GuardarResultadoLab] 
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@codigo int,
	@cantidad float,
	@idusu int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select @codigo = '85027' where @codigo = '85031'
    -- Insert statements for procedure here
	insert into SIS_ResultadoLab(Lote, Fua, Cod_Lab, cantidad, Idusuario) values(@lote,@fua,@codigo,@cantidad,@idusu)
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_GuardarRoles]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_GuardarRoles]
	-- Add the parameters for the stored procedure here
	@anio int,
	@mes int,
	@cod_usuario varchar(50),
	@prestacion varchar(3),
	@dia int,
	@usuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS(SELECT * FROM SIS_ROLES WHERE anio=@anio AND mes=@mes AND prestacion=@prestacion AND dia=@dia AND cod_usuario=@cod_usuario)
	BEGIN
		insert into SIS_ROLES(anio,mes,cod_usuario,prestacion,dia,Reg_usuario) values(@anio,@mes,@cod_usuario,@prestacion,@dia,@usuario);
	END

    
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_GuardarTomografia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_GuardarTomografia] 
	-- Add the parameters for the stored procedure here
@lote int,
@fua int,
@idtomografia int,
@informe varchar(max),
@anamnesisdirigida varchar(500),
@FC int,
@FR int,
@T int,
@SATO int,
@PA int,
@PA2 int,
@OT int,
@ToraxPulmones varchar(500),
@HMA bit,
@PCR bit,
@VSG bit,
@PR bit,
@PH bit,
@RXT bit,
@ET bit,
@SustentoTEM varchar(500),
@idusuario int,
@IdHORegistro int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into SIS_TOMOGRAFIA(Lote,Fua,IdTomografia,Informe,AnamnesisDirigida,FC,FR,T,SATO,PA,PA2,OT,ToraxPulmones,HMA,PCR,VSG,PR,PH,RXT,ET,SustentoTEM,IdUsuario,IdHORegistro) 
	values(@lote,@fua,@idtomografia,@informe,@anamnesisdirigida,@FC,@FR,@T,@SATO,@PA,@PA2,@OT,@ToraxPulmones,@HMA,@PCR,@VSG,@PR,@PH,@RXT,@ET,@SustentoTEM,@idusuario,@IdHORegistro)
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_GuardarUsuario]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_GuardarUsuario] 
	@codusuario varchar(30),
	@dni varchar(8),
	@clave varchar(100),
	@perfil int,
	@ape1 varchar(500),
	@nombres varchar(500),
	@ape2 varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Usuarios( CodUsuario, Dni, Clave, Perfil, ApellidoP, Nombres, ApellidoM) values(@codusuario,@dni,@clave,@perfil,@ape1,@nombres,@ape2)
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_IngresarPrestacionHabilitado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_IngresarPrestacionHabilitado]
	-- Add the parameters for the stored procedure here
	@id int,
	@usuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_Prestaciones set habilitado=1,rec_habi=GETDATE(),IdUsUHabi=@usuario,Alta=1,FechaAlta=GETDATE(),RegistroFAlta=GETDATE()
	 where Id=@id
	END

GO
/****** Object:  StoredProcedure [dbo].[SIS_listadoEspecialidades]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_listadoEspecialidades]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	select codEspecialidad as IdEspecialidad,ltrim(rtrim(Descripcion)) as Especialidad 
	from dbo.SIS_ESPECIALIDADES 
	WHERE Estado=0
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_ListadoHistorial]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

-- exec SIS_ListadoHistorial '21','6091517'
CREATE PROCEDURE [dbo].[SIS_ListadoHistorial]
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select c.Id, [Fecha], c.Codigo, [Item], [Unidad], [Cantidad], [Precio], [Importe], [Cie10], [Digita], [Lote], [Fua], c.Caja, c.Registro, c.Estado as Estado, 
   [Reg_anula], [UsuAnula], [Sismed],isnull(u.CodUsuario,'') as Usuario,ISNULL(spp.DESCRIPCION,'') as PaquetePerfil
   from SIS_HistorialConsumo c
   left join Usuarios u on u.Id=c.IdUsuario
   left join SIS_PAQUETEPERFILES spp on spp.Id=c.IdPaquetePerfil
   where c.Lote =@lote and c.Fua=@fua
   order by Registro desc
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_ListadoHistorialPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ListadoHistorialPrestaciones]
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select shp.CodPrestacion, shp.Registro, shp.IdUsuario, shp.lote, fua, upper(gt.gt_Des_Breve) as descripcion,u.CodUsuario as CodUsuario
   from SIS_HistorialPrestaciones shp
   inner join db_sighoshsb.dbo.GT_SIS_PRESTACION gt on gt.gt_Cod_Prestacion collate modern_spanish_ci_as= shp.CodPrestacion
   inner join Usuarios u on u.Id=shp.IdUsuario
   where shp.Lote=@lote and shp.Fua=@fua
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_ListadoPerfilesConsumo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec dbo.SIS_ListadoPerfilesConsumo
CREATE PROCEDURE [dbo].[SIS_ListadoPerfilesConsumo]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select Id,DESCRIPCION,CODIGO 
	from SIS_PAQUETEPERFILES where Estado=0
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_NombrePacienteporFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_NombrePacienteporFua] 
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Paciente,Historia from SIS_Fua where Lote=@lote and Fua=@fua
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_NombrePacientePrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_NombrePacientePrestaciones]
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select APaterno+' '+ AMaterno+' '+ PNombre + ' '+ONombres as Paciente,LTRIM(RTRIM(Historia))  as Historia
	from SIS_Trama where Lote=@lote and Numero=@fua
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerAliasUsuario]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerAliasUsuario]
	-- Add the parameters for the stored procedure here
	@idusuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Alias from hma.dbo.Usu_Usuarios where ID=@idusuario
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerConsumoDetallado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerConsumoDetallado] 
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@caja int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

select Codigo, Item, Unidad, sum(Cantidad) as Cantidad
	, max(Precio) as Precio, max(Precio) * sum(Cantidad) as Importe, Cie10, Digita, c.Lote, c.Fua, Caja , isnull(s.CPMS ,'')AS CPMS 
	--from SIS_FUA f 
	from SIS_Consumo  c
	left join SIS_CPMS s on s.CPT=c.Codigo and s.estado=0
	--c on c.Lote=f.Lote and c.Fua=f.Fua  
	where caja=@caja and c.lote=@lote and c.Fua=@fua and Digita=0
	group by Codigo, Item, Unidad,  Cie10, Digita, c.Lote, c.Fua, Caja,s.CPMS;
end


GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerConsumoDetalle]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--[SIS_ObtenerConsumoDetalle] 20,5261162,6954
CREATE PROCEDURE [dbo].[SIS_ObtenerConsumoDetalle]
	-- Add the parameters for the stored procedure here
		@lote int,
	@fua int,
	@codigo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select SUBSTRING(t.Descripcion,0,31) as Descripcion,dc.Cantidad,dc.Precio,dc.Importe,dc.CPT from SIS_ConsumoTicket c 
	inner join SIS_ConsumoTicketDet dc on c.Id=dc.Codigo
	left join SIS_Tarifario t on dc.CPT=t.CPT 
	where c.Lote=@lote and c.FUA=@fua and dc.Codigo=@codigo
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerConsumoFarmacia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerConsumoFarmacia] 
	-- Add the parameters for the stored procedure here
	@Lote int,
	@FUA int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT Codigo, Item, Unidad, SUM(Cantidad) AS Cantidad,
	MAX(Precio) AS Precio, MAX(Precio) * SUM(Cantidad) AS Importe,
	Cie10, Digita, c.Lote, c.Fua, Caja, ISNULL(s.CPMS ,'') AS CPMS,
	CONVERT(VARCHAR, c.Fecha, 23) AS Fecha, c.Id
	FROM SIS_Consumo c
	LEFT JOIN SIS_CPMS s ON s.CPT = c.Codigo AND s.estado = 0
	WHERE Caja = 1 AND c.Lote = @Lote AND c.Fua = @FUA AND Digita = 0
	GROUP BY Codigo, Item, Unidad, Cie10, Digita, c.Lote, c.Fua, Caja, s.CPMS, c.Fecha, c.Id;
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerDatosDetallesFuaIngreso]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerDatosDetallesFuaIngreso] 
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@idprocedencia int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Fecha,u.Alias as IdUsuario,isnull(FechaAlta,'') as FechaAlta,u1.Alias as IdusuAlta,isnull(s.RegMod,'') as RegMod,u2.Alias as IdUsuMod,
	isnull(rec_habi,'') as rec_habi,u3.Alias IdUsuHabi,
	isnull(RegAnula,'') as RegAnula,u5.Alias as IdUsuAnula,isnull(RegAltaMod,'') as RegAltaMod,u4.Alias as IdUsuAltaMod,
	u6.Alias as IdRetAnula,isnull(RegUsuQuitaAnula,'') as RegRetiAnula,u7.Alias as IdUsuAuditado,isnull(FechaCierre,'') as FechaCierre
	 from SIS_Prestaciones s
	 left join hma.dbo.Usu_Usuarios u on s.IdUsuario=u.ID 
	  left join hma.dbo.Usu_Usuarios u1 on s.IdusuAlta=u1.ID
	   left join hma.dbo.Usu_Usuarios u2 on s.IdUsuMod=u2.ID
	   left join hma.dbo.Usu_Usuarios u3 on s.IdUsuHabi=u3.ID
	   left join hma.dbo.Usu_Usuarios u4 on s.IdUsuAltaMod=u4.ID
	     left join hma.dbo.Usu_Usuarios u5 on s.IdUsuAnula=u5.ID
		 left join hma.dbo.Usu_Usuarios u6 on s.IdUsuQuitaAnula=u6.ID
		  left join hma.dbo.Usu_Usuarios u7 on s.IdUsuAuditado=u7.ID
	  where s.Lote=@lote and s.FUA=@fua and s.IdProcedencia=@idprocedencia
	   
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerDatosDetallesPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerDatosDetallesPrestaciones]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select s.FUA,Fecha,u.Alias as IdUsuario,isnull(FechaAlta,'') as FechaAlta,u1.Alias as IdusuAlta,isnull(s.RegMod,'') as RegMod ,u2.Alias as IdUsuMod,
	isnull(rec_habi,'') as rec_habi,u3.Alias IdUsuHabi,isnull(RegAnula,'') as RegAnula,u5.Alias as IdUsuAnula,isnull(RegAltaMod,'') as RegAltaMod,
	u4.Alias as IdUsuAltaMod,u6.Alias as IdRetAnula,isnull(RegUsuQuitaAnula,'') as RegRetiAnula,u7.Alias as IdUsuAuditado,isnull(FechaCierre,'') as FechaCierre
	 from SIS_Prestaciones s
	 left join hma.dbo.Usu_Usuarios u on s.IdUsuario=u.ID 
	  left join hma.dbo.Usu_Usuarios u1 on s.IdusuAlta=u1.ID
	   left join hma.dbo.Usu_Usuarios u2 on s.IdUsuMod=u2.ID
	   left join hma.dbo.Usu_Usuarios u3 on s.IdUsuHabi=u3.ID
	   left join hma.dbo.Usu_Usuarios u4 on s.IdUsuAltaMod=u4.ID
	     left join hma.dbo.Usu_Usuarios u5 on s.IdUsuAnula=u5.ID
		  left join hma.dbo.Usu_Usuarios u6 on s.IdUsuQuitaAnula=u6.ID
		  left join hma.dbo.Usu_Usuarios u7 on s.IdUsuAuditado=u7.ID
	  where s.Id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_obtenerDatosImprimir]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SIS_obtenerDatosImprimir '0354996'
CREATE PROCEDURE [dbo].[SIS_obtenerDatosImprimir]
@Historia char(7)
as
select s.Fecha,convert(char(8),s.Registro,108) as Hora,h.Historia,h.NDocumento,h.Paciente,h.Paterno,h.Materno,h.Nombres,case Prestacion when 8 then 2 else  s.idprocedencia end as Procedencia,
s.IdEspecialidad,e.Descripcion as Especialidad,3 as Financiador,s.Componente as IdSeguro,h.FNacimiento as FNacimiento,
case s.Componente when 1 THEN 'SIS GRATUITO' when 2 THEN 'SIS INDEPENDIENTE' when 3 then 'SIS MICROEMPRESAS' WHEN 4 THEN 'SIS EMPRENDEDOR'ELSE 'SIS GRATUITO' END as TSeguro,
S.idplan,s.du,Lote,FUA,Cama,isnull(p.NOMBRE ,'') as Medico,s.Disa as cod1,s.TFormato as cod2, s.NContrato as cod3,pres.Codigo as idprestacion,
isnull(es.Establecimiento ,'') as nomestablecimiento,isnull(es.Codigo,'') as codestablecimiento,case s.Turno when 1 then 'MAÑANA' when 2 then 'TARDE' when 3 then 'DIURNO' when 4 then 'NOCTURNO' end as Turno,
--'' as RNE
isnull(esp.RNE,'') as RNE
, isnull(p.COLEGIATURA,'') as colegiatura,
isnull(p.DOCUMENTO,'') as   DOCUMENTO
--,p.NOMBRE as Profesional
from SIS_Prestaciones s
inner join hma.dbo.ADM_Historia h on h.Historia = s.Historia
inner join hma.dbo.HMA_Especialidad e on e.Id = s.IdEspecialidad
left join hma.dbo.HMA_EspProfesional esp on esp.IdProfesional = s.IdProfesional and esp.IdEspecialidad = s.IdEspecialidad
left join hma.dbo.HMA_Profesionales p on p.Id=s.IdProfesional
left join SIS_Prestacion pres on pres.Id=s.Prestacion
left join HMA_Establecimientos es on es.Id=s.Establecimiento
where 
alta = 0 and 
s.Historia = @Historia 
and s.estado = 0 
and s.IdProcedencia = 1 
and s.Historia 
not in (select top 1 s.Historia from SIS_Prestaciones where Historia = @Historia and IdProcedencia = 3 and Alta = 0)
and  Fecha = convert(char(10),getdate(),103)
or alta = 1 and s.Historia = @Historia and s.estado = 0 and s.IdProcedencia = 1 and s.habilitado = 1  
and s.Historia not in (select top 1 s.Historia from SIS_Prestaciones where Historia = @Historia and IdProcedencia = 3 and Alta = 0)

ORDER BY Fecha


GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerDatosWebServices]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerDatosWebServices]
	-- Add the parameters for the stored procedure here
	@dni varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 1 s.Id, Fecha, Registro, DNIConsulta, ApeMaterno, ApePaterno, Contrato, Correlativo, 
	DescEESS, DescEESSUbigeo, DescTipoSeguro, s.Direccion, s.Disa, EESS,es.Id as IdEstablecimiento, EESSUbigeo, s.Estado, FecAfiliacion,
	 FecCaducidad, FecNacimiento, Genero, IdError, IdGrupoPoblacional, IdNumReg, IdPlan, IdUbigeo, MsgConfidencial,
	  Nombres, NroContrato, NroDocumento, Regimen, Resultado, Tabla, TipoDocumento, TipoFormato, TipoSeguro 
	  from SIS_ConsultaWService  s
	 left join HMA_Establecimientos es on es.Codigo=s.EESS
	where DNIConsulta=@dni 
	order by s.Id desc;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerDatoxId]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerDatoxId]	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Fecha, Registro, DNIConsulta, ApeMaterno, ApePaterno, Contrato, Correlativo, DescEESS, DescEESSUbigeo, 
	DescTipoSeguro, Direccion, Disa, EESS, EESSUbigeo, Estado, FecAfiliacion, FecCaducidad, FecNacimiento, Genero, IdError, 
	IdGrupoPoblacional, IdNumReg, IdPlan, IdUbigeo, MsgConfidencial, Nombres, NroContrato, NroDocumento, Regimen, Resultado,
	 Tabla, TipoDocumento, TipoFormato, TipoSeguro from SIS_ConsultaWService where Id=@id;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerDiagnosticoxIdAuditoria]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerDiagnosticoxIdAuditoria]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 1 id_diagnostico, Orden, lote,fua from SIS_SeguroDiagnostico where lote=@lote and fua=@fua order by Orden desc;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerFechaUsuAltaPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerFechaUsuAltaPrestaciones]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select s.FechaAlta, u.Alias as Usuario,s.Fecha,s.Aval from SIS_Prestaciones s 
	left join HMA.Dbo.Usu_Usuarios u on u.ID = s.IdusuAlta
	 where Lote=@lote and Fua=@fua and Alta=1;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerFuaPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerFuaPrestaciones]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 1 FUA  from SIS_Prestaciones where Lote=20 and estado=0 and migracion=0 order by FUA desc;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerIdEstablecimiento]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerIdEstablecimiento] 
	-- Add the parameters for the stored procedure here
	@codigo char(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id,Codigo from HMA_Establecimientos where Codigo=@codigo
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerImpresionMasiva]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--[SIS_ObtenerImpresionMasiva] 3341,'12/03/2020'
CREATE PROCEDURE [dbo].[SIS_ObtenerImpresionMasiva]
	-- Add the parameters for the stored procedure here
	 @idusuario int,
	 @fechacierre date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id, Lote, Fua, FechaCierre
 from SIS_FUA 
 WHERE IdUsuario=@idusuario and Convert(char(10),FechaCierre,103)=@fechacierre and Auditado=1 group by Id,Lote, Fua,FechaCierre order by Fua;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerImpresionMasivaPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec [dbo].[SIS_ObtenerImpresionMasivaPrestaciones] '1','22/04/2021'
CREATE PROCEDURE [dbo].[SIS_ObtenerImpresionMasivaPrestaciones] 
	-- Add the parameters for the stored procedure here
	 @idusuario int,
	 @fechacierre date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select s.Id, s.Lote, s.Fua,s.Ingreso,s.Registro,st.Historia,st.APaterno+' '+st.AMaterno+' '+st.PNombre+' '+st.ONombres as Paciente,st.NDocumento, u.CodUsuario as UsuAudita
 from SIS_FUAAUDITADOS S
 inner join SIS_Trama st on st.Lote=s.Lote and st.Numero=s.Fua
 inner join Usuarios u on u.Id=S.UsuAudita
 WHERE UsuAudita=@idusuario and Convert(char(10),s.Registro,103)=@fechacierre and Auditado=1 and s.Estado=0 
 group by s.Id,s.Lote, s.Fua,s.Ingreso,s.Registro,st.Historia,st.APaterno+' '+st.AMaterno+' '+st.PNombre+' '+st.ONombres,st.NDocumento,u.CodUsuario
 order by s.Fua;
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerPerfiles]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerPerfiles] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select Id,Descripcion from SIS_Perfiles  where Estado=0
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerTomografiaporIdTicket]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--SIS_ObtenerTomografiaporIdTicket 6954,20,5261162
CREATE PROCEDURE [dbo].[SIS_ObtenerTomografiaporIdTicket]
	-- Add the parameters for the stored procedure here
	@idticket int,
	@lote int,
	@fua int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select s.Id, s.Lote, s.Fua, IdTomografia, Informe, s.Registro, AnamnesisDirigida, FC, FR, T, SATO, PA, OT, ToraxPulmones, HMA, PCR, 
	VSG, PR, PH, RXT, ET, SustentoTEM, s.IdUsuario,ho.Id,isnull(ho.NOMBRE ,'') as Profesional,isnull(esp.Colegiatura,'')as CMP,
	isnull(esp.RNE,'') as RNE
	from SIS_TOMOGRAFIA s
	left join hma.dbo.Usu_Usuarios u on u.Id=s.IdUsuario
	left join hma.dbo.HMA_Profesionales ho on ho.DOCUMENTO=u.DNI
	left join hma.dbo.HMA_EspProfesional esp on esp.IdProfesional=ho.Id and esp.IdEspecialidad=esp.IdEspecialidad
	 where s.Lote=@lote and s.Fua=@fua and IdTomografia=@idticket and Atendido=0
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ObtenerTotalPrestacion]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ObtenerTotalPrestacion] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Id, Codigo, Descripcion from SIS_Prestacion
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_OrdenFuaRepetidas]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_OrdenFuaRepetidas]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select id_diagnostico, Orden, fua
	from SIS_SeguroDiagnostico
	where Orden = 1
	order by fua
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_PrestacionesAuditorxdia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec dbo.SIS_PrestacionesAuditorxdia 'pmauditorp'
CREATE PROCEDURE [dbo].[SIS_PrestacionesAuditorxdia]
	-- Add the parameters for the stored procedure here
	@usuario varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @anio int=year(getdate());
	declare @mes int=month(getdate());
	declare @dia int=day(getdate());
   select prestacion,cod_usuario,upper(gt_Des_Breve) AS Descripcion
   from SIS_ROLES SR
   INNER JOIN db_sighoshsb.dbo.GT_SIS_PRESTACION GSP on GSP.gt_Cod_Prestacion =SR.prestacion collate  Latin1_General_CI_AI
   where cod_usuario=@usuario and anio=@anio and mes=@mes and dia=@dia and estado=0 order by prestacion ;
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_PrestacionPorCodigo]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SIS_PrestacionPorCodigo]
@Codigo char(3)
as
select descripcion,id from SIS_Prestacion
where codigo = @Codigo
GO
/****** Object:  StoredProcedure [dbo].[SIS_PrestacionPorDescripcion]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SIS_PrestacionPorDescripcion]
@Descripcion varchar(50)
as
select codigo,descripcion,id from SIS_Prestacion
where descripcion like '%'+@Descripcion+'%'
GO
/****** Object:  StoredProcedure [dbo].[SIS_QuitarAnuladoFUA]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_QuitarAnuladoFUA]
	-- Add the parameters for the stored procedure here
	@id int,
	@usuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_Prestaciones set habilitado=1,IdUsuHabi=@usuario,rec_habi=GETDATE(),Alta=1,FechaAlta=GETDATE(),RegistroFAlta=GETDATE() where Id=@id;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_QuitarAnulados]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_QuitarAnulados]
	@id int,
	@idusuario int
AS
BEGIN
	declare @fua int=0
	SET NOCOUNT ON;
	select @fua=FUA from SIS_AnulacionesFua where IdPrestaciones=@id;
	
	if @fua=0
	begin
		update SIS_Prestaciones set Estado=0,IdUsuQuitaAnula=@idusuario,RegUsuQuitaAnula=getdate() where Id=@id
	end
	else if @fua!=0
	begin
	update SIS_Prestaciones set Estado=0,IdUsuQuitaAnula=@idusuario,RegUsuQuitaAnula=getdate(),FUA=@fua where Id=@id
	end
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_QuitarAuditado]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_QuitarAuditado]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@idusuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_FUA set Auditado=0,IdQuitaAudi=@idusuario,RegQuitaAudi=GETDATE() where Lote=@lote and Fua=@fua
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_QuitarAuditadoPrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SIS_QuitarAuditadoPrestaciones]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@idusuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update SIS_FUAAUDITADOS set Auditado=0,ModAudita=@idusuario,
	RegModAudita=GETDATE() where Lote=@lote and Fua=@fua
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_RechazadosTomografia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_RechazadosTomografia]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select t.Id, t.Lote, t.Fua,s.Historia, adm.Paciente,t.Observaciones 
	 FROM SIS_TOMOGRAFIA t
	 inner join SIS_Prestaciones s on s.Lote=t.Lote and s.FUA=t.Fua and IdProcedencia=3
	 inner join hma.dbo.ADM_Historia adm on adm.Historia=s.Historia
	 where Tomografia=2 and IdHORegistro!=''
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_RechazarTomografia]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_RechazarTomografia]
	@id int,
	@observaciones varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   update SIS_TOMOGRAFIA set Tomografia=2,Observaciones=@observaciones where IdTomografia=@id;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_RegistroDiagnostico]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [dbo].[SIS_RegistroDiagnostico] 'L899','D',1,2,22,872,1
CREATE PROCEDURE [dbo].[SIS_RegistroDiagnostico]
	-- Add the parameters for the stored procedure here
	@codigo varchar(7),
	@tipo char(1),
	@orden int =0,
	@tipo2 int,
	@lote int,
	@fua int,
	@idusuario int =0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

		with aaa as(
		select
					 d.sv_Num_Item as Orden
	
				from db_sighoshsb.dbo.SV_SIS_ATENCION_DIAG d
				inner join db_sighoshsb.dbo.SV_SIS_FILIACION f on d.sv_Num_Oper collate modern_spanish_ci_as =f.sv_Num_Oper collate modern_spanish_ci_as and d.sg_Est_Registro!='*' 
				where f.sv_Num_Fua_Corr=@fua and f.sv_Num_FUA_Lote=@lote 

				union ALL

				select  d.Orden as Orden
				from SIS_SeguroDiagnostico d 
				inner join  db_sighoshsb.dbo.GT_CIE10 c on c.gt_Cod_Cie collate modern_spanish_ci_as=d.Codigo  collate modern_spanish_ci_as
				where d.fua=@fua and d.lote=@lote  and d.Estado=0
		)

		select @orden=isnull(max(Orden)+1,1) from aaa;

	if not exists(select * from SIS_SeguroDiagnostico where lote=@lote and fua=@fua and Codigo=@codigo and Estado=0)
	begin
		insert into SIS_SeguroDiagnostico(Codigo, Tipo, Orden, Tipo2, lote, fua,IdUsuario) values(@codigo,@tipo,@orden,@tipo2,@lote,@fua,@idusuario)
	end

	
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_RegistroDiagnostico1]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_RegistroDiagnostico1]
	-- Add the parameters for the stored procedure here
	@codigo int,
	@tipo int,
	@orden int,
	@tipo2 int,
	@lote int,
	@fua int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @orden1 int=0
	select @orden1= isnull(max(Orden)+1,1) from SIS_SeguroDiagnostico where Lote=@lote and Fua=@fua
	insert into SIS_SeguroDiagnostico(Codigo, Tipo, Orden, Tipo2, lote, fua) values(@codigo,@tipo,@orden1,@tipo2,@lote,@fua);
	select MAX(id_diagnostico) as id from SIS_SeguroDiagnostico where Lote=@lote and Fua=@fua
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ReportePrestaciones]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ReportePrestaciones]
	-- Add the parameters for the stored procedure here
	@fini date,
	@ffinal date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select s.Id, Fecha, TDocumento, s.NDocumento, s.Historia, a.Paciente,s.Lote, s.FUA,
	CASE  s.IdProcedencia WHEN 1 THEN 'CONSULTA EXTERNA' WHEN 2 THEN 'EMERGENCIA' WHEN 3 THEN 'HOSPITALIZACION' END AS PROCEDENCIA ,
	 s.Disa, TFormato, NContrato,
 Turno, s.Tipo,p.Codigo as CodPrestacion, Componente, s.Establecimiento,es.Establecimiento as NomEstablecimiento, s.IdEspecialidad,e.Descripcion as Especialidad, IdProfesional, u.APELLIDOS+' '+u.NOMBRES as IdUsuario, s.Registro,
  s.IdUsuMod, s.RegMod, gestante, levantamiento, s.estado, habilitado, rec_habi, DU 
  from SIS_Prestaciones s 
  inner join hma.dbo.ADM_Historia a on s.Historia=a.Historia
  inner join hma.dbo.HMA_Especialidad e on s.IdEspecialidad=e.Id
  left join HMA_Establecimientos es on s.Establecimiento=es.Id
   left join hma.dbo.Usu_Usuarios u on u.ID = s.IdUsuario
    left join SIS_Prestacion p on p.Id=s.Prestacion
   where Fecha between @fini and @ffinal order by Fecha desc;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ResetearUsuario]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ResetearUsuario]
	-- Add the parameters for the stored procedure here
	@codusuario varchar(30),
	@clave varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update Usuarios set Clave=@clave where CodUsuario=@codusuario and Estado=0
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_TOTALFUALOTE]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_TOTALFUALOTE]
	-- Add the parameters for the stored procedure here
	@fua int,
	@lote int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Fua,Lote,sum(Importe) as Importe from SIS_Consumo where Fua=@fua and lote=@lote group by Fua, Lote;
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_Trama1PorLoteFua1]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SIS_Trama1PorLoteFua1]
@Lote char(2),
@Fua varchar(50)
as
select s.Id, Disa, Lote, Numero, UDR, IPRESS, IPRESS_Cat, IPRESS_Niv, PDigitacion, Reconsideracion, RDisa, RLote, RNumero,
 IdConvenio, Componente, DFormato, DLote, DNumero, NInscripcion, CTabla, CIdentificador, CPlan, CPoblacional, TDocumento, 
 s.NDocumento, APaterno, AMaterno, PNombre, ONombres, s.FNacimiento, isnull(case h.Sexo when 1 then 0 else 1 end,0) as IdSexo, Ubigeo, s.Historia, TAtencion, SMaterna, MAtencion,
  NAutorizacion, Monto, FAtencion, IReferencia, NReferencia, CPrestacional, PAtiende, LAtencion, Destino, FIngreso, FAlta,
   IDestino, NRefConD, FPParto, HVB, IEducativa, NEducativo, GEducativo, SEducativo, TEducativo, EEspecial, AnexoIIEE, FFallecimiento,
    COFlexible, IdEtnia, IdIAFAS, CSIAFA, IdUps, FCAdministrativo, UDRAutorizaFUA, LAutorizaFUA, SAutorizaFUA, DFUAVinculado, TDocumentoR,
	 NDocumentoR, TPersonal, Especialidad, Egresado, Colegiatura, num_colegiatura, RNE, Periodo, Mes, TDDigitador, NDDigitador, s.Registro,
	  s.Observacion,s.CAuto_SITEDS
 from SIS_Trama1 s
 left join hma.dbo.ADM_Historia h on h.Historia = s.Historia
where lote = @Lote and Numero = @FUA
GO
/****** Object:  StoredProcedure [dbo].[SIS_TramaEnvio]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[SIS_TramaEnvio]
 as
select top 200 Id as Id1, Disa as Disa2, Lote as Lote3, Numero as Numero4, UDR as UDR5, IPRESS as IPRESS6, IPRESS_Cat as IPRESS_Cat7, IPRESS_Niv as IPRESS_Niv8, PDigitacion as PDigitacion9, 
	Reconsideracion as Reconsideracion10, RDisa as RDisa11, RLote as RLote12, RNumero as RNumero13, IdConvenio as IdConvenio14, Componente as Componente15, 
    DFormato as DFormato16, DLote as DLote17, DNumero as DNumero18, NInscripcion as NInscripcion19, CTabla as CTabla20, CIdentificador as CIdentificador21, 
	CPlan as CPlan22, CPoblacional as CPoblacional23, TDocumento as TDocumento24, NDocumento as NDocumento25, APaterno as APaterno26, AMaterno as AMaterno27, PNombre as PNombre28, 
	ONombres as ONombres29,  CONVERT(varchar,FNacimiento,103) as FNacimiento30, IdSexo as IdSexo31, Ubigeo as Ubigeo32, Historia as Historia33, TAtencion as TAtencion34, SMaterna as SMaterna35, 
	MAtencion as MAtencion36, NAutorizacion as NAutorizacion37, Monto as Monto38, CONVERT(varchar,FAtencion,103)+ ' 00:00' as FAtencion39, IReferencia as IReferencia40, NReferencia as NReferencia41, 
	CPrestacional as CPrestacional42, PAtiende as PAtiende43, LAtencion as LAtencion44, Destino as Destino45, FIngreso as FIngreso46, case FAlta when '1900-01-01' then '' else FAlta end as FAlta47, 
	case IDestino when 0 then '' else IDestino end as IDestino48, NRefConD as NRefConD49,case FPParto when '1900-01-01' then '' else FPParto end as FPParto50, HVB as HVB51, IEducativa as IEducativa52, NEducativo as NEducativo53, GEducativo as GEducativo54, SEducativo as SEducativo55, 
	TEducativo as TEducativo56, EEspecial as EEspecial57, AnexoIIEE as AnexoIIEE58,FFallecimiento as FFallecimiento59, COFlexible as COFlexible60, IdEtnia as IdEtnia61, IdIAFAS as IdIAFAS62, 
	CSIAFA as CSIAFA63, IdUps as IdUps64, ''  as FCAdministrativo65,'' as UDRAutorizaFUA66, '' as LAutorizaFUA67, '' as SAutorizaFUA68, 
	'' as DFUAVinculado69,'' as LFUAVinculado70 ,'' as NFUAVinculado71 ,TDocumentoR as TDocumentoR72, NDocumentoR as NDocumentoR73, '01' as TPersonal74, 
	'61' as Especialidad75, Egresado as Egresado76,'' as Colegiatura77,  '' as RNE78, '20' as Periodo79, '06' as Mes80, 
	'1' as TDDigitador81, '11111111' as NDDigitador82,  Registro as Registro83, '' as Observacion84, '3.0' as "Version85" , '' as CAuto_SITEDS86
FROM         SIS_Trama
order by 1 desc
GO
/****** Object:  StoredProcedure [dbo].[SIS_TramaPorLoteFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[SIS_TramaPorLoteFua] '22','23117';
CREATE PROCEDURE [dbo].[SIS_TramaPorLoteFua]
@Lote char(2),
@Fua varchar(50)
as
begin
select s.Id,s.Disa, s.Lote, s.Numero, UDR, IPRESS, IPRESS_Cat, IPRESS_Niv, PDigitacion, Reconsideracion, RDisa, RLote, RNumero,
 IdConvenio, Componente, DFormato, DLote, DNumero, NInscripcion, CTabla, CIdentificador, CPlan, CPoblacional, TDocumento, 
 s.NDocumento, APaterno, AMaterno, PNombre, ONombres, s.FNacimiento, isnull(IdSexo,1) as IdSexo, Ubigeo, s.Historia, TAtencion, SMaterna, MAtencion,
 NAutorizacion, Monto, FAtencion, IReferencia, NReferencia, CPrestacional, PAtiende, LAtencion, Destino, FIngreso, FAlta,
 IDestino, NRefConD, convert(date,FPParto) as FPParto, HVB, IEducativa, NEducativo, GEducativo, SEducativo, TEducativo, EEspecial, AnexoIIEE, FFallecimiento,
 COFlexible, IdEtnia, IdIAFAS, CSIAFA, IdUps, FCAdministrativo, UDRAutorizaFUA, LAutorizaFUA, SAutorizaFUA, DFUAVinculado, TDocumentoR,
 NDocumentoR, TPersonal, Especialidad, Egresado, Colegiatura, num_colegiatura, RNE, Periodo, Mes, TDDigitador, NDDigitador, s.Registro,
 s.Observacion,s.CAuto_SITEDS,'' as NomEspecialidad,establecimiento,codestablecimiento, pres.gt_Des_Breve as PrestacionDetalle,s.sv_num_oper as sv_num_oper
 from SIS_Trama s
 inner join db_sighoshsb.dbo.RM_HCLINICA h on h.rm_Cod_HCli= s.Historia collate Modern_Spanish_CI_AS
 left join db_sighoshsb.dbo.GT_SIS_PRESTACION pres on pres.gt_Cod_Prestacion=s.CPrestacional collate Modern_Spanish_CI_AS and pres.sg_Est_Registro!='*'
-- left join db_sighoshsb.dbo.GT_CONSULT_ESPEC te on te.gt_cod_consult=s.Especialidad and te.sg_Est_Registro!='*'
where s.lote = @Lote and s.Numero = @FUA collate Modern_Spanish_CI_AS
end
GO
/****** Object:  StoredProcedure [dbo].[SIS_ValidacionHistoriaHoy]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ValidacionHistoriaHoy]
	-- Add the parameters for the stored procedure here
	@historia varchar(50),
	@procedencia int,
	@codpresta varchar(4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  s.Id, s.Fecha, s.NDocumento, s.Historia, s.Lote, s.FUA, s.IdProcedencia, s.Prestacion
	from sis_prestaciones s
	left join SIS_Prestacion p on s.Prestacion=p.Id
	where Historia=@historia and CONVERT(DATE,Registro)=CONVERT(DATE,GETDATE()) and s.IdProcedencia=@procedencia and p.Codigo=@codpresta and s.estado=0
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ValidarDni]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ValidarDni]
	@dni varchar(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select Id,Dni from Usuarios where Dni=@dni
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_ValidarFua]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

-- exec dbo.[SIS_ValidarFua] 22,36338
CREATE PROCEDURE [dbo].[SIS_ValidarFua]
	-- Add the parameters for the stored procedure here
	@_lote int,
	@_fua int 
AS
BEGIN

	SET NOCOUNT ON;
	
	DELETE  [dbo].[SIS_FUAOBSERVACIONES] WHERE Lote = @_lote AND FUA =@_fua

	DECLARE @lote as int
	DECLARE @fua as int
	DECLARE @diagnostico as varchar(4)
	DECLARE @sexo as char(1)
	DECLARE @Smaterna as int
	DECLARE @Fparto date
	DECLARE @edad as int 
	declare @Fatencion AS DATE
	DECLARE @sexoRC char(1),@edadMinRC int ,@edadMaxRC int , @condicionMaternaRC int
	declare @fechaSer AS DATE
	declare @set as int =0

	SET @fechaSer= DATEADD(DAY,-10,GETDATE())
	DECLARE ProdInfo CURSOR FOR SELECT t.Lote ,t.Numero ,c.Codigo ,case when t.IdSexo=0 then 'M' else 'H' end  as IdSexo ,t.SMaterna ,t.FPParto ,
											dbo.dfu_edad(t.FNacimiento,t.FAtencion) as edad,cast(T.FAtencion as date) as FAtencion, 
											r.sexo as sexoRC, r.edadmin as edadMinRC, r.edadmax  as edadMaxRC,r.condicionmaterna as condicionMaternaRC
											FROM [AUDITORIA].[dbo].[SIS_Trama] T
											INNER JOIN [AUDITORIA].[dbo].SIS_FUAAUDITADOS A ON  A.Lote = t.Lote and a.Fua =T.Numero
											inner JOIN [AUDITORIA].[dbo].SIS_SeguroDiagnostico c on c.Lote = t.Lote and c.Fua = t.Numero and c.Estado =0
											INNER JOIN [AUDITORIA].[dbo].RC_53 R ON R.codigo = c.Codigo 
											where  t.Lote = @_lote and  T.Numero= @_fua  
	-- sexo 0 - mujer 1 - hombre  // a AMBOS h hombre  m mujer
	-- 0	No Gestante- 1	Gestante-2	Puérpera // 0- GESTANE-PUERPERA-1- NO APLICA-2- GESTANTE-3- PUERPERA
	OPEN ProdInfo
	FETCH NEXT FROM ProdInfo INTO @lote,@fua,@diagnostico,@sexo,@Smaterna,@Fparto,@edad,@Fatencion,@sexoRC,@edadMinRC,@edadMaxRC,@condicionMaternaRC
	WHILE @@fetch_status = 0
	BEGIN
				  
		IF @sexoRC = 'A' OR @sexoRC = 'H'
			BEGIN
			IF   @edad >= @edadMinRC   AND @edad <= @edadMaxRC 
				BEGIN
				set @set=1	
				END
			ELSE
				BEGIN
					INSERT INTO [dbo].[SIS_FUAOBSERVACIONES]([Lote],[Fua],[Observacion],[DetalleObservacion])VALUES(@lote,@fua,'REGLA_CONSISTENCIA_53', 'DX: '+@diagnostico+' LA EDAD NO APLICA ')
				END
			END
		ELSE
			BEGIN
				IF @sexoRC = @sexo 
				BEGIN
					IF   @edad <= @edadMinRC   AND @edad >= @edadMaxRC 
					BEGIN 
						set @set=1	
					END
				ELSE
					BEGIN
						IF @condicionMaternaRC <> 1 AND (@Smaterna = 0 OR  @Fparto ='1900-01-01' )
						--BEGIN
						--INSERT INTO [dbo].[SIS_FUAOBSERVACIONES]([Lote],[Fua],[Observacion],[DetalleObservacion])VALUES(@lote,@fua,'REGLA_CONSISTENCIA_53', 'DX: '+@diagnostico+' GESTANTE O PUERPERA')
						-----PRINT  @Fparto
						--END
						set @set=1	
					END
				END
			END
	FETCH NEXT FROM ProdInfo INTO  @lote,@fua,@diagnostico,@sexo,@Smaterna,@Fparto,@edad,@Fatencion,@sexoRC,@edadMinRC,@edadMaxRC,@condicionMaternaRC
	END
	CLOSE ProdInfo
	DEALLOCATE ProdInfo

	
	SELECT Id,Lote,Fua,Observacion,DetalleObservacion,FechaRegistro 
	FROM [AUDITORIA].[dbo].[SIS_FUAOBSERVACIONES] 
	WHERE Lote = @_lote and Fua = @_fua 

  
END
GO
/****** Object:  StoredProcedure [dbo].[SIS_ValidarOrdenDiagnosticos]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ValidarOrdenDiagnosticos]
	-- Add the parameters for the stored procedure here
	@lote int,
	@fua int,
	@orden int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Orden,id_diagnostico from  SIS_SeguroDiagnostico where Lote=@lote and Fua=@fua and Orden=@orden
END

GO
/****** Object:  StoredProcedure [dbo].[SIS_ValidarUsuario]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SIS_ValidarUsuario] 
	-- Add the parameters for the stored procedure here
	@codusuario varchar(30),
	@dni varchar(8)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select  Id,upper(CodUsuario) as CodUsuario,Dni,Clave,Perfil 
	from Usuarios where CodUsuario=@codusuario and Dni= @dni and Estado=0
END
GO
/****** Object:  StoredProcedure [dbo].[USU_UsuarioPorId]    Script Date: 30/03/2022 8:53:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USU_UsuarioPorId]
	
	@idusuario int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select [Id], UPPER(CodUsuario) AS CodUsuario, [Dni], [Estado], [Registro], [Clave]
   from Usuarios where Id=@idusuario and Estado=0;
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'condicion materna 1= no aplica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RC_53', @level2type=N'COLUMN',@level2name=N'CondicionMaterna'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'sismed y cpms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SIS_Consumo', @level2type=N'COLUMN',@level2name=N'Sismed'
GO
