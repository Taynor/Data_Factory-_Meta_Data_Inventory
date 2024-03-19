/*third test batch*/
/*INSERT test values*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES
    ('insert_test_3_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_3_dataflow_name', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES
    ('insert_test_3_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_3_dataset_name', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2GlobalParameters]
VALUES
    ('datafactory_name', 'resource_group_name', 'insert_test_3_global_parameter_key',
        'insert_test_3_global_parameter')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES
    ('datafactory_name', 'insert_test_3_integration_runtime_name',
        NULL, NULL, 'insert_test_3_integration_runtime_type', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES
    ('insert_test_3_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_3_linked_service', 'resource_group_name')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES
    ('insert_test_3_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_3_pipeline', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES
    ('insert_test_3_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_3_trigger_name', 'insert_test_3_runtime_state', 'resource_group_name')

/*UPDATE test values*/
UPDATE [staging].[AzDataFactoryV2DataFlow]
SET [name] = 'dataflow_3_name_renamed'
WHERE [name] = 'dataflow_3_name'

UPDATE [staging].[AzDataFactoryV2Dataset]
SET [name] = 'dataset_3_name_renamed'
WHERE [name] = 'dataset_3_name'

UPDATE [staging].[AzDataFactoryV2IntegrationRuntime]
SET [authorizationtype] = 'integration_runtime_3_authorizationtype_renamed'
WHERE [authorizationtype] = 'integration_runtime_3_authorizationtype'

UPDATE [staging].[AzDataFactoryV2LinkedService]
SET [name] = 'linked_service_3_name_renamed'
WHERE [name] = 'linked_service_3_name'

UPDATE [staging].[AzDatafactoryV2Pipeline]
SET [name] = 'pipeline_3_name_renamed'
WHERE [name] = 'pipeline_3_name'

UPDATE [staging].[AzDataFactoryV2Trigger]
SET [RuntimeState] = 'trigger_runtime_state_3_renamed'
WHERE [RuntimeState] = 'trigger_runtime_state_3'

UPDATE [staging].[AzDataFactoryV2GlobalParameters]
SET [GlobalParameterValue] = 'global_parameter_3_value_renamed'
WHERE [GlobalParameterValue] = 'global_parameter_3_value'