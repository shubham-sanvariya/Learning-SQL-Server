select * from tblGender
select * from tblPerson

Insert into tblPerson (ID, Name, Email, GenderId ) Values (9, 'Sara', 'sara@m.com', Null)

Alter table tblPerson
Add Constraint DF_tblPerson_GenderId
Default 3 for GenderId