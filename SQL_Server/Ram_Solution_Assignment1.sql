/* Que 1. Create a Database with Name “Test” */
CREATE DATABASE Test;

/* Que 2. Create a Schema under the Database Test with Name “TestSchema” */
CREATE SCHEMA TestSchema;

/* Que 3. Create a Table with Name “Students” in “Test” Database with scheme “TestSchema”. Table will 
should have following columns – StudentId, Name, DOB, AdmissionDate. */
CREATE TABLE TestSchema.Students
(
	StudentId INT,
	Name NVARCHAR(100),
	DOB DATE,
	AdmissionDate DATE
)

/*
Que 4. 
1. Create Table Employee Containing Columns EmployeeId, Name, Salary, ManagerId, JobRole and 
   insert the data.
2. Add Columns in Employee Table Mail_id and Grade and insert the data for two newly added 
   columns.
3. Truncate the Employee Table.
4. Delete a specific record from a table.
5. DROP the Employee Table.
*/
CREATE TABLE TestSchema.Employee
(
	EmployeeId INT,
	Name NVARCHAR(100),
	Salary INT,
	ManagerId INT,
	JobRole NVARCHAR(100)
)

INSERT INTO TestSchema.Employee VALUES(1, 'Tim David', 20000, 10, 'Data Engineer'),(2, 'Chris Woaks', 15000, 20, 'HR');

SELECT * FROM TestSchema.Employee;

ALTER TABLE TestSchema.Employee ADD MailId NVARCHAR(100), GRADE CHAR(10);

UPDATE TestSchema.Employee SET MailId = 'timDavid123@gmail.com', GRADE = 'A' WHERE EmployeeId=1;
UPDATE TestSchema.Employee SET MailId = 'chris001@gmail.com', GRADE = 'B' WHERE EmployeeId=2;

DELETE FROM TestSchema.Employee WHERE EmployeeId = 2;

TRUNCATE TABLE TestSchema.Employee;

DROP TABLE TestSchema.Employee;

/* Que 5. Write an Update statement change the Supplier_name to google for id 600,700 and 800 */
ALTER SCHEMA TestSchema TRANSFER dbo.Suppliers;

SELECT * FROM TestSchema.Suppliers;

UPDATE TestSchema.Suppliers SET supplier_name = 'Google' where supplier_id in (600, 700, 800);

/* Que 6. Write a query that prints a list of employee names (i.e.: the name attribute) for employees 
in Employee having a salary greater than $200 per month who have been employees for less than 10 
months. Sort your result by ascending employee_id.
*/
ALTER SCHEMA TestSchema TRANSFER dbo.Employee;

SELECT * FROM TestSchema.Employee;

SELECT name FROM
(
	SELECT name, (salary/months) AS 'SalaryPerMonth', months
	FROM TestSchema.Employee
)AS SUBQUERY
WHERE (SalaryPerMonth > 200) and (months < 10);

/*Solve these Following Queries by Using Adventure Works Database*/

/* 1. List of all customers */
SELECT * FROM DimCustomer;

SELECT FirstName+' '+LastName AS Customers FROM DimCustomer;

/* 2. list of all customers where customer name ending in N */
SELECT FirstName+' '+LastName AS Customers 
FROM DimCustomer
WHERE FirstName+' '+LastName LIKE '%n';

/* 3. list of all customers who live in Berlin or London */
SELECT FirstName+' '+LastName AS FullName, City FROM DimCustomer c, DimGeography g
WHERE c.GeographyKey = g.GeographyKey AND City IN ('London', 'Berlin');

/* 4. list of all customers who live in UK or USA */
SELECT FirstName+' '+LastName AS FullName, EnglishCountryRegionName FROM DimCustomer c, DimGeography g
WHERE c.GeographyKey = g.GeographyKey AND EnglishCountryRegionName IN ('United Kingdom', 'United States');

/* 5. list of all products sorted by product name */
SELECT ProductKey, EnglishProductName FROM DimProduct ORDER BY EnglishProductName;

/* 6. list of all products where product name starts with an A */
SELECT EnglishProductName FROM DimProduct 
WHERE EnglishProductName LIKE 'A%'
ORDER BY EnglishProductName;

/* 7. List of customers who ever placed an order */
SELECT FirstName+' '+LastName AS FullName FROM DimCustomer c
WHERE c.CustomerKey IN 
(
	SELECT DISTINCT CustomerKey FROM FactInternetSales
);

/* 8. list of Customers who live in London and have bought "Classic Vest, S" */
SELECT FullName FROM DimGeography g, 
(
	SELECT FirstName+' '+LastName AS FullName, GeographyKey FROM DimCustomer c, 
	(
		SELECT CustomerKey FROM FactInternetSales
		WHERE ProductKey=471
	) i
	WHERE c.CustomerKey = i.CustomerKey
) c
WHERE g.GeographyKey = c.GeographyKey AND City='London';

/* 9. List of customers who never place an order */
SELECT FirstName+' '+LastName AS Customers FROM DimCustomer c
WHERE c.CustomerKey NOT IN 
(
	SELECT DISTINCT CustomerKey FROM FactInternetSales
);

/* 10. List of customers who ordered "Touring Tire" (541) */
SELECT FirstName+' '+LastName AS FullName FROM DimCustomer c,
(
	SELECT CustomerKey FROM FactInternetSales
	WHERE ProductKey = 541
) i
WHERE c.CustomerKey = i.CustomerKey;

/* 11. Details of first order of the system */
SELECT TOP(1)* FROM FactInternetSales
ORDER BY SalesOrderNumber ASC;

/* 12. Find the details of most expensive order date */
SELECT TOP(1)* FROM FactInternetSales
ORDER BY SalesAmount DESC;

/* 13. For each order get the OrderID and Average quantity of items in that order */
SELECT SalesOrderNumber, AVG(OrderQuantity) AS AvgQunatity FROM FactInternetSales
GROUP BY SalesOrderNumber;

/* 14. For each order get the orderID, minimum quantity and maximum quantity for that order */
SELECT SalesOrderNumber, MIN(OrderQuantity) AS MinQty, MAX(OrderQuantity) AS MaxQty FROM FactInternetSales
GROUP BY SalesOrderNumber;

/* 15. Get a list of all managers and total number of employees who report to them. */
SELECT e1.FirstName+' '+e1.LastName AS EmployeeName, e2.#EmployeeReportsIt FROM DimEmployee e1,
(
	SELECT ParentEmployeeKey , COUNT(EmployeeKey) AS #EmployeeReportsIt FROM DimEmployee
	GROUP BY ParentEmployeeKey
) e2
WHERE e1.EmployeeKey = e2.ParentEmployeeKey;

/* by Right Join  */
SELECT e1.FirstName+' '+e1.LastName AS EmployeeName, e2.#EmployeeReportsIt FROM DimEmployee e1
RIGHT JOIN
(
	SELECT ParentEmployeeKey , COUNT(EmployeeKey) AS #EmployeeReportsIt FROM DimEmployee
	GROUP BY ParentEmployeeKey
) e2
ON e1.EmployeeKey = e2.ParentEmployeeKey;

/* 16. Get the OrderID and the total quantity for each order that has a total quantity of greater than 
300 */
SELECT ProductKey, COUNT(ProductKey) AS TotalQty FROM FactInternetSales
GROUP BY ProductKey
HAVING COUNT(ProductKey) >= 300
ORDER BY ProductKey;

/* 17. list of all orders placed on or after 1996/12/31 */
SELECT SalesOrderNumber FROM FactInternetSales 
WHERE OrderDate >= '2013-12-12';

/* 18. list of all orders shipped to Canada */
SELECT i.SalesOrderNumber FROM FactInternetSales i, DimSalesTerritory t
WHERE i.SalesTerritoryKey = t.SalesTerritoryKey and SalesTerritoryRegion = 'Canada';

/* 19. list of all orders with order total > 200 */
SELECT ProductKey, COUNT(ProductKey) AS TotalQty FROM FactInternetSales
GROUP BY ProductKey
HAVING COUNT(ProductKey) >= 200
ORDER BY ProductKey;

/* 20. List of countries and sales made in each country */
SELECT  DISTINCT t.SalesTerritoryRegion FROM FactInternetSales i, DimSalesTerritory t
WHERE i.SalesTerritoryKey = t.SalesTerritoryKey;


