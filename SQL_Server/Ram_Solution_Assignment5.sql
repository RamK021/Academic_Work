/*
DAY 5 Assignment Questions
Practical Question

Que 1. Find the names of students who got GPA above the average GPA of all students (Use Having clause)
*/
create table StudInfo(
StudId int not null primary key,
StudName nvarchar(50) not null,
GPA float,
Branch nvarchar(10),
Section nvarchar(1),
);
select StudId, StudName, gpa from StudInfo
where gpa > (select avg(gpa) from StudInfo);


/*Que 2. - Count Section wise Students*/
select Section, count(StudId) from StudInfo
group by Section;

/*Que 3. Create a Clustered Index on Table Employee on Id Column.
This table have other columns such as Name, DOB, Salary.*/

create clustered index ixEmployee_Id
on Employee(employeeId);

select * from Employee;

/*Que 4. Create a Non-Clustered Index on Employee Table for Columns Salary in ascending and Gender Descending.
This table have columns such as- EmployeeId, Name, DOB, Salary, Gender.*/


create nonclustered index ixEmployee_Gender
on Employee(gender desc);

select * from Employee;

/*
Database Management System – Assignments Session 2
Assignment 1:
With respect to StoreFront application identify,
apply and list the constraints you would apply on the columns for the tables created.
*/

alter table hp.hpInvoice add constraint Check_Price check(Price > 0);

alter table hp.hpCustomers add constraint Unique_CustName unique(FirstName, LastName)

/*
Assignment 2:
Write SQL scripts for the following:
*/
create table A(
aid int,
bid int,
cid int,
);
create table B(
bid int
)
create table C(
cid int
)

select a.aid, b.bid, c.cid from A a
left join B b on a.bid=b.bid
inner join C c on a.cid=c.cid

/*➢	Display the list of products (Id, Title, Count of Categories) which fall in more than one Category.*/
select CategoryName, string_agg(ProdName, '/ ') as ProductList from hp.hpProducts p
inner join hp.hpProdCategory c on p.ProdCategoryId=c.ProdCategoryId
group by CategoryName;

/*➢	Display the Categories along with number of products under each category.*/
select CategoryName, count(ProdId) as #Products from hp.hpProducts p
inner join hp.hpProdCategory c on p.ProdCategoryId=c.ProdCategoryId
group by CategoryName;

/*
➢	Display Count of products as per below price range:

Range in Rs.	Count
0 - 100	
101 - 500	
Above 500
*/
select 
case
	when ProdPrice between 0 and 35000 then '0-35000'
	when ProdPrice between 35001 and 70000 then '35001-70000'
	else '70000 above'
end as Range,
count(*) as [count] from hp.hpProducts
group by
case
	when ProdPrice between 0 and 35000 then '0-35000'
	when ProdPrice between 35001 and 70000 then '35001-70000'
	else '70000 above'
end
order by Range;

/*Assignment 3:
Write SQL scripts for the following:
*/

/*
➢	Display Shopper’s information along with number of orders he/she placed during last 30 days.
*/
select distinct c.CustomerId, FirstName+' '+LastName as CustomerName, count(i.InvoiceDate) as #Orders
from hp.hpCustomers c inner join hp.hpInvoice i on c.CustomerId=i.CustomerId
where datediff(day, InvoiceDate, getdate()) <= 30
group by c.CustomerId, FirstName+' '+LastName;

/*➢	Display the top 10 Shoppers who generated maximum number of revenue in last 30 days.*/
select top (5) c.CustomerId, FirstName+' '+LastName as CustomerName, Price
from hp.hpCustomers c inner join hp.hpInvoice i on c.CustomerId=i.CustomerId
where datediff(day, InvoiceDate, getdate()) <= 30
order by Price desc;

/*➢	Display top 20 Products which are ordered most in last 60 days along with numbers.*/
select p.ProdId, ProdName, count(i.ProdId) as #Products from hp.hpProducts p inner join hp.hpInvoice i
on p.ProdId=i.ProdId 
where datediff(day, InvoiceDate, getdate()) <=30
group by p.ProdId, ProdName

/*➢	Display Monthly sales revenue of the StoreFront for last 6 months. It should display each month’s sale.*/
select datepart(month, InvoiceDate) as 'MonthName', sum(Price) as TotalRevenue from hp.hpInvoice
group by datepart(month, InvoiceDate);

/*
➢	Mark the products as Inactive which are not ordered in last 90 days.
*/

select p.ProdId, ProdName from hp.hpProducts p
inner join hp.hpInvoice i on p.ProdId=i.ProdId
where datediff(day, InvoiceDate, getdate()) <= 30 or not exists 
(select ProdId from hp.hpInvoice)

/*➢	Given a category search keyword, display all the Products present in this category/categories. */
select c.CategoryName, string_agg(ProdName, '/ ') as 'ProductsList' from hp.hpProducts p
inner join hp.hpProdCategory c on p.ProdCategoryId=c.ProdCategoryId
group by c.CategoryName;

/*➢	Display top 10 Items which were cancelled most.*/
select i.ProdId, ProdName from hp.hpProducts p
inner join hp.hpInvoice i on p.ProdId=i.ProdId
where datepart(month, InvoiceDate) = 8

/*
Assignment 4:
Consider a form where providing a Zip Code populates associated City and
State. 
➢	Create appropriate tables and relationships for the same and write a SQL
         query for that returns a Resultset containing Zip Code, City Names and
         States ordered by State Name and City Name.
(Create 3 tables to store State, District/City & Zip code separately)
*/

create table [State]
(
StateId int primary key,
CapitalId int,
ZipId int,
StateName nvarchar(20) not null
constraint fk_StateCapitalId
foreign key (CapitalId)
references Capital(CapitalId),
constraint fk_StateZipId
foreign key (ZipId)
references ZipCode(ZipId)
);

create table Capital
(
CapitalId int primary key,
CapitalName nvarchar(20),
);

create table ZipCode
(
ZipId int primary key,
ZipNumber nvarchar(10),
);

select StateName, CapitalName, ZipNumber from [State] s
inner join Capital c on s.CapitalId=c.CapitalId
inner join ZipCode z on z.ZipId=s.ZipId


/*
Assignment 5:
*/

/*
➢	Create a view displaying the order information (Id, Title, Price, Shopper’s name, Email, Orderdate, Status)
    with latest ordered items should be displayed first for last 60 days.
*/
alter view view_hpInvoice
as 
select i.CustomerId, FirstName+' '+LastName as CustomerName,ProdId, InvoiceId, InvoiceDate, BillingAddress, BillingCity
BillingState, Price from hp.hpCustomers c
inner join hp.hpInvoice i on c.CustomerId=i.CustomerId
where datediff(day, InvoiceDate, getdate()) <=30;

select * from view_hpInvoice;

/*➢	Use the above view to display the Products(Items) which are in ‘shipped’ state.*/
select v.CustomerId, v.ProdId, ProdName from hp.hpProducts  p
inner join view_hpInvoice v on p.ProdId=v.ProdId;

/*➢	Use the above view to display the top 5 most selling products.*/
select v.ProdId, ProdName, v.Price from hp.hpProducts p
inner join view_hpInvoice v on p.ProdId=v.ProdId
order by Price desc;

