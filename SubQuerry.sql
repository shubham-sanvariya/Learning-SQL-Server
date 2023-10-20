create table tblProducts1
(
	[Id] int identity primary key,
	[Name] nvarchar(50),
	[Description] nvarchar(250)
)

create table tblProductSales1
(
	Id int primary key identity,
	ProductId int foreign key references tblProducts1(id),
	UnitPrice int,
	QuantitySold int
)

insert into tblProducts1 values ('TV', '52 inch black color LED TV')
insert into tblProducts1 values ('Laptop', 'Very thin black color acer laptop')
insert into tblProducts1 values ('Desktop', 'HP high performance destop')

insert into tblProductSales1 values(3, 450, 5)
insert into tblProductSales1 values(2, 250, 7)
insert into tblProductSales1 values(3, 450, 4)
insert into tblProductSales1 values(3, 450, 9)

select * from tblProducts1
select * from tblProductSales1
-- getting the product which is not in ProductSales1 which means
-- it has not been sold (using SubQuerry)
select Id, Name, [Description] 
from tblProducts1
-- qurey which is in parameters is called sub-querry
where Id Not in (select distinct ProductId from tblProductSales1)
-- getting the product which is not in ProductSales1 which means
-- it has not been sold (using join)
select tblProducts1.Id, Name, [Description] 
from tblProducts1
left join tblProductSales1
on tblProducts1.Id = tblProductSales1.ProductId
where tblProductSales1.ProductId is null

-- using subquerry to get the productName & it's QtySold
select Name,
(select SUM(QuantitySold) from tblProductSales1 where ProductId = tblProducts1.Id)
as QtySold
from tblProducts1
order by Name
-- using join to get the productName & it's QtySold
select Name, SUM(QuantitySold) as QtySold
from tblProducts1
left join tblProductSales1
on tblProducts1.Id = tblProductSales1.ProductId
Group By Name
