CREATE TABLE [dbo].[State] (
    [StateId]               INT           IDENTITY (1, 1) NOT NULL,
    [Name]                  VARCHAR (255) NOT NULL,
    [Abbreviation]          VARCHAR (255) NOT NULL,
    [Country]               VARCHAR (255) NULL,
    [Type]                  VARCHAR (255) NULL,
    [Sort]                  INT           NULL,
    [Status]                VARCHAR (255) NULL,
    [Occupied]              VARCHAR (255) NULL,
    [Notes]                 VARCHAR (255) NULL,
    [FipsState]             VARCHAR (255) NULL,
    [AssocPress]            VARCHAR (255) NULL,
    [StandardFederalRegion] VARCHAR (255) NULL,
    [CensusRegion]          VARCHAR (255) NULL,
    [CensusRegionName]      VARCHAR (255) NULL,
    [CensusDivision]        VARCHAR (255) NULL,
    [CensusDivisionName]    VARCHAR (255) NULL,
    [CircuitCourt]          VARCHAR (255) NULL,
    CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED ([StateId] ASC)
);



