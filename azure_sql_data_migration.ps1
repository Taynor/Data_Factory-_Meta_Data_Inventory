<#
    .SYNOPSIS
        SQL Server database and table migration.

    .DESCRIPTION
        Migrate Azure SQL or on premise databases and tables between environments and platforms,
        without the need for Linked Servers.

    .PARAMETER
        need to add parameters for Azure DevOps pipeline

    .INPUTS
        The parameters are using CmdletBinding and will use the arguments as inputs

    .OUTPUTS
        N/A - but will add an output feature to monitor progress of the data migration

    .LINK
        https://dev.azure.com/biiuk/datafactory/_git/data_platform_maintenance
#>

# variables for target SQL connection
$masterDatabaseName = 'master'
$targetSqlInstance = 'adf-dev-sql.database.windows.net'
$targetSqlUserName = '<username>'
$targetSqlPassword = '<password>'
$targetDatabase = 'Fragile_contexts_OECD'
$targetSchema = 'dbo'
$targetTable = 'Fragile_States'

# variables for source SQL connections
$sourceSqlInstance = 'edw-sql-dev.database.windows.net'
$sourceSqlUserName = '<username>'
$sourceSqlPassword = '<password>'
$sourceDatabase = 'Fragile_contexts_OECD'
$sourceTable = '[dbo].[Fragile_States]'

#create target database if not exists
$createIfNotExistsDatabase = "
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = '$targetDatabase')
BEGIN
  CREATE DATABASE $targetDatabase;
END;
GO"

# create the target database statement connection config
$createIfNotExistsDatabaseConfig = @{
    'Database' = $masterDatabaseName
    'ServerInstance' = $targetSqlInstance
    'Username' = $targetSqlUserName
    'Password' = $targetSqlPassword
    'Query' = $createIfNotExistsDatabase
} 

# create the database
Invoke-Sqlcmd @createIfNotExistsDatabaseConfig

# select * from source database
$sourceTableExtract = "SELECT * FROM $sourceTable"

# source Table statement connection config
$sourceTableExtractConfig = @{
    'Database' = $sourceDatabase
    'ServerInstance' = $sourceSqlInstance
    'Username' = $sourceSqlUserName
    'Password' = $sourceSqlPassword
    'Query' = $sourceTableExtract
}

# save the results as a reusable variable 
$sourceTableExtract = Invoke-Sqlcmd @sourceTableExtractConfig -OutputAs DataTables

# create credential
$targetSqlPasswordSecured = ConvertTo-SecureString -String $targetSqlPassword -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $targetSqlUserName, $targetSqlPasswordSecured

# load data
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName $targetTable -InputData $sourceTableExtract -Force