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
        https://github.com/Taynor/DataFactoryInventory
#>

# variables for target SQL connection
$masterDatabaseName = 'master'
$targetSqlInstance = '<replace with destination sql server>'
$targetSqlUserName = '<replace with destination sql login>'
$targetSqlPassword = '<replace with destination sql password>'
$targetDatabase = '<replace with destination database name>'
$targetSchema = '<replace with destination schema name>'
$targetTable = '<replace with desitnation table name>'

# variables for source SQL connections
$sourceSqlInstance = '<replace with source sql server>'
$sourceSqlUserName = '<replace with source sql login>'
$sourceSqlPassword = '<replace with source sql password>'
$sourceDatabase = '<replace with source database>'
$sourceSchema = '<replace with source schema>'
$sourceTable = '<replace with source table>'

#create target database if not exists
$createIfNotExistsDatabase = "
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = '$targetDatabase')
BEGIN
  CREATE DATABASE $targetDatabase;
END;
GO"

# create the target database statement connection config
$createIfNotExistsDatabaseConfig = @{
    'Database'       = $masterDatabaseName
    'ServerInstance' = $targetSqlInstance
    'Username'       = $targetSqlUserName
    'Password'       = $targetSqlPassword
    'Query'          = $createIfNotExistsDatabase
} 

# create the database
Invoke-Sqlcmd @createIfNotExistsDatabaseConfig

# select * from source database
$sourceTableExtract = "SELECT * FROM $sourceSchema.$sourceTable"

# source Table statement connection config
$sourceTableExtractConfig = @{
    'Database'       = $sourceDatabase
    'ServerInstance' = $sourceSqlInstance
    'Username'       = $sourceSqlUserName
    'Password'       = $sourceSqlPassword
    'Query'          = $sourceTableExtract
}

# save the results as a reusable variable 
$sourceTableExtract = Invoke-Sqlcmd @sourceTableExtractConfig -OutputAs DataTables

# create credential
$targetSqlPasswordSecured = ConvertTo-SecureString -String $targetSqlPassword -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $targetSqlUserName, $targetSqlPasswordSecured

# load data
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName $targetTable -InputData $sourceTableExtract -Force