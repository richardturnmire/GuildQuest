CREATE TABLE [dbo].[PurchaseType] (
    [PurchaseTypeId] INT           IDENTITY (1, 1) NOT NULL,
    [Description]    NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_PurchaseType] PRIMARY KEY CLUSTERED ([PurchaseTypeId] ASC)
);

