--1. using try/catch to create more stable code
--2. never divide by zero because division by zero is not defined
declare @counter decimal=-10
while @counter<=1
     begin try
        select 1.00/@counter
	    set @counter=@counter+1
	 end try
	 begin catch
	   select ERROR_MESSAGE() as 'Error Message'
	   Break--3. helps to pop out of the loop after an error is handled
	 end catch

