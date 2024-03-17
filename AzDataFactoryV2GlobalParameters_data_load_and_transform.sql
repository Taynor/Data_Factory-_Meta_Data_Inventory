/*
Pull all new records from the staging schema table into the history schema 
*/
INSERT INTO [history].[AzDataFactoryV2GlobalParameters]
([DataFactoryName], [ResourceGroupName], [GlobalParameterKey], [GlobalParameterValue], [RecordCreationDate])
SELECT st.[DataFactoryName], st.[ResourceGroupName], st.[GlobalParameterKey], st.[GlobalParameterValue], GETDATE()
FROM [history].[AzDataFactoryV2GlobalParameters] AS ht
RIGHT OUTER JOIN [staging].[AzDataFactoryV2GlobalParameters] AS st
ON ht.[GlobalParameterKey] = st.[GlobalParameterKey]
WHERE ht.[GlobalParameterKey] IS NULL
AND st.[GlobalParameterKey] IS NOT NULL

/*Performance tune against this query
SELECT [DataFactoryName], [ResourceGroupName], [GlobalParameterKey], [GlobalParameterValue], GETDATE()
FROM [staging].[AzDataFactoryV2GlobalParameters] AS s
WHERE [GlobalParameterKey] NOT IN (
	SELECT [GlobalParameterKey]
	FROM [history].[AzDataFactoryV2GlobalParameters])
*/

/*
Pull data from the staging schema table into the history schema table.
Inserting data where the unique idenitfier ETag matches in both 
the staging and history schema table, but the editable column does 
not match the value in both staging and history schema tables.

Use for in place value change, not a new record INSERTED
*/
INSERT INTO [history].[AzDataFactoryV2GlobalParameters] 
([DataFactoryName], [ResourceGroupName], [GlobalParameterKey], [GlobalParameterValue], [RecordCreationDate])
SELECT [DataFactoryName], [ResourceGroupName], [GlobalParameterKey], [GlobalParameterValue], GETDATE()
FROM [staging].[AzDataFactoryV2GlobalParameters] AS s
WHERE EXISTS (
	SELECT [DataFactoryName], [ResourceGroupName], [GlobalParameterKey], [GlobalParameterValue]
	FROM [history].[AzDataFactoryV2GlobalParameters] AS h
	WHERE s.[GlobalParameterKey] = h.[GlobalParameterKey]
	AND s.[DataFactoryName] = h.[DataFactoryName]
	AND s.[GlobalParameterValue] <> h.[GlobalParameterValue])

/*
Update the editable column, along with the SCD 6 pattern columns
iscurrent, historical value and historical value date. Updating 
where the unique idenitfier ETag matches in both history and 
staging schemas, but the editable column does not match.
*/
UPDATE [history].[AzDataFactoryV2GlobalParameters] 
SET [HistoricalGlobalParameterValue] = ht.[GlobalParameterValue],
[history].[AzDataFactoryV2GlobalParameters].[GlobalParameterValue] = st.[GlobalParameterValue],
[IsCurrent] = 1,
[HistoricalGlobalParameterValueDate] = getdate()
FROM [history].[AzDataFactoryV2GlobalParameters] AS ht
JOIN [staging].[AzDataFactoryV2GlobalParameters] AS st
ON ht.[GlobalParameterKey] = st.[GlobalParameterKey]
WHERE ht.[GlobalParameterValue] <> st.[GlobalParameterValue]

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
UPDATE [history].[AzDataFactoryV2GlobalParameters] 
SET [IsCurrent] = 1
WHERE [HistoricalGlobalParameterValue] = [GlobalParameterValue]

/*
Set the iscurrent flag to 1 to ensure this record is the current
one when the historical value is NULL. This is a typical pattern
when a new record for the ETag has been loaded.
*/
UPDATE [history].[AzDataFactoryV2GlobalParameters] 
SET [IsCurrent] = 1
WHERE [HistoricalGlobalParameterValue] IS NULL

/*
Set the iscurrent flag to 1 to ensure this record is the current
when the recordcreationdate value has the newest datetime stamp
for the ETag. This is ensures the latest record to be added to the 
history schema table is by default the current one. 
*/
UPDATE [history].[AzDataFactoryV2GlobalParameters] 
SET [IsCurrent] = 1
WHERE [RecordCreationDate] = (SELECT MAX([RecordCreationDate]) 
							FROM [history].[AzDataFactoryV2GlobalParameters])

/*
Set the iscurrent flag to 0 to ensure this record is not the current
one when historical value and the current value are not the same. 
With an AND condition of the historical value is NULL.
*/
UPDATE [history].[AzDataFactoryV2GlobalParameters] 
SET [IsCurrent] = 0,
[RecordEndDate] = getdate()
WHERE [HistoricalGlobalParameterValue] <> [GlobalParameterValue]
AND [HistoricalGlobalParameterValue] IS NOT NULL