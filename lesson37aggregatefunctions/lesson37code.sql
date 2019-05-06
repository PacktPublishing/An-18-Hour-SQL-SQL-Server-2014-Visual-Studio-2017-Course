use AdventureWorks2014
go
select * from Sales.SalesOrderDetail
where SalesOrderID=43659

select SalesOrderID as ID,
       max(OrderQty) as MaxQty,
	   min(OrderQty) as MinQty,
	   Format(AVG(UnitPrice),'C','en-gb') as AverageUnitPrice
      from Sales.SalesOrderDetail
group by SalesOrderID
order by avg(UnitPrice) desc