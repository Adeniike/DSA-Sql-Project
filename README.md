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
Result:
| Product_Category | Total_Sales |
| ---------------- | ----------- | 
| Technology | 5984248.409

Insight:

Technology emerges as the top-selling product category, driving significant revenue for the business. This suggests a strong demand for tech-related products, potentially due to their innovative features, functionality, or relevance to customers' daily lives.


Q2 what are the Top 3 region in terms of sales?
```Sql
SELECT TOP 
	3 Region, SUM(Sales) AS Total_Sales
FROM  Kms_Data
GROUP BY Region
ORDER BY 
    Total_Sales DESC;
```
Result:
|Region| Total_sales|
|-|-|
|West|	3597549.329|
|Ontario|3063212.527
|Prarie|2837304.650|

Insight:

The Western region leads in overall sales performance, emerging as the top contributor to revenue. The Ontario and Prairie regions also demonstrate strong market presence, closely trailing the West in sales volume—highlighting robust demand across these key territories.

```Sql
Q2b what are the Bottom 3 Region
SELECT top  3 Region, SUM(Sales) AS Total_Sales
FROM Kms_Data
GROUP BY Region
ORDER BY 
    Total_Sales ASC;
```
Result:
| Region| Total_sales|
|-|-|
|Nunavut|116376.486|
|Northwest Territories|800847.341|
|Yukon|975867.383|

Insight/Recomendation

These regions currently exhibit lower sales performance relative to others. To enhance market penetration and drive growth, KMS Management  should consider the following strategic actions:
- 🔍 Assess local market dynamics to identify barriers and untapped opportunities
- 🎯 Implement targeted marketing campaigns tailored to regional preferences and needs
- 🤝 Explore partnerships or collaborations with local distributors or influencers to strengthen presence and accessibility

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
Bottom 10 customer's revenue
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
Result:

|Product_Category|Customers_Namme|Total_sales|
|-|-|-|
|Furniture|Anne McFarland|11.700|
|Office Supplies|Tiffany House|17.060|
|Furniture|Toby Carlisle|17.300|
|Office Supplies|Victor Price|22.130|
|Furniture|Emily Burns|	22.740|
|Technology|Bradley Talbott|24.960|
|Furniture	|Henry MacAllister|	25.520|
|Technology	|Amy Cox	|25.960
|Office Supplies|Deirdre Greer|26.530|
|Office Supplies|Chris McAfee|28.550


#### Insight and strategic guidance to KMS Leadership
 Bottom 10 Customers by Revenue
This query reveals the customers who have contributed the least to KMS’s revenue across different product categories. These accounts represent untapped or underperforming opportunities.

To improve revenue from these low-performing customers, KMS should consider the following strategies:
- Customer Needs Assessment
Conduct direct outreach or surveys to understand why these customers are spending less. Are they price-sensitive, unaware of certain products, or facing service issues?
-  Personalized Promotions
Offer tailored discounts, product bundles, or loyalty incentives based on their purchase history to encourage repeat purchases.
- Customer Education
Provide product demos, webinars, or onboarding sessions to help them better understand the value of KMS’s offerings—especially in underutilized categories.
- Dedicated Account Management
Assign a sales rep or customer success manager to nurture these accounts and build stronger relationships.
- Cross-Sell & Upsell Opportunities
Analyze what similar high-value customers are buying and recommend those products to the bottom-tier customers.

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

Result

| Ship_Mode | Total_Shiping_cost |
| ---------------- | ----------- | 
| Delivery Truck	|51971.940

Insight

**Delivery Truck** is the shipping method with the highest total incurred cost for KMS, amounting to 51971.940

Q6 Who are the most valuable customers and what product or service do they typically purchase?
```Sql
SELECT Top 5
    Customer_Name,
    SUM(Sales) AS Total_customer_sales
FROM 
    Kms_Data
	GROUP BY 
    Customer_Name
ORDER BY 
    Customer_Name, Total_customer_sales DESC;
```

Result:

|Customers_Namme|Total_customers_sales|
|-|-|
|Aaron Bergman	|11630.590|
|Aaron Hawkins	|27690.726|
|Aaron Smayling	|8835.324|
|Adam Bellavance	|11577.580|
|Adam Hart	|26114.266|

Typical Purchase for Top Customers
```Sql
SELECT 
    Customer_Name,
    Product_Category,
    COUNT(*) AS Purchase_Count,
    SUM(Sales) AS Total_sales_for_customer
FROM 
    Kms_Data
WHERE 
    Customer_Name IN ('Aaron Bergman' ,'Aaron Hawkins' ,'Aaron Smayling', 'Adam Bellavance','Adam Hart')
        GROUP BY Customer_Name, Product_Category
        Order by Customer_Name, Total_sales_for_customer Desc;
```
Result:


| 👤 Customer_Name   | 🗂️ Product_Category | 🔢 Purchase_Count | 💰 Total_Sales_for_customer  |
|-------------------|---------------------|-------------------|--------------------|
| Aaron Bergman     | Technology          | 2                 | 8,934.84           |
| Aaron Bergman     | Office Supplies     | 5                 | 2,695.75           |
| Aaron Hawkins     | Furniture           | 4                 | 18,491.80          |
| Aaron Hawkins     | Office Supplies     | 7                 | 5,788.77           |
| Aaron Hawkins     | Technology          | 1                 | 3,410.16           |
| Aaron Smayling    | Technology          | 1                 | 3,594.74           |
| Aaron Smayling    | Furniture           | 2                 | 3,311.83           |
| Aaron Smayling    | Office Supplies     | 11                | 1,928.75           |
| Adam Bellavance   | Furniture           | 3                 | 6,278.00           |
| Adam Bellavance   | Office Supplies     | 8                 | 4,668.59           |
| Adam Bellavance   | Technology          | 1                 | 630.99             |
| Adam Hart         | Office Supplies     | 17                | 12,544.14          |
| Adam Hart         | Technology          | 5                 | 10,409.15          |
| Adam Hart         | Furniture           | 5                 | 3,160.98           |









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





