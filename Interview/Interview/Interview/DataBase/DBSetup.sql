IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'apotea_student')
  BEGIN
    CREATE DATABASE apotea_student


    END
    GO
       USE apotea_student
    GO

if not exists (select * from sysobjects where name='tableOrder' and xtype='U')
	CREATE TABLE [dbo].[tableOrder](
	[order_number] [int] NOT NULL,
	[order_date] [datetime] NOT NULL,
	[order_status] [int] NOT NULL,
	[shipping_method_id] [int] NOT NULL,
	[first_name] [varchar](500) NOT NULL,
	[last_name] [varchar](500) NOT NULL,
	[zip_code] [varchar](5) NOT NULL,
	PRIMARY KEY CLUSTERED 
	(
	[order_number] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO



if not exists (select * from sysobjects where name='tableOrderItem' and xtype='U')
    CREATE TABLE [dbo].[tableOrderItem](
	[order_number] [int] NOT NULL,
	[sku_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	PRIMARY KEY CLUSTERED 
	(
	[order_number] ASC,
	[sku_id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
go

if not exists (select * from sysobjects where name='tableSku' and xtype='U')
	CREATE TABLE [dbo].[tableSku](
	[sku_id] [int] NOT NULL,
	[article_name] [varchar](500) NOT NULL,
	[store_price] [decimal](10, 2) NOT NULL,
	[weight] [int] NOT NULL,
	[height] [int] NOT NULL,
	[width] [int] NOT NULL,
	[length] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
	(
	[sku_id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
GO
