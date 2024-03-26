/*Archive staging [AzDataFactoryV2DataFlow] into the archive table*/
/*INSERT into archive*/
INSERT [archive].[AzDataFactoryV2DataFlow]
([Etag], [DataFactoryName], [Name], [ResourceGroupName], [RecordStagingDate])
SELECT [Etag], [DataFactoryName], [Name], [ResourceGroupName], GETDATE()
FROM [staging].[AzDataFactoryV2DataFlow]

/*DELETE from staging*/
DELETE [staging].[AzDataFactoryV2DataFlow]


/*Archive staging [AzDataFactoryV2DataSet] into the archive table*/
/*INSERT into archive*/
INSERT [archive].[AzDataFactoryV2DataSet]
([Etag], [DataFactoryName], [Name], [ResourceGroupName], [RecordStagingDate])
SELECT [Etag], [DataFactoryName], [Name], [ResourceGroupName], GETDATE()
FROM [staging].[AzDataFactoryV2DataSet]

/*DELETE from staging*/
DELETE [staging].[AzDataFactoryV2DataSet]


/*Archive staging [AzDataFactoryV2GlobalParameters] into the archive table*/
/*INSERT into archive*/
INSERT [archive].[AzDataFactoryV2GlobalParameters]
([DataFactoryName], [ResourceGroupName], [GlobalParameterKey], [GlobalParameterValue], [RecordStagingDate])
SELECT [DataFactoryName], [ResourceGroupName], [GlobalParameterKey], [GlobalParameterValue], GETDATE()
FROM [staging].[AzDataFactoryV2GlobalParameters]

/*DELETE from staging*/
DELETE [staging].[AzDataFactoryV2GlobalParameters]


/*Archive staging [AzDataFactoryV2IntegrationRuntime] into the archive table*/
/*INSERT into archive*/
INSERT [archive].[AzDataFactoryV2IntegrationRuntime]
([DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName], [RecordStagingDate])
SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName], GETDATE()
FROM [staging].[AzDataFactoryV2IntegrationRuntime]

/*DELETE from staging*/
DELETE [staging].[AzDataFactoryV2IntegrationRuntime]

/*Archive staging [archive].[AzDataFactoryV2LinkedService] into the archive table*/
/*INSERT into archive*/
INSERT [archive].[AzDataFactoryV2LinkedService]
([Etag], [DataFactoryName], [Name], [ResourceGroupName], [RecordStagingDate])
SELECT [Etag], [DataFactoryName], [Name], [ResourceGroupName], GETDATE()
FROM [staging].[AzDataFactoryV2LinkedService]

/*DELETE from staging*/
DELETE [staging].[AzDataFactoryV2LinkedService]


/*Archive staging [archive].[AzDatafactoryV2Pipeline] into the archive table*/
/*INSERT into archive*/
INSERT [archive].[AzDatafactoryV2Pipeline]
([Etag], [DataFactoryName], [Name], [ResourceGroupName], [RecordStagingDate])
SELECT [Etag], [DataFactoryName], [Name], [ResourceGroupName], GETDATE()
FROM [staging].[AzDatafactoryV2Pipeline]

/*DELETE from staging*/
DELETE [staging].[AzDatafactoryV2Pipeline]


/*Archive staging [archive].[AzDataFactoryV2Trigger] into the archive table*/
/*INSERT into archive*/
INSERT [archive].[AzDataFactoryV2Trigger]
([Etag], [DataFactoryName], [Name], [RuntimeState], [ResourceGroupName], [RecordStagingDate])
SELECT [Etag], [DataFactoryName], [Name], [RuntimeState], [ResourceGroupName], GETDATE()
FROM [staging].[AzDataFactoryV2Trigger]

/*DELETE from staging*/
DELETE [staging].[AzDataFactoryV2Trigger]