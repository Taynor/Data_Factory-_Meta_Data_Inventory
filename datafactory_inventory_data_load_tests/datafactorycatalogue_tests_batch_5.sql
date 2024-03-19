/*fifth test batch*/
/*INSERT test values*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES
    ('insert_test_5_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_5_dataflow_name', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES
    ('insert_test_5_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_5_dataset_name', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2GlobalParameters]
VALUES
    ('datafactory_name', 'resource_group_name', 'insert_test_5_global_parameter_key',
        'insert_test_5_global_parameter')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES
    ('datafactory_name', 'insert_test_5_integration_runtime_name',
        NULL, NULL, 'insert_test_5_integration_runtime_type', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES
    ('insert_test_5_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_5_linked_service', 'resource_group_name')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES
    ('insert_test_5_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_4_pipeline', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES
    ('insert_test_5_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_5_trigger_name', 'insert_test_5_runtime_state', 'resource_group_name')

/*UPDATE test values*/
UPDATE [staging].[AzDataFactoryV2DataFlow]
SET [name] = 'dataflow_5_name_renamed'
WHERE [name] = 'dataflow_5_name'

UPDATE [staging].[AzDataFactoryV2Dataset]
SET [name] = 'dataset_5_name_renamed'
WHERE [name] = 'dataset_5_name'

UPDATE [staging].[AzDataFactoryV2IntegrationRuntime]
SET [name] = 'integration_runtime_5_name_renamed'
WHERE [name] = 'integration_runtime_5_name'

UPDATE [staging].[AzDataFactoryV2LinkedService]
SET [name] = 'linked_service_5_name_renamed'
WHERE [name] = 'linked_service_5_name'

UPDATE [staging].[AzDatafactoryV2Pipeline]
SET [name] = 'pipeline_5_name_renamed'
WHERE [name] = 'pipeline_5_name'

UPDATE [staging].[AzDataFactoryV2Trigger]
SET [name] = 'trigger_5_name_renamed'
WHERE [name] = 'trigger_5_name'

UPDATE [staging].[AzDataFactoryV2GlobalParameters]
SET [GlobalParameterValue] = 'global_parameter_5_value_renamed'
WHERE [GlobalParameterValue] = 'global_parameter_5_value'