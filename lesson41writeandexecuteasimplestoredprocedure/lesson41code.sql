--1. stored procedures are blocks of code that we create once
-- and we can then reuse
use AdventureWorks2014
go
create procedure GetTotalQuantities
as
	select Sum(OrderQty) as Total
	from Sales.SalesOrderDetail
	group by SalesOrderID
go

alter procedure GetTotalQuantities
as 
   select SalesOrderID, Sum(OrderQty) as Total
	from Sales.SalesOrderDetail
	group by SalesOrderID
go
GetTotalQuantities

	

