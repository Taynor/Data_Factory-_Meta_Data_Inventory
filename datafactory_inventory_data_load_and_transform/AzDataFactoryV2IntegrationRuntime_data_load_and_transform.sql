/*
Pull all new records from the staging schema table into the history schema 
*/
INSERT INTO [history].[AzDataFactoryV2IntegrationRuntime]
	([DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName], [RecordCreationDate])
SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName], GETDATE()
FROM [staging].[AzDataFactoryV2IntegrationRuntime_test] AS s
WHERE EXISTS (
	SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName]
FROM [history].[AzDataFactoryV2IntegrationRuntime] AS h
WHERE s.[AuthorizationType] <> h.[AuthorizationType])

INSERT INTO [history].[AzDataFactoryV2IntegrationRuntime]
	([DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName], [RecordCreationDate])
SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName], GETDATE()
FROM [staging].[AzDataFactoryV2IntegrationRuntime_test] AS s
WHERE EXISTS (
	SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName]
FROM [history].[AzDataFactoryV2IntegrationRuntime] AS h
WHERE s.[Description] <> h.[Description])

INSERT INTO [history].[AzDataFactoryV2IntegrationRuntime]
	([DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName], [RecordCreationDate])
SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName], GETDATE()
FROM [staging].[AzDataFactoryV2IntegrationRuntime_test] AS s
WHERE EXISTS (
	SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName]
FROM [history].[AzDataFactoryV2IntegrationRuntime] AS h
WHERE s.[Type] <> h.[Type])

/*
Pull data from the staging schema table into the history schema table.
Inserting data where the unique idenitfier Name matches in both 
the staging and history schema table, but the editable column does 
not match the value in both staging and history schema tables.

Use for in place value change, not a new record INSERTED
*/
INSERT INTO [history].[AzDataFactoryV2IntegrationRuntime]
	([DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName], [RecordCreationDate])
SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName], GETDATE()
FROM [staging].[AzDataFactoryV2IntegrationRuntime] AS s
WHERE EXISTS (
	SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName]
FROM [history].[AzDataFactoryV2IntegrationRuntime] AS h
WHERE s.[Name] = h.[Name]
	AND CONVERT(NVARCHAR(MAX), s.[AuthorizationType]) <> h.[AuthorizationType])

INSERT INTO [history].[AzDataFactoryV2IntegrationRuntime]
	([DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName])
SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName]
FROM [staging].[AzDataFactoryV2IntegrationRuntime] AS s
WHERE EXISTS (
	SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName]
FROM [history].[AzDataFactoryV2IntegrationRuntime] AS h
WHERE s.[Name] = h.[Name]
	AND CONVERT(NVARCHAR(MAX), s.[Description]) <> h.[Description])

INSERT INTO [history].[AzDataFactoryV2IntegrationRuntime]
	([DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName])
SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName]
FROM [staging].[AzDataFactoryV2IntegrationRuntime] AS s
WHERE EXISTS (
	SELECT [DataFactoryName], [Name], [AuthorizationType], [Description], [Type], [ResourceGroupName]
FROM [history].[AzDataFactoryV2IntegrationRuntime] AS h
WHERE s.[Name] = h.[Name]
	AND s.[Type] <> h.[Type])

/*
Update the editable column, along with the SCD 6 pattern columns
iscurrent, historical value and historical value date. Updating 
where the unique idenitfier Name matches in both history and 
staging schemas, but the editable column does not match.
*/
UPDATE [history].[AzDataFactoryV2IntegrationRuntime] 
SET [HistoricalAuthorizationType] = ht.[AuthorizationType],
[history].[AzDataFactoryV2IntegrationRuntime].[AuthorizationType] = CONVERT(VARCHAR(MAX), st.[AuthorizationType]),
[IsCurrent] = 1,
[HistoricalAuthorizationTypeDate] = getdate()
FROM [history].[AzDataFactoryV2IntegrationRuntime] AS ht
	JOIN [staging].[AzDataFactoryV2IntegrationRuntime] AS st
	ON ht.[Name] = st.[Name]
WHERE ht.[AuthorizationType] <> st.[AuthorizationType]

UPDATE [history].[AzDataFactoryV2IntegrationRuntime] 
SET [HistoricalDescription] = ht.[Description],
[history].[AzDataFactoryV2IntegrationRuntime].[Description] = st.[Description],
[IsCurrent] = 1,
[HistoricalDescriptionDate] = getdate()
FROM [history].[AzDataFactoryV2IntegrationRuntime] AS ht
	JOIN [staging].[AzDataFactoryV2IntegrationRuntime] AS st
	ON ht.[Name] = st.[Name]
WHERE ht.[Description] <> st.[Description]

UPDATE [history].[AzDataFactoryV2IntegrationRuntime] 
SET [HistoricalType] = ht.[Type],
[history].[AzDataFactoryV2IntegrationRuntime].[Type] = st.[Type],
[IsCurrent] = 1,
[HistoricalTypeDate] = getdate()
FROM [history].[AzDataFactoryV2IntegrationRuntime] AS ht
	JOIN [staging].[AzDataFactoryV2IntegrationRuntime] AS st
	ON ht.[Name] = st.[Name]
WHERE ht.[Type] <> st.[Type]

/*
To ensure the SCD pattern iscurrent flag is managed with the 
correct conditions, not covered in the initial delta load from
the staging to the history schema tables.
*/

/*
Set the iscurrent flag to 1 to ensure this record is the current
one when the historical and current editable column values are
the same. This is a defensive condition, and not expected. To future 
proof against future data bugs that may occur.
*/
UPDATE [history].[AzDataFactoryV2IntegrationRuntime] 
SET [IsCurrent] = 1
WHERE [HistoricalAuthorizationType] = [AuthorizationType]

UPDATE [history].[AzDataFactoryV2IntegrationRuntime] 
SET [IsCurrent] = 1
WHERE [HistoricalDescription] = [Description]

UPDATE [history].[AzDataFactoryV2IntegrationRuntime] 
SET [IsCurrent] = 1
WHERE [HistoricalType] = [Type]

/*
Set the iscurrent flag to 1 to ensure this record is the current
one when the historical value is NULL. This is a typical pattern
when a new record for the Name has been loaded.
*/
UPDATE [history].[AzDataFactoryV2IntegrationRuntime] 
SET [IsCurrent] = 1
WHERE [HistoricalAuthorizationType] IS NULL

UPDATE [history].[AzDataFactoryV2IntegrationRuntime] 
SET [IsCurrent] = 1
WHERE [HistoricalDescription] IS NULL

UPDATE [history].[AzDataFactoryV2IntegrationRuntime] 
SET [IsCurrent] = 1
WHERE [HistoricalType] IS NULL

/*
Set the iscurrent flag to 1 to ensure this record is the current
when the recordcreationdate value has the newest datetime stamp
for the Name. This is ensures the latest record to be added to the 
history schema table is by default the current one. 
*/
UPDATE [history].[AzDataFactoryV2Dataset] 
SET [IsCurrent] = 1
WHERE [RecordCreationDate] = (SELECT MAX([RecordCreationDate])
FROM [history].[AzDataFactoryV2Dataset])

/*
Set the iscurrent flag to 0 to ensure this record is not the current
one when historical value and the current value are not the same. 
With an AND condition of the historical value is NULL.
*/
UPDATE [history].[AzDataFactoryV2IntegrationRuntime] 
SET [IsCurrent] = 0,
[RecordEndDate] = getdate()
WHERE [HistoricalAuthorizationType] <> [AuthorizationType]
	AND [HistoricalAuthorizationType] IS NOT NULL

UPDATE [history].[AzDataFactoryV2IntegrationRuntime] 
SET [IsCurrent] = 0,
[RecordEndDate] = getdate()
WHERE [HistoricalDescription] <> [Description]
	AND [HistoricalDescription] IS NOT NULL

UPDATE [history].[AzDataFactoryV2IntegrationRuntime] 
SET [IsCurrent] = 0,
[RecordEndDate] = getdate()
WHERE [HistoricalType] <> [Type]
	AND [HistoricalType] IS NOT NULL