select ASCII('A')

select CHAR(65)

declare @Start int
set @Start = 65
while (@Start <= 90)
begin
	print char(@Start)
	set @Start = @Start + 1
end

-- remove space from the left side
select LTRIM( '    hello')

select UPPER(ltrim('   hello'))

select REVERSE(rtrim('mass    '))

-- this left f^n gives the char to the 4th index
select LEFT('ABCDEF', 4)

-- this right f^n gives the 4 chars to from right
select right('ABCDEF', 3)

-- it is use to find the index val of the char in a string
select CHARINDEX('@', 'sara@aaa.com',2)

select substring('sara@aaa.com', 6, 7)

select substring('shubh@bbb.com',
CHARINDEX('@', 'shubh@bbb.com') + 1,
LEN('shubh@bbb.com') - CHARINDEX('@', 'shubh@bbb.com')
)

select SUBSTRING(Email, CHARINDEX('@', Email) + 1,
LEN(Email) - CHARINDEX('@', Email))
as EmailDomain, COUNT(Email) as Total
from tblPerson
group by SUBSTRING(Email, CHARINDEX('@', Email) + 1,
LEN(Email) - CHARINDEX('@', Email))

select * from tblPerson