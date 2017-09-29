CREATE TABLE [dbo].[Special] (
    [Special_ID]          INT             NOT NULL,
    [Special_Title]       NVARCHAR (128)  NOT NULL,
    [Special_Description] NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_Special] PRIMARY KEY CLUSTERED ([Special_ID] ASC)
);

