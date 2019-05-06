--1. if/else is used to make decisions
--2. product weights can be set, but not to a negative
--3. digital product, a weight of 0 makes sense
--4. physical product should have a weight
--5. set the weight of a product with a particular id

sp_columns 'Product'--6. run this to look at the structure of a table
go
--7. we're storing information on physical products
alter procedure SetWeight
       @ProductID int,
	   @Weight decimal
as
      if @Weight>0 --8. checks to ensure input is sensible
	     update Production.Product
		        set weight=@Weight
		 where ProductID=@ProductID
	  else --9. runs when user tries calling proc. with a value like -20
	     Print 'Weight Must Exceed 0'
go
--10. line below results in 'Weight Must Exceed 0' because of the if
SetWeight @ProductID=4, @Weight=-10



