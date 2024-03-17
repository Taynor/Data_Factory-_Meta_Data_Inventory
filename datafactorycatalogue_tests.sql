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

/*second test batch*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES
    ('insert_test_2_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_2_dataflow_name', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES
    ('insert_test_2_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_2_dataset_name', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2GlobalParameters]
VALUES
    ('datafactory_name', 'resource_group_name', 'insert_test_2_global_parameter_key',
        'insert_test_2_global_parameter')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES
    ('datafactory_name', 'insert_test_2_integration_runtime_name',
        NULL, NULL, 'insert_test_2_integration_runtime_type', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES
    ('insert_test_2_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_2_linked_service', 'resource_group_name')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES
    ('insert_test_2_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_2_pipeline', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES
    ('insert_test_2_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_2_trigger_name', 'insert_test_2_runtime_state', 'resource_group_name')

UPDATE [staging].[AzDataFactoryV2DataFlow]
SET [name] = 'dataflow_2_name_renamed'
WHERE [name] = 'dataflow_2_name'

UPDATE [staging].[AzDataFactoryV2Dataset]
SET [name] = 'dataset_2_name_renamed'
WHERE [name] = 'dataset_2_name'

UPDATE [staging].[AzDataFactoryV2IntegrationRuntime]
SET [Type] = 'integration_runtime_2_type_renamed'
WHERE [Type] = 'integration_runtime_2_type'

UPDATE [staging].[AzDataFactoryV2LinkedService]
SET [name] = 'linked_service_2_name_renamed'
WHERE [name] = 'linked_service_2_name'

UPDATE [staging].[AzDatafactoryV2Pipeline]
SET [name] = 'pipeline_2_name_renamed'
WHERE [name] = 'pipeline_2_name'

UPDATE [staging].[AzDataFactoryV2Trigger]
SET [name] = 'trigger_name_2_renamed'
WHERE [name] = 'trigger_2_name'

UPDATE [staging].[AzDataFactoryV2GlobalParameters]
SET [GlobalParameterValue] = 'global_parameter_2_value_renamed'
WHERE [GlobalParameterValue] = 'global_parameter_2_value'

/*third test batch*/
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

/*fourth test batch*/
INSERT INTO [staging].[AzDataFactoryV2DataFlow]
VALUES
    ('insert_test_4_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_4_dataflow_name', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2Dataset]
VALUES
    ('insert_test_4_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_4_dataset_name', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2GlobalParameters]
VALUES
    ('datafactory_name', 'resource_group_name', 'insert_test_4_global_parameter_key',
        'insert_test_4_global_parameter')

INSERT INTO [staging].[AzDataFactoryV2IntegrationRuntime]
VALUES
    ('datafactory_name', 'insert_test_4_integration_runtime_name',
        NULL, NULL, 'insert_test_4_integration_runtime_type', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2LinkedService]
VALUES
    ('insert_test_4_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_4_linked_service', 'resource_group_name')

INSERT INTO [staging].[AzDatafactoryV2Pipeline]
VALUES
    ('insert_test_4_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_4_pipeline', 'resource_group_name')

INSERT INTO [staging].[AzDataFactoryV2Trigger]
VALUES
    ('insert_test_4_00000000-0000-0000-0000-000000000000', 'datafactory_name',
        'insert_test_4_trigger_name', 'insert_test_4_runtime_state', 'resource_group_name')

UPDATE [staging].[AzDataFactoryV2DataFlow]
SET [name] = 'dataflow_4_name_renamed'
WHERE [name] = 'dataflow_4_name'

UPDATE [staging].[AzDataFactoryV2Dataset]
SET [name] = 'dataset_4_name_renamed'
WHERE [name] = 'dataset_4_name'

UPDATE [staging].[AzDataFactoryV2IntegrationRuntime]
SET [Description] = 'integration_runtime_4_description_renamed'
WHERE [Description] = 'integration_runtime_4_description'

UPDATE [staging].[AzDataFactoryV2LinkedService]
SET [name] = 'linked_service_4_name_renamed'
WHERE [name] = 'linked_service_4_name'

UPDATE [staging].[AzDatafactoryV2Pipeline]
SET [name] = 'pipeline_4_name_renamed'
WHERE [name] = 'pipeline_4_name'

UPDATE [staging].[AzDataFactoryV2Trigger]
SET [name] = 'trigger_4_name_renamed'
WHERE [name] = 'trigger_4_name'

UPDATE [staging].[AzDataFactoryV2GlobalParameters]
SET [GlobalParameterValue] = 'global_parameter_4_value_renamed'
WHERE [GlobalParameterValue] = 'global_parameter_4_value'

/*fifth test batch*/
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