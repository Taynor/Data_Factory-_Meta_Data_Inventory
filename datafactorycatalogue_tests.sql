/*first test batch*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES ('insert_test_0e00d050-0000-0c00-0000-64fafdde0000', 'cdc-az-dev-datafactory', 
'insert_test_DF_ICECurvesFlow', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES ('insert_test_3a00b392-0000-0c00-0000-63eb5f670000', 'cdc-az-dev-datafactory',
'insert_test_FundUnderlyingConnectionsSQL',	'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersDevelopment]
VALUES ('insert_test_adls_container_name', 'insert_test_datalake-dev')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersProduction]
VALUES ('insert_test_adls_container_name', 'insert_test_datalake')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersQA]
VALUES ('insert_test_adls_container_name', 'insert_test_datalake-qa')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES ('cdc-az-dev-datafactory', 'insert_test_managedIntegrationRuntime',	
NULL, NULL, 'insert_test_Managed_renamed', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES ('insert_test_9a0035b8-0000-0c00-0000-62669f210000', 'cdc-az-dev-datafactory',	
'insert_test_AzureSqlDB_Private', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES ('insert_test_0e000751-0000-0c00-0000-64fafde90000',	'cdc-az-dev-datafactory',
'insert_test_Master', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES ('insert_test_0e003751-0000-0c00-0000-64fafdef0000',	'cdc-az-dev-datafactory',
'insert_test_Deal_CSV_Added', 'insert_test_Stopped', 'CDC-AZ-DEV-DataFactory')

UPDATE [staging].[AzDataFactoryV2DataFlow]
SET [name] = 'DF_ICECurvesFlow_renamed'
WHERE [name] = 'DF_ICECurvesFlow'

UPDATE [staging].[AzDataFactoryV2Dataset]
SET [name] = 'FundUnderlyingConnectionsSQL_renamed'
WHERE [name] = 'FundUnderlyingConnectionsSQL'

UPDATE [staging].[AzDataFactoryV2IntegrationRuntime]
SET [Type] = 'Managed_renamed'
WHERE [Type] = 'Managed'

UPDATE [staging].[AzDataFactoryV2LinkedService]
SET [name] = 'AzureSqlDB_Private_renamed'
WHERE [name] = 'AzureSqlDB_Private'

UPDATE [staging].[AzDatafactoryV2Pipeline]
SET [name] = 'Master_renamed'
WHERE [name] = 'Master'

UPDATE [staging].[AzDataFactoryV2Trigger]
SET [name] = 'Deal_CSV_Added_renamed'
WHERE [name] = 'Deal_CSV_Added'

UPDATE [staging].[AzDataFactoryV2GlobalParametersDevelopment]
SET [GlobalParameterValue] = 'datalake-dev_renamed'
WHERE [GlobalParameterValue] = 'datalake-dev'

UPDATE [staging].[AzDataFactoryV2GlobalParametersQA]
SET [GlobalParameterValue] = 'datalake-qa_renamed'
WHERE [GlobalParameterValue] = 'datalake-qa'

UPDATE [staging].[AzDataFactoryV2GlobalParametersProduction]
SET [GlobalParameterValue] = 'datalake_renamed'
WHERE [GlobalParameterValue] = 'datalake'

/*second test batch*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES ('insert_test_2_0e00d050-0000-0c00-0000-64fafdde0000', 'cdc-az-dev-datafactory', 
'insert_test_2_DF_ICECurvesFlow', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES ('insert_test_2_3a00b392-0000-0c00-0000-63eb5f670000', 'cdc-az-dev-datafactory',
'insert_test_2_FundUnderlyingConnectionsSQL', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersDevelopment]
VALUES ('insert_test_2_adls_container_name', 'insert_test_2_datalake-dev')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersProduction]
VALUES ('insert_test_2_adls_container_name', 'insert_test_2_datalake')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersQA]
VALUES ('insert_test_2_adls_container_name', 'insert_test_2_datalake-qa')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES ('cdc-az-dev-datafactory', 'insert_test_2_managedIntegrationRuntime',	
NULL, NULL, 'insert_test_2_Managed_renamed', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES ('insert_test_2_9a0035b8-0000-0c00-0000-62669f210000', 'cdc-az-dev-datafactory',	
'insert_test_2_AzureSqlDB_Private', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES ('insert_test_2_0e000751-0000-0c00-0000-64fafde90000', 'cdc-az-dev-datafactory',
'insert_test_2_Master', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES ('insert_test_2_0e003751-0000-0c00-0000-64fafdef0000', 'cdc-az-dev-datafactory',
'insert_test_2_Deal_CSV_Added', 'insert_test_2_Stopped', 'CDC-AZ-DEV-DataFactory')

UPDATE [staging].[AzDataFactoryV2DataFlow]
SET [name] = 'DF_FxRates_ADLS_Raw_to_Staged_renamed'
WHERE [name] = 'DF_FxRates_ADLS_Raw_to_Staged'

UPDATE [staging].[AzDataFactoryV2Dataset]
SET [name] = 'UpdatedD365Records_renamed'
WHERE [name] = 'UpdatedD365Records'

UPDATE [staging].[AzDataFactoryV2IntegrationRuntime]
SET [Type] = 'SelfHosted_renamed'
WHERE [Type] = 'SelfHosted'

UPDATE [staging].[AzDataFactoryV2LinkedService]
SET [name] = 'DataLake_Private_renamed'
WHERE [name] = 'DataLake_Private'

UPDATE [staging].[AzDatafactoryV2Pipeline]
SET [name] = 'eFront_to_Datalake_2_Organisations_renamed'
WHERE [name] = 'eFront_to_Datalake_2_Organisations'

UPDATE [staging].[AzDataFactoryV2Trigger]
SET [name] = 'Fund_Underlying_Connection_CSV_Added_renamed'
WHERE [name] = 'Fund_Underlying_Connection_CSV_Added'

UPDATE [staging].[AzDataFactoryV2GlobalParametersDevelopment]
SET [GlobalParameterValue] = 'cdc-efdev-dw02.cdcgroup.com_renamed'
WHERE [GlobalParameterValue] = 'cdc-efdev-dw02.cdcgroup.com'

UPDATE [staging].[AzDataFactoryV2GlobalParametersQA]
SET [GlobalParameterValue] = 'eFrontMIG-DW_renamed'
WHERE [GlobalParameterValue] = 'eFrontMIG-DW'

UPDATE [staging].[AzDataFactoryV2GlobalParametersProduction]
SET [GlobalParameterValue] = 'eFront_renamed'
WHERE [GlobalParameterValue] = 'eFront'

/*third test batch*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES ('insert_test_3_0e00d050-0000-0c00-0000-64fafdde0000', 'cdc-az-dev-datafactory', 
'insert_test_3_DF_ICECurvesFlow', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES ('insert_test_3_3a00b392-0000-0c00-0000-63eb5f670000', 'cdc-az-dev-datafactory',
'insert_test_3_FundUnderlyingConnectionsSQL', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersDevelopment]
VALUES ('insert_test_3_adls_container_name', 'insert_test_3_datalake-dev')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersProduction]
VALUES ('insert_test_3_adls_container_name', 'insert_test_3_datalake')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersQA]
VALUES ('insert_test_3_adls_container_name', 'insert_test_3_datalake-qa')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES ('cdc-az-dev-datafactory', 'insert_test_3_managedIntegrationRuntime',	
NULL, NULL, 'insert_test_3_Managed_renamed', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES ('insert_test_3_9a0035b8-0000-0c00-0000-62669f210000', 'cdc-az-dev-datafactory',	
'insert_test_3_AzureSqlDB_Private', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES ('insert_test_3_0e000751-0000-0c00-0000-64fafde90000', 'cdc-az-dev-datafactory',
'insert_test_3_Master', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES ('insert_test_3_0e003751-0000-0c00-0000-64fafdef0000', 'cdc-az-dev-datafactory',
'insert_test_3_Deal_CSV_Added', 'insert_test_3_Stopped', 'CDC-AZ-DEV-DataFactory')

UPDATE [staging].[AzDataFactoryV2DataFlow]
SET [name] = 'DF_FxRates_ADLS_to_SQL_renamed'
WHERE [name] = 'DF_FxRates_ADLS_to_SQL'

UPDATE [staging].[AzDataFactoryV2Dataset]
SET [name] = 'D365_Investments_renamed'
WHERE [name] = 'D365_Investments'

UPDATE [staging].[AzDataFactoryV2IntegrationRuntime]
SET [authorizationtype] = 'RBAC_renamed'
WHERE [authorizationtype] = NULL

UPDATE [staging].[AzDataFactoryV2LinkedService]
SET [name] = 'Dynamics_renamed'
WHERE [name] = 'Dynamics'

UPDATE [staging].[AzDatafactoryV2Pipeline]
SET [name] = 'eFront_to_Datalake_7_Fund_Underlying_renamed'
WHERE [name] = 'eFront_to_Datalake_7_Fund_Underlying'

UPDATE [staging].[AzDataFactoryV2Trigger]
SET [RuntimeState] = 'Stopped_renamed'
WHERE [RuntimeState] = 'Stopped'

UPDATE [staging].[AzDataFactoryV2GlobalParametersDevelopment]
SET [GlobalParameterValue] = 'eFrontX-DW_renamed'
WHERE [GlobalParameterValue] = 'eFrontX-DW'

UPDATE [staging].[AzDataFactoryV2GlobalParametersQA]
SET [GlobalParameterValue] = 'adfstagingqa_renamed'
WHERE [GlobalParameterValue] = 'adfstagingqa'

UPDATE [staging].[AzDataFactoryV2GlobalParametersProduction]
SET [GlobalParameterValue] = 'adfsqlprod_renamed'
WHERE [GlobalParameterValue] = 'adfsqlprod'

/*fourth test batch*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES ('insert_test_4_0e00d050-0000-0c00-0000-64fafdde0000', 'cdc-az-dev-datafactory', 
'insert_test_4_DF_ICECurvesFlow', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES ('insert_test_4_3a00b392-0000-0c00-0000-63eb5f670000', 'cdc-az-dev-datafactory',
'insert_test_4_FundUnderlyingConnectionsSQL', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersDevelopment]
VALUES ('insert_test_4_adls_container_name', 'insert_test_4_datalake-dev')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersProduction]
VALUES ('insert_test_4_adls_container_name', 'insert_test_4_datalake')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersQA]
VALUES ('insert_test_4_adls_container_name', 'insert_test_4_datalake-qa')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES ('cdc-az-dev-datafactory', 'insert_test_4_managedIntegrationRuntime',	
NULL, NULL, 'insert_test_4_Managed_renamed', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES ('insert_test_4_9a0035b8-0000-0c00-0000-62669f210000', 'cdc-az-dev-datafactory',	
'insert_test_4_AzureSqlDB_Private', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES ('insert_test_4_0e000751-0000-0c00-0000-64fafde90000', 'cdc-az-dev-datafactory',
'insert_test_4_Master', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES ('insert_test_4_0e003751-0000-0c00-0000-64fafdef0000', 'cdc-az-dev-datafactory',
'insert_test_4_Deal_CSV_Added', 'insert_test_4_Stopped', 'CDC-AZ-DEV-DataFactory')

UPDATE [staging].[AzDataFactoryV2DataFlow]
SET [name] = 'DF_FxRates_TriOnlyPairs_renamed'
WHERE [name] = 'DF_FxRates_TriOnlyPairs'

UPDATE [staging].[AzDataFactoryV2Dataset]
SET [name] = 'D365_Fund_Underlying_Connections_renamed'
WHERE [name] = 'D365_Fund_Underlying_Connections'

UPDATE [staging].[AzDataFactoryV2IntegrationRuntime]
SET [Description] = 'Description_renamed'
WHERE [Description] = NULL

UPDATE [staging].[AzDataFactoryV2LinkedService]
SET [name] = 'eFront_Share_renamed'
WHERE [name] = 'eFront_Share'

UPDATE [staging].[AzDatafactoryV2Pipeline]
SET [name] = 'eFront_to_Datalake_5_Fund_Managers_renamed'
WHERE [name] = 'eFront_to_Datalake_5_Fund_Managers'

UPDATE [staging].[AzDataFactoryV2Trigger]
SET [name] = 'Investment_Activity_CSV_Added_renamed'
WHERE [name] = 'Investment_Activity_CSV_Added'

UPDATE [staging].[AzDataFactoryV2GlobalParametersDevelopment]
SET [GlobalParameterValue] = 'eFrontX_renamed'
WHERE [GlobalParameterValue] = 'eFrontX'

UPDATE [staging].[AzDataFactoryV2GlobalParametersQA]
SET [GlobalParameterValue] = 'adfqasql_renamed'
WHERE [GlobalParameterValue] = 'adfqasql'

UPDATE [staging].[AzDataFactoryV2GlobalParametersProduction]
SET [GlobalParameterValue] = 'adfstagingprod_renamed'
WHERE [GlobalParameterValue] = 'adfstagingprod'

/*fifth test batch*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES ('insert_test_5_0e00d050-0000-0c00-0000-64fafdde0000', 'cdc-az-dev-datafactory', 
'insert_test_5_DF_ICECurvesFlow', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES ('insert_test_5_3a00b392-0000-0c00-0000-63eb5f670000', 'cdc-az-dev-datafactory',
'insert_test_5_FundUnderlyingConnectionsSQL', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersDevelopment]
VALUES ('insert_test_5_adls_container_name', 'insert_test_5_datalake-dev')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersProduction]
VALUES ('insert_test_5_adls_container_name', 'insert_test_5_datalake')

INSERT INTO [staging].[AzDataFactoryV2GlobalParametersQA]
VALUES ('insert_test_5_adls_container_name', 'insert_test_5_datalake-qa')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES ('cdc-az-dev-datafactory', 'insert_test_5_managedIntegrationRuntime',	
NULL, NULL, 'insert_test_5_Managed_renamed', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES ('insert_test_5_9a0035b8-0000-0c00-0000-62669f210000', 'cdc-az-dev-datafactory',	
'insert_test_5_AzureSqlDB_Private', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES ('insert_test_5_0e000751-0000-0c00-0000-64fafde90000', 'cdc-az-dev-datafactory',
'insert_test_5_Master', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES ('insert_test_5_0e003751-0000-0c00-0000-64fafdef0000', 'cdc-az-dev-datafactory',
'insert_test_5_Deal_CSV_Added', 'insert_test_5_Stopped', 'CDC-AZ-DEV-DataFactory')

UPDATE [staging].[AzDataFactoryV2DataFlow]
SET [name] = 'DF_HolidayData_convert_eFront_renamed'
WHERE [name] = 'DF_HolidayData_convert_eFront'

UPDATE [staging].[AzDataFactoryV2Dataset]
SET [name] = 'D365_Investment_Activities_renamed'
WHERE [name] = 'D365_Investment_Activities'

UPDATE [staging].[AzDataFactoryV2IntegrationRuntime]
SET [Type] = 'SelfHosted_renamed'
WHERE [Type] = 'SelfHosted'

UPDATE [staging].[AzDataFactoryV2LinkedService]
SET [name] = 'ICEsftpSite_renamed'
WHERE [name] = 'ICEsftpSite'

UPDATE [staging].[AzDatafactoryV2Pipeline]
SET [name] = 'eFront_to_Datalake_6_Investment_Activites_renamed'
WHERE [name] = 'eFront_to_Datalake_6_Investment_Activites'

UPDATE [staging].[AzDataFactoryV2Trigger]
SET [name] = 'Organisation_CSV_Added_renamed',
[RuntimeState] = 'Running_renamed'
WHERE [name] = 'Organisation_CSV_Added'
AND [RuntimeState] = 'Stopped'

UPDATE [staging].[AzDataFactoryV2GlobalParametersDevelopment]
SET [GlobalParameterValue] = 'dropzone_renamed'
WHERE [GlobalParameterValue] = 'dropzone'

UPDATE [staging].[AzDataFactoryV2GlobalParametersQA]
SET [GlobalParameterValue] = 'CDC_Salmon\IMPORT\FxRates\QA\_renamed'
WHERE [GlobalParameterValue] = 'CDC_Salmon\IMPORT\FxRates\QA\'

UPDATE [staging].[AzDataFactoryV2GlobalParametersProduction]
SET [GlobalParameterValue] = 'cdc-ef-dw01.cdcgroup.com_renamed'
WHERE [GlobalParameterValue] = 'cdc-ef-dw01.cdcgroup.com'