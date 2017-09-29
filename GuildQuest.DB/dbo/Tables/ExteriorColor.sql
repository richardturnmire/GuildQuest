CREATE TABLE [dbo].[ExteriorColor] (
    [ExteriorColorID] INT          NOT NULL,
    [ExteriorColor]   VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([ExteriorColorID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ExteriorColor]
    ON [dbo].[ExteriorColor]([ExteriorColor] ASC);

