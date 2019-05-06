--1. inner join: select records that match between two tables
--2. left join: select all recors from the left table
--3. right join: select all records from the right table
select
      [customer name],
	  quantity, 
	  total, 
	  o.orderid
 from 
           customers$ as c right join orders$ as o
		   on c.orderid=o.orderid
--1. from, on, select 