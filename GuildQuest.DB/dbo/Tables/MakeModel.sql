CREATE TABLE [dbo].[MakeModel] (
    [MakeModelID] INT          IDENTITY (1, 1) NOT NULL,
    [MakeID]      INT          NOT NULL,
    [ModelID]     INT          NOT NULL,
    [MakeName]    VARCHAR (50) NOT NULL,
    [ModelName]   VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_MakeModel] PRIMARY KEY CLUSTERED ([MakeModelID] ASC),
    CONSTRAINT [FK_MakeModel_Make] FOREIGN KEY ([MakeID]) REFERENCES [dbo].[Make] ([MakeID]),
    CONSTRAINT [FK_MakeModel_Model] FOREIGN KEY ([ModelID]) REFERENCES [dbo].[Model] ([ModelID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MakeModel]
    ON [dbo].[MakeModel]([MakeID] ASC, [ModelID] ASC);

