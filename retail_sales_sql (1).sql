CREATE TABLE retail_sales (
    OrderID          VARCHAR(20),
    OrderDate        DATE,
    Year             INT,
    Month            INT,
    MonthName        VARCHAR(10),
    Quarter          VARCHAR(5),
    Segment          VARCHAR(20),
    Region           VARCHAR(20),
    Category         VARCHAR(30),
    SubCategory      VARCHAR(30),
    ProductName      VARCHAR(100),
    CustomerID       VARCHAR(20),
    Quantity         INT,
    UnitPrice        DECIMAL(10,2),
    Discount_Fixed2  DECIMAL(5,2),
    Revenue          DECIMAL(10,2),
    COGS             DECIMAL(10,2),
    Profit           DECIMAL(10,2),
    ProfitMargin     DECIMAL(5,2),
    Channel          VARCHAR(20),
    PaymentMethod    VARCHAR(20),
    Extra            VARCHAR(10)
);

COPY retail_sales
FROM 'C:/RetailSales_Cleaned.csv'
DELIMITER ','
CSV HEADER;

-- Query 1: Check total rows
SELECT COUNT(*) AS Total_Rows
FROM retail_sales;

-- Query 2: Preview first 5 rows
SELECT *
FROM retail_sales
LIMIT 5;

-- Check all columns loaded correctly
SELECT 
    COUNT(*)                    AS Total_Rows,
    COUNT(DISTINCT OrderID)     AS Unique_Orders,
    COUNT(DISTINCT CustomerID)  AS Unique_Customers,
    COUNT(DISTINCT Category)    AS Categories,
    COUNT(DISTINCT Region)      AS Regions,
    MIN(OrderDate)              AS Earliest_Date,
    MAX(OrderDate)              AS Latest_Date
FROM retail_sales;


--Query 1 — Total Revenue (KPI 1)
SELECT
    ROUND(SUM(Revenue)::NUMERIC, 2)         AS Total_Revenue,
    ROUND(SUM(Profit)::NUMERIC, 2)          AS Total_Profit,
    COUNT(DISTINCT OrderID)                  AS Total_Orders,
    SUM(Quantity)                            AS Total_Units_Sold
FROM retail_sales;


--Query 2: Profit Margin % by Category
select 
      category, 
	  sum(revenue) as total_revenue,
	  sum(profit) as total_profit,
	  sum(profit)/sum(revenue)*100 as profit_margin
from retail_sales
group by category
order by profit_margin asc;

--Query 3 — MoM Revenue Growth
SELECT
    Year,
    Month,
    MonthName,
    ROUND(SUM(Revenue)::NUMERIC, 2) AS Monthly_Revenue,
    LAG(ROUND(SUM(Revenue)::NUMERIC, 2)) OVER (
        ORDER BY Year, Month
    ) AS Prev_Month_Revenue,
    ROUND(
        (SUM(Revenue) - LAG(SUM(Revenue)) OVER (ORDER BY Year, Month))
        / LAG(SUM(Revenue)) OVER (ORDER BY Year, Month) * 100
    ::NUMERIC, 2) AS MoM_Growth_Pct
FROM retail_sales
GROUP BY Year, Month, MonthName
ORDER BY Year, Month;


--Query 4 — AOV
SELECT
    ROUND(SUM(Revenue)::NUMERIC, 2)                           AS Total_Revenue,
    COUNT(DISTINCT OrderID)                                    AS Total_Orders,
    ROUND((SUM(Revenue)/COUNT(DISTINCT OrderID))::NUMERIC, 2) AS AOV
FROM retail_sales;


--— Revenue by Region
SELECT
    Region,
    ROUND(SUM(Revenue)::NUMERIC, 2)  AS Revenue,
    ROUND(SUM(Profit)::NUMERIC, 2)   AS Profit,
    COUNT(DISTINCT OrderID)           AS Orders
FROM retail_sales
WHERE Region != 'UNKNOWN'
GROUP BY Region
ORDER BY Revenue DESC;

--— Top 10 Products
SELECT
    ProductName,
    Category,
    ROUND(SUM(Revenue)::NUMERIC, 2)  AS Revenue,
    ROUND(SUM(Profit)::NUMERIC, 2)   AS Profit,
    SUM(Quantity)                     AS Units_Sold
FROM retail_sales
WHERE ProductName IS NOT NULL
GROUP BY ProductName, Category
ORDER BY Revenue DESC
LIMIT 10;

