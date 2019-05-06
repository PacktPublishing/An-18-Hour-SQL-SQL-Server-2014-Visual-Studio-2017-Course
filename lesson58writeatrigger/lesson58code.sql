--1. triggers allow taking actions after an update, delete
--or an insert
use mydbase
go
sp_columns 'SalesAmounts'
alter table SalesAmounts
      add ID int primary key identity(1,1)
select * from SalesAmounts
go
if OBJECT_ID('OnDeleteUpdateInsert') is not null
       drop trigger OnDeleteUpdateInsert
go
       create trigger OnDeleteUpdateInsert on SalesAmounts
       after update, delete, insert
       as 
	       if OBJECT_ID('SalesAmountsTemp') is not null
		      drop table SalesAmountsTemp
            select * into SalesAmountsTemp from SalesAmounts

update SalesAmounts 
      set Amount=6787
	  where id=5
     
