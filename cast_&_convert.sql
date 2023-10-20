select * from tblDob

-- usint cast f^n to convert DateTime DataType to nvarchar dataType
select Id, Name, DateOfBirth, CAST(DateOfBirth as nvarchar)
as ConvertedDOB from tblDob

-- using cast f^n to convert DateTime DataType to nvarchar DataType
select Id, Name, DateOfBirth, convert(nvarchar, DateOfBirth)
as ConvertedDOB from tblDob

-- one additional feature the convert f^n has is styling
-- here 103 is the styling code for dd/mm/yyyy
select Id, Name, DateOfBirth, convert(nvarchar, DateOfBirth, 103)
as ConvertedDOB from tblDob

-- concatenate Id(int) and Name(Nvarchar)
select Id , Name, Name + '-' + CAST(Id as nvarchar) as [Name-Id] from tblDob

select * from tblRegister

-- counting registration by dateTime
select		RegisteredDate as RegistrationDate, COUNT(ID) as TotalRegistrations
from		tblRegister
group by	RegisteredDate

-- counting registration by date
select		cast(RegisteredDate as Date)as RegistrationDate, COUNT(ID) as TotalRegistrations
from		tblRegister
group by	cast(RegisteredDate as Date)
