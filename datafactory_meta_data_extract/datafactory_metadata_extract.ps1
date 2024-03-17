<#
    .SYNOPSIS
        Data Factory catalogue extract from meta data from instances.

    .DESCRIPTION
        The data extract pulls data from the Data Factory instance. It lists the dataflow, dataset, 
        integration runtime, linked services, pipelines, triggers and global parameters.

    .PARAMETER
        N/A

    .INPUTS
        The parameters are using CmdletBinding and will use the arguments as inputs

    .OUTPUTS
        N/A - but will add an output feature to monitor progress of the loading
        the data into the tables.

    .LINK
        https://github.com/Taynor/DataFactoryInventory
#>

# variables for target SQL connection
$targetSqlInstance = '<replace with target sql server>'
$targetSqlUserName = '<replace with target sql login>'
$targetSqlPassword = '<replace with target sql password>'
$targetDatabase = '<replace with target database>'
$targetSchema = '<replace with target schema>'

# datafactory resource group and instance name variables
$resourceGroup = '<replace with resource group name>'
$dataFactory = '<replace with datafactory name>'

$targetSqlPasswordSecured = ConvertTo-SecureString -String $targetSqlPassword -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $targetSqlUserName, $targetSqlPasswordSecured

# load data for development
(Get-AzDatafactoryV2Pipeline -ResourceGroupName $resourceGroup -DataFactoryName $dataFactory | `
    select-object etag, datafactoryname, name, resourcegroupname) | `
    Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential `
    -SchemaName $targetSchema -TableName 'AzDatafactoryV2Pipeline' -Force

(Get-AzDataFactoryV2Dataset -ResourceGroupName $resourceGroup -DataFactoryName $dataFactory | `
    select-object etag, datafactoryname, name, resourcegroupname) | `
    Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential `
    -SchemaName $targetSchema -TableName 'AzDataFactoryV2Dataset' -Force

(Get-AzDataFactoryV2LinkedService -ResourceGroupName $resourceGroup -DataFactoryName $dataFactory | `
    select-object etag, datafactoryname, name, resourcegroupname) | `
    Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential `
    -SchemaName $targetSchema -TableName 'AzDataFactoryV2LinkedService' -Force

(Get-AzDataFactoryV2DataFlow -ResourceGroupName $resourceGroup -DataFactoryName $dataFactory | `
    select-object etag, datafactoryname, name, resourcegroupname) | `
    Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential `
    -SchemaName $targetSchema -TableName 'AzDataFactoryV2DataFlow' -Force

(Get-AzDataFactoryV2IntegrationRuntime -ResourceGroupName $resourceGroup -DataFactoryName $dataFactory | `
    select-object datafactoryname, name, authorizationtype, description, type, resourcegroupname) | `
    Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential `
    -SchemaName $targetSchema -TableName 'AzDataFactoryV2IntegrationRuntime' -Force

(Get-AzDataFactoryV2Trigger -ResourceGroupName $resourceGroup -DataFactoryName $dataFactory | `
    select-object etag, datafactoryname, name, runtimestate, resourcegroupname) | `
    Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential `
    -SchemaName $targetSchema -TableName 'AzDataFactoryV2Trigger' -Force

# load development global parameters
$dataFactoryDevelopment = Get-AzDataFactoryV2 -ResourceGroupName $resourceGroup -Name $dataFactory 
$datafactoryGlobalParametersDevelopment = $dataFactoryDevelopment.GlobalParameters 
$datafactoryResourceGroupName = $dataFactoryDevelopment.ResourceGroupName
$datafactoryName = $dataFactoryDevelopment.DataFactoryName

foreach ($key in $datafactoryGlobalParametersDevelopment) {
    $keyContentDevelopment = $key | select-object -ExpandProperty Keys
}

foreach ($value in $datafactoryGlobalParametersDevelopment) {
    $valueContentDevelopment = $value.values | select-object -ExpandProperty value
}

$datafactoryGlobalParametersArrayDevelopment = @()
$MaxArraySizeDevelopment = [Math]::Max($keyContentDevelopment.Length, $valueContentDevelopment.Length)
$datafactoryGlobalParametersArrayDevelopment = for ($i = 0; $i -lt $MaxArraySizeDevelopment; $i++) { 
    Write-Verbose "$($keyContentDevelopment[$i]),$($valueContentDevelopment[$i]),$($datafactoryResourceGroupName),$($datafactoryName)"
    [PSCustomObject]@{
        DataFactoryName      = $datafactoryName
        ResourceGroupName    = $datafactoryResourceGroupName
        GlobalParameterKey   = $keyContentDevelopment[$i]
        GlobalParameterValue = $valueContentDevelopment[$i]
    }
}

$datafactoryGlobalParametersArrayDevelopment | `
    Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential `
    -SchemaName $targetSchema -TableName 'AzDataFactoryV2GlobalParameters' -Force
