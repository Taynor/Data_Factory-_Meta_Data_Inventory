# Data Factory Inventory

The purpose of the project is to extract meta data from Azure Data Factory objects, and load it into a Staging schema using SQL server tables. The data can then be pulled into a History schema, where SCD patterns are applied to build the historical data context. The Staging and History schemas will need to be created before building the Data Factory Inventory tables. The historical context tracks the following attributes of the SCD pattern:

- A timestamp of when a record has been created
- A timestamp of when a record has been modified
- A timestamp of when a record has been ended
- A IsCurrent flag applied to the record that is the latest and current record
- A record of an attribute of the Data Factory object that has changed

The project also includes scripts to help migrate individual tables from an Azure SQL database to a SQL server table. There is also a SQL server index maintenance script that can be used to maintain the indexes in the Data Factory Inventory database, as indexes are added and are fragmented over time.

## The project structure

datafactory_meta_data_extract folder:

- datafactory_metadata_extract.ps1 - PowerShell script to extract meta data from Data Factory

datafactory_inventory_data_load_and_transform folder:

- T-SQL scripts to load the data from the staging schema tables and into the history schema tables

datafactory_inventory_schema folder:

- T-SQL script to create the history schema tables, run the same scripts to create the staging schema tables for an exact schema match. The AzDataFactoryV2IntegrationRuntime table that is created by running the PowerShell scripts uses the sql_variant data type. To override this data type for a a stable data load that doesn't require using CONVERT(NVARCHAR(MAX), [AuthorizationType]), CONVERT(NVARCHAR(MAX), [Description]) in the data loading and transformation process.

Optional folders:

- datafactory_inventory_data_load_tests - for testing the data load
- azure_sql_data_table_to_sqlserver_migration - for migrating specific tables to alternative databases
- sql_server_index_maintenance - for maintaining the indexes on the history tables as the data grows.

## Notes

For managing the staging table history, it is advised to truncate the staging schema tables before running the data loading process into the history schema tables.
