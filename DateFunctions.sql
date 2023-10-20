-- exmaple of Datepart & DateName
select DATEPART(weekday, '2020-08-28')
select DATENAME(weekday, '2020-08-28')

-- example of adding 20 & sub -20 days to a date
select DATEADD(day, 20, '2020-09-28')
select DATEADD(day, -20, '2020-09-28')

--example of diff. in date bet^n starting and ending date
select DATEDIFF(month, '11/28/2023', '01/31/2024')
select DATEDIFF(DAY, '11/28/2023', '01/31/2024')
