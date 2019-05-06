--1. common table expressions
use AdventureWorks2014
go
--2. define the common table expression
--3. this table expression can be queried like a regular table
--3. be sure to highlight everything, including the query down below the CTE
--4 when running this code
With SalesOrderSummary (SalesOrderID, TotalQuantity, TotalSales)
as
(
   Select SalesOrderID, 
          Sum(OrderQty) as TotalQuantity, 
		  Sum(LineTotal) as TotalSales
		  from Sales.SalesOrderDetail
		  group by SalesOrderID
)

Select SalesOrderID,
       TotalQuantity,
	   Format(TotalSales,'C')
       from SalesOrderSummary
   where SalesOrderID=43659
