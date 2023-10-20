select * from tblPerson

-- replicate f^n
select REPLICATE('pragim ', 3)

select Name, SUBSTRING(Email, 1, 2) 
		+ REPLICATE('*',5) +
		SUBSTRING(Email, charindex('@',Email),
		len(Email) - charindex('@',Email)+1)
		as Email
from tblPerson

-- space f^n
select * from tblCoalesceFn

select FirstName + SPACE(5) + MiddleName as FullName
from tblCoalesceFn

-- PATINDEX	 F^n
select Email, PATINDEX('%@m.com', Email) as FirstOccurence
from  tblPerson
where PATINDEX('%@m.com',Email) > 0

-- replace f^n
select Email, REPLACE(Email, '.com','.net') as ConvertedEmail
from tblPerson

-- stuff f^n
-- this function inserts replacement expression, at the
-- start poisition specified, along with removing the 
-- characters specified using length parameter.

select Name, Email,
		STUFF(Email, 2, 3, '****') as StuffedEmail
from   tblPerson