-- transaction 1

create table tblInventory
(
    Id int,
    Product nvarchar(50),
    ProductInStock int
)

insert into tblInventory
values(1, 'android', 10)

select *
from tblInventory

begin tran
update tblInventory set ProductInStock = 9
where Id = 1

-- bill the customer
waitfor Delay '00:00:15'
rollback tran

--TRANSACTION 2 by another user
-- when using uncommitted isolation dirty data gets readed
set tran isolation level read uncommitted
select * from tblInventory
where Id = 1