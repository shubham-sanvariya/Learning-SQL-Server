UPDATE tblProductSales2
SET UnitPrice = CASE
                    WHEN Name = 'Product - 55' THEN 55
                    WHEN Name = 'Product - 65' THEN 65
                    WHEN Name LIKE 'Product - 100%' THEN 1000
-- for data to be update correctly make sure to put an else
-- case if case does not match it's criteria so that the table
-- get's updated properly
                    ELSE 
                         UnitPrice
                END
FROM tblProductSales2
JOIN tblProducts2
ON tblProducts2.Id = tblProductSales2.productId
WHERE (Name = 'Product - 55' or Name = 'Product - 65' or Name LIKE 'Product - 100%')

select * FROM tblProducts2

SELECT Name, UnitPrice
from tblProducts2 JOIN
    tblProductSales2 on tblProducts2.Id = tblProductSales2.productId
WHERE (Name = 'Product - 55' or Name = 'Product - 65') or Name like 'Product - 100%'