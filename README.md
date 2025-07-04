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


#### Insight and strategic guidance to KMS Management
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

####  Recommendation for KMS Management
To maximize revenue and strengthen relationships with high-value customers, KMS should consider the following actions:
1. 🎯 Focus on Customer-Specific Product Strategies
- Tailor marketing and sales efforts around the preferred product categories of each top customer.
- For example, promote new Technology offerings to Aaron Bergman and Adam Bellavance.
- Offer exclusive Office Supplies bundles to Aaron Hawkins and Adam Hart.
2. 🤝 Strengthen Loyalty Through Personalization
- Assign dedicated account managers to top customers to provide personalized service and early access to new products.
- Use purchase history to send targeted promotions, loyalty rewards, or volume-based discounts.
3. 📈 Expand High-Performing Categories
- Invest in expanding inventory and promotions in categories like Technology, Office Supplies, and Furniture, which are driving the most revenue from top clients.
4. 📊 Monitor and Nurture Top Accounts
- Create a dashboard to track sales trends and engagement levels of top customers monthly.
- Identify any drop in activity early and re-engage with tailored offers or check-ins

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
Result:

| Customer_sales| Total_sales|
|-|-
|Dennis Kane	|75967.591|

Insight
Dennis Kane is identified as the small business customer with the highest sales, contributing 75,967.59 to KMS revenue.

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

Result:

| Customer_name| Total_orders|
|-|-
|Adam Hart	|18|

Insight:

Between 2009 and 2012, Adam Hart emerged as the most active Corporate Customer, placing a total of 18 orders. This consistent purchasing behavior highlights Adam Hart as a highly engaged and valuable client for KMS.

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

Result:
| Customer_name| Total_orders|
|-|-
|Emily Phan	|34005.440|

Insight

Emily Phan stands out as the most profitable Consumer Customer for KMS, contributing a total profit of 4,005.440

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

Result:

This table shows few customers with high return activity, including their segment and the number of returned orders.

| 👤 Customer Name      | 🏢 Segment      | 🔢 Orders_Returned | 🔁 Status   |
|-----------------------|----------------|--------------------|-------------|
| Tamara Dahlen         | Corporate      | 65                 | Returned    |
| Jonathan Doherty      | Corporate      | 69                 | Returned    |
| Jonathan Doherty      | Corporate      | 69                 | Returned    |
| Michael Dominguez     | Home Office    | 134                | Returned    |
| Anne Pryor            | Consumer       | 135                | Returned    |

Insight:

A significant number of customers 872 in total have returned items to KMS. These returns span across all customer segments, including Home Office, Corporate, Small Business, and Consumer. This pattern suggests that returns are a widespread occurrence rather than being isolated to a specific segment, potentially pointing to broader issues such as product quality, customer expectations, or fulfillment challenges that warrant further investigation.

#### 📌 Recommendation: Reduce High Return Rates Among Key Customers

The data reveals a high volume of returned orders from specific customers across multiple segments. To address this and improve operational efficiency, KMS should consider the following actions:

#### 1. Investigate Root Causes of Returns

- Analyze return reasons for customers like **Michael Dominguez** and **Anne Pryor**, who have over 130 returns each.
- Identify patterns such as product defects, delivery issues, or mismatched expectations.

#### 2. Improve Product Descriptions and Quality Control

- Ensure product listings are accurate and detailed to reduce misunderstandings.
- Strengthen quality assurance processes to minimize defective or misrepresented items.

#### 3. Engage High-Return Customers Directly

- Reach out to customers with frequent returns (e.g., **Jonathan Doherty**, **Tamara Dahlen**) to understand their experience.
- Offer support or personalized solutions to rebuild trust and reduce future returns.

#### 4. Monitor Return Trends by Segment

- Track return rates by customer segment (Corporate, Home Office, Consumer).
- Use this data to tailor return policies, improve service, and adjust inventory strategies.

#### 5. Introduce Return Threshold Alerts

- Set up internal alerts for customers with unusually high return activity.
- Flag accounts for review and proactive engagement before profitability is impacted.


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

Result:
✈️ Shipping Method Performance by Priority Level

| 🚦 Priority Level   | 🚚 Shipping Method | 📦 Order Count | 💰 Avg Shipping Cost |
|---------------------|--------------------|----------------|----------------------|
| Critical            | Regular Air        | 1,180          | 7.28                 |
| Critical            | Express Air        | 200            | 8.71                 |
| Critical            | Delivery Truck     | 228            | 47.30                |
| High                | Regular Air        | 1,308          | 7.65                 |
| High                | Express Air        | 212            | 6.86                 |
| High                | Delivery Truck     | 248            | 45.19                |
| Low                 | Regular Air        | 1,280          | 8.02                 |
| Low                 | Express Air        | 190            | 8.17                 |
| Low                 | Delivery Truck     | 250            | 44.53                |
| Medium              | Regular Air        | 1,225          | 7.69                 |
| Medium              | Express Air        | 201            | 8.13                 |
| Medium              | Delivery Truck     | 205            | 46.15                |
| Not Specified       | Regular Air        | 1,277          | 7.62                 |
| Not Specified       | Express Air        | 180            | 8.17                 |
| Not Specified       | Delivery Truck     | 215            | 43.67                |





