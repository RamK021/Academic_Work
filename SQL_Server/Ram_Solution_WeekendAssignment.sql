/*
Database Management System - Assignments
Session 1
Assignment 1
There is an Organization (StoreFront) that would like to go online for selling their products. 
We have the following information to build an application that meets the requirements:
➢	Application contains many Products.
➢	Categories will categorised the Products.
➢	Categories can be nested.
➢	A Product can fall into multiple Categories.
➢	A Product can have one or more Images.
➢	User can be a Shopper or Administrator.
➢	Shopper can place an order having one or more products.
➢	Shopper can shop only those products which are in stock.
➢	Shopper can have multiple Shipping Addresses.
➢	Independent items in an Order can be shipped, cancelled or returned.

Database Management System - Assignments
Session 2

1.	Identify the participating entities.
2.	Identify the relations. 
3.	Identify the key attributes. 
4.	Draw the E-R diagram for the problem.
*/


/*
Assignment 1:
Write SQL scripts for the following:
➢	Create all tables of eCommerce Application: StoreFront covered in Session 1 Assignments.
    (Write all CREATE commands in a SQL file and run that SQL File).
➢	Write a command to display all the table names present in StoreFront.
➢	Write a command to remove Product table of the StoreFront database.
➢	Create the Product table again.

*/
create database hpLaptopStore;
use hpLaptopStore
go

create schema hp;
go

create table hp.hpProducts
(
ProdId int not null primary key,
ProdCategoryId int not null,
ProdSubCategoryId int not null,
ProdName nvarchar(50) not null,
ProdPrice money not null,
constraint fk_ProdCatId
foreign key (ProdCategoryId)
references hp.hpProdCategory(ProdCategoryId),
constraint fk_ProdSubCatId
foreign key (ProdSubCategoryId)
references hp.hpProdSubCategory(ProdSubCategoryId)
); 

create table hp.hpProdCategory
(
ProdCategoryId int not null  primary key,
ProdSubCategoryId int not null,
CategoryName nvarchar(50) not null,
constraint fk_ProdCatSubCatId
foreign key (ProdSubCategoryId)
references hp.hpProdSubCategory(ProdSubCategoryId)
);

create table hp.hpProdSubCategory
(
ProdSubCategoryId int not null primary key,
Color nvarchar(20) not null,
Processor nvarchar(20) not null,
[Memory(RAM)] int not null,
OS nvarchar not null
);

select * from hp.hpProdCategory;

select * from hp.hpProdSubCategory;

select * from hp.hpProducts;

select * from hp.hpCustomers;


create table hp.hpInvoice
(
InvoiceId int not null primary key,
CustomerId int not null,
ProdId int not null,
InvoiceDate datetime,
BillingAddress nvarchar(100),
BillingCity nvarchar(50),
BillingState nvarchar(50),
Price money,
constraint fk_InvoiceCustomerId
foreign key (CustomerId)
references hp.hpCustomers(CustomerId),
constraint fk_InvoiceProdId
foreign key (ProdId)
references hp.hpProducts(ProdId)
);

select * from hp.hpInvoice;


/*
Assignment 2:
Write SQL scripts for the following:
➢	Insert sample data in StoreFront tables by using SQL files.
*/

select * from hp.hpInvoice;

/*
➢	Display Id, Title, Category Title, Price of the products which are Active and 
    recently added products should be at top.
*/
select i.ProdId, ProdName, Price, Color, Processor, [Memory(RAM)], OS 
from hp.hpInvoice i
inner join hp.hpProducts p on i.ProdId=p.ProdId
inner join hp.hpProdSubCategory s on p.ProdSubCategoryId=s.ProdSubCategoryId
where datepart(month, InvoiceDate)=8;

/*
➢	Display the list of products which don't have any images.
*/
select ProdId, ProdName from hp.hpProducts 
where ProdId not in (select ProdId from hp.hpInvoice);

/*
➢	Display all Id, Title and Parent Category Title for all the Categories listed,
    sorted by Parent Category Title and then Category Title.
    (If Category is top category then Parent Category Title column should display “Top Category” as value.)
*/
select ProdId, ProdName, CategoryName, 
concat(Color,',', Processor,',', [Memory(RAM)],',', OS) as ProdSubCategory from hp.hpProducts p
inner join hp.hpProdCategory c on p.ProdCategoryId=c.ProdCategoryId
inner join hp.hpProdSubCategory s on s.ProdSubCategoryId=p.ProdSubCategoryId
order by concat(Color,',', Processor,',', [Memory(RAM)],',', OS), CategoryName;

/*
➢	Display Id, Title, Parent Category Title of all the leaf Categories 
    (categories which are not parent of any other category)
*/

/*➢	Display Product Title, Price & Description which falls into particular category Title (i.e. “Mobile”)*/
select ProdName, CategoryName, concat(Color,',',Processor,',',[Memory(RAM)],',',OS) as ProdSubCategory, ProdPrice
from hp.hpProducts p 
inner join hp.hpProdCategory c on p.ProdCategoryId=c.ProdCategoryId
inner join hp.hpProdSubCategory s on p.ProdSubCategoryId=s.ProdSubCategoryId
where c.CategoryName = 'Omen';

/*
➢	Display the list of Products whose Quantity on hand (Inventory) is under 50.
*/
select ProdId, ProdName, ProdPrice from hp.hpProducts
where ProdPrice < 50000;

/*****Assignment 3: Write SQL scripts for the following:****/

/*
➢	Display Recent 50 Orders placed (Id, Order Date, Order Total).
*/
select top (3) ProdId, format(InvoiceDate,'yyyy-MM-dd') as [Date_W/O_Time], Price from hp.hpInvoice
where datepart(month, InvoiceDate) = 8;

/*
➢	Display 10 most expensive Orders.
*/
select top (10) ProdId, ProdName, Price
from(
select distinct p.ProdId, ProdName, Price from hp.hpProducts p
inner join hp.hpInvoice i on p.ProdId=i.ProdId
) as subquery
order by Price desc;

/*
➢	Display all the Orders which are placed more than 10 days old and one or more items
    from those orders are still not shipped.
*/
select CustomerId, ProdId, format(InvoiceDate, 'yyyy-MM-dd') as InvoiceDate,
datediff(day, InvoiceDate,  getdate()) as #OrderDueDay from hp.hpInvoice
where datediff(day, InvoiceDate,  getdate()) > 10;

/*
➢	Display list of shoppers which haven't ordered anything since last month.
*/
select i.CustomerId, FirstName+' '+LastName as CustomerName from hp.hpInvoice i
inner join hp.hpCustomers c on i.CustomerId=c.CustomerId
where datepart(month, InvoiceDate) < 8;

/*
➢	Display list of shopper along with orders placed by them in last 15 days. 
*/
select CustomerId, ProdId, format(InvoiceDate, 'yyyy-MM-dd') as InvoiceDate,
datediff(day, InvoiceDate,  getdate()) as #OrderDueDay from hp.hpInvoice
where datediff(day, InvoiceDate,  getdate()) <= 15;

/*
➢	Display list of order items which are in “shipped” state for particular Order Id (i.e.: 1020))
*/
select CustomerId, ProdId, format(InvoiceDate, 'yyyy-MM-dd') as InvoiceDate from hp.hpInvoice
where CustomerId=1002;

/*
➢	Display list of order items along with order placed date which fall between Rs 20 to Rs 50 price.
*/
select CustomerId, ProdId, format(InvoiceDate, 'yyyy-MM-dd') as InvoiceDate, Price from hp.hpInvoice
where Price between 50000 and 60000 order by Price;

