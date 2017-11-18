CREATE TABLE [dbo].[Sale] (
    [SaleId]         INT           IDENTITY (1, 1) NOT NULL,
    [VehicleId]      INT           NOT NULL,
    [Name]           NVARCHAR (50) NOT NULL,
    [Phone]          NCHAR (10)    NOT NULL,
    [Email]          NVARCHAR (50) NOT NULL,
    [Street1]        NVARCHAR (50) NOT NULL,
    [Street2]        NVARCHAR (50) NULL,
    [City]           NVARCHAR (50) NOT NULL,
    [StateId]        INT           NOT NULL,
    [ZipCode]        NCHAR (10)    NOT NULL,
    [PurchasePrice]  MONEY         NOT NULL,
    [PurchaseTypeId] INT           NOT NULL,
    CONSTRAINT [PK__Sales__3214EC07AF9CFB3D] PRIMARY KEY CLUSTERED ([SaleId] ASC),
    CONSTRAINT [FK_Sale_PurchaseType] FOREIGN KEY ([PurchaseTypeId]) REFERENCES [dbo].[PurchaseType] ([PurchaseTypeId]),
    CONSTRAINT [FK_Sale_State] FOREIGN KEY ([StateId]) REFERENCES [dbo].[State] ([StateId]),
    CONSTRAINT [FK_Sale_Vehicle] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([VehicleID])
);





