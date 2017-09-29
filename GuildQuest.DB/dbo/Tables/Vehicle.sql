CREATE TABLE [dbo].[Vehicle] (
    [VehicleID]          INT             NOT NULL,
    [Year]               SMALLINT        NOT NULL,
    [MakeModelID]        INT             NOT NULL,
    [BodyStyleID]        INT             NOT NULL,
    [TransmissionTypeID] INT             NOT NULL,
    [InteriorColorID]    INT             NOT NULL,
    [ExteriorColorID]    INT             NOT NULL,
    [Mileage]            INT             NOT NULL,
    [VINumber]           CHAR (17)       NOT NULL,
    [SalesPrice]         MONEY           NOT NULL,
    [MSRPrice]           MONEY           NOT NULL,
    [Sold]               BIT             NOT NULL,
    [Featured]           BIT             NOT NULL,
    [Description]        NVARCHAR (1024) NULL,
    CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED ([VehicleID] ASC),
    CONSTRAINT [FK_Vehicle_BodyStyle] FOREIGN KEY ([BodyStyleID]) REFERENCES [dbo].[BodyStyle] ([BodyStyleID]),
    CONSTRAINT [FK_Vehicle_ExteriorColor] FOREIGN KEY ([ExteriorColorID]) REFERENCES [dbo].[ExteriorColor] ([ExteriorColorID]),
    CONSTRAINT [FK_Vehicle_InteriorColor] FOREIGN KEY ([InteriorColorID]) REFERENCES [dbo].[InteriorColor] ([InteriorColorID]),
    CONSTRAINT [FK_Vehicle_MakeModel] FOREIGN KEY ([MakeModelID]) REFERENCES [dbo].[MakeModel] ([MakeModelID]),
    CONSTRAINT [FK_Vehicle_TransmissionType] FOREIGN KEY ([TransmissionTypeID]) REFERENCES [dbo].[TransmissionType] ([TransmissionTypeID])
);

