use AdventureWorks2014
go
--1. pick out records where blade or bb ball bearing is stored
--2. in the lower case version of the name column
select * from Production.Product
where lower(Name) in ('blade', 'bb ball bearing')

--3. select those colors that are not black or white
--4. select all colors besides black or white
--5. also group by the color and show a count of each color
select Color,count(Color) as Colors from Production.Product
where upper(color) not in ('BLACK','WHITE')
group by color

