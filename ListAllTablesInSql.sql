-- Gets the list of tables only
Select *
from SYSOBJECTS
where XTYPE='U'
-- Gets the list of tables only
Select *
from SYS.TABLES
-- Gets the list of tables and views
Select *
from INFORMATION_SCHEMA.TABLES

Select Distinct XTYPE
from SYSOBJECTS