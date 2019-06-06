-- Exercise #1
SELECT FirstName, LastName, Address, City, ISNULL(Region, '-')
FROM  Employees;

-- Exercise #2
SELECT FirstName, LastName, Address, City, ISNULL(Region, '-')
FROM Employees
WHERE Country = 'USA';

-- Exercise #3
SELECT FirstName, LastName, Address, City, ISNULL(Region, '-')
FROM Employees
WHERE DATEDIFF(year, BirthDate, GETDATE()) > 50


-- Exercise #4
SELECT Employees.FirstName, Employees.LastName, Employees.Address, Employees.City, Employees.Region
FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
WHERE Orders.ShipCountry = 'Belgium';

-- Exercise #5
SELECT Employees.LastName, Customers.ContactName
FROM  Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN Customers
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Shippers
ON Orders.ShipVia = Shippers.ShipperID
WHERE Shippers.CompanyName = 'Speedy Express'
AND Customers.City = 'Bruxelles';


-- Exercise 6
SELECT DISTINCT Employees.Title, Employees.LastName
FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products
ON [Order Details].ProductID = Products.ProductID
WHERE Products.ProductName in ('Gravad Lax', 'Mishi Kobe Niku')

-- Exercise #7
SELECT Employees.Title, Employees.LastName, e.Title, e.LastName
FROM Employees
INNER JOIN Employees AS e
ON Employees.ReportsTo = e.EmployeeID;

-- Exercise #8
SELECT DISTINCT Customers.ContactName, Products.ProductName, Suppliers.ContactName, Suppliers.CompanyName, Customers.City
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products
ON Products.ProductID = [Order Details].ProductID
INNER JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
WHERE Customers.City = 'London'
	AND Suppliers.CompanyName in ('Pavlova, Ltd.', 'Karkki Oy');

-- Exercise #9
SELECT DISTINCT Products.ProductName 
FROM Products
INNER JOIN [Order Details]
ON Products.ProductID = [Order Details].ProductID
INNER JOIN Orders
ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID
WHERE Employees.City = 'London'
	OR Customers.City = 'London';

-- Exercise #10A
SELECT LastName
FROM Employees
WHERE BirthDate < ANY(SELECT BirthDate FROM Employees WHERE City = 'London');

-- Exercise #10B
SELECT LastName
FROM Employees
WHERE BirthDate < ALL(SELECT BirthDate FROM Employees WHERE City = 'London');

-- Exercise #11
SELECT LastName
FROM Employees
WHERE HireDate < ALL(SELECT HireDate FROM Employees WHERE City = 'London');

-- Exercise #12
SELECT LastName, City
FROM Employees
INNER JOIN Orders
ON Employ


SELECT  * FROM  Customers
SELECT * FROM Employees
SELECT * FROM  [Order Details]
SELECT * FROM  Orders
