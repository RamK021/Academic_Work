CREATE SCHEMA Fact;

CREATE SCHEMA Dimension;

SELECT * FROM sys.schemas;

CREATE TABLE Dimension.Date (
    DateKey int NOT NULL,
    FullDate date NOT NULL,
    DayName nvarchar(9) NOT NULL,
    DayNumber tinyint NOT NULL,
    MonthName varchar(9) NOT NULL,
    MonthNumber tinyint NOT NULL,
    QuarterNumber tinyint NOT NULL,
    Year tinyint NOT NULL

    CONSTRAINT PK_Date PRIMARY KEY CLUSTERED (
        DateKey ASC
    )
);

CREATE TABLE Dimension.Customer (
    CustomerKey int IDENTITY (1,1) NOT NULL,
    CustomerAlternateKey int NOT NULL,
    FirstName nvarchar(50) NOT NULL,
    LastName nvarchar(50) NOT NULL,
    FullName nvarchar(100) NOT NULL,
    City nvarchar(50) NOT NULL,
    State char(2) NOT NULL,
    Statename nvarchar(20) NOT NULL,
    Zip char(5) NOT NULL

    CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (
        CustomerKey ASC
    )
);

CREATE TABLE Fact.Orders (
    OrderID int IDENTITY (1,1) NOT NULL,
    DateKey int NOT NULL,
    CustomerKey int NOT NULL,
    OrderTotal money NOT NULL

    CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED (
        OrderID ASC
    )

);


ALTER TABLE Fact.Orders WITH CHECK ADD CONSTRAINT FK_Fact_Orders_DateKey_Dimension_Date FOREIGN KEY(DateKey)
REFERENCES Dimension.Date (DateKey);


ALTER TABLE Fact.Orders CHECK CONSTRAINT FK_Fact_Orders_DateKey_Dimension_Date;


ALTER TABLE Fact.Orders WITH CHECK ADD CONSTRAINT FK_Fact_Orders_CustomerKey_Dimension_Customer FOREIGN KEY(CustomerKey)
REFERENCES Dimension.Customer (CustomerKey);

ALTER TABLE Fact.Orders CHECK CONSTRAINT FK_Fact_Orders_CustomerKey_Dimension_Customer;


CREATE VIEW dbo.OrdersByDate
    WITH SCHEMABINDING
    AS
        SELECT Orders.OrderID, Orders.CustomerKey, Orders.OrderTotal,
            Date.FullDate, Date.DayName, Date.DayNumber,
            Date.MonthName, Date.MonthNumber, Date.QuarterNumber, Date.Year
        FROM Fact.Orders JOIN Dimension.Date ON Orders.DateKey = Date.DateKey
;

CREATE UNIQUE CLUSTERED INDEX IDX_OrdersByDate
   ON dbo.OrdersByDate (OrderID);

SELECT * FROM dbo.OrdersByDate;