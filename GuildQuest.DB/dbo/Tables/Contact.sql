CREATE TABLE [dbo].[Contact] (
    [ContactID]        INT             IDENTITY (1, 1) NOT NULL,
    [ContactName]      NVARCHAR (128)  NOT NULL,
    [ContactEmail]     NVARCHAR (128)  NOT NULL,
    [ContactPhone]     NCHAR (16)      NULL,
    [ContactSubject]   NVARCHAR (128)  NOT NULL,
    [ContactMessage]   NVARCHAR (1024) NOT NULL,
    [ContactGenerated] BIT             NULL,
    CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED ([ContactID] ASC)
);

