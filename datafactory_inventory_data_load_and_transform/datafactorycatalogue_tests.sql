/*first test batch*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES ('insert_test_0e00d050-0000-0c00-0000-64fafdde0000', 'cdc-az-dev-datafactory', 
'insert_test_DF_ICECurvesFlow', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES ('0e00d050-0000-0c00-0000-64fafdde0000', 'cdc-az-dev-datafactory', 
'DF_ICECurvesFlow_renamed', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES ('insert_test_3a00b392-0000-0c00-0000-63eb5f670000', 'cdc-az-dev-datafactory',
'insert_test_FundUnderlyingConnectionsSQL',	'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES ('3a00b392-0000-0c00-0000-63eb5f670000', 'cdc-az-dev-datafactory',
'FundUnderlyingConnectionsSQL_renamed',	'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2GlobalParameters]
VALUES ('cdc-az-dev-datafactory', 'CDC-AZ-DEV-DataFactory', 'insert_test_adls_container_name', 'insert_test_datalake-dev')

INSERT INTO [staging].[AzDataFactoryV2GlobalParameters]
VALUES ('cdc-az-dev-datafactory', 'CDC-AZ-DEV-DataFactory', 'adls_container_name', 'datalake-dev_renamed')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES ('cdc-az-dev-datafactory', 'insert_test_managedIntegrationRuntime',	
NULL, NULL, 'insert_test_Managed_renamed', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES ('cdc-az-dev-datafactory', 'adf-dev-ir-cdc-az-wvd-0-linked',	
'RBAC_renamed', NULL, 'Managed_renamed', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES ('insert_test_9a0035b8-0000-0c00-0000-62669f210000', 'cdc-az-dev-datafactory',	
'insert_test_AzureSqlDB_Private', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES ('9a0035b8-0000-0c00-0000-62669f210000', 'cdc-az-dev-datafactory',	
'AzureSqlDB_Private_renamed', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES ('insert_test_0e000751-0000-0c00-0000-64fafde90000',	'cdc-az-dev-datafactory',
'insert_test_Master', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES ('0e000751-0000-0c00-0000-64fafde90000',	'cdc-az-dev-datafactory',
'Master_renamed', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES ('insert_test_0e003751-0000-0c00-0000-64fafdef0000',	'cdc-az-dev-datafactory',
'insert_test_Deal_CSV_Added', 'insert_test_Stopped', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES ('0e003751-0000-0c00-0000-64fafdef0000',	'cdc-az-dev-datafactory',
'Deal_CSV_Added', 'Stopped_renamed', 'CDC-AZ-DEV-DataFactory')