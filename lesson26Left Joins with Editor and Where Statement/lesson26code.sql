use AdventureWorks2014
go
--1. inner join: 121317 records 
--2. left join: 121555 records
SELECT    Production.Product.ProductID, 
          Production.Product.Name AS [Product Name], 
		  Production.Product.Size, 
		  Production.Product.Weight, 
		  Sales.SalesOrderDetail.UnitPrice, 
		  Sales.SalesOrderDetail.OrderQty
FROM       Production.Product INNER JOIN
           Sales.SalesOrderDetail 
		   ON 
	    Production.Product.ProductID = Sales.SalesOrderDetail.ProductID
ORDER BY Sales.SalesOrderDetail.UnitPrice DESC

select * from Production.Product

select * from Sales.SalesOrderDetail
order by productid desc

