DROP EXTERNAL TABLE NYC_Payroll_Summary GO
-- CREATE DATABASE udacity
-- https://adlsnycpayrollanilkumart.dfs.core.windows.net/
-- Use the same file format as used for creating the External Tables during the LOAD step.
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
FORMAT_OPTIONS (
FIELD_TERMINATOR = ',',
USE_TYPE_DEFAULT = FALSE
))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'dirstaging_adlsnycpayrollanilkumart_dfs_core_windows_net') 
    CREATE EXTERNAL DATA SOURCE [dirstaging_adlsnycpayrollanilkumart_dfs_core_windows_net] 
    WITH (
        LOCATION = 'abfss://dirstaging@adlsnycpayrollanilkumart.dfs.core.windows.net' 
    )
GO

CREATE EXTERNAL TABLE [dbo].[NYC_Payroll_Summary](
[FiscalYear] [int] NULL,
[AgencyName] [varchar](50) NULL,
[TotalPaid] [float] NULL
)
WITH (
LOCATION = '/',
DATA_SOURCE = [dirstaging_adlsnycpayrollanilkumart_dfs_core_windows_net],
-- mydlsfs20230413_mydls20230413_dfs_core_windows_net
FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO

SELECT * FROM NYC_Payroll_Summary GO