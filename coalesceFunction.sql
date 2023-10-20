select * from tblCoalesceFn

insert into tblCoalesceFn values(2,'James','Nick','Nancy')

-- coalesce f^n returns the first Non Null value
select Id, coalesce(FirstName, MiddleName, LastName)
as Name from tblCoalesceFn