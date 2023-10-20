create table CountryWiseProductSales(SalesAgent nvarchar(30),
SalesCountry nvarchar(10), SalesAmount int)

select * from CountryWiseProductSales

-- Group by Query
select	SalesCountry, SalesAgent, SUM(SalesAmount) as Total 
from	CountryWiseProductSales
group by	SalesCountry, SalesAgent
order by	SalesCountry, SalesAgent

-- Query Using Pivot
select SalesAgent, India, US, UK from CountryWiseProductSales
pivot	(sum(SalesAmount) for SalesCountry in ([India],[US],[UK]))
as PivotTable

create table tableCountryWiseProductSalesWithId(Id int Identity(1,1),SalesAgent nvarchar(30),
SalesCountry nvarchar(10), SalesAmount int)

insert into tableCountryWiseProductSalesWithId(SalesAgent,
SalesCountry,SalesAmount)
select SalesAgent,SalesCountry,SalesAmount
from CountryWiseProductSales

select * from tableCountryWiseProductSalesWithId

-- Query Using Pivot
select SalesAgent, India, US, UK from tableCountryWiseProductSalesWithId
pivot	(sum(SalesAmount) for SalesCountry in ([India],[US],[UK]))
as PivotTable2

select SalesAgent, India, US, UK
from
(
		Select SalesAgent, SalesCountry, SalesAmount
		from tableCountryWiseProductSalesWithId
) as SourceTable
pivot
(
	sum(SalesAmount)
	for SalesCountry in (India, US, UK)
) as PivortTable2