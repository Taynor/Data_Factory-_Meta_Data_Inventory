/*
Pull all new records from the staging schema table into the history schema 
*/
INSERT INTO [history].[AzDataFactoryV2GlobalParametersProduction]
([GlobalParameterKey], [GlobalParameterValue])
SELECT st.[GlobalParameterKey], st.[GlobalParameterValue], GETDATE()
FROM [history].[AzDataFactoryV2GlobalParametersProduction] AS ht
RIGHT OUTER JOIN [staging].[AzDataFactoryV2GlobalParametersProduction] AS st
ON ht.[GlobalParameterKey] = st.[GlobalParameterKey]
WHERE ht.[GlobalParameterKey] IS NULL
AND st.[GlobalParameterKey] IS NOT NULL

/*
Pull data from the staging schema table into the history schema table.
Inserting data where the unique idenitfier ETag matches in both 
the staging and history schema table, but the editable column does 
not match the value in both staging and history schema tables.
*/
INSERT INTO [history].[AzDataFactoryV2GlobalParametersProduction] 
([GlobalParameterKey], [GlobalParameterValue], [RecordCreationDate])
SELECT [GlobalParameterKey], [GlobalParameterValue], GETDATE()
FROM [staging].[AzDataFactoryV2GlobalParametersProduction] AS s
WHERE EXISTS (
	SELECT [GlobalParameterKey], [GlobalParameterValue]
	FROM [history].[AzDataFactoryV2GlobalParametersProduction] AS h
	WHERE s.[GlobalParameterKey] = h.[GlobalParameterKey]
	AND s.[GlobalParameterValue] <> h.[GlobalParameterValue])

/*
Update the editable column, along with the SCD 6 pattern columns
iscurrent, historical value and historical value date. Updating 
where the unique idenitfier ETag matches in both history and 
staging schemas, but the editable column does not match.
*/
UPDATE [history].[AzDataFactoryV2GlobalParametersProduction] 
SET [HistoricalGlobalParameterValue] = ht.[GlobalParameterValue],
[history].[AzDataFactoryV2GlobalParametersProduction].[GlobalParameterValue] = st.[GlobalParameterValue],
[IsCurrent] = 1,
[HistoricalGlobalParameterValueDate] = getdate()
FROM [history].[AzDataFactoryV2GlobalParametersProduction] AS ht
JOIN [staging].[AzDataFactoryV2GlobalParametersProduction] AS st
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
UPDATE [history].[AzDataFactoryV2GlobalParametersProduction] 
SET [IsCurrent] = 1
WHERE [HistoricalGlobalParameterValue] = [GlobalParameterValue]

/*
Set the iscurrent flag to 1 to ensure this record is the current
one when the historical value is NULL. This is a typical pattern
when a new record for the ETag has been loaded.
*/
UPDATE [history].[AzDataFactoryV2GlobalParametersProduction] 
SET [IsCurrent] = 1
WHERE [HistoricalGlobalParameterValue] IS NULL

/*
Set the iscurrent flag to 1 to ensure this record is the current
when the recordcreationdate value has the newest datetime stamp
for the ETag. This is ensures the latest record to be added to the 
history schema table is by default the current one. 
*/
UPDATE [history].[AzDataFactoryV2GlobalParametersProduction] 
SET [IsCurrent] = 1
WHERE [RecordCreationDate] = (SELECT MAX([RecordCreationDate]) 
							FROM [history].[AzDataFactoryV2GlobalParametersProduction])

/*
Set the iscurrent flag to 0 to ensure this record is not the current
one when historical value and the current value are not the same. 
With an AND condition of the historical value is NULL.
*/
UPDATE [history].[AzDataFactoryV2GlobalParametersProduction] 
SET [IsCurrent] = 0,
[RecordEndDate] = getdate()
WHERE [HistoricalGlobalParameterValue] <> [GlobalParameterValue]
AND [HistoricalGlobalParameterValue] IS NOT NULL