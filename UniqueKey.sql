select * from tblPerson

alter table tblPerson
Add Constraint UQ_tblPerson_Email Unique (Email)

insert into tblPerson values (12, 'xyz', 'a@a.com', 1 ,20)

alter table tblPerson
drop constraint UQ_tblPerson_Email