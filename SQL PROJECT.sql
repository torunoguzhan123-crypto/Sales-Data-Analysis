--Top 10 States by Order Volume and Revenue
SELECT 
Top 10
STATE,count(distinct Fact_Orders.Postal_Code)as Total_Unique_Locations ,
SUM(Fact_Orders.Sales) as Total_Revenue
FROM Dim_Location 
Inner Join Fact_Orders on Dim_Location.Postal_Code=Fact_Orders.Postal_Code
Group by state
Order By  Total_Unique_Locations desc 

--ANNUAL BUSINESS PERFORMANCE SUMMARY
Select 
(year(Order_Date)) as Order_Year,
count(DISTINCT Order_ID) as Total_Orders, 
sum(F.Sales) Total_Revenue
FROM 
Fact_Orders F
Group By year(Order_Date)
Order By year(Order_Date)

--YEARLY PROFITABILITY BY SUB-CATEGORY
SELECT
YEAR(ORDER_DATE) as Order_Year,
P.Sub_Category as Sub_Category,
SUM(F.Profit) Total_Profit
FROM
Fact_Orders F 
INNER JOIN Dim_Products P on P.Product_ID=F.Product_ID
Group BY P.Sub_Category,YEAR(ORDER_DATE)
Order BY Order_Year,Total_Profit Desc 

--SEGMENT-BASED PROFITABILITY ANALYSIS
SELECT 
Segment,
Sum(O.Profit)as Total_Profit
From Dim_Customers C
INNER JOIN  Fact_Orders O on C.Customer_ID=O.CUstomer_ID
Group by Segment
Order BY Total_Profit

--SHIPPING DURATION VS. AVERAGE PROFITABILITY
SELECT 
DATEDIFF(DAY,Order_Date,Ship_Date) AS SHIPPING_DURATION,
ROUND(AVG(F.Profit),2) Average_Profit
FROM
Fact_Orders F
JOIN Dim_Products P ON F.PRODUCT_ID=P.Product_ID
GROUP BY DATEDIFF(DAY,Order_Date,Ship_Date)
ORDER BY Average_Profit DESC 

--REGIONAL PROFIT CONTRIBUTION ANALYSIS
SELECT 
Region,
round(sum(Profit)*100 / (Select sum(Profit) from Fact_Orders),2) as Profit_Percentage
FROM
Dim_Location L
INNER JOIN Fact_Orders O on O.Postal_Code=L.Postal_Code
Group BY Region 

--Q1 PERFORMANCE COMPARISON (2016 VS. 2017)
SELECT 
Year(Order_Date) as Order_Year,
Sum(Profit) Total_Profit,
Count(Order_Id) Order_Count
FROM
Fact_Orders
Where Month(Order_Date) in (01,02,03) and
 Year(Order_Date) in (2016,2017)
Group By Year(Order_Date)
Order By(Order_Year)