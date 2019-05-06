--1. updating existing records
--2. find it and replace an old value with a new one
--3. and also mark the modification date using the 
--4. GETDATE() function
update Employees
set Salary=85000,
    [Date Modified]=GetDate()
where id=2
select * from Employees
