/*
Pull all new records from the staging schema table into the history schema 
*/
INSERT INTO [history].[AzDataFactoryV2DataSet] 
([ETag], [DataFactoryName], [Name], [ResourceGroupName], [RecordCreationDate])
SELECT st.[Etag], st.[DataFactoryName], st.[Name], st.[ResourceGroupName], GETDATE()
FROM [history].[AzDataFactoryV2DataSet] AS ht
RIGHT OUTER JOIN [staging].[AzDataFactoryV2DataSet] AS st
ON ht.[ETag] = st.[ETag]
WHERE ht.[Etag] IS NULL
AND st.[Etag] IS NOT NULL

/*
Pull data from the staging schema table into the history schema table.
Inserting data where the unique idenitfier ETag matches in both 
the staging and history schema table, but the editable column does 
not match the value in both staging and history schema tables.
*/
INSERT INTO [history].[AzDataFactoryV2Dataset] 
([ETag], [DataFactoryName], [Name], [ResourceGroupName], [RecordCreationDate])
SELECT [ETag], [DataFactoryName], [Name], [ResourceGroupName], GETDATE()
FROM [staging].[AzDataFactoryV2Dataset] AS s
WHERE EXISTS (
	SELECT [ETag], [DataFactoryName], [Name], [ResourceGroupName]
	FROM [history].[AzDataFactoryV2Dataset] AS h
	WHERE s.[ETag] = h.[Etag]
	AND s.[Name] <> h.[Name])

/*
Update the editable column, along with the SCD 6 pattern columns
iscurrent, historical value and historical value date. Updating 
where the unique idenitfier ETag matches in both history and 
staging schemas, but the editable column does not match.
*/
UPDATE [history].[AzDataFactoryV2Dataset] 
SET [HistoricalName] = ht.[Name],
[history].[AzDataFactoryV2Dataset].[Name] = st.[Name],
[IsCurrent] = 1,
[HistoricalNameDate] = getdate()
FROM [history].[AzDataFactoryV2Dataset] AS ht
JOIN [staging].[AzDataFactoryV2Dataset] AS st
ON ht.[ETag] = st.[ETag]
WHERE ht.[Name] <> st.[Name]

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
UPDATE [history].[AzDataFactoryV2Dataset] 
SET [IsCurrent] = 1
WHERE [HistoricalName] = [Name]

/*
Set the iscurrent flag to 1 to ensure this record is the current
one when the historical value is NULL. This is a typical pattern
when a new record for the ETag has been loaded.
*/
UPDATE [history].[AzDataFactoryV2Dataset] 
SET [IsCurrent] = 1
WHERE [HistoricalName] IS NULL

/*
Set the iscurrent flag to 1 to ensure this record is the current
when the recordcreationdate value has the newest datetime stamp
for the ETag. This is ensures the latest record to be added to the 
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
UPDATE [history].[AzDataFactoryV2Dataset] 
SET [IsCurrent] = 0,
[RecordEndDate] = getdate()
WHERE [HistoricalName] <> [Name]
AND [HistoricalName] IS NOT NULL