use AdventureWorks2014
go
--1. comparing sales from order to order
With SalesSummary (SalesOrderID, TotalSales)
As
(
   --2. sum the line total by the order id
   select SalesOrderID, Sum(LineTotal) as TotalSales
   from Sales.SalesOrderDetail
   group by SalesOrderID 
)
--3. With formatting of NextAmount and Difference
select SalesOrderID ,
       Format(TotalSales,'C') as CurrentAmount,
	   Format((lead(TotalSales) over(order by SalesOrderID)),'C') as NextAmount,
	   Format(TotalSales-(lead(TotalSales) over(order by SalesOrderID)),'C') as Difference
from SalesSummary

--4. without formatting of NextAmount and Difference
--5. code will underline red because only the previous select can work with the CTE
--6. the code below would have to be placed right after the CTE to work
select SalesOrderID ,
       Format(TotalSales,'C') as CurrentAmount,
	   (lead(TotalSales) over(order by SalesOrderID)) as NextAmount,
	   TotalSales-(lead(TotalSales) over(order by SalesOrderID)) as Difference
from SalesSummary

