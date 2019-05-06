use mydbase
go
create trigger UpdateSalesTable on EmployeesTable after insert
as
   declare @EmpID int=(select max(EmpID) from EmployeesTable)
   declare @Counter int=0
   while @Counter<=10
   begin
        insert into SalesTable(EmpID, DateSold, MonthOnly, Amount)
		       values(@EmpID,
			          GetDate()+@Counter,
					  DateName(MOnth,GetDate()+@Counter),
					  Rand()*10000)
					  set @Counter=@Counter+1
   end
select * from SalesTable
