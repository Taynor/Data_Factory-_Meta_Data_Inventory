<#
    .SYNOPSIS
        SQL server maintenance to rebuild indexes on an Azure SQL database.

    .DESCRIPTION
        Rebuild all indexes within a database, for any given SQL server. The script is a payload for 
        an Azure DevOps pipeline to maintain indexes on Azure SQL databases. Use the Azure DevOps
        arguments feature to select the SQL instance and database to target.

    .PARAMETER
        $dbName - name of the database
        $sqlName - name of the azure database sql instance
        $userName - the SQL server user name
        $password - the password for the $userName

    .INPUTS
        The parameters are using CmdletBinding and will use the arguments as inputs

    .OUTPUTS
        N/A - but will add an output feature to monitor progress of the index rebuilds

    .LINK
        https://dev.azure.com/biiuk/datafactory/_git/data_platform_maintenance
#>

[CmdletBinding()]
param (
    $dbName,
    $sqlName,
    $userName,
    $psword
)

$databaseName = $dbName
$sqlInstance = $sqlName
$sqlUserName = $userName
$sqlPassword = $psword

<# 
uses CTE to grab list of indexes on the database takes the table and index name and uses to build 
the index rebuild statement
#> 
$indexListQuery = "
WITH indexes_to_rebuild (table_name, index_name)
AS (
    SELECT t.name AS 'table_name', 
    i.name AS 'index_name'
    FROM sys.objects AS o
    JOIN sys.indexes AS i
    ON o.object_id = i.object_id
    JOIN sys.tables AS t
    ON o.object_id = t.object_id
    WHERE i.name IS NOT NULL
)

SELECT 'ALTER INDEX ' + index_name + ' ON ' + table_name + ' REBUILD' FROM indexes_to_rebuild"

# create the index rebuild statements
$indexListQueryConfig = @{
    'Database' = $databaseName
    'ServerInstance' = $sqlInstance
    'Username' = $sqlUserName
    'Password' = $sqlPassword
    'Query' = $indexListQuery
} 

# variable to hold the results of capturing the index rebuild statements
$indexesToRebuild = 'Invoke-Sqlcmd @indexListQueryConfig | select-object -ExpandProperty Column1'

# save the results as a reusable variable 
invoke-expression $indexesToRebuild | Tee-Object -Variable scriptOutput

# loop and rebuild each index 
foreach ($so in $scriptOutput) {
    $soType = $so.GetType() | Select-Object -ExpandProperty name
    if ($soType -eq 'Object[]') {
        write-host 'object not valid to be a SQL statement'
    }
    elseif ($soType -eq 'String') {
        $indexRebuildQueryConfig = @{
            'Database' = $databaseName
            'ServerInstance' = $sqlInstance
            'Username' = $sqlUserName
            'Password' = $sqlPassword
            'Query' = $so
            } 
        Invoke-Sqlcmd @indexRebuildQueryConfig
    }
}
