# Data Factory Inventory

The purpose of the project is to extract meta data from Azure Data Factory objects, and load it into a Staging schema using SQL server tables. The data can then be pulled into a History schema, where SCD patterns are applied to build the historical data context. The Staging and History schemas will need to be created before building the Data Factory Inventory tables. The historical context tracks the following attributes of the SCD pattern:

- A timestamp of when a record has been created
- A timestamp of when a record has been modified
- A timestamp of when a record has been ended
- A IsCurrent flag applied to the record that is the latest and current record
- A record of an attribute of the Data Factory object that has changed

The project also includes scripts to help migrate individual tables from an Azure SQL database to a SQL server table. There is also a SQL server index maintenance script that can be used to maintain the indexes in the Data Factory Inventory database, as indexes are added and are fragmented over time.

The project structure:

-
