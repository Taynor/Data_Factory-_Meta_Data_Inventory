/*third test batch*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES ('insert_test_3_0e00d050-0000-0c00-0000-64fafdde0000', 'cdc-az-dev-datafactory', 
'insert_test_3_DF_ICECurvesFlow', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES ('0e00d050-0000-0c00-0000-64fafdde0000', 'cdc-az-dev-datafactory', 
'DF_ICECurvesFlow_renamed_3', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES ('insert_test_3_3a00b392-0000-0c00-0000-63eb5f670000', 'cdc-az-dev-datafactory',
'insert_test_3_FundUnderlyingConnectionsSQL',	'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES ('3a00b392-0000-0c00-0000-63eb5f670000', 'cdc-az-dev-datafactory',
'FundUnderlyingConnectionsSQL_renamed_3',	'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2GlobalParameters]
VALUES ('cdc-az-dev-datafactory', 'CDC-AZ-DEV-DataFactory', 'insert_test_3_adls_container_name', 'insert_test_3_datalake-dev')

INSERT INTO [staging].[AzDataFactoryV2GlobalParameters]
VALUES ('cdc-az-dev-datafactory', 'CDC-AZ-DEV-DataFactory', 'adls_container_name', 'datalake-dev_renamed_3')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES ('cdc-az-dev-datafactory', 'insert_test_3_managedIntegrationRuntime',	
NULL, NULL, 'insert_test_Managed_renamed_3', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES ('cdc-az-dev-datafactory', 'adf-dev-ir-cdc-az-wvd-0-linked',	
'RBAC_renamed_3', NULL, 'Managed_renamed_3', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES ('insert_test_3_9a0035b8-0000-0c00-0000-62669f210000', 'cdc-az-dev-datafactory',	
'insert_test_3_AzureSqlDB_Private', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES ('9a0035b8-0000-0c00-0000-62669f210000', 'cdc-az-dev-datafactory',	
'AzureSqlDB_Private_renamed_3', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES ('insert_test_3_0e000751-0000-0c00-0000-64fafde90000',	'cdc-az-dev-datafactory',
'insert_test_3_Master', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES ('0e000751-0000-0c00-0000-64fafde90000',	'cdc-az-dev-datafactory',
'Master_renamed_3', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES ('insert_test_0e003751-0000-0c00-0000-64fafdef0000',	'cdc-az-dev-datafactory',
'insert_test_3_Deal_CSV_Added', 'insert_test_3_Stopped', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES ('0e003751-0000-0c00-0000-64fafdef0000',	'cdc-az-dev-datafactory',
'Deal_CSV_Added', 'Stopped_renamed_3', 'CDC-AZ-DEV-DataFactory')