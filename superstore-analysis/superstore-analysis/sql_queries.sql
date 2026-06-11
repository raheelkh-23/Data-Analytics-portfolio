-- ============================================
-- SUPERSTORE SALES ANALYSIS - SQL QUERIES
-- ============================================

-- 1. Total Sales by Category with Ranking
SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    COUNT(Order_ID) AS Total_Orders,
    ROUND(AVG(Sales), 2) AS Avg_Sale,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Category_Rank
FROM train
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 2. Top 10 Customers by Total Spending
SELECT TOP 10
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Spent,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM train
GROUP BY Customer_Name
ORDER BY Total_Spent DESC;

-- 3. Sales Performance by Region and Segment
SELECT 
    Region,
    Segment,
    SUM(Sales) AS Total_Sales,
    COUNT(*) AS Order_Count
FROM train
WHERE Region IN ('West', 'East', 'Central', 'South')
GROUP BY Region, Segment
ORDER BY Region, Total_Sales DESC;

-- 4. Monthly Sales Trend (Year over Year)
SELECT 
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    SUM(Sales) AS Monthly_Sales,
    COUNT(*) AS Order_Count
FROM train
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;

-- 5. Customers from Target Region with High Value Orders
SELECT 
    Customer_Name,
    Region,
    SUM(Sales) AS Total_Sales
FROM train
WHERE Region = 'West' AND Sales > 1000
GROUP BY Customer_Name, Region
HAVING SUM(Sales) > 5000
ORDER BY Total_Sales DESC;

-- 6. Sub-Category Performance with CTE
WITH Category_Stats AS (
    SELECT 
        Category,
        Sub_Category,
        SUM(Sales) AS Total_Sales,
        COUNT(*) AS Orders
    FROM train
    GROUP BY Category, Sub_Category
)
SELECT *
FROM Category_Stats
WHERE Total_Sales > 100000
ORDER BY Total_Sales DESC;

-- 7. Running Total of Sales by Month
SELECT 
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    SUM(Sales) AS Monthly_Sales,
    SUM(SUM(Sales)) OVER (ORDER BY YEAR(Order_Date), MONTH(Order_Date)) AS Running_Total
FROM train
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;

-- 8. Outlier Detection (Orders Above 95th Percentile)
WITH Sales_Percentile AS (
    SELECT 
        PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY Sales) OVER () AS Percentile_95
    FROM train
)
SELECT 
    Order_ID,
    Customer_Name,
    Category,
    Sales
FROM train, Sales_Percentile
WHERE Sales > Percentile_95
ORDER BY Sales DESC;
