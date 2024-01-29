/***Que 1. Select 2nd Highest salary from the Table.****/
create table Salary(
	ID INT,
	FirstName NVARCHAR(20),
	LastName NVARCHAR(20),
	Gender NVARCHAR(10),
	Salary INT
);

INSERT INTO Salary
(ID, FirstName, LastName, Gender, Salary)
VALUES
(8,'John','Stanmore','Male',80000),
(1,'Ben','Hoskins','Male',70000),
(4,'Ben','Hoskins','Male',70000),
(6,'Mary','Lambeth','Female',30000);

SELECT * FROM Salary;

SELECT MAX(Salary) As [2nd_Max_Salary] FROM Salary
WHERE Salary NOT IN (SELECT MAX(Salary) FROM Salary);


/***Que 3.  Write the Query to get the first 3 Alphabets of Column State.***/
SELECT SUBSTRING(state,1,3) AS [State] FROM Supplier;

/***Que 9. Write a query to extract the year from the current date.***/
SELECT DATEPART(YEAR,GETDATE()) AS [YEAR];

/***Que 8. Write a query to get the current date in the following format.
Input         - 2014-09-04
Output Format - September 4, 2014***/
select convert(varchar(10), getdate(), 107) as [Date];

create table customers(
	FirstName nvarchar(20),
	LastName nvarchar(20),
	Email nvarchar(20),
);

insert into customers
(FirstName, LastName, Email)
values
('Aman','Prajapati','amanK300@gmail.com'),
('Abhishek','Kaushik','abhiK001@gmail.com'),
('Omprakash','Prajapati','om080@outlook.com'),
('Ram','Kumar','ramk021@gmail.com');

/***Que 10. Find the Index of ‘@’ in the Given String.***/
select Email, charindex('@',Email) as Index_value from customers;

/***Que 11. Extract the Domain from the Email Id.***/
select substring(Email,charindex('@',Email),len(Email)) as DomainName from customers;

/***Que 12. 
1.	Count of Employees who have same Domain.
2.	Count of Employee who have same salary.
3.	Count of Employee who have same domain and same salary.
4.	Select Name and Id of Employee who have same domain.***/

/*1.	Count of Employees who have same Domain.*/
select
	substring(Email,charindex('@',Email),len(Email)) as DomainName,
	count(substring(Email,charindex('@',Email),len(Email))) as [Employee_Count]
from customers
group by substring(Email,charindex('@',Email),len(Email));

/*2.	Count of Employee who have same salary.*/
select
	Salary as [Salary],
	count(Salary) as [#Employee]
from customers
group by Salary;

/*3.	Count of Employee who have same domain and same salary.*/
create table Employee(
	EmployeeId int,
	[Name] nvarchar(20),
	Salary int,
	EmailId nvarchar(20),
);
insert into Employee
(EmployeeId,	Name,	Salary,	EmailId)
values
(1,'John',1000,'John@abc.com'),
(2,'Ben',2000,'Ben@xyz.com'),
(3,'Mark',3000,'Mark@abc.com'),
(4,'Steve',2000,'Steve@asd.com'),
(5,'Philip',5000,'Philip@xyz.com'),
(6,'Mary',6000,'Mary@qwe.com');

/***Solve these Following Queries by Using Adventure Works Database***/

/*1.	List of Customer ContactName and number of orders they placed*/
select
	c.FirstName+' '+c.LastName as CustomerName,
	count(i.Productkey) as #OrderPlaced
from 
	DimCustomer as c
inner join
	FactInternetSales as i
on
	c.CustomerKey = i.CustomerKey
group by 
	c.FirstName+' '+c.LastName
order by
	count(i.Productkey) desc

/*2.	List of customer contactnames who have placed more than 3 orders.*/
select
	c.FirstName+' '+c.LastName as CustomerName,
	count(i.Productkey) as #OrderPlaced
from 
	DimCustomer  c
inner join
	FactInternetSales  i
on
	c.CustomerKey = i.CustomerKey
group by 
	c.FirstName+' '+c.LastName
having 
	count(i.Productkey) > 3
order by
	count(i.Productkey)

/*5.	List of Employees id and total sale condcuted by employee*/
select
	e.EmployeeKey,
	count(i.ProductKey) as TotalSalesConduct
from
	DimEmployee e
inner join
	FactInternetSales i
on
	e.SalesTerritoryKey = i.SalesTerritoryKey
group by 
	e.EmployeeKey
order by
	count(i.ProductKey) desc

/*6.	list of employees whose FirstName contains character a.*/
select
	EmployeeKey,
	FirstName
from 
	DimEmployee
where
	FirstName like 'A%'

/*23.	Count of Employees who joined in Same month.*/
select 
	datepart(month, HireDate) as [Month],
	count(EmployeeKey) as #Employees
from
	DimEmployee
group by
	datepart(month, HireDate)

/*24.	Count of Employees who share same month in their Birth Date.*/
select 
	datepart(month, BirthDate) as [Month],
	count(EmployeeKey) as #Employees
from
	DimEmployee
group by
	datepart(month, BirthDate)

/*25.	Count of Employees Gender Wise.*/
select 
	Gender,
	count(EmployeeKey) as #Employees
from
	DimEmployee
group by
	Gender

/*16.	List of top 10 countries by sales*/
select
	top 10
	s.SalesTerritoryCountry as Country,
	sum(i.SalesAmount) as Sales
from 
	DimSalesTerritory s
inner join
	FactInternetSales i
on 
	s.SalesTerritoryKey = i.SalesTerritoryKey
group by
	s.SalesTerritoryCountry
order by
	sum(i.SalesAmount) desc

/*18.	Orderdate of most expensive order*/
select
	top 1
	OrderDate,
	max(TotalProductCost) as Max_Order
from
	FactInternetSales
group by
	OrderDate

/*14.	List of products that were never ordered*/
select EnglishProductName as ProductName from  DimProduct
where ProductKey not in
(select distinct ProductKey from FactInternetSales);

/*12.	List of product Names that were shipped to France*/
select p.EnglishProductName as ProductName, s.SalesTerritoryCountry as Country from DimProduct p
inner join FactInternetSales i on p.ProductKey = i.ProductKey
inner join DimSalesTerritory s on i.SalesTerritoryKey = s.SalesTerritoryKey
where i.SalesTerritoryKey = 7 and i.ProductKey in (select ProductKey from FactInternetSales)

/*22.	What is the total revenue of the company.*/
select sum(TotalProductCost) as TotalRevenue from FactInternetSales;


/*10.	List of orders placed by customers who do not have a Fax number*/

select * from DimCustomer;

