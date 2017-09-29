CREATE TABLE [dbo].[BodyStyle] (
    [BodyStyleID] INT          NOT NULL,
    [BodyStyle]   VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([BodyStyleID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_BodyStyle]
    ON [dbo].[BodyStyle]([BodyStyle] ASC);

