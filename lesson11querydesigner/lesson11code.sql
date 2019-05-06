--1. In English: Get the first name, title and 
--   salary of people who
--   make between 100,000 and 200,000, and sort 
--   by salary, from highest to lowest
SELECT    Name AS [First Name], 
          Title AS [Employee Title], 
		  [Money Earned] AS Salary
FROM       Table_1
WHERE    ([Money Earned] > 100000) AND ([Money Earned] < 200000)
ORDER BY Salary DESC