## Kultra Mega Stores Analysis
### Table of Content
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools](#tools)
- [Sql Analysis](#sql-analysis)

#### Project Overview:
 Kultra Mega Stores (KMS) is a Lagos-based retail company specializing in office supplies and furniture. With a diverse customer base that includes individual consumers, small retail businesses, and large corporate clients, KMS operates in a dynamic market that demands efficient inventory control, pricing strategy, and customer satisfaction.
This SQL project models the inventory management system of KMS, focusing on how structured data can support operational efficiency and strategic decision-making. The database tracks products, categories, suppliers, stock levels, pricing, discounts, and customer reviews all essential components for managing a modern retail operation.

#### Data Sources
The primary dataset used in this analysis is a CSV file titled **KMS SQL Case Study.csv.**

It includes key fields such as:
-	Product and category information
-	Sales performance metrics
-	Review counts and ratings
-	Inventory levels

#### Tools
-	SQL (SQLServer) For Analysis

### Sql Analysis 
 Q1 Which Product Category with the highest sales
``` Sql
SELECT TOP 1 
    Product_Category,  
    SUM(Sales) AS Total_Sales  
FROM  
    Kms_Data  
GROUP BY  
    Product_Category  
ORDER BY  
    Total_Sales DESC;                  
```
Q2 what are the Top 3 region in terms of sales?
```Sql
SELECT TOP 
	3 Region, SUM(Sales) AS Total_Sales
FROM  Kms_Data
GROUP BY Region
ORDER BY 
    Total_Sales DESC;
```
```Sql
Q2b what are the Bottom 3 Region
SELECT top  3 Region, SUM(Sales) AS Total_Sales
FROM Kms_Data
GROUP BY Region
ORDER BY 
    Total_Sales ASC;
```
 Q3 What were the total sales of appliances in ontairo?
```Sql
SELECT Region, SUM(Sales) AS Total_Appliance_Sales_Ontario
FROM 
   Kms_Data
WHERE 
    Product_Sub_Category = 'Appliances'
    AND Province = 'Ontario'
Group by Region;
```
Q4 Advise the management of kms what to do to increase the revenue from bottom 10 customers..
identify the bottom 10 customer's revenue
```Sql
SELECT TOP 10
    Product_category,Customer_Name,
    SUM(Sales) AS Total_Sales
FROM 
    Kms_Data
GROUP BY 
    Product_category, Customer_Name
ORDER BY 
    Total_Sales ASC;
```
### Recommendation

hbuigUSGNJXIU;Chuhnnjnvtdaa;IO;YFOIQ






Q5 the company incurred the most shipping cost using which shipping method
```Sql
SELECT 
    Ship_Mode,
    SUM([Shipping_Cost]) AS Total_Shipping_Cost
FROM 
    Kms_Data
GROUP BY 
    Ship_Mode
ORDER BY 
    Total_Shipping_Cost DESC;
```

Q6 Who are the most valuable customers and what product or service do they typically purchase?
```Sql
SELECT 
    Customer_Name,
    Product_Category,
    COUNT(*) AS Purchase_Count,
    SUM(Sales) AS Total_Spent
FROM 
    Kms_Data
WHERE 
    [Customer_Name] IN (
        SELECT TOP 2 Customer_Name
        FROM Kms_Data
        GROUP BY Customer_Name
        ORDER BY SUM(Sales) DESC
    )
	GROUP BY 
    Customer_Name, Product_Category
ORDER BY 
  Customer_Name, Total_Spent DESC;
```
Q7 which small business customer had the highest sales?
```Sql
SELECT TOP 1
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM 
    Kms_Data
WHERE 
    Customer_Segment = 'Small Business'
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Sales DESC
```

Q8 Which corporate customer placed the most number of orders in 2019-2012?
```Sql
SELECT TOP 1
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM 
    Kms_Data
WHERE 
    Customer_Segment = 'Corporate'
    AND Order_Date BETWEEN '2009-01-01' AND '2012-12-31'
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Orders DESC;
```
Q9 Which consumer customer was the most profitable one?
```Sql
SELECT TOP 1
    Customer_Name,
    SUM(Profit) AS Total_Profit
FROM 
    Kms_Data
WHERE 
    Customer_Segment = 'Consumer'
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Profit DESC;
```
Q10 Which customer returend items, and what segment do they belong?
```Sql
SELECT  * from dbo.Kms_Data
select * from dbo.Order_Status

SELECT 
    k.customer_name,
    k.Customer_Segment,
    k.order_id,
    o.status
FROM 
    kms_data k
JOIN 
    order_status o ON k.order_id = o.order_id
WHERE 
    o.status = 'Returned'
```

Q 11 company appropriately spent shipping cost based on the Order Priority?
```Sql
SELECT 
    Order_Priority,
    Ship_Mode,
    COUNT(*) AS Order_Count,
    AVG(Shipping_Cost) AS Avg_Shipping_Cost
FROM 
    Kms_Data
GROUP BY 
    Order_Priority, Ship_Mode
ORDER BY 
    Order_Priority, Ship_Mode Desc;
```





