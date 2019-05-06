--1. a transaction is a unit of work
--2. transactions help to ensure database consistency 
--3. prevent existence of partial/inconsistent data
use mydbase
go
drop table temp
create table temp (id int, value float)
declare @InsertTransact varchar='Insert Transaction'
declare @counter int=1
while @counter<=100
    begin
       begin transaction @InsertTransact
	      insert into temp values (@counter, Rand()*1000) 
		  select @@TRANCOUNT as 'Transaction Count'
	   commit transaction
	   set @counter=@counter+1   
    end
go
select * from temp
select @@TRANCOUNT as transactioncount

      