SELECT TOP 10 * FROM tblProducts2
SELECT TOP 10 * FROM tblProductSales2

SELECT * FROM tblProducts2
SELECT * FROM tblProductSales2

SELECT COUNT(*) FROM tblProducts2
SELECT COUNT(*) FROM tblProductSales2

SELECT Name, UnitPrice
from tblProducts2 JOIN
tblProductSales2 on tblProducts2.Id = tblProductSales2.productId
WHERE (Name = 'Product - 55' or Name = 'Product - 65') or Name like 'Product - 100%'

-- DECLARE @ProductId INT
DECLARE @Name NVARCHAR(30)

DECLARE ProductCursor CURSOR FOR
SELECT Id, Name FROM tblProducts2 WHERE Id <= 1000

OPEN ProductCursor

FETCH NEXT FROM ProductCursor INTO @ProductId, @Name

WHILE(@@FETCH_STATUS = 0)
BEGIN
    PRINT 'Id = ' + CAST(@ProductId as NVARCHAR(10)) + ' Name = ' + @Name

    FETCH NEXT FROM ProductCursor INTO @ProductId, @Name
END

CLOSE ProductCursor
DEALLOCATE ProductCursor

DECLARE @ProductId INT
DECLARE @ProductName NVARCHAR(30)

DECLARE ProductCursor CURSOR FOR
SELECT productId FROM tblProductSales2 WHERE Id<= 6000

OPEN ProductCursor

FETCH NEXT FROM ProductCursor INTO @ProductId

WHILE(@@FETCH_STATUS = 0)
BEGIN
    select @ProductName = Name FROM tblProducts2 WHERE Id = @ProductId

    if(@ProductName = 'Product - 55')
    BEGIN
        update tblProductSales2 SET UnitPrice = 55
        WHERE productId = @ProductId
    END
    else if (@ProductName = 'Product - 65')
    BEGIN
        UPDATE tblProductSales2 SET UnitPrice = 65
        WHERE productId = @ProductId
    END
    ELSE IF (@ProductName like 'Product - 100%')
    BEGIN
        UPDATE tblProductSales2 SET UnitPrice = 1000
        WHERE productId = @ProductId
    END
    Fetch Next from ProductCursor into @ProductId
END

CLOSE ProductCursor
DEALLOCATE ProductCursor