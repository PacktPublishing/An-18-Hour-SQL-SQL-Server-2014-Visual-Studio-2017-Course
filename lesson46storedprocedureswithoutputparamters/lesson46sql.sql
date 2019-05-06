--1. we had procedures that accepted values through input parameters
--2. we are going instead to return a single value using an output parameter
use AdventureWorks2014
go
drop procedure GetSum
go
create procedure GetSum @total money output
as
   --3. find total of linetotal in the table and set it to the @total parameter
   --4. after that, return that value to the calling code
   set @total=(select sum(LineTotal) from Sales.SalesOrderDetail)
   return @total
go
declare @total money
execute GetSum @total output
Print 'Sum of line total '+Format(@total,'C')