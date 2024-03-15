<#
    .SYNOPSIS
        Data Factory catalogue extract from all environments and instances.

    .DESCRIPTION
        The data extract pulls data from the development, test, QA and production
        environments Data Factory instances. It lists the dataflow, dataset, 
        integration runtime, linked servvies, pipelines and triggers.

    .PARAMETER
        need to add parameters for Azure DevOps pipeline

    .INPUTS
        The parameters are using CmdletBinding and will use the arguments as inputs

    .OUTPUTS
        N/A - but will add an output feature to monitor progress of the loading
        the data into the tables.

    .LINK
        https://dev.azure.com/biiuk/datafactory/_git/data_platform_maintenance
#>

# variables for target SQL connection
$targetSqlInstance = 'adf-dev-sql.database.windows.net'
$targetSqlUserName = 'adfdbadmin'
$targetSqlPassword = '69BqRXkG6aHQ'
$targetDatabase = 'datafactorycatalogue'
$targetSchema = 'staging'
$targetTable = 'Data_Factory_Objects'

$targetSqlPasswordSecured = ConvertTo-SecureString -String $targetSqlPassword -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $targetSqlUserName, $targetSqlPasswordSecured

# load data for development
(Get-AzDatafactoryV2Pipeline -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'cdc-az-dev-datafactory' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDatafactoryV2Pipeline' -Force

(Get-AzDataFactoryV2Dataset -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'cdc-az-dev-datafactory' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2Dataset' -Force

(Get-AzDataFactoryV2LinkedService -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'cdc-az-dev-datafactory' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2LinkedService' -Force

(Get-AzDataFactoryV2DataFlow -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'cdc-az-dev-datafactory' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2DataFlow' -Force

(Get-AzDataFactoryV2IntegrationRuntime -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'cdc-az-dev-datafactory' | `
select-object datafactoryname, name, authorizationtype, description, type, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2IntegrationRuntime' -Force

(Get-AzDataFactoryV2Trigger -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'cdc-az-dev-datafactory' | `
select-object etag, datafactoryname, name, runtimestate, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2Trigger' -Force



# load data for test
(Get-AzDatafactoryV2Pipeline -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'adf-neu-test' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDatafactoryV2Pipeline' -Force

(Get-AzDataFactoryV2Dataset -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'adf-neu-test' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2Dataset' -Force

(Get-AzDataFactoryV2LinkedService -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'adf-neu-test' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2LinkedService' -Force

(Get-AzDataFactoryV2DataFlow -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'adf-neu-test' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2DataFlow' -Force

(Get-AzDataFactoryV2IntegrationRuntime -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'adf-neu-test' | `
select-object datafactoryname, name, authorizationtype, description, type, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2IntegrationRuntime' -Force

(Get-AzDataFactoryV2Trigger -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'adf-neu-test' | `
select-object etag, datafactoryname, name, runtimestate, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2Trigger' -Force



# load data for QA
(Get-AzDatafactoryV2Pipeline -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'adf-neu-qa' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDatafactoryV2Pipeline' -Force

(Get-AzDataFactoryV2Dataset -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'adf-neu-qa' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2Dataset' -Force

(Get-AzDataFactoryV2LinkedService -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'adf-neu-qa' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2LinkedService' -Force

(Get-AzDataFactoryV2DataFlow -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'adf-neu-qa' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2DataFlow' -Force

(Get-AzDataFactoryV2IntegrationRuntime -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'adf-neu-qa' | `
select-object datafactoryname, name, authorizationtype, description, type, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2IntegrationRuntime' -Force

(Get-AzDataFactoryV2Trigger -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -DataFactoryName 'adf-neu-qa' | `
select-object etag, datafactoryname, name, runtimestate, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2Trigger' -Force



# load data for prod
(Get-AzDatafactoryV2Pipeline -ResourceGroupName 'adf-prod-rg' -DataFactoryName 'adf-neu-prod' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDatafactoryV2Pipeline' -Force

(Get-AzDataFactoryV2Dataset -ResourceGroupName 'adf-prod-rg' -DataFactoryName 'adf-neu-prod' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2Dataset' -Force

(Get-AzDataFactoryV2LinkedService -ResourceGroupName 'adf-prod-rg' -DataFactoryName 'adf-neu-prod' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2LinkedService' -Force

(Get-AzDataFactoryV2DataFlow -ResourceGroupName 'adf-prod-rg' -DataFactoryName 'adf-neu-prod' | `
select-object etag, datafactoryname, name, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2DataFlow' -Force

(Get-AzDataFactoryV2IntegrationRuntime -ResourceGroupName 'adf-prod-rg' -DataFactoryName 'adf-neu-prod' | `
select-object datafactoryname, name, authorizationtype, description, type, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2IntegrationRuntime' -Force

(Get-AzDataFactoryV2Trigger -ResourceGroupName 'adf-prod-rg' -DataFactoryName 'adf-neu-prod' | `
select-object etag, datafactoryname, name, runtimestate, resourcegroupname) | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2Trigger' -Force



# load development global parameters
$dataFactoryDevelopment = Get-AzDataFactoryV2 -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -Name 'cdc-az-dev-datafactory' 
$datafactoryGlobalParametersDevelopment = $dataFactoryDevelopment.GlobalParameters 
$datafactoryResourceGroupName = $dataFactoryDevelopment.ResourceGroupName
$datafactoryName = $dataFactoryDevelopment.DataFactoryName

foreach ($key in $datafactoryGlobalParametersDevelopment){
$keyContentDevelopment = $key | select-object -ExpandProperty Keys
}

foreach ($value in $datafactoryGlobalParametersDevelopment){
$valueContentDevelopment = $value.values | select-object -ExpandProperty value
}

$datafactoryGlobalParametersArrayDevelopment = @()
$MaxArraySizeDevelopment = [Math]::Max($keyContentDevelopment.Length, $valueContentDevelopment.Length)
$datafactoryGlobalParametersArrayDevelopment = for ($i = 0; $i -lt $MaxArraySizeDevelopment; $i++){ 
    Write-Verbose "$($keyContentDevelopment[$i]),$($valueContentDevelopment[$i]),$($datafactoryResourceGroupName),$($datafactoryName)"
    [PSCustomObject]@{
        DataFactoryName = $datafactoryName
        ResourceGroupName = $datafactoryResourceGroupName
        GlobalParameterKey = $keyContentDevelopment[$i]
        GlobalParameterValue = $valueContentDevelopment[$i]
    }
}

$datafactoryGlobalParametersArrayDevelopment | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2GlobalParameters' -Force


# load QA global parameters
$dataFactoryQA = Get-AzDataFactoryV2 -ResourceGroupName 'CDC-AZ-DEV-DataFactory' -Name 'adf-neu-qa' 
$datafactoryGlobalParametersQA = $dataFactoryQA.GlobalParameters
$datafactoryResourceGroupName = $dataFactoryDevelopment.ResourceGroupName
$datafactoryName = $dataFactoryDevelopment.DataFactoryName 

foreach ($key in $datafactoryGlobalParametersQA){
$keyContentQA = $key | select-object -ExpandProperty Keys
}

foreach ($value in $datafactoryGlobalParametersQA){
$valueContentQA = $value.values | select-object -ExpandProperty value
}

$datafactoryGlobalParametersArrayQA = @()
$MaxArraySizeQA = [Math]::Max($keyContentQA.Length, $valueContentQA.Length)
$datafactoryGlobalParametersArrayQA = for ($i = 0; $i -lt $MaxArraySizeQA; $i++){ 
    Write-Verbose "$($keyContentDevelopment[$i]),$($valueContentDevelopment[$i]),$($datafactoryResourceGroupName),$($datafactoryName)"
    [PSCustomObject]@{
        DataFactoryName = $datafactoryName
        ResourceGroupName = $datafactoryResourceGroupName
        GlobalParameterKey = $keyContentDevelopment[$i]
        GlobalParameterValue = $valueContentDevelopment[$i]
    }
}

$datafactoryGlobalParametersArrayQA | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2GlobalParameters' -Force



# load production global parameters
$dataFactoryProduction = Get-AzDataFactoryV2 -ResourceGroupName 'adf-prod-rg' -Name 'adf-neu-prod' 
$datafactoryGlobalParametersProduction = $dataFactoryProduction.GlobalParameters
$datafactoryResourceGroupName = $dataFactoryDevelopment.ResourceGroupName
$datafactoryName = $dataFactoryDevelopment.DataFactoryName 

foreach ($key in $datafactoryGlobalParametersProduction){
$keyContentProduction = $key | select-object -ExpandProperty Keys
}

foreach ($value in $datafactoryGlobalParametersProduction){
$valueContentProduction = $value.values | select-object -ExpandProperty value
}

$datafactoryGlobalParametersArrayProduction = @()
$MaxArraySizeProduction = [Math]::Max($keyContentProduction.Length, $valueContentProduction.Length)
$datafactoryGlobalParametersArrayProduction = for ($i = 0; $i -lt $MaxArraySizeProduction; $i++){ 
    Write-Verbose "$($keyContentProduction[$i]),$($valueContentProduction[$i]),$($datafactoryResourceGroupName),$($datafactoryName)"
    [PSCustomObject]@{
        DataFactoryName      = $datafactoryName
        ResourceGroupName    = $datafactoryResourceGroupName
        GlobalParameterKey   = $keyContentProduction[$i]
        GlobalParameterValue = $valueContentProduction[$i]
    }
}

$datafactoryGlobalParametersArrayProduction | `
Write-SqlTableData -ServerInstance $targetSqlInstance -DatabaseName $targetDatabase -Credential $Credential -SchemaName $targetSchema -TableName 'AzDataFactoryV2GlobalParameters' -Force