USE [master]
GO
/****** Object:  Database [FE]    Script Date: 21/12/2021 04:03:32 pm ******/
CREATE DATABASE [FE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'validar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.QSOFT2017\MSSQL\DATA\FE.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'validar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.QSOFT2017\MSSQL\DATA\FE_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FE] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FE] SET ARITHABORT OFF 
GO
ALTER DATABASE [FE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FE] SET RECOVERY FULL 
GO
ALTER DATABASE [FE] SET  MULTI_USER 
GO
ALTER DATABASE [FE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FE', N'ON'
GO
USE [FE]
GO
/****** Object:  UserDefinedFunction [dbo].[ObtenerPuntoVenta]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ObtenerPuntoVenta]
(
@Tipo varchar(5), @NumCaja numeric

)
RETURNS varchar(5)
AS
BEGIN
Declare @PuntoVenta varchar(5)

If @Tipo = 'CON'
Begin
	Set @NumCaja = (Select Case @NumCaja when 1 then 1 else 2 end);	
End

If @Tipo = 'CRE'
Begin
	Set @NumCaja = (Select Case @NumCaja when 1 then 3 else 4 end);	
End

If @Tipo = 'PVE'
Begin
	Set @NumCaja = (Select Case @NumCaja when 1 then 5 else 6 end);	
End

If @Tipo = 'TCO'
Begin
	Set @NumCaja = (Select Case @NumCaja when 1 then 7 else 8 end);	
End	
	
If @Tipo = 'TCR'
Begin
	Set @NumCaja = (Select Case @NumCaja when 1 then 9 else 10 end);
End		

If @Tipo = 'MCO'
Begin
	Set @NumCaja = (Select Case @NumCaja when 1 then 11 else 12 end);
End		

If @Tipo = 'MCR'
Begin
	Set @NumCaja = (Select Case @NumCaja when 1 then 13 else 14 end);
End		

return REPLACE(STR(@NumCaja, 5), SPACE(1), '0');

END

GO
/****** Object:  Table [dbo].[ActividadEmpresa]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadEmpresa](
	[IdActividad] [int] IDENTITY(1,1) NOT NULL,
	[Actividad] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ActividadEmpresa] PRIMARY KEY CLUSTERED 
(
	[IdActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[articulos_comprados]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[articulos_comprados](
	[Id_ArticuloComprados] [bigint] IDENTITY(1,1) NOT NULL,
	[IdCompra] [bigint] NOT NULL,
	[Codigo] [bigint] NOT NULL,
	[CodArticulo] [varchar](250) NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
	[Base] [float] NOT NULL,
	[Monto_Flete] [float] NOT NULL,
	[OtrosCargos] [float] NOT NULL,
	[Costo] [float] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[Regalias] [float] NOT NULL,
	[Gravado] [float] NOT NULL,
	[Exento] [float] NOT NULL,
	[Descuento_P] [float] NOT NULL,
	[Descuento] [float] NOT NULL,
	[Impuesto_P] [float] NOT NULL,
	[Impuesto] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[Devoluciones] [float] NOT NULL,
	[Precio_A] [float] NOT NULL,
	[Precio_B] [float] NOT NULL,
	[Precio_C] [float] NOT NULL,
	[Precio_D] [float] NOT NULL,
	[CodMonedaVenta] [int] NOT NULL,
	[NuevoCostoBase] [float] NOT NULL,
	[Lote] [varchar](250) NOT NULL,
	[Bonificado] [bit] NOT NULL,
	[CodigoBonificado] [bigint] NOT NULL,
	[CantidadBonificado] [float] NOT NULL,
	[CostoBonificado] [float] NOT NULL,
	[SubTotalBonificado] [float] NOT NULL,
	[CodArticuloBonificacion] [varchar](250) NOT NULL,
	[CodCabys] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_articulos_comprados] PRIMARY KEY CLUSTERED 
(
	[Id_ArticuloComprados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[articulos_ventas_devueltos]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[articulos_ventas_devueltos](
	[Consecutivo] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Devolucion] [bigint] NOT NULL,
	[Codigo] [bigint] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Cantidad] [float] NOT NULL,
	[CantVet] [float] NOT NULL,
	[CantBod] [float] NOT NULL,
	[Precio_Costo] [float] NOT NULL,
	[Precio_Base] [float] NOT NULL,
	[Precio_Flete] [float] NOT NULL,
	[Precio_Otros] [float] NOT NULL,
	[Precio_Unit] [float] NOT NULL,
	[Descuento] [float] NOT NULL,
	[Monto_Descuento] [float] NOT NULL,
	[Impuesto] [float] NOT NULL,
	[Monto_Impuesto] [float] NOT NULL,
	[SubtotalGravado] [float] NOT NULL,
	[SubTotalExcento] [float] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Id_Art_Venta] [int] NOT NULL,
	[id_articulo_V] [varchar](250) NOT NULL,
	[devuelto] [bit] NULL,
	[empaquetado] [bit] NOT NULL,
	[recibido] [bit] NOT NULL,
 CONSTRAINT [PK_articulos_ventas_devueltos] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[identificacion] [bigint] NOT NULL,
	[cedula] [varchar](30) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[observaciones] [varchar](255) NOT NULL,
	[Telefono_01] [varchar](16) NOT NULL,
	[telefono_02] [varchar](16) NOT NULL,
	[fax_01] [varchar](16) NOT NULL,
	[fax_02] [varchar](16) NOT NULL,
	[e_mail] [varchar](255) NOT NULL,
	[abierto] [char](2) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
	[impuesto] [float] NOT NULL,
	[max_credito] [float] NOT NULL,
	[Plazo_credito] [int] NOT NULL,
	[descuento] [float] NOT NULL,
	[empresa] [char](2) NOT NULL,
	[tipoprecio] [smallint] NOT NULL,
	[sinrestriccion] [char](2) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[nombreusuario] [varchar](50) NOT NULL,
	[agente] [varchar](50) NOT NULL,
	[CodMonedaCredito] [int] NOT NULL,
	[Cliente_Moroso] [bit] NOT NULL,
	[PrecioSugerido] [bit] NOT NULL,
	[Anulado] [bit] NOT NULL,
	[notificar] [bit] NULL,
	[tipo_cedula] [nvarchar](50) NULL,
	[OrdenCompra] [bit] NOT NULL,
	[IdTipoExoneracion] [numeric](18, 0) NOT NULL,
	[TipoCliente] [nvarchar](100) NOT NULL,
	[CorreoComprobante] [nvarchar](500) NOT NULL,
	[Actualizado] [bit] NOT NULL,
	[DescuentoEspecial] [float] NOT NULL,
	[Relacionados] [bit] NOT NULL,
	[MAG] [bit] NOT NULL,
	[EnviarRecibo] [bit] NOT NULL,
	[CorreoRecibo] [nvarchar](500) NOT NULL,
	[UsoInterno] [bit] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[compras]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[compras](
	[Id_Compra] [bigint] IDENTITY(1,1) NOT NULL,
	[Factura] [float] NOT NULL,
	[CodigoProv] [int] NOT NULL,
	[SubTotalGravado] [float] NOT NULL,
	[SubTotalExento] [float] NOT NULL,
	[Descuento] [float] NOT NULL,
	[Impuesto] [float] NOT NULL,
	[TotalFactura] [float] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Vence] [datetime] NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[MotivoGasto] [varchar](255) NOT NULL,
	[Compra] [bit] NOT NULL,
	[Contabilizado] [bit] NOT NULL,
	[Consignacion] [bit] NOT NULL,
	[Asiento] [float] NOT NULL,
	[ContaInve] [bit] NOT NULL,
	[AsientoInve] [float] NOT NULL,
	[TipoCompra] [char](3) NOT NULL,
	[CedulaUsuario] [varchar](75) NOT NULL,
	[Cod_MonedaCompra] [int] NOT NULL,
	[FacturaCancelado] [bit] NOT NULL,
	[Gasto] [bit] NOT NULL,
	[TipoCambio] [float] NOT NULL,
	[CambioImpuesto] [float] NOT NULL,
	[Taller] [bit] NOT NULL,
	[Mascotas] [bit] NOT NULL,
	[num_orden] [float] NULL,
	[FEC] [bit] NOT NULL,
	[CodigoActividad] [nvarchar](255) NOT NULL,
	[EnviadoDGT] [bit] NOT NULL,
	[EstadoDGT] [nvarchar](50) NOT NULL,
	[ConsecutivoDGT] [nvarchar](50) NOT NULL,
	[ClaveDGT] [nvarchar](100) NOT NULL,
	[Trans] [bit] NOT NULL,
	[NumTrans] [nvarchar](50) NOT NULL,
	[Prepagada] [bit] NOT NULL,
	[PreAbono] [float] NOT NULL,
 CONSTRAINT [PK_compras] PRIMARY KEY CLUSTERED 
(
	[Id_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_compras] UNIQUE NONCLUSTERED 
(
	[Factura] ASC,
	[CodigoProv] ASC,
	[TipoCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[configuraciones]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[configuraciones](
	[Cedula] [varchar](255) NOT NULL,
	[Empresa] [varchar](255) NOT NULL,
	[Tel_01] [varchar](255) NOT NULL,
	[Tel_02] [varchar](255) NOT NULL,
	[Fax_01] [varchar](255) NOT NULL,
	[Fax_02] [varchar](255) NOT NULL,
	[Direccion] [varchar](255) NOT NULL,
	[Imp_Venta] [float] NOT NULL,
	[Frase] [varchar](255) NOT NULL,
	[Cajeros] [int] NOT NULL,
	[Logo] [image] NULL,
	[Intereses] [int] NOT NULL,
	[UnicoConsecutivo] [bit] NOT NULL,
	[NumeroConsecutivo] [bigint] NOT NULL,
	[ConsContado] [bit] NOT NULL,
	[NumeroContado] [bigint] NOT NULL,
	[ConsCredito] [bit] NOT NULL,
	[NumeroCredito] [bigint] NOT NULL,
	[ConsPuntoVenta] [bit] NOT NULL,
	[NumeroPuntoVenta] [bigint] NOT NULL,
	[Taller] [bit] NOT NULL,
	[TallerContado] [bigint] NOT NULL,
	[TallerCredito] [bigint] NOT NULL,
	[Imprimir_en_Factura_Personalizada] [bit] NOT NULL,
	[FormatoCheck] [bit] NOT NULL,
	[Contabilidad] [bit] NOT NULL,
	[CambiaPrecioCredito] [bit] NOT NULL,
	[Mascotas] [bit] NOT NULL,
	[MascotasContado] [bigint] NOT NULL,
	[MascotasCredito] [bigint] NOT NULL,
	[regalias] [bit] NULL,
	[empresa1] [nvarchar](150) NULL,
	[empresa2] [nvarchar](150) NULL,
	[empresa3] [nvarchar](150) NULL,
	[editar_nombre] [bit] NULL,
	[FacturaElectronica] [bit] NOT NULL,
	[SoloPVE] [bit] NOT NULL,
	[ModoCaja] [bit] NOT NULL,
	[AplicaTemperatura] [bit] NOT NULL,
	[idEmisor] [int] NOT NULL,
	[ImprimeContadoPVE] [bit] NOT NULL,
 CONSTRAINT [PK_configuraciones] PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[devoluciones_ventas]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[devoluciones_ventas](
	[Devolucion] [bigint] IDENTITY(1,1) NOT NULL,
	[Id_Factura] [bigint] NOT NULL,
	[SaldoAnt_Fact] [float] NOT NULL,
	[SubTotalGravado] [float] NOT NULL,
	[SubTotalExcento] [float] NOT NULL,
	[Descuento] [float] NOT NULL,
	[Impuesto] [float] NOT NULL,
	[Monto] [float] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Contabilizado] [bit] NOT NULL,
	[NumeroAsiento] [bigint] NOT NULL,
	[Anulado] [bit] NOT NULL,
	[Cedula_Usuario] [varchar](75) NOT NULL,
	[Cod_Moneda] [int] NOT NULL,
	[Transporte] [float] NOT NULL,
	[ContabilizadoCosto] [bit] NOT NULL,
	[NumeroAsientoCosto] [bigint] NOT NULL,
	[caja] [numeric](18, 0) NOT NULL,
	[CONSECUTIVO] [bigint] NOT NULL,
	[ENVIADODGT] [bit] NOT NULL,
	[ESTADODGT] [varchar](50) NOT NULL,
	[CONSECUTIVODGT] [varchar](100) NOT NULL,
	[CLAVEDGT] [varchar](100) NOT NULL,
	[MontoDevolucion] [float] NOT NULL,
	[Num_Apertura] [numeric](18, 0) NOT NULL,
	[UsuarioRecibio] [nvarchar](255) NOT NULL,
	[NotasDevolucion] [nvarchar](500) NULL,
 CONSTRAINT [PK_devoluciones_ventas] PRIMARY KEY CLUSTERED 
(
	[Devolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Emisor]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emisor](
	[TipoIdentificacion] [nvarchar](255) NOT NULL,
	[Identificacion] [nvarchar](255) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
	[Correo] [nvarchar](255) NOT NULL,
	[Telefono] [nvarchar](255) NOT NULL,
	[Sucursal] [nvarchar](50) NOT NULL,
	[Provincia] [numeric](18, 0) NOT NULL,
	[Canton] [numeric](18, 0) NOT NULL,
	[Distrito] [numeric](18, 0) NOT NULL,
	[OtrasSeñas] [nvarchar](500) NOT NULL,
	[Usuario] [nvarchar](255) NOT NULL,
	[Clave] [nvarchar](255) NOT NULL,
	[Certificado] [nvarchar](500) NOT NULL,
	[NumeroResolucion] [nvarchar](255) NOT NULL,
	[FechaResolucion] [nvarchar](255) NOT NULL,
	[IdTipoIdentificacion] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VenceCertificado] [datetime] NULL,
 CONSTRAINT [PK_Emisor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmpresaActividades]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpresaActividades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idEmisor] [int] NOT NULL,
	[idActividad] [int] NOT NULL,
	[EsPrincipal] [bit] NOT NULL,
 CONSTRAINT [PK_EmpresaActividades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Impuestos]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impuestos](
	[Id_Impuesto] [int] IDENTITY(1,1) NOT NULL,
	[Impuesto] [nvarchar](50) NOT NULL,
	[Codigo_Impuesto] [nvarchar](50) NOT NULL,
	[Codigo_Tarifa] [nvarchar](50) NOT NULL,
	[Porcentaje] [float] NOT NULL,
	[Simbolo] [nvarchar](50) NOT NULL,
	[Inactivo] [bit] NOT NULL,
 CONSTRAINT [PK_Impuestos] PRIMARY KEY CLUSTERED 
(
	[Id_Impuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventario](
	[Codigo] [bigint] NOT NULL,
	[Cod_Articulo] [varchar](255) NOT NULL,
	[Barras] [varchar](255) NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
	[PresentaCant] [float] NOT NULL,
	[CodPresentacion] [int] NOT NULL,
	[CodMarca] [int] NOT NULL,
	[SubFamilia] [varchar](10) NOT NULL,
	[Minima] [float] NOT NULL,
	[PuntoMedio] [float] NOT NULL,
	[Maxima] [float] NOT NULL,
	[Existencia] [float] NOT NULL,
	[SubUbicacion] [varchar](10) NOT NULL,
	[Observaciones] [varchar](255) NOT NULL,
	[MonedaCosto] [int] NOT NULL,
	[PrecioBase] [float] NOT NULL,
	[Fletes] [float] NOT NULL,
	[OtrosCargos] [float] NOT NULL,
	[Costo] [float] NOT NULL,
	[MonedaVenta] [int] NOT NULL,
	[IVenta] [float] NOT NULL,
	[Precio_A] [float] NOT NULL,
	[Precio_B] [float] NOT NULL,
	[Precio_C] [float] NOT NULL,
	[Precio_D] [float] NOT NULL,
	[Precio_Promo] [float] NOT NULL,
	[Promo_Activa] [bit] NOT NULL,
	[Promo_Inicio] [smalldatetime] NOT NULL,
	[Promo_Finaliza] [smalldatetime] NOT NULL,
	[Max_Comision] [float] NOT NULL,
	[Max_Descuento] [float] NOT NULL,
	[Imagen] [image] NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[Servicio] [bit] NOT NULL,
	[Inhabilitado] [bit] NOT NULL,
	[Proveedor] [int] NOT NULL,
	[Precio_Sugerido] [float] NOT NULL,
	[SugeridoIV] [float] NOT NULL,
	[PreguntaPrecio] [bit] NOT NULL,
	[Lote] [bit] NOT NULL,
	[Consignacion] [bit] NOT NULL,
	[Id_Bodega] [int] NOT NULL,
	[ExistenciaBodega] [float] NOT NULL,
	[MAX_Inventario] [float] NOT NULL,
	[MAX_Bodega] [float] NOT NULL,
	[CantidadDescarga] [float] NULL,
	[CodigoDescarga] [varchar](255) NULL,
	[DescargaOtro] [bit] NULL,
	[Cod_PresentOtro] [int] NOT NULL,
	[CantidadPresentOtro] [float] NOT NULL,
	[ExistenciaForzada] [float] NULL,
	[bloqueado] [bit] NULL,
	[pantalla] [bit] NULL,
	[clinica] [bit] NULL,
	[mascotas] [bit] NULL,
	[receta] [bit] NULL,
	[peces] [bit] NULL,
	[taller] [bit] NULL,
	[barras2] [varchar](255) NULL,
	[barras3] [varchar](255) NULL,
	[Apartado] [float] NULL,
	[promo3x1] [bit] NULL,
	[orden] [bit] NULL,
	[bonificado] [bit] NULL,
	[encargado] [nvarchar](50) NULL,
	[serie] [bigint] NOT NULL,
	[armamento] [bit] NULL,
	[tienda] [bit] NULL,
	[prestamo] [float] NULL,
	[maquinaria] [bit] NULL,
	[productos_organicos] [bit] NULL,
	[rifa] [bigint] NULL,
	[PromoCON] [bit] NOT NULL,
	[PromoCRE] [bit] NOT NULL,
	[CostoReal] [float] NULL,
	[ValidaExistencia] [bit] NOT NULL,
	[Actualizado] [bit] NOT NULL,
	[FechaActualizacion] [date] NULL,
	[Id_Impuesto] [int] NOT NULL,
	[ActivarBodega2] [bit] NOT NULL,
	[ExistenciaBodega2] [float] NOT NULL,
	[EnToma] [bit] NOT NULL,
	[UsaGalon] [bit] NOT NULL,
	[ApicarDescuentoTarjeta] [bit] NOT NULL,
	[SoloContado] [bit] NOT NULL,
	[SoloConExistencia] [bit] NOT NULL,
	[MAG] [bit] NOT NULL,
	[SinDecimal] [bit] NOT NULL,
	[CODCABYS] [nvarchar](30) NOT NULL,
	[CodigoPrestamo] [bigint] NOT NULL,
	[Muestra] [bit] NOT NULL,
	[Web] [bit] NOT NULL,
	[SoloUsoInterno] [bit] NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MensajeReceptor]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MensajeReceptor](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](50) NOT NULL,
	[NumeroCedulaEmisor] [varchar](50) NOT NULL,
	[FechaEmisionDoc] [datetime] NOT NULL,
	[Mensaje] [varchar](50) NOT NULL,
	[MontoTotalImpuesto] [float] NOT NULL,
	[TotalFactura] [float] NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[Consecutivo] [varchar](100) NOT NULL,
	[Proveedor] [nvarchar](1000) NOT NULL,
	[Moneda] [nvarchar](50) NOT NULL,
	[FechaComprobante] [datetime] NULL,
	[PDF] [varchar](500) NOT NULL,
	[DetalleMensaje] [nvarchar](255) NOT NULL,
	[CodigoActividad] [nvarchar](255) NOT NULL,
	[CondicionImpuesto] [nvarchar](255) NOT NULL,
	[MontoTotalImpuestoAcreditar] [float] NOT NULL,
	[CodProveedor] [int] NULL,
	[IdEmpresa] [int] NULL,
	[MontoTotalDeGastoAplicable] [float] NOT NULL,
 CONSTRAINT [PK_MensajeReceptor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Presentaciones]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Presentaciones](
	[Presentaciones] [varchar](50) NOT NULL,
	[CodPres] [int] IDENTITY(1,1) NOT NULL,
	[MH] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Presentaciones] PRIMARY KEY CLUSTERED 
(
	[CodPres] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedores](
	[CodigoProv] [int] NOT NULL,
	[Cedula] [varchar](20) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Contacto] [varchar](250) NOT NULL,
	[Telefono_Cont] [varchar](15) NOT NULL,
	[Observaciones] [varchar](250) NOT NULL,
	[Telefono1] [varchar](15) NOT NULL,
	[Telefono2] [varchar](15) NOT NULL,
	[Fax1] [varchar](15) NOT NULL,
	[Fax2] [varchar](15) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Direccion] [varchar](250) NOT NULL,
	[MontoCredito] [float] NOT NULL,
	[Plazo] [int] NOT NULL,
	[CostoTotal] [bit] NOT NULL,
	[ImpIncluido] [bit] NOT NULL,
	[PedidosMes] [int] NOT NULL,
	[Utilidad_Inventario] [float] NOT NULL,
	[Utilidad_Fija] [bit] NOT NULL,
	[CuentaContable] [varchar](50) NULL,
	[DescripcionCuentaContable] [varchar](50) NULL,
	[Actualizado] [bit] NOT NULL,
	[Inhabilitado] [bit] NOT NULL,
	[FEC] [bit] NOT NULL,
	[TipoProveedor] [nvarchar](50) NOT NULL,
	[Id_Provincia] [numeric](18, 0) NOT NULL,
	[Id_Canton] [numeric](18, 0) NOT NULL,
	[Id_Distrito] [numeric](18, 0) NOT NULL,
	[OtrasSenas] [nvarchar](50) NOT NULL,
	[CodigoActividad] [nvarchar](50) NOT NULL,
	[CorreoElectronico] [nvarchar](255) NOT NULL,
	[Serie] [bit] NOT NULL,
	[Bloqueado] [bit] NOT NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[CodigoProv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposIdentificacion]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposIdentificacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[CodigoFE] [int] NOT NULL,
 CONSTRAINT [PK_TiposIdentificacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Num_Factura] [float] NOT NULL,
	[Tipo] [varchar](3) NOT NULL,
	[Cod_Cliente] [bigint] NOT NULL,
	[Nombre_Cliente] [varchar](250) NOT NULL,
	[Orden] [varchar](75) NOT NULL,
	[Cedula_Usuario] [varchar](75) NOT NULL,
	[Pago_Comision] [bit] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Descuento] [float] NOT NULL,
	[Imp_Venta] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Vence] [smalldatetime] NOT NULL,
	[Cod_Encargado_Compra] [varchar](75) NOT NULL,
	[Contabilizado] [bit] NOT NULL,
	[AsientoVenta] [bigint] NOT NULL,
	[ContabilizadoCVenta] [bit] NOT NULL,
	[AsientoCosto] [bigint] NOT NULL,
	[Anulado] [bit] NOT NULL,
	[PagoImpuesto] [int] NOT NULL,
	[FacturaCancelado] [bit] NOT NULL,
	[Num_Apertura] [bigint] NOT NULL,
	[Entregado] [bit] NOT NULL,
	[Cod_Moneda] [int] NOT NULL,
	[Moneda_Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](250) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[SubTotalGravada] [float] NOT NULL,
	[SubTotalExento] [float] NOT NULL,
	[Transporte] [float] NOT NULL,
	[Tipo_Cambio] [float] NOT NULL,
	[Observaciones] [varchar](500) NULL,
	[Exonerar] [bit] NOT NULL,
	[Taller] [bit] NOT NULL,
	[Mascotas] [bit] NOT NULL,
	[Num_Caja] [bigint] NOT NULL,
	[agente] [bit] NULL,
	[cod_agente] [bigint] NULL,
	[apartado] [bigint] NULL,
	[EnviadoMH] [bit] NOT NULL,
	[Cedula] [varchar](100) NULL,
	[ClaveMH] [varchar](100) NOT NULL,
	[EstadoMH] [nvarchar](50) NOT NULL,
	[TipoCedula] [varchar](50) NULL,
	[ConsecutivoMH] [varchar](100) NOT NULL,
	[excluirCxC] [bit] NOT NULL,
	[Id_Adelanto] [numeric](18, 0) NOT NULL,
	[Reenviar] [bit] NOT NULL,
	[NumeroReenvio] [numeric](18, 0) NOT NULL,
	[ClaveReenvio] [nvarchar](100) NOT NULL,
	[ConsecutivoReenvio] [nvarchar](100) NOT NULL,
	[Archivada] [bit] NOT NULL,
	[UsuarioArchivo] [nvarchar](50) NOT NULL,
	[FechaArchivo] [datetime] NULL,
	[Frecuente] [bit] NOT NULL,
	[Id_FacturaRemplaza] [numeric](18, 0) NOT NULL,
	[Renta] [bit] NOT NULL,
	[Etapa] [numeric](18, 0) NOT NULL,
	[idEmpresa] [int] NULL,
	[FechaEtapa] [datetime] NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Ventas] UNIQUE CLUSTERED 
(
	[Num_Factura] ASC,
	[Tipo] ASC,
	[Num_Caja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ventas_Detalle]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ventas_Detalle](
	[id_venta_detalle] [bigint] IDENTITY(1,1) NOT NULL,
	[Id_Factura] [bigint] NOT NULL,
	[Codigo] [bigint] NOT NULL,
	[CodArticulo] [varchar](250) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Cantidad] [float] NOT NULL,
	[Precio_Costo] [float] NOT NULL,
	[Precio_Base] [float] NOT NULL,
	[Precio_Flete] [float] NOT NULL,
	[Precio_Otros] [float] NOT NULL,
	[Precio_Unit] [float] NOT NULL,
	[Descuento] [float] NOT NULL,
	[Monto_Descuento] [float] NOT NULL,
	[Impuesto] [float] NOT NULL,
	[Monto_Impuesto] [float] NOT NULL,
	[SubtotalGravado] [float] NOT NULL,
	[SubTotalExcento] [float] NOT NULL,
	[SubTotal] [float] NOT NULL,
	[Devoluciones] [float] NOT NULL,
	[Numero_Entrega] [float] NOT NULL,
	[Max_Descuento] [float] NOT NULL,
	[Tipo_Cambio_ValorCompra] [float] NOT NULL,
	[Cod_MonedaVenta] [int] NOT NULL,
	[Lote] [varchar](250) NOT NULL,
	[CantVet] [float] NOT NULL,
	[CantBod] [float] NOT NULL,
	[Disminuye] [float] NULL,
	[empaquetado] [bit] NULL,
	[nota_pantalla] [varchar](250) NULL,
	[id_bodega] [bigint] NULL,
	[regalias] [float] NULL,
	[CostoReal] [float] NULL,
	[IdTipoExoneracion] [numeric](18, 0) NOT NULL,
	[NumeroDocumento] [varchar](100) NOT NULL,
	[FechaEmision] [datetime] NULL,
	[PorcentajeCompra] [float] NOT NULL,
	[Id_Impuesto] [numeric](18, 0) NOT NULL,
	[entregado] [bit] NULL,
	[Entregados] [numeric](18, 2) NOT NULL,
	[IdSerie] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Ventas_Detalle] PRIMARY KEY CLUSTERED 
(
	[id_venta_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[viewSubtotalesFactura43]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewSubtotalesFactura43]
AS
SELECT        v.Id_Factura, SUM(CASE WHEN i.Servicio = 1 AND imp.Porcentaje = 0 THEN ROUND(v.SubTotal, 5) ELSE 0 END) AS TotalServiciosExento, SUM(CASE WHEN i.Servicio = 1 AND imp.Porcentaje > 0 THEN ROUND(v.SubTotal, 5) 
                         ELSE 0 END) AS TotalServiciosGravado, SUM(CASE WHEN i.Servicio = 1 AND imp.Porcentaje > 0 THEN ROUND(v.subtotal * (v.PorcentajeCompra / 13), 5) ELSE 0 END) AS TotalServiciosExonerado, 
                         SUM(CASE WHEN i.Servicio = 0 AND imp.Porcentaje = 0 THEN ROUND(v.SubTotal, 5) ELSE 0 END) AS TotalMercaderiaExento, SUM(CASE WHEN i.Servicio = 0 AND imp.Porcentaje > 0 THEN ROUND(v.SubTotal, 5) ELSE 0 END) 
                         AS TotalMercaderiaGravado, SUM(CASE WHEN i.Servicio = 0 AND imp.Porcentaje > 0 THEN ROUND(v.subtotal * (v.PorcentajeCompra / 13), 5) ELSE 0 END) AS TotalMercaderiaExonerado, 
                         SUM(CASE WHEN imp.Porcentaje = 0 THEN ROUND(v.SubTotal, 5) ELSE 0 END) AS TotalExento, SUM(CASE WHEN imp.Porcentaje > 0 THEN ROUND(v.SubTotal, 5) ELSE 0 END) AS TotalGravado, 
                         SUM(CASE WHEN imp.Porcentaje > 0 THEN ROUND(v.SubTotal * (v.PorcentajeCompra / 13), 5) ELSE 0 END) AS TotalExonerado, SUM(ROUND(v.SubTotal, 5)) AS Total, SUM(ROUND(v.Monto_Descuento, 5)) AS TotalDescuento, 
                         SUM(ROUND(v.SubTotal, 5) - ROUND(v.Monto_Descuento, 5)) AS TotalVentaNeta, SUM(ROUND(v.Monto_Impuesto, 5)) AS TotalImpuesto, SUM(ROUND(v.SubTotal, 5) - ROUND(v.Monto_Descuento, 5) + ROUND(v.Monto_Impuesto,
                          5)) AS TotalComprobante
FROM            dbo.Ventas_Detalle AS v INNER JOIN
                         dbo.Inventario AS i ON v.Codigo = i.Codigo INNER JOIN
                         dbo.Impuestos AS imp ON v.Id_Impuesto = imp.Id_Impuesto
WHERE        (v.Id_Factura >= 1255682)
GROUP BY v.Id_Factura

GO
/****** Object:  View [dbo].[viewTemp]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewTemp]
AS
  SELECT
  v.Id
  ,'SeePOS' AS BasedeDatos
  ,'FACTURA' AS TipoDoc
  ,v.Tipo
  ,LOWER(v.EstadoMH) AS EstadoMH
  ,CASE v.Reenviar
  WHEN 0 THEN v.ConsecutivoMH
  WHEN 1 THEN v.ConsecutivoReenvio
  END AS Consecutivo
  ,CONVERT(VARCHAR(32), CONVERT(DATETIMEOFFSET(3), v.Fecha), 127) AS FechaEmision
  ,sf.TotalComprobante
  ,v.Reenviar
  FROM dbo.Ventas AS v
  INNER JOIN dbo.viewSubtotalesFactura43 AS sf
  ON sf.Id_Factura = v.Id
  WHERE (v.EnviadoMH = 0)
  AND v.estadomh NOT IN ('rechazado')
  AND tipo NOT IN ('apa')
UNION
  SELECT
  Devolucion AS Id
  ,'SeePOS' AS Basededatos
  ,'DEVOLUCION' AS TipoDoc
  ,'DEV' AS Tipo
  ,ESTADODGT AS EstadoMH
  ,'' AS Consecutivo
  ,CONVERT(VARCHAR(32), CONVERT(DATETIMEOFFSET(3), Fecha), 127)
  AS FechaEmision
  ,Monto
  ,0 AS Reenviar
  FROM dbo.devoluciones_ventas
  WHERE (CONSECUTIVO > 0)
  AND (ENVIADODGT = 0)
  AND estadodgt NOT IN ('rechazado')
UNION
  SELECT
  id
  ,'SeePOS' AS BasedeDatos
  ,'MENSAJE'
  ,'MENSAJE'
  ,Estado
  ,Consecutivo
  ,CONVERT(VARCHAR(32), CONVERT(DATETIMEOFFSET(3), FechaEmisionDoc), 127)
  ,TotalFactura
  ,0 AS Reenviar
  FROM dbo.MensajeReceptor
  WHERE estado NOT IN ('rechazado', 'aceptado', ' ')
  AND MENSAJE <> 'PENDIENTE'
  AND seepos.dbo.dateonly(fechaemisiondoc) >= '01/07/2019'


GO
/****** Object:  View [dbo].[viewFacturas]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewFacturas]
AS
SELECT TOP (100) PERCENT
  Id
 ,BasedeDatos
 ,TipoDoc
 ,Tipo
 ,CASE EstadoMH
    WHEN '' THEN 'procesando'
    ELSE estadomh
  END AS EstadoMH
 ,Consecutivo
 ,FechaEmision
 ,TotalComprobante
 ,Reenviar
FROM dbo.viewTemp

GO
/****** Object:  View [dbo].[viewMensajeReceptor]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewMensajeReceptor]
AS
SELECT TOP (100) PERCENT
  Clave
 ,NumeroCedulaEmisor AS CedulaEmisor
 ,Proveedor AS NombreEmisor
 ,FechaEmisionDoc AS FechaEmision
 ,Mensaje
 ,Estado
 ,MontoTotalImpuesto
 ,TotalFactura
FROM dbo.MensajeReceptor AS m

GO
/****** Object:  View [dbo].[viewSubtotalesDevoluciones43]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[viewSubtotalesDevoluciones43]
AS
SELECT
  v.Devolucion
 ,SUM(CASE i.Servicio
    WHEN 1 THEN (CASE i.IVenta
        WHEN 0 THEN v.SubTotal
        ELSE 0
      END)
    ELSE 0
  END) AS TotalServiciosExento
 ,SUM(CASE i.Servicio
    WHEN 1 THEN (CASE i.IVenta
        WHEN 0 THEN 0
        ELSE v.SubTotal
      END)
    ELSE 0
  END) AS TotalServiciosGravado
 ,SUM(CASE
    WHEN i.Servicio = 1 AND
      i.iventa > 0 AND
      vd.PorcentajeCompra > 0 THEN ROUND(((v.subtotal * vd.PorcentajeCompra / 100)), 5)
    ELSE 0
  END) AS TotalServiciosExonerado
 ,SUM(CASE i.Servicio
    WHEN 0 THEN (CASE i.IVenta
        WHEN 0 THEN v.SubTotal
        ELSE 0
      END)
    ELSE 0
  END) AS TotalMercaderiaExento
 ,SUM(CASE i.Servicio
    WHEN 0 THEN (CASE i.IVenta
        WHEN 0 THEN 0
        ELSE v.SubTotal
      END)
    ELSE 0
  END) AS TotalMercaderiaGravado
 ,SUM(CASE
    WHEN i.Servicio = 0 AND
      i.iventa > 0 AND
      vd.PorcentajeCompra > 0 THEN ROUND(((v.subtotal * vd.PorcentajeCompra / 13)), 5)
    ELSE 0
  END) AS TotalMercaderiaExonerado
 ,SUM(CASE i.IVenta
    WHEN 0 THEN v.SubTotal
    ELSE 0
  END) AS TotalExento
 ,SUM(CASE i.IVenta
    WHEN 0 THEN 0
    ELSE v.SubTotal
  END) AS TotalGravado
 ,SUM(CASE
    WHEN i.iventa > 0 AND
      vd.PorcentajeCompra > 0 THEN ROUND(((v.subtotal * vd.PorcentajeCompra / 13)), 5)
    ELSE 0
  END)
  AS TotalExonerado
 ,SUM(v.SubTotal) AS Total
 ,SUM(v.Monto_Descuento) AS TotalDescuento
 ,SUM(v.SubTotal - v.Monto_Descuento) AS TotalVentaNeta
 ,SUM(v.Monto_Impuesto) AS TotalImpuesto
 ,SUM(v.SubTotal - v.Monto_Descuento + v.Monto_Impuesto) AS TotalComprobante
FROM dbo.articulos_ventas_devueltos AS v
INNER JOIN dbo.Ventas_Detalle AS vd
  ON v.Id_Art_Venta = vd.id_venta_detalle
INNER JOIN dbo.Inventario AS i
  ON v.Codigo = i.Codigo
GROUP BY v.Devolucion

GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Codigo]  DEFAULT ((0)) FOR [Codigo]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_CodArticulo]  DEFAULT ((0)) FOR [CodArticulo]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Descripcion]  DEFAULT ('') FOR [Descripcion]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Base]  DEFAULT ((0)) FOR [Base]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Monto_Flete]  DEFAULT ((0)) FOR [Monto_Flete]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_OtrosCargos]  DEFAULT ((0)) FOR [OtrosCargos]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Costo]  DEFAULT ((0)) FOR [Costo]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Cantidad]  DEFAULT ((0)) FOR [Cantidad]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Regalias]  DEFAULT ((0)) FOR [Regalias]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Gravado]  DEFAULT ((0)) FOR [Gravado]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Exento]  DEFAULT ((0)) FOR [Exento]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Descuento]  DEFAULT ((0)) FOR [Descuento]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Impuesto]  DEFAULT ((0)) FOR [Impuesto]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Devoluciones]  DEFAULT ((0)) FOR [Devoluciones]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Precio_A]  DEFAULT ((0)) FOR [Precio_A]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Precio_B]  DEFAULT ((0)) FOR [Precio_B]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Precio_C]  DEFAULT ((0)) FOR [Precio_C]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Precio_D]  DEFAULT ((0)) FOR [Precio_D]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_CodMonedaVenta]  DEFAULT ((0)) FOR [CodMonedaVenta]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_NuevoCostoBase]  DEFAULT ((0)) FOR [NuevoCostoBase]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Lote]  DEFAULT ((0)) FOR [Lote]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_Bonificado]  DEFAULT ((0)) FOR [Bonificado]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_CodigoBonificado]  DEFAULT ((0)) FOR [CodigoBonificado]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_CantidadBonificado]  DEFAULT ((0)) FOR [CantidadBonificado]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_CostoBonificado]  DEFAULT ((0)) FOR [CostoBonificado]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_SubTotalBonificado]  DEFAULT ((0)) FOR [SubTotalBonificado]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_CodArticuloBonificacion]  DEFAULT ('') FOR [CodArticuloBonificacion]
GO
ALTER TABLE [dbo].[articulos_comprados] ADD  CONSTRAINT [DF_articulos_comprados_CodCabys]  DEFAULT ('') FOR [CodCabys]
GO
ALTER TABLE [dbo].[articulos_ventas_devueltos] ADD  CONSTRAINT [DF_articulos_ventas_devueltos_CantVet]  DEFAULT ((0)) FOR [CantVet]
GO
ALTER TABLE [dbo].[articulos_ventas_devueltos] ADD  CONSTRAINT [DF_articulos_ventas_devueltos_CantBod]  DEFAULT ((0)) FOR [CantBod]
GO
ALTER TABLE [dbo].[articulos_ventas_devueltos] ADD  CONSTRAINT [DF__tmp_artic__Id_Ar__60C757A0]  DEFAULT ((0)) FOR [Id_Art_Venta]
GO
ALTER TABLE [dbo].[articulos_ventas_devueltos] ADD  CONSTRAINT [DF_articulos_ventas_devueltos_id_articulo_V]  DEFAULT ((0)) FOR [id_articulo_V]
GO
ALTER TABLE [dbo].[articulos_ventas_devueltos] ADD  CONSTRAINT [DF_articulos_ventas_devueltos_empaquetado]  DEFAULT ((0)) FOR [empaquetado]
GO
ALTER TABLE [dbo].[articulos_ventas_devueltos] ADD  CONSTRAINT [DF_articulos_ventas_devueltos_recibido]  DEFAULT ((0)) FOR [recibido]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_cedula]  DEFAULT ('') FOR [cedula]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_nombre]  DEFAULT ('') FOR [nombre]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_observaciones]  DEFAULT ('') FOR [observaciones]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_telefono_01]  DEFAULT ('') FOR [Telefono_01]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_telefono_02]  DEFAULT ('') FOR [telefono_02]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_fax_01]  DEFAULT ('') FOR [fax_01]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_fax_02]  DEFAULT ('') FOR [fax_02]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_e_mail]  DEFAULT ('') FOR [e_mail]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_abierto]  DEFAULT ('') FOR [abierto]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_direccion]  DEFAULT ('') FOR [direccion]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_impuesto]  DEFAULT ((0)) FOR [impuesto]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_limite]  DEFAULT ((0)) FOR [max_credito]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_credito]  DEFAULT ((0)) FOR [Plazo_credito]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_descuento]  DEFAULT ((0)) FOR [descuento]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_empresa]  DEFAULT ('') FOR [empresa]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_tipoprecio]  DEFAULT ((0)) FOR [tipoprecio]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_sinrestriccion]  DEFAULT ('') FOR [sinrestriccion]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_usuario]  DEFAULT ('') FOR [usuario]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_cliente_nombreusuario]  DEFAULT ('') FOR [nombreusuario]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_agente]  DEFAULT ('') FOR [agente]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_CodMonedaCredito]  DEFAULT ((1)) FOR [CodMonedaCredito]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_Cliente_Moroso]  DEFAULT ((0)) FOR [Cliente_Moroso]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_PrecioSugerido]  DEFAULT ((0)) FOR [PrecioSugerido]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_Anulado]  DEFAULT ((0)) FOR [Anulado]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_OrdenCompra]  DEFAULT ((0)) FOR [OrdenCompra]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_IdTipoExoneracion]  DEFAULT ((1)) FOR [IdTipoExoneracion]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_TipoCliente]  DEFAULT (N'FISICA') FOR [TipoCliente]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_CorreoComprobante]  DEFAULT ('') FOR [CorreoComprobante]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_Actualizado]  DEFAULT ((0)) FOR [Actualizado]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_DescuentoEspecial]  DEFAULT ((0)) FOR [DescuentoEspecial]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_Relacionados]  DEFAULT ((0)) FOR [Relacionados]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_MAG]  DEFAULT ((0)) FOR [MAG]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_EnviarRecibo]  DEFAULT ((0)) FOR [EnviarRecibo]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_CorreoRecibo]  DEFAULT ('') FOR [CorreoRecibo]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_UsoInterno]  DEFAULT ((0)) FOR [UsoInterno]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_SubTotalGravado]  DEFAULT ((0)) FOR [SubTotalGravado]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_SubTotalExento]  DEFAULT ((0)) FOR [SubTotalExento]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_Descuento]  DEFAULT ((0)) FOR [Descuento]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_Impuesto]  DEFAULT ((0)) FOR [Impuesto]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_TotalFactura]  DEFAULT ((0)) FOR [TotalFactura]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_MotivoGasto]  DEFAULT ('') FOR [MotivoGasto]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_Compra]  DEFAULT ((0)) FOR [Compra]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_Contabilizado]  DEFAULT ((0)) FOR [Contabilizado]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_Consignacion]  DEFAULT ((0)) FOR [Consignacion]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_Asiento]  DEFAULT ((0)) FOR [Asiento]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_ContaInve]  DEFAULT ((0)) FOR [ContaInve]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_AsientoInve]  DEFAULT ((0)) FOR [AsientoInve]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_TipoCompra]  DEFAULT ('') FOR [TipoCompra]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_CedulaUsuario]  DEFAULT ('') FOR [CedulaUsuario]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_Cod_MonedaCompra]  DEFAULT ((0)) FOR [Cod_MonedaCompra]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_FacturaCancelado]  DEFAULT ((0)) FOR [FacturaCancelado]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_Gasto]  DEFAULT ((0)) FOR [Gasto]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_TipoCambio]  DEFAULT ((0)) FOR [TipoCambio]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_CambioImpuesto]  DEFAULT ((0)) FOR [CambioImpuesto]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_Taller]  DEFAULT ((0)) FOR [Taller]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_Mascotas]  DEFAULT ((0)) FOR [Mascotas]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_FEC]  DEFAULT ((0)) FOR [FEC]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_CodigoActividad]  DEFAULT ('') FOR [CodigoActividad]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_EnviadoDGT]  DEFAULT ((0)) FOR [EnviadoDGT]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_EstadoDGT]  DEFAULT ('') FOR [EstadoDGT]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_ConsecutivoDGT]  DEFAULT ('') FOR [ConsecutivoDGT]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_ClaveDGT]  DEFAULT ('') FOR [ClaveDGT]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_Trans]  DEFAULT ((0)) FOR [Trans]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_NumTrans]  DEFAULT ('') FOR [NumTrans]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_Prepagada]  DEFAULT ((0)) FOR [Prepagada]
GO
ALTER TABLE [dbo].[compras] ADD  CONSTRAINT [DF_compras_PreAbono]  DEFAULT ((0)) FOR [PreAbono]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Empre__658C0CBD]  DEFAULT ('') FOR [Empresa]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Tel_0__668030F6]  DEFAULT ('') FOR [Tel_01]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Tel_0__6774552F]  DEFAULT ('') FOR [Tel_02]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Fax_0__68687968]  DEFAULT ('') FOR [Fax_01]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Fax_0__695C9DA1]  DEFAULT ('') FOR [Fax_02]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Direc__6A50C1DA]  DEFAULT ('') FOR [Direccion]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Imp_V__6B44E613]  DEFAULT ((0)) FOR [Imp_Venta]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Frase__6C390A4C]  DEFAULT ('') FOR [Frase]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Cajer__6D2D2E85]  DEFAULT ((0)) FOR [Cajeros]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Inter__6E2152BE]  DEFAULT ((0)) FOR [Intereses]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Unico__6F1576F7]  DEFAULT ((0)) FOR [UnicoConsecutivo]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Numer__70099B30]  DEFAULT ((0)) FOR [NumeroConsecutivo]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__ConsC__70FDBF69]  DEFAULT ((0)) FOR [ConsContado]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Numer__71F1E3A2]  DEFAULT ((0)) FOR [NumeroContado]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__ConsC__72E607DB]  DEFAULT ((0)) FOR [ConsCredito]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Numer__73DA2C14]  DEFAULT ((0)) FOR [NumeroCredito]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__ConsP__74CE504D]  DEFAULT ((0)) FOR [ConsPuntoVenta]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Numer__75C27486]  DEFAULT ((0)) FOR [NumeroPuntoVenta]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_Taller]  DEFAULT ((0)) FOR [Taller]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_ConsTallerCon]  DEFAULT ((0)) FOR [TallerContado]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_ConsTallerCre]  DEFAULT ((0)) FOR [TallerCredito]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF__tmp_confi__Impri__76B698BF]  DEFAULT ((0)) FOR [Imprimir_en_Factura_Personalizada]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_FormatoCheck]  DEFAULT ((0)) FOR [FormatoCheck]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_Contabilidad]  DEFAULT ((0)) FOR [Contabilidad]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_CambiaPrecioCredito]  DEFAULT ((0)) FOR [CambiaPrecioCredito]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_Mascotas]  DEFAULT ((0)) FOR [Mascotas]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_MascotasContado]  DEFAULT ((0)) FOR [MascotasContado]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_MascotasCredito]  DEFAULT ((0)) FOR [MascotasCredito]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_FacturaElectronica]  DEFAULT ((0)) FOR [FacturaElectronica]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_SoloPVE]  DEFAULT ((0)) FOR [SoloPVE]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_ModoCaja]  DEFAULT ((0)) FOR [ModoCaja]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_AplicaTemperatura]  DEFAULT ((0)) FOR [AplicaTemperatura]
GO
ALTER TABLE [dbo].[configuraciones] ADD  CONSTRAINT [DF_configuraciones_ImprimeContadoPVE]  DEFAULT ((0)) FOR [ImprimeContadoPVE]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF__tmp_devol__Numer__53584DE9]  DEFAULT ((0)) FOR [NumeroAsiento]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF__tmp_devol__Cod_M__544C7222]  DEFAULT ((0)) FOR [Cod_Moneda]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF__tmp_devol__Conta__5540965B]  DEFAULT ((0)) FOR [ContabilizadoCosto]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF__tmp_devol__Numer__5634BA94]  DEFAULT ((0)) FOR [NumeroAsientoCosto]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF_devoluciones_ventas_caja]  DEFAULT ((0)) FOR [caja]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF_devoluciones_ventas_CONSECUTIVO]  DEFAULT ((0)) FOR [CONSECUTIVO]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF_devoluciones_ventas_ENVIADODGT]  DEFAULT ((0)) FOR [ENVIADODGT]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF_devoluciones_ventas_ESTADODGT]  DEFAULT ('pendiente') FOR [ESTADODGT]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF_devoluciones_ventas_CONSECUTIVODGT]  DEFAULT ('') FOR [CONSECUTIVODGT]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF_devoluciones_ventas_CLAVEDGT]  DEFAULT ('') FOR [CLAVEDGT]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF_devoluciones_ventas_MontoDevolucione]  DEFAULT ((0)) FOR [MontoDevolucion]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF_devoluciones_ventas_Num_Apertura]  DEFAULT ((0)) FOR [Num_Apertura]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF_devoluciones_ventas_UsuarioRecibio]  DEFAULT ('') FOR [UsuarioRecibio]
GO
ALTER TABLE [dbo].[devoluciones_ventas] ADD  CONSTRAINT [DF_devoluciones_ventas_NotasDevolucion]  DEFAULT ('') FOR [NotasDevolucion]
GO
ALTER TABLE [dbo].[Impuestos] ADD  CONSTRAINT [DF_Impuestos_inactivo]  DEFAULT ((0)) FOR [Inactivo]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_Cod_Articulo]  DEFAULT ('') FOR [Cod_Articulo]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Barra__10615C29]  DEFAULT ('') FOR [Barras]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Descr__11558062]  DEFAULT ('') FOR [Descripcion]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__CodPr__1249A49B]  DEFAULT ('') FOR [CodPresentacion]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__CodMa__133DC8D4]  DEFAULT ((0)) FOR [CodMarca]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__SubUb__1431ED0D]  DEFAULT ('') FOR [SubUbicacion]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Obser__15261146]  DEFAULT ('') FOR [Observaciones]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Moned__161A357F]  DEFAULT ((0)) FOR [MonedaCosto]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Moned__170E59B8]  DEFAULT ((0)) FOR [MonedaVenta]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Preci__18027DF1]  DEFAULT ((0)) FOR [Precio_Promo]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Promo__18F6A22A]  DEFAULT ((0)) FOR [Promo_Activa]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Promo__19EAC663]  DEFAULT (getdate()) FOR [Promo_Inicio]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Promo__1ADEEA9C]  DEFAULT (getdate()) FOR [Promo_Finaliza]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Max_C__1BD30ED5]  DEFAULT ((0)) FOR [Max_Comision]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Max_D__1CC7330E]  DEFAULT ((0)) FOR [Max_Descuento]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Fecha__1DBB5747]  DEFAULT (getdate()) FOR [FechaIngreso]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Servi__1EAF7B80]  DEFAULT ((0)) FOR [Servicio]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Inhab__1FA39FB9]  DEFAULT ((0)) FOR [Inhabilitado]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF__tmp_Inven__Prove__2097C3F2]  DEFAULT ((0)) FOR [Proveedor]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_Precio_Sugerido]  DEFAULT ((0)) FOR [Precio_Sugerido]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_SugeridoIV]  DEFAULT ((0)) FOR [SugeridoIV]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_PreguntaPrecio]  DEFAULT ((0)) FOR [PreguntaPrecio]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_Lote]  DEFAULT ((0)) FOR [Lote]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_Consignacion]  DEFAULT ((0)) FOR [Consignacion]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_Id_Bodega]  DEFAULT ((0)) FOR [Id_Bodega]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_ExistenciaBodega]  DEFAULT ((0)) FOR [ExistenciaBodega]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_MAX_Inventario]  DEFAULT ((0)) FOR [MAX_Inventario]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_MAX_Bodega]  DEFAULT ((0)) FOR [MAX_Bodega]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_CantidadDescarga]  DEFAULT ((0)) FOR [CantidadDescarga]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_CodigoDescarga]  DEFAULT ('') FOR [CodigoDescarga]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_DescarOtro]  DEFAULT ((0)) FOR [DescargaOtro]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_Cod_PresentOtro]  DEFAULT ((0)) FOR [Cod_PresentOtro]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_CantidadPresentOtro]  DEFAULT ((0)) FOR [CantidadPresentOtro]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_bloqueado]  DEFAULT ((0)) FOR [bloqueado]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_pantalla]  DEFAULT ((0)) FOR [pantalla]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_clinica]  DEFAULT ((0)) FOR [clinica]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_serie]  DEFAULT ((0)) FOR [serie]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_prestamo]  DEFAULT ((0)) FOR [prestamo]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_PromoCON]  DEFAULT ((0)) FOR [PromoCON]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_PromoCRE]  DEFAULT ((0)) FOR [PromoCRE]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_ValidaExistencia]  DEFAULT ((0)) FOR [ValidaExistencia]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_Actualizado]  DEFAULT ((0)) FOR [Actualizado]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_Id_Impuesto]  DEFAULT ((0)) FOR [Id_Impuesto]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_ActivarBodega2]  DEFAULT ((0)) FOR [ActivarBodega2]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_ExistenciaBodega2]  DEFAULT ((0)) FOR [ExistenciaBodega2]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_EnToma]  DEFAULT ((0)) FOR [EnToma]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_UsaGalon]  DEFAULT ((0)) FOR [UsaGalon]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_ApicarDescuentoTarjeta]  DEFAULT ((0)) FOR [ApicarDescuentoTarjeta]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_SoloContado]  DEFAULT ((0)) FOR [SoloContado]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_SoloConExistencia]  DEFAULT ((0)) FOR [SoloConExistencia]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_MAG]  DEFAULT ((0)) FOR [MAG]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_SinDecimal]  DEFAULT ((0)) FOR [SinDecimal]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_CODCABYS]  DEFAULT ((0)) FOR [CODCABYS]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_CodigoPrestamo]  DEFAULT ((0)) FOR [CodigoPrestamo]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_Muestra]  DEFAULT ((1)) FOR [Muestra]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_Web]  DEFAULT ((0)) FOR [Web]
GO
ALTER TABLE [dbo].[Inventario] ADD  CONSTRAINT [DF_Inventario_SoloUsoInterno]  DEFAULT ((0)) FOR [SoloUsoInterno]
GO
ALTER TABLE [dbo].[MensajeReceptor] ADD  CONSTRAINT [DF_MensajeReceptor_Estado]  DEFAULT ('pendiente') FOR [Estado]
GO
ALTER TABLE [dbo].[MensajeReceptor] ADD  CONSTRAINT [DF_MensajeReceptor_Consecutivo]  DEFAULT ('') FOR [Consecutivo]
GO
ALTER TABLE [dbo].[MensajeReceptor] ADD  CONSTRAINT [DF_MensajeReceptor_Proveedor]  DEFAULT ('') FOR [Proveedor]
GO
ALTER TABLE [dbo].[MensajeReceptor] ADD  CONSTRAINT [DF_MensajeReceptor_Moneda]  DEFAULT (N'CRC') FOR [Moneda]
GO
ALTER TABLE [dbo].[MensajeReceptor] ADD  CONSTRAINT [DF_MensajeReceptor_PDF]  DEFAULT ('') FOR [PDF]
GO
ALTER TABLE [dbo].[MensajeReceptor] ADD  CONSTRAINT [DF_MensajeReceptor_DetalleMensaje]  DEFAULT ('') FOR [DetalleMensaje]
GO
ALTER TABLE [dbo].[MensajeReceptor] ADD  CONSTRAINT [DF_MensajeReceptor_CodigoActividad]  DEFAULT ('') FOR [CodigoActividad]
GO
ALTER TABLE [dbo].[MensajeReceptor] ADD  CONSTRAINT [DF_MensajeReceptor_CondicionImpuesto]  DEFAULT ('') FOR [CondicionImpuesto]
GO
ALTER TABLE [dbo].[MensajeReceptor] ADD  CONSTRAINT [DF_MensajeReceptor_MontoTotalImpuestoAcreditar]  DEFAULT ((0)) FOR [MontoTotalImpuestoAcreditar]
GO
ALTER TABLE [dbo].[MensajeReceptor] ADD  CONSTRAINT [DF_MensajeReceptor_MontoTotalDeGastoAplicable]  DEFAULT ((0)) FOR [MontoTotalDeGastoAplicable]
GO
ALTER TABLE [dbo].[Presentaciones] ADD  CONSTRAINT [DF_Presentaciones_MH]  DEFAULT ('') FOR [MH]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Cedula]  DEFAULT ('') FOR [Cedula]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Nombre]  DEFAULT ('') FOR [Nombre]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Contacto]  DEFAULT ('') FOR [Contacto]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Telefono_Cont]  DEFAULT ('') FOR [Telefono_Cont]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Observaciones]  DEFAULT ('') FOR [Observaciones]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Telefono1]  DEFAULT ('') FOR [Telefono1]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Telefono2]  DEFAULT ('') FOR [Telefono2]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Fax1]  DEFAULT ('') FOR [Fax1]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Fax2]  DEFAULT ('') FOR [Fax2]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Email]  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Direccion]  DEFAULT ('') FOR [Direccion]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_MontoCredito]  DEFAULT ((0)) FOR [MontoCredito]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Plazo]  DEFAULT ((0)) FOR [Plazo]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_CostoTotal]  DEFAULT ((0)) FOR [CostoTotal]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_ImpIncluido]  DEFAULT ((0)) FOR [ImpIncluido]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_PedidosMes]  DEFAULT ((0)) FOR [PedidosMes]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Utilidad_Inventario]  DEFAULT ((0)) FOR [Utilidad_Inventario]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Utilidad_Fija]  DEFAULT ((0)) FOR [Utilidad_Fija]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Actualizado]  DEFAULT ((0)) FOR [Actualizado]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Inhabilitado]  DEFAULT ((0)) FOR [Inhabilitado]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_FEC]  DEFAULT ((0)) FOR [FEC]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_TipoProveedor]  DEFAULT ('') FOR [TipoProveedor]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Id_Provincia]  DEFAULT ((0)) FOR [Id_Provincia]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Id_Canton]  DEFAULT ((0)) FOR [Id_Canton]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Id_Distrito]  DEFAULT ((0)) FOR [Id_Distrito]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_OtrasSenas]  DEFAULT ('') FOR [OtrasSenas]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_CodigoActividad]  DEFAULT ('') FOR [CodigoActividad]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_CorreoElectronico]  DEFAULT ('') FOR [CorreoElectronico]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Serie]  DEFAULT ((0)) FOR [Serie]
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Bloqueado]  DEFAULT ((0)) FOR [Bloqueado]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_AsientoCosto]  DEFAULT ((0)) FOR [AsientoCosto]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_Taller]  DEFAULT ((0)) FOR [Taller]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_Mascotas]  DEFAULT ((0)) FOR [Mascotas]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_Num_Caja]  DEFAULT ((1)) FOR [Num_Caja]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_EnviadoMH]  DEFAULT ((0)) FOR [EnviadoMH]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_Cedula]  DEFAULT ('000000000') FOR [Cedula]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_ClaveMH]  DEFAULT ('') FOR [ClaveMH]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_EstadoMH]  DEFAULT ('pendiente') FOR [EstadoMH]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_TipoCedula]  DEFAULT ('FISICA') FOR [TipoCedula]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_ConsecutivoMH]  DEFAULT ('') FOR [ConsecutivoMH]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_excluirCxC]  DEFAULT ((0)) FOR [excluirCxC]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_Id_Adelanto]  DEFAULT ((0)) FOR [Id_Adelanto]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_Reenviar]  DEFAULT ((0)) FOR [Reenviar]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_NumeroReenvio]  DEFAULT ((0)) FOR [NumeroReenvio]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_ClaveRenvio]  DEFAULT ('') FOR [ClaveReenvio]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_ConsecutivoRenvio]  DEFAULT ('') FOR [ConsecutivoReenvio]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_Archivada]  DEFAULT ((0)) FOR [Archivada]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_UsuarioArchivo]  DEFAULT ('') FOR [UsuarioArchivo]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_Frecuente]  DEFAULT ((0)) FOR [Frecuente]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_Id_FacturaRemplaza]  DEFAULT ((0)) FOR [Id_FacturaRemplaza]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_Renta]  DEFAULT ((0)) FOR [Renta]
GO
ALTER TABLE [dbo].[Ventas] ADD  CONSTRAINT [DF_Ventas_Etapa]  DEFAULT ((0)) FOR [Etapa]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_CodArticulo]  DEFAULT ((0)) FOR [CodArticulo]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_Tipo_Cambio]  DEFAULT ((1)) FOR [Tipo_Cambio_ValorCompra]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_Cod_MonedaVenta]  DEFAULT ((500)) FOR [Cod_MonedaVenta]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_Lote]  DEFAULT ((0)) FOR [Lote]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_Existencia]  DEFAULT ((0)) FOR [CantVet]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_ExisBodega]  DEFAULT ((0)) FOR [CantBod]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_Factor]  DEFAULT ((0)) FOR [Disminuye]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_nota_pantalla]  DEFAULT ('-') FOR [nota_pantalla]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_id_bodega]  DEFAULT ((0)) FOR [id_bodega]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_regalias]  DEFAULT ((0)) FOR [regalias]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_IdTipoExoneracion]  DEFAULT ((0)) FOR [IdTipoExoneracion]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_NumeroDocumento]  DEFAULT ('') FOR [NumeroDocumento]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_PorcentajeCompra]  DEFAULT ((0)) FOR [PorcentajeCompra]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_Id_Impuesto]  DEFAULT ((0)) FOR [Id_Impuesto]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_entregado]  DEFAULT ((0)) FOR [entregado]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_Entregados]  DEFAULT ((0)) FOR [Entregados]
GO
ALTER TABLE [dbo].[Ventas_Detalle] ADD  CONSTRAINT [DF_Ventas_Detalle_IdSerie]  DEFAULT ((0)) FOR [IdSerie]
GO
ALTER TABLE [dbo].[articulos_comprados]  WITH NOCHECK ADD  CONSTRAINT [FK_articulos_comprados_compras] FOREIGN KEY([IdCompra])
REFERENCES [dbo].[compras] ([Id_Compra])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[articulos_comprados] CHECK CONSTRAINT [FK_articulos_comprados_compras]
GO
ALTER TABLE [dbo].[articulos_comprados]  WITH CHECK ADD  CONSTRAINT [FK_articulos_comprados_Inventario] FOREIGN KEY([Codigo])
REFERENCES [dbo].[Inventario] ([Codigo])
GO
ALTER TABLE [dbo].[articulos_comprados] CHECK CONSTRAINT [FK_articulos_comprados_Inventario]
GO
ALTER TABLE [dbo].[articulos_ventas_devueltos]  WITH NOCHECK ADD  CONSTRAINT [FK_articulos_ventas_devueltos_devoluciones_ventas] FOREIGN KEY([Devolucion])
REFERENCES [dbo].[devoluciones_ventas] ([Devolucion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[articulos_ventas_devueltos] CHECK CONSTRAINT [FK_articulos_ventas_devueltos_devoluciones_ventas]
GO
ALTER TABLE [dbo].[articulos_ventas_devueltos]  WITH CHECK ADD  CONSTRAINT [FK_articulos_ventas_devueltos_Inventario] FOREIGN KEY([Codigo])
REFERENCES [dbo].[Inventario] ([Codigo])
GO
ALTER TABLE [dbo].[articulos_ventas_devueltos] CHECK CONSTRAINT [FK_articulos_ventas_devueltos_Inventario]
GO
ALTER TABLE [dbo].[compras]  WITH NOCHECK ADD  CONSTRAINT [FK_compras_Proveedores] FOREIGN KEY([CodigoProv])
REFERENCES [dbo].[Proveedores] ([CodigoProv])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[compras] CHECK CONSTRAINT [FK_compras_Proveedores]
GO
ALTER TABLE [dbo].[configuraciones]  WITH CHECK ADD  CONSTRAINT [FK_configuraciones_Emisor] FOREIGN KEY([idEmisor])
REFERENCES [dbo].[Emisor] ([Id])
GO
ALTER TABLE [dbo].[configuraciones] CHECK CONSTRAINT [FK_configuraciones_Emisor]
GO
ALTER TABLE [dbo].[devoluciones_ventas]  WITH CHECK ADD  CONSTRAINT [FK_devoluciones_ventas_Ventas] FOREIGN KEY([Id_Factura])
REFERENCES [dbo].[Ventas] ([Id])
GO
ALTER TABLE [dbo].[devoluciones_ventas] CHECK CONSTRAINT [FK_devoluciones_ventas_Ventas]
GO
ALTER TABLE [dbo].[Emisor]  WITH CHECK ADD  CONSTRAINT [FK_Emisor_TiposIdentificacion] FOREIGN KEY([IdTipoIdentificacion])
REFERENCES [dbo].[TiposIdentificacion] ([Id])
GO
ALTER TABLE [dbo].[Emisor] CHECK CONSTRAINT [FK_Emisor_TiposIdentificacion]
GO
ALTER TABLE [dbo].[EmpresaActividades]  WITH CHECK ADD  CONSTRAINT [FK_EmpresaActividades_ActividadEmpresa] FOREIGN KEY([idActividad])
REFERENCES [dbo].[ActividadEmpresa] ([IdActividad])
GO
ALTER TABLE [dbo].[EmpresaActividades] CHECK CONSTRAINT [FK_EmpresaActividades_ActividadEmpresa]
GO
ALTER TABLE [dbo].[EmpresaActividades]  WITH CHECK ADD  CONSTRAINT [FK_EmpresaActividades_Emisor] FOREIGN KEY([idEmisor])
REFERENCES [dbo].[Emisor] ([Id])
GO
ALTER TABLE [dbo].[EmpresaActividades] CHECK CONSTRAINT [FK_EmpresaActividades_Emisor]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Impuestos] FOREIGN KEY([Id_Impuesto])
REFERENCES [dbo].[Impuestos] ([Id_Impuesto])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Impuestos]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Presentaciones] FOREIGN KEY([CodPresentacion])
REFERENCES [dbo].[Presentaciones] ([CodPres])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Presentaciones]
GO
ALTER TABLE [dbo].[MensajeReceptor]  WITH CHECK ADD  CONSTRAINT [FK_MensajeReceptor_Emisor] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Emisor] ([Id])
GO
ALTER TABLE [dbo].[MensajeReceptor] CHECK CONSTRAINT [FK_MensajeReceptor_Emisor]
GO
ALTER TABLE [dbo].[MensajeReceptor]  WITH CHECK ADD  CONSTRAINT [FK_MensajeReceptor_Proveedores] FOREIGN KEY([CodProveedor])
REFERENCES [dbo].[Proveedores] ([CodigoProv])
GO
ALTER TABLE [dbo].[MensajeReceptor] CHECK CONSTRAINT [FK_MensajeReceptor_Proveedores]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Clientes] FOREIGN KEY([Cod_Cliente])
REFERENCES [dbo].[Clientes] ([identificacion])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Clientes]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Emisor] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Emisor] ([Id])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Emisor]
GO
ALTER TABLE [dbo].[Ventas_Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Detalle_Inventario1] FOREIGN KEY([Codigo])
REFERENCES [dbo].[Inventario] ([Codigo])
GO
ALTER TABLE [dbo].[Ventas_Detalle] CHECK CONSTRAINT [FK_Ventas_Detalle_Inventario1]
GO
ALTER TABLE [dbo].[Ventas_Detalle]  WITH NOCHECK ADD  CONSTRAINT [FK_Ventas_Detalle_Ventas] FOREIGN KEY([Id_Factura])
REFERENCES [dbo].[Ventas] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ventas_Detalle] CHECK CONSTRAINT [FK_Ventas_Detalle_Ventas]
GO
/****** Object:  StoredProcedure [dbo].[Obtener_DetallesDevolucion43]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Obtener_DetallesDevolucion43] @IdDevolucion NUMERIC,
@BasedeDatos VARCHAR(100)
AS
BEGIN

  IF @BasedeDatos = 'SeePOS'
  BEGIN
    SELECT
      i.codcabys AS Cabys
     ,'04' AS Tipo
     ,vd.Codigo AS Codigo
     ,ROUND(vd.cantidad, 3) AS Cantidad
     ,p.MH AS UnidadMedida
     ,vd.Descripcion AS Detalle
     ,ROUND(vd.Precio_Unit, 5) AS PrecioUnitario
     ,ROUND(vd.Cantidad * vd.Precio_Unit, 5) AS MontoTotal
     ,vd.Descuento
     ,ROUND(vd.Monto_Descuento, 5) AS MontoDescuento
     ,vd.Descripcion AS NaturalezaDescuento
     ,ROUND((vd.Cantidad * vd.Precio_Unit) - vd.Monto_Descuento, 5) AS SubTotal
     ,imp.Codigo_Impuesto AS Codigo_Impuesto
     ,imp.Codigo_Tarifa AS CodigoTarifa
     ,imp.Porcentaje AS Tarifa_Impuesto
     ,ROUND(((vd.Cantidad * vd.Precio_Unit) - vd.Monto_Descuento) * (imp.Porcentaje / 100), 5) AS Monto_Impuesto
     ,ISNULL(te.Codigo, '01') AS TipoDocumento_Exoneracion
     ,vv.NumeroDocumento AS NumeroDocumento_Exoneracion
     ,
      -- v.nombre_cliente as NombreInstitucion_Exoneracion, 
      'Dirección General de Hacienda' AS NombreInstitucion_Exoneracion
     ,REPLACE(CONVERT(VARCHAR(32), CONVERT(DATETIMEOFFSET(3), ISNULL(vv.FechaEmision, GETDATE())), 127), 'Z', '') AS FechaEmision_Exoneracion
     ,ROUND(((vd.SubTotal - vd.Monto_Descuento) * (i.IVenta / 100)) - vd.Monto_Impuesto, 5) AS MontoImpuesto_Exoneracion
     ,
      -- vv.PorcentajeCompra as PorcentajeCompra_Exoneracion,
      CASE
        WHEN vv.PorcentajeCompra > imp.Porcentaje THEN imp.Porcentaje
        ELSE vv.PorcentajeCompra
      END AS PorcentajeCompra_Exoneracion
     ,
      --round((((vd.Cantidad * vd.Precio_Unit) - vd.Monto_Descuento) * (imp.Porcentaje / 100)) - (((vd.SubTotal - vd.Monto_Descuento) * (i.IVenta / 100)) - vd.Monto_Impuesto),5) as ImpuestoNeto, 	
      ROUND((((vd.Cantidad * vd.Precio_Unit) - vd.Monto_Descuento) * (imp.Porcentaje / 100)) - (((vd.SubTotal - vd.Monto_Descuento) * (imp.Porcentaje / 100)) - vd.Monto_Impuesto), 5) AS ImpuestoNeto
     ,ROUND((vd.Cantidad * vd.Precio_Unit) - vd.Monto_Descuento + vd.Monto_Impuesto, 5) AS MontoTotalLinea
    FROM dbo.devoluciones_ventas d
    INNER JOIN dbo.ventas v
      ON d.Id_Factura = v.Id
    INNER JOIN dbo.articulos_ventas_devueltos vd
      ON d.Devolucion = vd.Devolucion
    INNER JOIN dbo.inventario i
      ON vd.codigo = i.codigo
    INNER JOIN dbo.presentaciones p
      ON i.CodPresentacion = p.codpres
    INNER JOIN dbo.Ventas_Detalle vv
      ON vd.Id_Art_Venta = vv.id_venta_detalle
    INNER JOIN dbo.impuestos imp
      ON vv.id_impuesto = imp.id_impuesto
    LEFT JOIN dbo.TipoExoneracion te
      ON vv.IdTipoExoneracion = te.IdTipoExoneracion
    WHERE d.Devolucion = @IdDevolucion
  END

END

GO
/****** Object:  StoredProcedure [dbo].[Obtener_DetallesFactura43]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Obtener_DetallesFactura43] @IdFactura NUMERIC,
@BasedeDatos VARCHAR(100)
AS
BEGIN

  DECLARE @porcentaje FLOAT;

  SET @porcentaje = 100;

  IF @BasedeDatos = 'SeePOS'
  BEGIN
    SELECT
      i.codcabys AS Cabys
     ,'04' AS Tipo
     ,vd.Codigo AS Codigo
     ,ROUND(cantidad, 5) AS Cantidad
     ,CASE i.Servicio
        WHEN 1 THEN 'Sp'
        ELSE p.MH
      END AS UnidadMedida
     ,vd.Descripcion AS Detalle
     ,ROUND(vd.Precio_Unit, 5) AS PrecioUnitario
     ,ROUND(vd.Cantidad * vd.Precio_Unit, 5) AS MontoTotal
     ,vd.Descuento
     ,ROUND(vd.Monto_Descuento, 5) AS MontoDescuento
     ,vd.Descripcion AS NaturalezaDescuento
     ,ROUND((vd.Cantidad * vd.Precio_Unit) - Monto_Descuento, 5) AS SubTotal
     ,imp.Codigo_Impuesto AS Codigo_Impuesto
     ,imp.Codigo_Tarifa AS CodigoTarifa
     ,imp.Porcentaje AS Tarifa_Impuesto
     ,ROUND(((vd.Cantidad * vd.Precio_Unit) - Monto_Descuento) * (imp.Porcentaje / @porcentaje), 5) AS Monto_Impuesto
     ,ISNULL(te.Codigo, '01') AS TipoDocumento_Exoneracion
     ,vd.NumeroDocumento AS NumeroDocumento_Exoneracion
     ,'Dirección General de Hacienda' AS NombreInstitucion_Exoneracion
     ,REPLACE(CONVERT(VARCHAR(32), CONVERT(DATETIMEOFFSET(3), ISNULL(vd.FechaEmision, GETDATE())), 127), 'Z', '') AS FechaEmision_Exoneracion
     ,ROUND(((vd.SubTotal - vd.Monto_Descuento) * (imp.Porcentaje / 100)) - vd.Monto_Impuesto, 5) AS MontoImpuesto_Exoneracion
     ,CASE
        WHEN vd.PorcentajeCompra > imp.Porcentaje THEN imp.Porcentaje
        ELSE vd.PorcentajeCompra
      END AS PorcentajeCompra_Exoneracion
     ,ROUND((((vd.Cantidad * vd.Precio_Unit) - Monto_Descuento) * (imp.Porcentaje / 100)) - (((vd.SubTotal - vd.Monto_Descuento) * (imp.Porcentaje / @porcentaje)) - vd.Monto_Impuesto), 5) AS ImpuestoNeto
     ,ROUND((vd.Cantidad * vd.Precio_Unit) - Monto_Descuento + vd.Monto_Impuesto, 5) AS MontoTotalLinea
    FROM dbo.ventas v
    INNER JOIN dbo.ventas_detalle vd
      ON v.id = vd.id_factura
    INNER JOIN dbo.inventario i
      ON vd.codigo = i.codigo
    INNER JOIN dbo.impuestos imp
      ON vd.Id_Impuesto = imp.id_impuesto
    INNER JOIN dbo.presentaciones p
      ON i.CodPresentacion = p.codpres
    LEFT JOIN dbo.TipoExoneracion te
      ON vd.IdTipoExoneracion = te.IdTipoExoneracion
    WHERE v.id = @IdFactura
  END

END

GO
/****** Object:  StoredProcedure [dbo].[Obtener_Devolucion43]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Obtener_Devolucion43] @IdDevolucion NUMERIC,
@BasedeDatos VARCHAR(100)
AS
BEGIN

  IF @BasedeDatos = 'SeePOS'
  BEGIN
    SELECT
      '523912' AS CodigoActividad
     ,'SeePOS' AS BasedeDatos
     ,v.Tipo AS TipoFactura
     ,d.Fecha
     ,d.devolucion
     ,d.ClaveDGT AS Clave
     ,e.Sucursal + SeePOS.dbo.ObtenerPuntoVenta(v.Tipo, v.Num_Caja) + '03' + REPLACE(STR(d.CONSECUTIVO, 10), SPACE(1), '0') AS Consecutivo
     ,REPLACE(CONVERT(VARCHAR(32), CONVERT(DATETIMEOFFSET(3), d.Fecha), 127), 'Z', '') AS FechaEmision
     ,GETDATE() AS FECHA
     ,e.Nombre AS Nombre_Emisor
     ,CASE e.TipoIdentificacion
        WHEN 'Cedula Fisica' THEN '01'
        ELSE '02'
      END AS Tipo_Emisor
     ,e.Identificacion AS Numero_Emisor
     ,e.Provincia AS Provincia_Emisor
     ,REPLACE(STR(e.Canton, 2), SPACE(1), '0') AS Canton_Emisor
     ,REPLACE(STR(e.Distrito, 2), SPACE(1), '0') AS Distrito_Emisor
     ,e.OtrasSeñas AS OtrasSenas_Emisor
     ,'506' AS CodigoPais_Emisor
     ,e.Telefono AS NumTelefono_Emisor
     ,e.Correo AS CorreoElectronico_Emisor
     ,ISNULL(c.Nombre, v.Nombre_Cliente) AS Nombre_Receptor
     ,ISNULL(c.cedula, v.Cod_Cliente) AS Numero_Receptor
     ,ISNULL(c.Telefono_01, '') AS NumTelefono_Receptor
     ,ISNULL(c.CorreoComprobante, '') AS CorreoElectronico_Receptor
     ,ISNULL(CASE ISNULL(c.TipoCliente, v.TipoCedula)
        WHEN 'FISICA' THEN '01'
        WHEN 'JURIDICA' THEN '02'
        WHEN 'DIMEX' THEN '03'
      END, '01') AS Tipo_Receptor
     ,'01' AS CondicionVenta
     , -- CASE v.Tipo WHEN 'CON' THEN '01' WHEN 'PVE' THEN '01' WHEN 'TCO' THEN '01' WHEN 'MCO' THEN '01' WHEN 'CRE' THEN '02' WHEN 'TCR' THEN '02' WHEN 'MCR' THEN '02' END AS CondicionVenta,
      '01' AS MedioPago
     ,CASE v.Cod_Moneda
        WHEN 1 THEN 'CRC'
        ELSE 'USD'
      END AS CodigoMoneda
     ,v.Tipo_Cambio AS TipoCambio
     ,ROUND(sf.TotalServiciosGravado - sf.TotalServiciosExonerado, 5) AS TotalServGravados
     ,ROUND(sf.TotalServiciosExento, 5) AS TotalServExentos
     ,ROUND(sf.TotalServiciosExonerado, 5) AS TotalServExonerado
     ,ROUND(sf.TotalMercaderiaGravado - sf.TotalMercaderiaExonerado, 5) AS TotalMercanciasGravadas
     ,ROUND(sf.TotalMercaderiaExento, 5) AS TotalMercanciasExentas
     ,ROUND(sf.TotalMercaderiaExonerado, 5) AS TotalMercExonerada
     ,ROUND(sf.TotalGravado - sf.TotalExonerado, 5) AS TotalGravado
     ,ROUND(sf.TotalExento, 5) AS TotalExento
     ,ROUND(sf.TotalExonerado, 5) AS TotalExonerado
     ,ROUND(sf.Total, 5) AS TotalVenta
     ,ROUND(sf.TotalDescuento, 5) AS TotalDescuentos
     ,ROUND(sf.TotalVentaNeta, 5) AS TotalVentaNeta
     ,ROUND(sf.TotalImpuesto, 5) AS TotalImpuesto
     ,ROUND(sf.TotalComprobante, 5) AS TotalComprobante
     ,CASE v.Tipo
        WHEN 'PVE' THEN '04'
        ELSE '01'
      END AS TipoDoc_Referencia
     ,ISNULL(v.ConsecutivoMH, ' ') AS Numero_Referencia
     ,REPLACE(CONVERT(VARCHAR(32), CONVERT(DATETIMEOFFSET(3), v.Fecha), 127), 'Z', '') AS FechaEmision_Referencia
     ,'04' AS Codigo_Referencia
     ,'Nota de credito por devolucion' AS Razon_Referencia
     ,e.NumeroResolucion
     ,e.FechaResolucion
    FROM dbo.devoluciones_ventas d
    INNER JOIN SeePos.dbo.Ventas v
      ON v.Id = d.Id_Factura
    LEFT JOIN dbo.Clientes c
      ON v.Cod_Cliente = c.identificacion
    INNER JOIN dbo.viewSubtotalesDevoluciones43 AS sf
      ON sf.Devolucion = d.Devolucion
    CROSS JOIN dbo.Emisor AS e
    WHERE (d.Devolucion = @IdDevolucion)
  END



END

GO
/****** Object:  StoredProcedure [dbo].[Obtener_Factura43]    Script Date: 21/12/2021 04:03:32 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Obtener_Factura43] @IdFactura NUMERIC,
@BasedeDatos VARCHAR(100)
AS
BEGIN

  IF @BasedeDatos = 'SeePOS'
  BEGIN
    SELECT
      '523912' AS CodigoActividad
     ,v.ClaveMH
     ,v.Id
     ,V.ConsecutivoMH AS NumeroConsecutivo
     ,V.ClaveMH AS Clave
     ,
      v.ConsecutivoMH AS Consecutivo
     ,REPLACE(CONVERT(VARCHAR(32), CONVERT(DATETIMEOFFSET(3), v.Fecha), 127), 'Z', '') AS FechaEmision
     ,v.Fecha AS FECHA
     ,e.Nombre AS Nombre_Emisor
     ,CASE e.TipoIdentificacion
        WHEN 'Cedula Fisica' THEN '01'
        ELSE '02'
      END AS Tipo_Emisor
     ,e.Identificacion AS Numero_Emisor
     ,e.Provincia AS Provincia_Emisor
     ,REPLACE(STR(e.Canton, 2), SPACE(1), '0') AS Canton_Emisor
     ,REPLACE(STR(e.Distrito, 2), SPACE(1), '0') AS Distrito_Emisor
     ,e.OtrasSeñas AS OtrasSenas_Emisor
     ,'506' AS CodigoPais_Emisor
     ,e.Telefono AS NumTelefono_Emisor
     ,e.Correo AS CorreoElectronico_Emisor
     ,v.Nombre_Cliente AS Nombre_Receptor
     ,ISNULL(c.Telefono_01, '') AS NumTelefono_Receptor
     ,ISNULL(c.CorreoComprobante, '') AS CorreoElectronico_Receptor
     ,CASE ISNULL(c.TipoCliente, v.TipoCedula)
        WHEN 'FISICA' THEN '01'
        WHEN 'JURIDICA' THEN '02'
        WHEN 'DIMEX' THEN '03'
      END AS Tipo_Receptor
     ,ISNULL(c.Cedula, CASE v.Cod_Cliente
        WHEN 0 THEN '500000000'
        ELSE v.Cod_Cliente
      END) AS Numero_Receptor
     ,CASE v.Tipo
        WHEN 'CON' THEN '01'
        WHEN 'PVE' THEN '01'
        WHEN 'TCO' THEN '01'
        WHEN 'MCO' THEN '01'
        WHEN 'CRE' THEN '02'
        WHEN 'TCR' THEN '02'
        WHEN 'MCR' THEN '02'
      END AS CondicionVenta
     ,DATEDIFF(DAY, v.Fecha, v.Vence) AS PlazoCredito
     ,v.Vence AS FechaVence
     ,v.Orden AS OrdenCompra
     ,'01' AS MedioPago
     ,CASE v.Cod_Moneda
        WHEN 1 THEN 'CRC'
        WHEN 2 THEN 'USD'
        ELSE ''
      END AS CodigoMoneda
     ,v.Tipo_Cambio AS TipoCambio
     ,ROUND(sf.TotalServiciosGravado - sf.TotalServiciosExonerado, 5) AS TotalServGravados
     ,ROUND(sf.TotalServiciosExento, 5) AS TotalServExentos
     ,ROUND(sf.TotalServiciosExonerado, 5) AS TotalServExonerado
     ,ROUND(sf.TotalMercaderiaGravado - sf.TotalMercaderiaExonerado, 5) AS TotalMercanciasGravadas
     ,ROUND(sf.TotalMercaderiaExento, 5) AS TotalMercanciasExentas
     ,ROUND(sf.TotalMercaderiaExonerado, 5) AS TotalMercExonerada
     ,ROUND(sf.TotalGravado - sf.TotalExonerado, 5) AS TotalGravado
     ,ROUND(sf.TotalExento, 5) AS TotalExento
     ,ROUND(sf.TotalExonerado, 5) AS TotalExonerado
     ,ROUND(sf.Total, 5) AS TotalVenta
     ,ROUND(sf.TotalDescuento, 5) AS TotalDescuentos
     ,ROUND(sf.TotalVentaNeta, 5) AS TotalVentaNeta
     ,ROUND(sf.TotalImpuesto, 5) AS TotalImpuesto
     ,ROUND(sf.TotalComprobante, 5) AS TotalComprobante
     ,e.NumeroResolucion
     ,e.FechaResolucion
    FROM dbo.Ventas AS v
    LEFT JOIN dbo.Clientes c
      ON v.Cod_Cliente = c.identificacion
    INNER JOIN dbo.viewSubtotalesFactura43 AS sf
      ON sf.Id_Factura = v.Id
    CROSS JOIN dbo.Emisor AS e
    WHERE (v.Id = @IdFactura)
  END


END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Clientes', @level2type=N'COLUMN',@level2name=N'Cliente_Moroso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Campo que me permitirá establecer el proveedor por defecto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventario', @level2type=N'COLUMN',@level2name=N'Proveedor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[10] 4[5] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "viewTemp"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2415
         Width = 1830
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewFacturas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewFacturas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "m"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewMensajeReceptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewMensajeReceptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[13] 4[5] 2[65] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "v"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vd"
            Begin Extent = 
               Top = 6
               Left = 278
               Bottom = 136
               Right = 529
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSubtotalesDevoluciones43'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSubtotalesDevoluciones43'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[12] 4[5] 2[45] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "v"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 327
               Bottom = 136
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "imp"
            Begin Extent = 
               Top = 6
               Left = 596
               Bottom = 136
               Right = 795
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSubtotalesFactura43'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewSubtotalesFactura43'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[11] 4[5] 2[78] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -480
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1920
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewTemp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewTemp'
GO
USE [master]
GO
ALTER DATABASE [FE] SET  READ_WRITE 
GO
