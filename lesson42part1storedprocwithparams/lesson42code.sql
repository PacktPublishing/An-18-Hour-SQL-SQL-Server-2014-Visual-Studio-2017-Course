--1. stored procedures that can accept values and use them
--2. a parametrized stored procedure
--3. max quantity, min quantity, sum of the line total
--4. a parameter is a place holder through which a value
--5. can be passed into a stored procedure so that value 
--6. can be used throughout the body of the stored procedure
select * from Sales.SalesOrderDetail
go
drop procedure GetOrderSummary

create procedure GetOrderSummary
       @SalesOrderID int 
as 
   select SalesOrderID,
          Max(OrderQty) as Maximum, 
		  Min(OrderQty) as Minimum,
		  Format(Sum(LineTotal),'C','en-us') as Total
		  from Sales.SalesOrderDetail
	where SalesOrderID=@SalesOrderID
	group by SalesOrderID

GetOrderSummary @SalesOrderID=43659

select * from sales.SalesOrderDetail
where salesorderid=43659



