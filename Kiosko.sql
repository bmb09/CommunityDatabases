USE [master]
GO
/****** Object:  Database [kiosko]    Script Date: 04/04/2018 8:55:57 p. m. ******/
CREATE DATABASE [kiosko]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kiosko', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER2016\MSSQL\DATA\kiosko.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kiosko_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER2016\MSSQL\DATA\kiosko_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [kiosko] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kiosko].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kiosko] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kiosko] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kiosko] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kiosko] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kiosko] SET ARITHABORT OFF 
GO
ALTER DATABASE [kiosko] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kiosko] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kiosko] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kiosko] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kiosko] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kiosko] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kiosko] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kiosko] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kiosko] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kiosko] SET  ENABLE_BROKER 
GO
ALTER DATABASE [kiosko] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kiosko] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kiosko] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kiosko] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kiosko] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kiosko] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kiosko] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kiosko] SET RECOVERY FULL 
GO
ALTER DATABASE [kiosko] SET  MULTI_USER 
GO
ALTER DATABASE [kiosko] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kiosko] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kiosko] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kiosko] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kiosko] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'kiosko', N'ON'
GO
ALTER DATABASE [kiosko] SET QUERY_STORE = OFF
GO
USE [kiosko]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [kiosko]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[cliente_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[telefono] [varchar](15) NULL,
	[direccion] [varchar](250) NULL,
	[correo1] [varchar](50) NULL,
	[correo2] [varchar](50) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[cliente_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estatus]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estatus](
	[estado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[decripcion] [varchar](250) NULL,
	[tabla] [varchar](25) NULL,
 CONSTRAINT [PK_estatus] PRIMARY KEY CLUSTERED 
(
	[estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lote]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lote](
	[lote_id] [int] IDENTITY(1,1) NOT NULL,
	[producto_id] [int] NULL,
	[precio_unitario] [decimal](12, 4) NULL,
	[cantidad] [int] NULL,
	[fec_vencimiento] [date] NULL,
	[fec_ingreso] [date] NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_lote] PRIMARY KEY CLUSTERED 
(
	[lote_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orden]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden](
	[orden_id] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NULL,
	[fec_orden] [date] NULL,
	[fec_actualizacion] [date] NULL,
	[fec_saldado] [date] NULL,
	[monto] [decimal](12, 4) NULL,
	[saldo] [decimal](12, 4) NULL,
	[usuario_orden] [varchar](50) NULL,
	[usuario_actualizacion] [varchar](50) NULL,
	[usuario_saldado] [varchar](50) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_orden] PRIMARY KEY CLUSTERED 
(
	[orden_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orden_detalle]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_detalle](
	[orden_id] [int] NOT NULL,
	[producto_id] [int] NOT NULL,
	[precio_unitario] [decimal](12, 4) NULL,
	[precio_venta] [decimal](12, 4) NULL,
	[impuesto] [decimal](12, 4) NULL,
	[descuento] [decimal](12, 4) NULL,
	[cantidad] [int] NULL,
	[lote_id] [int] NULL,
 CONSTRAINT [PK_orden_detalle_1] PRIMARY KEY CLUSTERED 
(
	[orden_id] ASC,
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orden_historico]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_historico](
	[ordenH_id] [int] IDENTITY(1,1) NOT NULL,
	[orden_id] [int] NULL,
	[fec_orden] [date] NULL,
	[monto] [decimal](12, 4) NULL,
	[saldo] [decimal](12, 4) NULL,
	[usuario_orden] [varchar](50) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_orden_historico] PRIMARY KEY CLUSTERED 
(
	[ordenH_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[presentaciones]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[presentaciones](
	[presentacion_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_presentaciones] PRIMARY KEY CLUSTERED 
(
	[presentacion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[producto]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[producto_id] [int] IDENTITY(1,1) NOT NULL,
	[presentacion_id] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[precio_venta1] [decimal](18, 2) NULL,
	[precio_venta2] [decimal](18, 2) NULL,
	[precio_venta3] [decimal](18, 2) NULL,
	[detalle] [text] NULL,
	[stock] [int] NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_presentaciones2] PRIMARY KEY CLUSTERED 
(
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipo_pago]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_pago](
	[tpago_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_tipo_pago] PRIMARY KEY CLUSTERED 
(
	[tpago_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (1, N'Juan', N'Almonte', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (2, N'Juan', N'Cruz', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (3, N'Juan', N'Espinosa', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (4, N'Juan', N'Gruyon', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (6, N'Juan', N'Lid', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (7, N'Juan', N'estaroni', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (8, N'Juan', N'camino', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (9, N'Juan', N'cameron', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (10, N'Juan', N'diaz', N'', N'', N'', N'', 1)
INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (12, N'starling', N'germosen', N'4564564654', N'5465456', N'4564564', N'56456', 1)
INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (16, N'asdasd', N'asdasd', N'435345435', NULL, NULL, NULL, 1)
INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (17, N'11111', N'rff', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[cliente] ([cliente_id], [nombre], [apellido], [telefono], [direccion], [correo1], [correo2], [estado]) VALUES (18, N'Astrid', N'Cabrera', N'333233242', N'la direccion de la muerte', N'jjsjdjfsdjfj@hotmail.com', NULL, 1)
SET IDENTITY_INSERT [dbo].[cliente] OFF
SET IDENTITY_INSERT [dbo].[estatus] ON 

INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (1, N'Activo', NULL, N'cliente')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (2, N'Inactivo', NULL, N'cliente')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (3, N'Descontinuado', NULL, N'producto')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (4, N'Deudor', NULL, N'cliente')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (5, N'Iniciada', NULL, N'orden')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (6, N'Acuerdo', NULL, N'orden')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (7, N'Abonada', NULL, N'orden')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (8, N'Saldada', NULL, N'orden')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (9, N'Anulada', NULL, N'orden')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (10, N'Incobrable', NULL, N'orden')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (11, N'Atraso', NULL, N'orden')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (12, N'Pendiente', NULL, N'orden')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (21, N'Iniciada', NULL, N'orden_historico')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (22, N'Acuerdo', NULL, N'orden_historico')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (23, N'Abonada', NULL, N'orden_historico')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (24, N'Saldada', NULL, N'orden_historico')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (25, N'Anulada', NULL, N'orden_historico')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (26, N'Incobrable', NULL, N'orden_historico')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (27, N'Atraso', NULL, N'orden_historico')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (28, N'Pendiente', NULL, N'orden_historico')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (29, N'Activa', NULL, N'presentaciones')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (30, N'Inactiva', NULL, N'presentaciones')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (31, N'Activo', NULL, N'producto')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (32, N'Inactivo', NULL, N'producto')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (33, N'Activo', NULL, N'lote')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (34, N'Inactivo', NULL, N'lote')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (35, N'Agotado', NULL, N'lote')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (36, N'Activo', NULL, N'tipo_pago')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (37, N'Inactivo', NULL, N'tipo_pago')
INSERT [dbo].[estatus] ([estado], [nombre], [decripcion], [tabla]) VALUES (38, N'Descontinuado', NULL, N'tipo_pago')
SET IDENTITY_INSERT [dbo].[estatus] OFF
SET IDENTITY_INSERT [dbo].[lote] ON 

INSERT [dbo].[lote] ([lote_id], [producto_id], [precio_unitario], [cantidad], [fec_vencimiento], [fec_ingreso], [estado]) VALUES (1, 3, CAST(3.0000 AS Decimal(12, 4)), 5, CAST(N'2016-11-01' AS Date), NULL, 33)
INSERT [dbo].[lote] ([lote_id], [producto_id], [precio_unitario], [cantidad], [fec_vencimiento], [fec_ingreso], [estado]) VALUES (2, 2, CAST(7.0000 AS Decimal(12, 4)), 10, NULL, NULL, 33)
SET IDENTITY_INSERT [dbo].[lote] OFF
SET IDENTITY_INSERT [dbo].[orden] ON 

INSERT [dbo].[orden] ([orden_id], [cliente_id], [fec_orden], [fec_actualizacion], [fec_saldado], [monto], [saldo], [usuario_orden], [usuario_actualizacion], [usuario_saldado], [estado]) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[orden] OFF
SET IDENTITY_INSERT [dbo].[presentaciones] ON 

INSERT [dbo].[presentaciones] ([presentacion_id], [nombre], [estado]) VALUES (1, N'8 Onzas', 1)
INSERT [dbo].[presentaciones] ([presentacion_id], [nombre], [estado]) VALUES (2, N'Paquete', 1)
INSERT [dbo].[presentaciones] ([presentacion_id], [nombre], [estado]) VALUES (3, N'Botella', 1)
INSERT [dbo].[presentaciones] ([presentacion_id], [nombre], [estado]) VALUES (4, N'Pote', 1)
INSERT [dbo].[presentaciones] ([presentacion_id], [nombre], [estado]) VALUES (5, N'Unidad', 1)
SET IDENTITY_INSERT [dbo].[presentaciones] OFF
SET IDENTITY_INSERT [dbo].[producto] ON 

INSERT [dbo].[producto] ([producto_id], [presentacion_id], [nombre], [precio_venta1], [precio_venta2], [precio_venta3], [detalle], [stock], [estado]) VALUES (1, 1, N'Malta Morena ', CAST(26.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), NULL, N'La malta morena es uan vaina bien nutricional', 0, 31)
INSERT [dbo].[producto] ([producto_id], [presentacion_id], [nombre], [precio_venta1], [precio_venta2], [precio_venta3], [detalle], [stock], [estado]) VALUES (2, 2, N'Galleta Aviva', CAST(10.00 AS Decimal(18, 2)), NULL, NULL, NULL, 0, 31)
INSERT [dbo].[producto] ([producto_id], [presentacion_id], [nombre], [precio_venta1], [precio_venta2], [precio_venta3], [detalle], [stock], [estado]) VALUES (3, 2, N'Galleta Club Social', CAST(5.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), NULL, 0, 31)
SET IDENTITY_INSERT [dbo].[producto] OFF
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_estatus] FOREIGN KEY([estado])
REFERENCES [dbo].[estatus] ([estado])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_estatus]
GO
ALTER TABLE [dbo].[lote]  WITH CHECK ADD  CONSTRAINT [FK_lote_estatus] FOREIGN KEY([estado])
REFERENCES [dbo].[estatus] ([estado])
GO
ALTER TABLE [dbo].[lote] CHECK CONSTRAINT [FK_lote_estatus]
GO
ALTER TABLE [dbo].[lote]  WITH CHECK ADD  CONSTRAINT [FK_lote_producto] FOREIGN KEY([producto_id])
REFERENCES [dbo].[producto] ([producto_id])
GO
ALTER TABLE [dbo].[lote] CHECK CONSTRAINT [FK_lote_producto]
GO
ALTER TABLE [dbo].[orden]  WITH CHECK ADD  CONSTRAINT [FK_orden_cliente1] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[cliente] ([cliente_id])
GO
ALTER TABLE [dbo].[orden] CHECK CONSTRAINT [FK_orden_cliente1]
GO
ALTER TABLE [dbo].[orden]  WITH CHECK ADD  CONSTRAINT [FK_orden_estatus] FOREIGN KEY([estado])
REFERENCES [dbo].[estatus] ([estado])
GO
ALTER TABLE [dbo].[orden] CHECK CONSTRAINT [FK_orden_estatus]
GO
ALTER TABLE [dbo].[orden_detalle]  WITH CHECK ADD  CONSTRAINT [FK_orden_detalle_lote] FOREIGN KEY([lote_id])
REFERENCES [dbo].[lote] ([lote_id])
GO
ALTER TABLE [dbo].[orden_detalle] CHECK CONSTRAINT [FK_orden_detalle_lote]
GO
ALTER TABLE [dbo].[orden_detalle]  WITH CHECK ADD  CONSTRAINT [FK_orden_detalle_orden] FOREIGN KEY([orden_id])
REFERENCES [dbo].[orden] ([orden_id])
GO
ALTER TABLE [dbo].[orden_detalle] CHECK CONSTRAINT [FK_orden_detalle_orden]
GO
ALTER TABLE [dbo].[orden_detalle]  WITH CHECK ADD  CONSTRAINT [FK_orden_detalle_producto] FOREIGN KEY([producto_id])
REFERENCES [dbo].[producto] ([producto_id])
GO
ALTER TABLE [dbo].[orden_detalle] CHECK CONSTRAINT [FK_orden_detalle_producto]
GO
ALTER TABLE [dbo].[orden_historico]  WITH CHECK ADD  CONSTRAINT [FK_orden_historico_estatus] FOREIGN KEY([estado])
REFERENCES [dbo].[estatus] ([estado])
GO
ALTER TABLE [dbo].[orden_historico] CHECK CONSTRAINT [FK_orden_historico_estatus]
GO
ALTER TABLE [dbo].[orden_historico]  WITH CHECK ADD  CONSTRAINT [FK_orden_historico_orden1] FOREIGN KEY([orden_id])
REFERENCES [dbo].[orden] ([orden_id])
GO
ALTER TABLE [dbo].[orden_historico] CHECK CONSTRAINT [FK_orden_historico_orden1]
GO
ALTER TABLE [dbo].[presentaciones]  WITH CHECK ADD  CONSTRAINT [FK_presentaciones_estatus] FOREIGN KEY([estado])
REFERENCES [dbo].[estatus] ([estado])
GO
ALTER TABLE [dbo].[presentaciones] CHECK CONSTRAINT [FK_presentaciones_estatus]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_estatus] FOREIGN KEY([estado])
REFERENCES [dbo].[estatus] ([estado])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_estatus]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_presentaciones] FOREIGN KEY([presentacion_id])
REFERENCES [dbo].[presentaciones] ([presentacion_id])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FK_producto_presentaciones]
GO
ALTER TABLE [dbo].[tipo_pago]  WITH CHECK ADD  CONSTRAINT [FK_tipo_pago_estatus] FOREIGN KEY([estado])
REFERENCES [dbo].[estatus] ([estado])
GO
ALTER TABLE [dbo].[tipo_pago] CHECK CONSTRAINT [FK_tipo_pago_estatus]
GO
/****** Object:  StoredProcedure [dbo].[GetSaldoOrden]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSaldoOrden] 
     (@orden_id int)
     as
     select saldo from orden where orden_id=@orden_id
 


GO
/****** Object:  StoredProcedure [dbo].[GetStock]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[GetStock] 
(@producto_id int)
as
set nocount on;
 select stock from producto where producto_id= @producto_id;
return ;




GO
/****** Object:  StoredProcedure [dbo].[ListarCliente]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ListarCliente]
   -- @Cursor CURSOR VARYING OUTPUT
AS
  --  SET NOCOUNT ON;
  --  SET @Cursor = CURSOR
   -- FORWARD_ONLY STATIC FOR
      SELECT *
      FROM Cliente  where estado<>3 ;
   -- OPEN @Cursor;



GO
/****** Object:  StoredProcedure [dbo].[RealizarPago]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  
PROCEDURE [dbo].[RealizarPago](
           @orden_id                  INT                      , 
           @fec_orden date, 
                  @monto                   decimal(12,4)      = NULL   , 
             @saldo                 decimal(12,4)      = NULL   , 
           @usuario_orden                   varchar(50)     = NULL   , 
      
         @estado                       TINYINT               , 
       @Dec                   TINYINT  ,
             @sucess TINYINT output   )
AS
BEGIN
declare @CurSaldo int; 
     IF @Dec = 0 
     begin 
     INSERT INTO orden_historico
          ( 
            orden_id,
           fec_orden , 
                monto                   , 
               saldo                    , 
               usuario_orden                    , 
               estado                                   
                                  
          ) 
     VALUES 
			( 
			@orden_id,
            @fec_orden , 
                @monto                   , 
               @saldo                    , 
               @usuario_orden                    , 
               @estado                              
     
                           
	)  
	;
	exec @CurSaldo =	GetSaldoOrden @orden_id;

if @CurSaldo-@monto = 0

	update orden  
	set 
		saldo = 0, 
		estado=0,
		fec_saldado= getdate(), 
		fec_actualizacion=getdate(), 
		usuario_actualizacion=@usuario_orden , 
		usuario_saldado=@usuario_orden 
	where orden_id = @orden_id;
	else 
	update orden  
	set 
		saldo = @CurSaldo-@monto, 
		estado=1,
		--fec_saldado=sysdate, 
		fec_actualizacion=getdate(), 
		usuario_actualizacion=@usuario_orden --, 
		--usuario_saldado=@usuario_orden 
	where orden_id = @orden_id;
	
	end
	
     ELSE
    return   ;
     END  --end del procedure 
     
     
     
     
 


GO
/****** Object:  StoredProcedure [dbo].[SaveClientes]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
PROCEDURE [dbo].[SaveClientes](
           @cliente_id                  INT                      , 
                @nombre                      VARCHAR(50)      = NULL  , 
       @apellido                 varchar(50)     = NULL   , 
         @telefono                    varchar(15)      = NULL   , 
           @direccion                   varchar(250)       = NULL   , 
             @correo1                 varchar(50) = NULL , 
       @correo2                  varchar(50)     = NULL  , 
           @estado                       TINYINT               , 
       @Dec                   TINYINT  , 
       @sucess TINYINT output   )
AS
BEGIN
     IF @Dec = 0 
     INSERT INTO cliente
          ( 
            
               nombre                      , 
       apellido               , 
         telefono                    , 
           direccion               , 
             correo1                 , 
       correo2                    , 
           estado                                    
          ) 
     VALUES 
			( 
                                   
      
       @nombre                     , 
       @apellido                , 
         @telefono                , 
           @direccion             , 
             @correo1                , 
       @correo2                 , 
            @estado                             
			) ;
     ELSe IF @Dec=1 
 update cliente
          set  
          nombre  =  @nombre                     , 
    apellido   =  @apellido                 , 
       telefono  = @telefono               , 
       direccion  =   @direccion             , 
     correo1   =     @correo1               , 
     correo2   = @correo2                 , 
      estado   =  @estado    
            where 
            cliente_id= @cliente_id              
                                
			         
			 ;
         ELSe IF @Dec=3 
 update cliente
          set  
               estado   =  @estado    
            where 
            cliente_id= @cliente_id              
                                
			         
			 ;

     ELSE
    return  -1 ;
     END  --end del procedure 
     
     
 
 


GO
/****** Object:  StoredProcedure [dbo].[SaveOrden]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  
PROCEDURE [dbo].[SaveOrden](
           @orden_id                  INT                      , 
           @cliente_id int, 
           @fec_orden date, 
                  @monto                   decimal(12,4)      = NULL   , 
             @saldo                 decimal(12,4)      = NULL   , 
           @usuario_orden                   varchar(50)     = NULL   , 
      
         @estado                       TINYINT               , 
       @Dec                   TINYINT  ,
             @sucess TINYINT output   )
AS
BEGIN
 
     IF @Dec = 0 
     begin 
     INSERT INTO orden
          ( 
            orden_id,
            cliente_id,
           fec_orden , 
           fec_actualizacion,
                monto                   , 
               saldo                    , 
               usuario_orden                    , 
               usuario_actualizacion, 
               estado                                   
                                  
          ) 
     VALUES 
			( 
			@orden_id,
			  @cliente_id,
            @fec_orden , 
            getdate(),
                @monto                   , 
               @saldo                    , 
               @usuario_orden                    , 
               @usuario_orden                    , 
               1                              
     
                           
	)  
	;
	end
	
     ELSE
    return   ;
     END  --end del procedure 
     
     
     
     
 


GO
/****** Object:  StoredProcedure [dbo].[SaveOrdenDetalle]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  
PROCEDURE [dbo].[SaveOrdenDetalle](
           @orden_id                  INT                      , 
           @producto_id int, 
                  @precio_unitario                   decimal(12,4)      = NULL   , 
             @precio_venta                  decimal(12,4)      = NULL   , 
           @impuesto                   decimal(12,4)      = NULL   , 
       @descuento                   decimal(12,4)      = NULL   , 
        @cantidad                int      = NULL   , 
         @estado                       TINYINT               , 
       @Dec                   TINYINT  ,
       @ActProd tinyint = 1, 
       @sucess TINYINT output   )
AS
BEGIN
declare @CurStock int; 
     IF @Dec = 0 
     begin 
     INSERT INTO orden_detalle
          ( 
            orden_id,
           producto_id , 
                precio_unitario                   , 
               precio_venta                    , 
               impuesto                    , 
               descuento                    , 
          
       cantidad                   
                                  
          ) 
     VALUES 
			( 
			@orden_id, 
         @producto_id , 
     
           @precio_unitario                   , 
               @precio_venta                    , 
               @impuesto                    , 
               @descuento                    , 
       @cantidad                   
     
                           
	)  
	;
	exec @CurStock=	GetStock @producto_id;

	update producto  
	set 
		stock = (@CurStock - @cantidad  )
	where producto_id = @producto_id;
	
	
	end
	
     ELSE
    return   ;
     END  --end del procedure 
     
     
 
 


GO
/****** Object:  StoredProcedure [dbo].[SaveProducto]    Script Date: 04/04/2018 8:55:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE
PROCEDURE [dbo].[SaveProducto](
           @producto_id                   INT                      , 
           @presentacion_id int, 
       @nombre                       VARCHAR(50)      = NULL  , 
             @precio_venta1                   decimal(12,4)      = NULL   , 
             @precio_venta2                   decimal(12,4)      = NULL   , 
         @precio_venta3                   decimal(12,4)      = NULL   , 
  @detalle                    text      = NULL  , 
       @stock                int      = NULL   , 
  @estado                       TINYINT               , 
       @Dec                   TINYINT  , 
       @sucess TINYINT output   )
AS
BEGIN
     IF @Dec = 0 
     INSERT INTO producto
          ( 
            
           presentacion_id , 
       nombre                      , 
               precio_venta1                    , 
               precio_venta2                    , 
               precio_venta3                    , 
          
       detalle                    , 
       stock            , 
      
       estado                                    
          ) 
     VALUES 
			( 
                                   
           @presentacion_id , 
       @nombre                     , 
     
         @precio_venta1                , 
         @precio_venta2                , 
         @precio_venta3                , 
          
       @detalle                  , 
       @stock                 , 
             @estado                             
			) ;
     ELSe IF @Dec=1 
 update producto
          set  
        presentacion_id =    @presentacion_id , 
    nombre  =  @nombre                     , 
   precio_venta1  = @precio_venta1                , 
     precio_venta2  = @precio_venta2                , 
       precio_venta3  = @precio_venta3                , 
   detalle   = @detalle                  , 
    stock    = @stock                 , 
 estado   =  @estado    
            where 
            producto_id= @producto_id                
                                
			         
			 ;
          ELSe IF @Dec=2
           update producto
          set stock=@stock,
           precio_venta1  = @precio_venta1                , 
     precio_venta2  = @precio_venta2                , 
       precio_venta3  = @precio_venta3                
          where  producto_id = @producto_id  ;  

     ELSE
    return   ;
     END  --end del procedure 
     
     
 
 
GO
USE [master]
GO
ALTER DATABASE [kiosko] SET  READ_WRITE 
GO
