 
--Query 1 Select all the quantity ordered that is above 10
SELECT *
from [Production].[WorkOrder]
where OrderQty > 10
--Query 2
SELECT ProductID, Name, ListPrice
FROM  Production.Product

--Query 3- Show all the colonialvoice card with the 2007 expiration date.
SELECT CardType, COUNT(*) AS NumberOfCards
FROM [Sales].[CreditCard]
WHERE CardType LIKE '%ColonialVoice%' AND ExpYear = 2007
GROUP BY CardType;

--Query 4 What is the total avergerate for usd to usd currency.
SELECT SUM(AverageRate) AS total_averagerate
FROM [Sales].[CurrencyRate]
WHERE FromCurrencyCode = 'USD' OR ToCurrencyCode = 'USD'

--Query 5 Find the total sales amount for each sales territory.
SELECT st.Name AS TerritoryName, 
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name

--Query 6 Find the average yearly sales for each salesperson.
SELECT s.BusinessEntityID,
    p.FirstName, 
    p.LastName,
    AVG(soh.TotalDue) AS AverageYearlySales
FROM Sales.SalesPerson s
JOIN Person

--Query 7 Find all products that have never been sold.
SELECT 
    p.ProductID, 
    p.Name
FROM Production.Product p
LEFT JOIN 
    Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
WHERE sod.ProductID IS NULL

--Query 8 Get the total quantity of each product sold.
SELECT p.Name, SUM(sod.OrderQty) AS TotalQuantitySold
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
GROUP BY  p.Name

--Query 9 Find all orders with a shipping method of 'CARGO TRANSPORT 5' and 'ZY-EXPRESS'.
SELECT
    soh.SalesOrderID, 
    soh.OrderDate, 
    soh.ShipMethodID
FROM Sales.SalesOrderHeader soh
JOIN Purchasing.ShipMethod sm ON soh.ShipMethodID = sm.ShipMethodID
WHERE sm.Name IN ('CARGO TRANSPORT 5', 'ZY-EXPRESS')

--Query 10 Find the 5 most popular product (the one with the highest number of orders).
SELECT top 5  p.Name, COUNT(sod.SalesOrderID) AS OrderCount
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY OrderCount DESC

--Query 11 List all sales territories along with their country or region
SELECT TerritoryID, Name,  CountryRegionCode
FROM  Sales.SalesTerritory

--Query 12 List all ship methods available in the database
SELECT ShipMethodID,  Name
FROM  Purchasing.ShipMethod

--Query 13 List all products along with their vendors and product categories
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    pv.BusinessEntityID AS VendorID,
    v.Name AS VendorName,
    ps.ProductSubcategoryID,
    ps.Name AS SubcategoryName,
    pc.ProductCategoryID,
    pc.Name AS CategoryName
FROM 
    Production.Product p
JOIN 
    Purchasing.ProductVendor pv ON p.ProductID = pv.ProductID
JOIN 
    Purchasing.Vendor v ON pv.BusinessEntityID = v.BusinessEntityID
JOIN 
    Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN 
    Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
ORDER BY 
    ProductID
--Query 14 Retrieve all product subcategories with their respective product category IDs
SELECT 
    ProductSubcategoryID, 
    Name, 
    ProductCategoryID
FROM 
    Production.ProductSubcategory

--Query 15 List all sales orders along with their order dates and total amounts due
SELECT 
    SalesOrderID, 
    OrderDate, 
    TotalDue
FROM Sales.SalesOrderHeader







