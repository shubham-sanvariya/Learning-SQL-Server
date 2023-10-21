-- check for table existence
IF NOT EXISTS (SELECT * from INFORMATION_SCHEMA.tables where table_name = 'tblXyz')
BEGIN
    create TABLE tblXyz
    (
        Id INT IDENTITY PRIMARY KEY,
        Name NVARCHAR(100),
        Gender NVARCHAR(10),
        DateOfBirth DATETIME
    )
    PRINT 'Table tblXyz successfully created'
END
ELSE
BEGIN
    PRINT 'Table tblXyz already exists'
END

-- or 

IF OBJECT_ID('tblXyz') is NULL
BEGIN
    -- create Table script
    PRINT 'Table tblXyz created'
END
ELSE
BEGIN
    PRINT 'Table tblXyz already exists'
END

-- check for column existence
USE[Sample]
if not exists(SELECT * from INFORMATION_SCHEMA.COLUMNS
 where COLUMN_NAME = 'EmailAddress' and
 -- specifiying table name because there can be many tables with 
 -- that column name & also the same with schema
 TABLE_NAME = 'tblXyz' and TABLE_SCHEMA = 'dbo')
BEGIN
    ALTER TABLE tblXyz
    ADD EmailAddress NVARCHAR(50)
END
Else
BEGIN
    PRINT 'Column EmailAddress already exists'
END

-- or 