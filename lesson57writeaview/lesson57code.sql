--1. creating views with scripts
use AdventureWorks2014
go
if OBJECT_ID("EmployeeDetails") is not null
   drop view EmployeeDetails
go
create view EmployeeDetails
as
   select HireDate,
   "Bonus"=(case 
                when DATEDIFF(YEAR, HireDate,GETDATE())>=8 
                     then 'Yes'
					 else 'No'
			end)
   from HumanResources.Employee 
go
select * from EmployeeDetails


