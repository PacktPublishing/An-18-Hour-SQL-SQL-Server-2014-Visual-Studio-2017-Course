use mydbase
go
select name,Title from Table_1
where id=2 or id=3
--1. logical execution of a query
--2. first from grabs the table
--3. where selects the records you want
--4. select grabs the columns
