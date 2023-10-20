select ABS(-101.5) -- returns 101.5, without the - sign

select CEILING(15.2) -- retuns 16
select CEILING(-15.2) -- retuns -15

select FLOOR(15.2) -- returns 15
select FLOOR(-15.2) -- returns -16

select POWER(2,3) -- returns 8

select SQUARE(9) -- returns 81
select SQRT(81) -- returns 9

select RAND() -- gives random value bet^n 0 to 1
select RAND(2) -- always returns the same value

select FLOOR(rand() * 100) -- returns no. betn 1 to 100

-- printing 10 values through rand
declare @Counter int
set @Counter = 1
while (@Counter <= 10)
begin
	 print floor(rand() * 100)
	 set @Counter = @Counter + 1
end

--Round to 2 places after (to the right) the decimal point

Select ROUND (850.556, 2) -- Returns 850.560

-- Truncate anything after 2 places, after (to the right) the decimal point

Select ROUND (850.556, 2, 1) -- Returns 850.550

-- Round to 1 place after (to the right) the decimal point

Select ROUND (850.556, 1) -- Returns 850.600

-- Truncate anything after 1 place, after (to the right) the decimal point

Select ROUND (850.556, 1, 1) -- Returns 850.500

--Round the last 2 places before (to the left) the decimal point

Select ROUND (850.556, -2) -- 900.000

--Round the last 1 place before (to the left) the decimal point

Select ROUND (850.556, -1) -- 850.000