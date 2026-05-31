USE AdventureWorksDW2025

-- Fact Sales 
SELECT 
	ProductKey,
	OrderDateKey,
	ResellerKey,
	EmployeeKey,
	SalesTerritoryKey,
	SalesOrderNumber,
	OrderQuantity,
	SalesAmount,
	OrderDate
FROM FactResellerSales 
WHERE YEAR(OrderDate) IN (2012,2013);

-- Dim Product
SELECT
	p.ProductKey,
	p.EnglishProductName AS Product_Name,
	s.EnglishProductSubcategoryName AS Product_Subcategory,
	c.EnglishProductCategoryName AS Product_Category
FROM DimProduct p
LEFT JOIN DimProductSubcategory s ON p.ProductSubcategoryKey= s.ProductSubcategoryKey
LEFT JOIN DimProductCategory c ON s.ProductCategoryKey = c.ProductCategoryKey
WHERE p.FinishedGoodsFlag = 1;

-- Dim Date
SELECT 
	DateKey,
	FullDateAlternateKey AS Calendar,
	LEFT(EnglishDayNameOfWeek,3) AS Day_Name,
	DayNumberOfWeek AS Day_Nr,
	LEFT(EnglishMonthName,3) AS Month_Name,
	MonthNumberOfYear AS Month_Nr,
	CalendarQuarter,
	CalendarYear
FROM DimDate
WHERE CalendarYear in (2012 , 2013);

-- Dim Reseller
SELECT 
	r.ResellerKey,
	r.ResellerName,
	r.BusinessType,
	r.ProductLine,
	g.SalesTerritoryKey,
	g.City,
	g.StateProvinceName AS Province,
	g.EnglishCountryRegionName AS Country
FROM DimReseller r
LEFT JOIN DimGeography g ON r.GeographyKey = g.GeographyKey;

-- Dim Employee
SELECT
	e1.EmployeeKey,
	e1.ParentEmployeeKey,
	e1.SalesTerritoryKey,
	CONCAT(e1.FirstName,' ',e1.LastName) AS Employee_Name,
	e1.Title AS Employee_Title,
	CONCAT(e2.FirstName,' ',e2.LastName) AS Manager_Name,
	e2.Title AS Manager_Title,
	e1.DepartmentName,
	e1.HireDate,
	e1.Status
FROM DimEmployee e1
LEFT JOIN DimEmployee e2 
	ON e1.ParentEmployeeKey = e2.EmployeeKey
WHERE e1.SalesPersonFlag = 1
	AND e1.Status = 'Current';

-- Dim SalesTerritory
SELECT
	SalesTerritoryKey,
	SalesTerritoryRegion AS Region,
	SalesTerritoryCountry AS Country,
	SalesTerritoryGroup AS Territory
FROM DimSalesTerritory
WHERE SalesTerritoryAlternateKey <> 0;

-- Dim Sales Quota
SELECT 
	EmployeeKey,
	DateKey,
	SalesAmountQuota
FROM FactSalesQuota
WHERE CalendarYear = 2013;


