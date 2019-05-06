--1. pivoting tables 
--2. taking a column and turning it into a row
--3. 1 
--4. 2
--5. 3
--6. 1 2 3
use AdventureWorks2014
go
select 'TitleCount' as 'Title Count', [Mr.],[Ms.]
from 
         (select Title from Person.Person) as SourceTable
                                     Pivot 
									 (
									    Count(Title) for Title in ([Mr.],[Ms.])
									 ) As PivotTable