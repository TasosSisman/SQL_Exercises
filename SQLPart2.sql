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
SELECT DISTINCT Employees.Title,Employees.FirstName, Employees.LastName
FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products
ON [Order Details].ProductID = Products.ProductID
WHERE Products.ProductName in ('Gravad Lax', 'Mishi Kobe Niku');

-- Exercise #7
SELECT Employees.Title, Employees.LastName, e.Title, e.LastName
FROM Employees
LEFT JOIN Employees AS e
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
SELECT DISTINCT e.LastName, e.City
FROM Employees AS e
INNER JOIN Orders AS o
ON o.EmployeeID = e.EmployeeID
INNER JOIN Customers AS c ON c.CustomerID = o.CustomerID
WHERE e.City = c.City;

-- Exercise #13
SELECT DISTINCT c.ContactName 
FROM Customers AS c
FULL OUTER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- Second Way
SELECT DISTINCT ContactName
FROM Customers 
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID 
									FROM Orders);

-- Exercise #14
SELECT DISTINCT c.ContactName
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] AS od
ON o.OrderID = od.OrderID
INNER JOIN Products as p
ON od.ProductID = p.ProductID
GROUP BY c.ContactName
HAVING MAX(p.UnitPrice) < 50;

-- Second Way
SELECT ContactName 
FROM Customers
WHERE CustomerID NOT IN
	  (SELECT DISTINCT Customers.CustomerID
	  FROM Customers
	  INNER JOIN Orders
      ON Customers.CustomerID = Orders.CustomerID
      INNER JOIN [Order Details]
	  ON Orders.OrderID = [Order Details].OrderID
	  INNER JOIN Products
	  ON [Order Details].ProductID = Products.ProductID
	  WHERE Products.UnitPrice >= 50)
AND CustomerID IN (SELECT DISTINCT CustomerID FROM Orders)

-- Exercise #15
SELECT p.ProductName
FROM Products AS p
INNER JOIN [Order Details] AS od ON p.ProductID = od.ProductID
INNER JOIN Orders AS o ON  od.OrderID = o.OrderID
GROUP BY p.ProductName
HAVING COUNT(DISTINCT o.EmployeeID) =(SELECT COUNT(*) FROM Employees)


SELECT  * FROM  Customers
SELECT * FROM Employees
SELECT * FROM  [Order Details]
SELECT * FROM  Orders
select * from Suppliers
select * from Products