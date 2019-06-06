-- Exercise #1
select CategoryName, Description from Categories;

-- Exercise #2
select ContactName, CustomerID, CompanyName from Customers where (City = 'London');

-- Exercise #3
select * from Suppliers where Fax is not null;

-- Exercise #4
select CustomerID from Orders where OrderDate between '1997-1-1' and '1998-1-1' and Freight < 100;

-- Exercise #5
select CompanyName, ContactName from Customers where Country in ('Mexico', 'Sweden', 'Germany');

-- Exercise #6
select count(*) from Products where Discontinued = 1;

-- Exercise #7
select CategoryName, Description from Categories where CategoryName like ('Co%');

-- Exercise #8
select CompanyName, City, Country, PostalCode 
from Suppliers 
where Address like('%rue%')
order by CompanyName desc;

-- Exercise #9
select ProductID, sum(Quantity) as Quantity from [Order Details] group by ProductID;

-- Exercise #10
select DISTINCT ContactName, Address from Customers where CustomerID in
	(select CustomerID from Orders where ShipVia in
		(select ShipVia from Shippers where CompanyName = 'Speedy Express'));

SELECT DISTINCT Customers.ContactName, Customers.Address
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Shippers
ON Orders.ShipVia = Shippers.ShipperID
WHERE Shippers.CompanyName = 'Speedy Express';

-- Exercise #11
select * from Suppliers
where CompanyName is not null and 
	  ContactName is not null and
	  ContactTitle is not null and
	  Region is not null;

-- Exercise #12

-- First Way
select ProductName from Products where CategoryID in
	(select CategoryID from Categories where CategoryName = 'Condiments');

-- Second Way
SELECT Products.ProductName
FROM Products
INNER JOIN Categories
ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Condiments';

-- Exercise #13
select ContactName from Customers where CustomerID not in
	(select distinct CustomerID from Orders);

-- Exercise #14
select * from Shippers;
insert into Shippers(CompanyName) Values ('Amazon');
Insert into Shippers(CompanyName, Phone)
values ('ELTA', '210232325');

UPDATE Shippers
SET Phone = '21034353'
WHERE CompanyName = 'Amazon';

DELETE FROM Shippers
WHERE CompanyName = 'ELTA';

-- Exercise #15
UPDATE Shippers
SET CompanyName = 'Amazon Prime Shipping'
WHERE CompanyName = 'Amazon';

SELECT Orders.OrderID, Shippers.CompanyName, Shippers.Phone
FROM Orders
INNER JOIN Shippers
ON Orders.ShipVia = Shippers.ShipperID;

SELECT	Categories.CategoryName, AVG(Products.UnitPrice) as [Average Price]
FROM Products
INNER JOIN Categories
ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName;

