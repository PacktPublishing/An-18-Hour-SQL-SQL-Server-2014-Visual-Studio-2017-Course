use AdventureWorks2014
go
--1. case/when/then
--2. when SalesYTD<200000, then commission=SalesYTD*.1
--3. when SalesYTD between 200,000 and 1,000,000, then commission=SalesYTD*.2
--4. when SalesYTD >1,000,000, then commission=SalesYTD*.3
select * from Sales.SalesPerson
go
alter procedure Commissions
as 
   select Format(SalesYTD,'C') as SalesYTD,
          "Commission Earned"=
		                      Case
		                         When SalesYTD<200000
							     Then Format(SalesYTD*0.1,'C')
								 When SalesYTD between 200000 and 1000000 
								 Then Format(SalesYTD*0.2,'C')
								 When SalesYTD>1000000
								 Then Format(SalesYTD*0.3,'C')
							  end
    from sales.SalesPerson
Commissions
