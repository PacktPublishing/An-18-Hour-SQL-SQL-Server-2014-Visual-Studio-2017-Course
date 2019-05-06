use AdventureWorks2014
go
--1. using like to pick out certain records
select firstname from Person.Person
where lower(FirstName) like '__a'
group by firstname
--2. '%sar': anything before "sar"
--3. 'sar%': begin with sar, and end with anything 
--4. '%pe%': search for pe inside the first name
--5. '_a%': find names where a is the second letter
--   followed by anything