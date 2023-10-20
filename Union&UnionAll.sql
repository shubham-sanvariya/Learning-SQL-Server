select * from tblIndiaCustomers
union all
select * from tblUKCustomers

select * from tblIndiaCustomers
union all
select * from tblUKCustomers
order by FirstName

insert into tblUKCustomers values('Sam', 'S@S.com')

CREATE TABLE tblUKCustomers (
    Personid int IDENTITY(1,1),
    FirstName nvarchar(50),
	Email     nvarchar(50)
);