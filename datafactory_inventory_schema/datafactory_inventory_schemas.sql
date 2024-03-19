  --update the historicaldate column with an update statement and not with a table definition clause

CREATE TABLE [history].[AzDataFactoryV2DataFlow](
	[ETag] [nvarchar](max) NULL,
	[DataFactoryName] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[HistoricalName] [nvarchar](max) NULL,
	[ResourceGroupName] [nvarchar](max) NULL,
	[RecordCreationDate] [datetime] NULL,
	[HistoricalNameDate] [datetime] NULL,
	[RecordEndDate] [datetime] NULL,
	[IsCurrent] [bit] NULL
) 

CREATE TABLE [history].[AzDataFactoryV2Dataset](
	[ETag] [nvarchar](max) NULL,
	[DataFactoryName] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[HistoricalName] [nvarchar](max) NULL,
	[ResourceGroupName] [nvarchar](max) NULL,
	[RecordCreationDate] [datetime] NULL,
	[HistoricalNameDate] [datetime] NULL,
	[RecordEndDate] [datetime] NULL,
	[IsCurrent] [bit] NULL
) 

CREATE TABLE [history].[AzDataFactoryV2IntegrationRuntime](
	[DataFactoryName] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[AuthorizationType] [nvarchar](max) NULL,
	[HistoricalAuthorizationType] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[HistoricalDescription] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[HistoricalType] [nvarchar](max) NULL,
	[ResourceGroupName] [nvarchar](max) NULL,
	[RecordCreationDate] [datetime] NULL,
	[HistoricalAuthorizationTypeDate] [datetime] NULL,
	[HistoricalDescriptionDate] [datetime] NULL,
	[HistoricalTypeDate] [datetime] NULL,
	[RecordEndDate] [datetime] NULL,
	[IsCurrent] [bit] NULL
) 

CREATE TABLE [history].[AzDataFactoryV2LinkedService](
	[ETag] [nvarchar](max) NULL,
	[DataFactoryName] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[HistoricalName] [nvarchar](max) NULL,
	[ResourceGroupName] [nvarchar](max) NULL,
	[RecordCreationDate] [datetime] NULL,
	[HistoricalNameDate] [datetime] NULL,
	[RecordEndDate] [datetime] NULL,
	[IsCurrent] [bit] NULL
)

CREATE TABLE [history].[AzDatafactoryV2Pipeline](
	[ETag] [nvarchar](max) NULL,
	[DataFactoryName] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[HistoricalName] [nvarchar](max) NULL,
	[ResourceGroupName] [nvarchar](max) NULL,
	[RecordCreationDate] [datetime] NULL,
	[HistoricalNameDate] [datetime] NULL,
	[RecordEndDate] [datetime] NULL,
	[IsCurrent] [bit] NULL
)

CREATE TABLE [history].[AzDataFactoryV2Trigger](
	[ETag] [nvarchar](max) NULL,
	[DataFactoryName] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[HistoricalName] [nvarchar](max) NULL,
	[RuntimeState] [nvarchar](max) NULL,
	[HistoricalRuntimeState] [nvarchar](max) NULL,
	[ResourceGroupName] [nvarchar](max) NULL,
	[RecordCreationDate] [datetime] NULL,
	[HistoricalNameDate] [datetime] NULL,
	[HistoricalRuntimeStateDate] [datetime] NULL,
	[RecordEndDate] [datetime] NULL,
	[IsCurrent] [bit] NULL
)

CREATE TABLE [history].[AzDataFactoryV2GlobalParameters](
	[DataFactoryName] [nvarchar](max) NULL,
	[ResourceGroupName] [nvarchar](max) NULL,
	[GlobalParameterKey] [nvarchar](max) NULL,
	[GlobalParameterValue] [nvarchar](max) NULL,
	[HistoricalGlobalParameterValue] [nvarchar](max) NULL,
	[RecordCreationDate] [datetime] NULL,
	[HistoricalGlobalParameterValueDate] [datetime] NULL,
	[RecordEndDate] [datetime] NULL,
	[IsCurrent] [bit] NULL
) 