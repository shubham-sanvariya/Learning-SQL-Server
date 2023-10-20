create table tblProduct(ProductId int, Name nvarchar(50), UnitPrice int)

select * from tblProduct

insert into tblProduct values(4,'Clips',5)

create table tblProductSales(ProductId int, QuantitySold int)

select * from tblProductSales

create view vWTotalSalesByProduct
with schemaBinding
as
select Name,
SUM(isnull((QuantitySold * UnitPrice), 0)) as TotalSales,
COUNT_BIG(*) as TotalTransactions
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductId = dbo.tblProductSales.ProductId
group by Name

select * from vWTotalSalesByProduct

create Unique Clustered Index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)