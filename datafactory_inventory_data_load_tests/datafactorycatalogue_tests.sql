/*first test batch*/
/*INSERT test values*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES
    ('insert_test_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_dataflow_name', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES
    ('insert_test_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_dataset_name', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2GlobalParameters]
VALUES
    ('datafactory_name', 'resource_group_name', 'insert_test_global_parameter_key',
        'insert_test_global_parameter')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES
    ('datafactory_name', 'insert_test_integration_runtime_name',
        NULL, NULL, 'insert_test_integration_runtime_type', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES
    ('insert_test_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_linked_service', 'resource_group_name')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES
    ('insert_test_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_pipeline', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES
    ('insert_test_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_trigger_name', 'insert_test_runtime_state', 'resource_group_name')

/*UPDATE test values*/
UPDATE [staging].[AzDataFactoryV2DataFlow]
SET [name] = 'dataflow_name_renamed'
WHERE [name] = 'dataflow_name'

UPDATE [staging].[AzDataFactoryV2Dataset]
SET [name] = 'dataset_name_renamed'
WHERE [name] = 'dataset_name'

UPDATE [staging].[AzDataFactoryV2IntegrationRuntime]
SET [Type] = 'integration_runtime_type_renamed'
WHERE [Type] = 'integration_runtime_type'

UPDATE [staging].[AzDataFactoryV2LinkedService]
SET [name] = 'linked_service_name_renamed'
WHERE [name] = 'linked_service_name'

UPDATE [staging].[AzDatafactoryV2Pipeline]
SET [name] = 'pipeline_name_renamed'
WHERE [name] = 'pipeline_name'

UPDATE [staging].[AzDataFactoryV2Trigger]
SET [name] = 'trigger_name_renamed'
WHERE [name] = 'trigger_name'

UPDATE [staging].[AzDataFactoryV2GlobalParameters]
SET [GlobalParameterValue] = 'global_parameter_value_renamed'
WHERE [GlobalParameterValue] = 'global_parameter_value'