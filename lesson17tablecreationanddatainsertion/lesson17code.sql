--1. creating a table to represent Employees
create table Employees3
(
  ID int primary key identity(1,1) not null,
  Name nvarchar(50) not null,
  [Date Started] date not null,
  Money money not null
)
insert into Employees
values('John Smith','10/12/2017',25000),
      ('Jose Felicias', Getdate(),'35000')

select * from Employees
drop table Employees