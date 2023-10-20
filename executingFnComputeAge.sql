select * from tblDob

select Id, Name, DateOfBirth, dbo.fnComputeAge2(DateOfBirth) as Age from tblDob