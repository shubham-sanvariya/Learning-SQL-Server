-- if table exists then drop and recreate
-- information_schema.tables contains all the tables 
-- that is in the database
if (EXISTS (select * 
            from information_schema.tables
            WHERE TABLE_NAME = 'tblProductSales2'))
begin
    drop table tblProductSales2
end

if (EXISTS (SELECT *
            from INFORMATION_SCHEMA.TABLES
            WHERE TABLE_NAME = 'tblProducts2'))
BEGIN
    DROP TABLE tblProducts2
END

-- simple random number generating function
DECLARE @LL INT
SET @LL = 1

DECLARE @UL INT
SET @UL = 5
SELECT ROUND(((@UL - @LL) * Rand() + 1), 0)

CREATE TABLE tblProducts2
(
    [Id] int IDENTITY PRIMARY KEY,
    [Name] NVARCHAR(50),
    [Description] NVARCHAR(250)
)

CREATE TABLE tblProductSales2
(
    Id int PRIMARY KEY IDENTITY,
    productId int FOREIGN KEY REFERENCES tblProducts2(Id),
    UnitPrice int,
    QuantitySold int
)

-- Insert Sample data into tblProducts table
DECLARE @Id INT
set @Id = 1

WHILE(@Id <= 10000)
BEGIN
    INSERT into tblProducts2
    VALUES('Product - ' + CAST(@Id as nvarchar(20)),
    'Product - ' + CAST(@Id as nvarchar(20))
    + 'Description')
    PRINT @Id
    SET @Id = @Id + 1
END

-- declare variables to hold a random ProductId,
-- UnitPrice and QuantitySold
DECLARE @RandomProductId INT
DECLARE @RandomUnitPrice INT
DECLARE @RandomQuantitySold int

-- declare and set variable to generate a
-- random ProductId between 1 and 10000
DECLARE @UpperLimitForProductId INT
DECLARE @LowerLimitForProductId INT

SET @LowerLimitForProductId = 1
SET @UpperLimitForProductId = 8500

-- declare and set variables to generate a 
-- random UnitPrice between 1 and 100
DECLARE @UpperLimitForUnitPrice INT
DECLARE @LowerLimitForUnitPrice INT

SET @LowerLimitForUnitPrice = 1
SET @UpperLimitForUnitPrice = 100

-- declare and set variables to generate a
-- random QuantitySold between 1 and 10
DECLARE @UpperLimitForQuantitySold INT
DECLARE @LowerLimitForQuantitySold INT

set @LowerLimitForQuantitySold = 1
SET @UpperLimitForQuantitySold = 10

-- Insert sample data into tblProductSales2 table
DECLARE @Counter int
SET @Counter = 1

WHILE(@Counter <= 15000)
BEGIN
    SELECT @RandomProductId = ROUND(((@UpperLimitForProductId - @LowerLimitForProductId) * Rand() + @LowerLimitForProductId), 0)
    SELECT @RandomUnitPrice = ROUND(((@UpperLimitForUnitPrice- @LowerLimitForUnitPrice) * Rand() + @LowerLimitForUnitPrice), 0)
    SELECT @RandomQuantitySold  = ROUND(((@UpperLimitForQuantitySold - @LowerLimitForQuantitySold) * Rand() + @LowerLimitForQuantitySold), 0)

    INSERT INTO tblProductSales2
    VALUES (@RandomProductId, @RandomUnitPrice, @RandomQuantitySold)

    PRINT @Counter
    SET @Counter = @Counter + 1
END

SELECT * from tblProducts2
SELECT * from tblProductSales2