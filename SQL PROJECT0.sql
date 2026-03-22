
--SELECT 'Dim_Customers' as Tablo_Adi, COUNT(*) as Hata_Sayisi 
--FROM Dim_Customers 
--WHERE Customer_ID IS NULL

--UNION ALL
--SELECT 'Dim_Products', COUNT(*) 
--FROM Dim_Products 
--WHERE Product_ID IS NULL

--UNION ALL

--SELECT 'Dim_Location', COUNT(*) 
--FROM Dim_Location 
--WHERE Postal_Code IS NULL

--UNION ALL
--SELECT 'Fact_Orders', COUNT(*) 
--FROM Fact_Orders 
--WHERE Customer_ID IS NULL

--SELECT 
--*,count(*) from Dim_customers
--group by CUSTOMER_ID,CUSTOMER_NAME,SEGMENT
--having count(*)>1
 
--SELECT POSTAL_CODE,COUNTRY,City,STATE,region,COUNT(*)
--FROM dim_location
--GROUP BY POSTAL_CODE,COUNTRY,city,STATE,Region
--having count(*)>1

--SELECT * , COUNT(*)
--FROM Dim_Products
--Group By Product_ID,Product_Name,Category,Sub_Category
--Having Count(*)>1

--SELECT*,COUNT(*)
--FROM FACT_Orders	
--Group BY Row_ID,Order_Id,Order_Date,Ship_Date,Ship_Mode,Customer_ID,Product_ID,Postal_Code,Sales,Quantity,Discount,Profit
--Having Count(*)>1

