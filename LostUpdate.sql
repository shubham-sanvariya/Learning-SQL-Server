-- transaction 1 
SET TRANSACTION ISOLATION LEVEL Repeatable READ

BEGIN TRANSACTION
DECLARE @ItemsInStock INT

select @ItemsInStock = ProductInStock
FROM tblInventory WHERE Id = 1

WAITFOR Delay '00:00:10'
set @ItemsInStock = @ItemsInStock - 1

UPDATE tblInventory
set ProductInStock = @ItemsInStock WHERE Id = 1

PRINT @ItemsInStock
COMMIT TRANSACTION

-- transaction 2
-- repeatable read will wait for first tran
-- to finish
SET TRANSACTION ISOLATION LEVEL Repeatable READ

BEGIN TRANSACTION
DECLARE @ItemsInStock INT

select @ItemsInStock = ProductInStock
FROM tblInventory
WHERE Id = 1

WAITFOR Delay '00:00:01'
set @ItemsInStock = @ItemsInStock - 2

UPDATE tblInventory
set ProductInStock = @ItemsInStock WHERE Id = 1

PRINT @ItemsInStock
COMMIT TRANSACTION