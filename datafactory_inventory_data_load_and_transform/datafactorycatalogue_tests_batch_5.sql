/*fifth test batch*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES ('insert_test_5_0e00d050-0000-0c00-0000-64fafdde0000', 'cdc-az-dev-datafactory', 
'insert_test_5_DF_ICECurvesFlow', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES ('0e00d050-0000-0c00-0000-64fafdde0000', 'cdc-az-dev-datafactory', 
'DF_ICECurvesFlow_renamed_5', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES ('insert_test_5_3a00b392-0000-0c00-0000-63eb5f670000', 'cdc-az-dev-datafactory',
'insert_test_5_FundUnderlyingConnectionsSQL',	'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES ('3a00b392-0000-0c00-0000-63eb5f670000', 'cdc-az-dev-datafactory',
'FundUnderlyingConnectionsSQL_renamed_5',	'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2GlobalParameters]
VALUES ('cdc-az-dev-datafactory', 'CDC-AZ-DEV-DataFactory', 'insert_test_5_adls_container_name', 'insert_test_5_datalake-dev')

INSERT INTO [staging].[AzDataFactoryV2GlobalParameters]
VALUES ('cdc-az-dev-datafactory', 'CDC-AZ-DEV-DataFactory', 'adls_container_name', 'datalake-dev_renamed_5')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES ('cdc-az-dev-datafactory', 'insert_test_5_managedIntegrationRuntime',	
NULL, NULL, 'insert_test_Managed_renamed_5', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES ('cdc-az-dev-datafactory', 'adf-dev-ir-cdc-az-wvd-0-linked',	
'RBAC_renamed_5', NULL, 'Managed_renamed_5', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES ('insert_test_5_9a0035b8-0000-0c00-0000-62669f210000', 'cdc-az-dev-datafactory',	
'insert_test_5_AzureSqlDB_Private', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES ('9a0035b8-0000-0c00-0000-62669f210000', 'cdc-az-dev-datafactory',	
'AzureSqlDB_Private_renamed_5', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES ('insert_test_5_0e000751-0000-0c00-0000-64fafde90000',	'cdc-az-dev-datafactory',
'insert_test_5_Master', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES ('0e000751-0000-0c00-0000-64fafde90000',	'cdc-az-dev-datafactory',
'Master_renamed_5', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES ('insert_test_0e003751-0000-0c00-0000-64fafdef0000',	'cdc-az-dev-datafactory',
'insert_test_5_Deal_CSV_Added', 'insert_test_5_Stopped', 'CDC-AZ-DEV-DataFactory')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES ('0e003751-0000-0c00-0000-64fafdef0000',	'cdc-az-dev-datafactory',
'Deal_CSV_Added', 'Stopped_renamed_5', 'CDC-AZ-DEV-DataFactory')