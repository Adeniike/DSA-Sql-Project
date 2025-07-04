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
Result:

🏙️ Region   | 💰 Total_Sales  |
|-------------|--------------------|
| Ontario     | 202,346.84         |

Insight:

The total sales of Appliances within the ontario province amount to 202,346,84


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
    sum(Shipping_Cost)  AS Total_shipping_cost_for_priority,
    count(Order_ID) AS number_of_shipping_cost_for_priority_ship_mode
FROM 
    Kms_Data
GROUP BY 
    Order_Priority, Ship_Mode
ORDER BY 
    Order_Priority, Total_shipping_cost_for_priority Desc;
```

Result:
✈️ Shipping Method Performance by Priority Level

🚦Order_Priority   | 🚚 Ship_Mode| 💰 Total_shipping_cost_for_priority     | 📦 number_of_shipping_cost_for_priority_ship_mode |
|---------------------|--------------------|-----------------------------|----------------|
| Critical            | Delivery Truck     | 10,783.82                   | 228            |
| Critical            | Regular Air        | 8,586.76                    | 1,180          |
| Critical            | Express Air        | 1,742.10                    | 200            |
| High                | Delivery Truck     | 11,206.88                   | 248            |
| High                | Regular Air        | 10,005.01                   | 1,308          |
| High                | Express Air        | 1,453.53                    | 212            |
| Low                 | Delivery Truck     | 11,131.61                   | 250            |
| Low                 | Regular Air        | 10,263.62                   | 1,280          |
| Low                 | Express Air        | 1,551.63                    | 190            |
| Medium              | Delivery Truck     | 9,461.62                    | 205            |
| Medium              | Regular Air        | 9,418.72                    | 1,225          |
| Medium              | Express Air        | 1,633.59                    | 201            |
| Not Specified       | Regular Air        | 9,734.08                    | 1,277          |
| Not Specified       | Delivery Truck     | 9,388.01                    | 215            |
| Not Specified       | Express Air        | 1,470.06                    | 180            |


Insight:

The analysis reveals that KMS is not allocating shipping costs effectively in relation to order priority—particularly for time-sensitive orders.

#### Key Observations:

a. Misalignment for High and Critical Orders:

Delivery Truck, identified as the slowest yet most economical shipping method, accounts for the highest total shipping cost for both Critical and High priority orders. This contradicts the urgency these priorities imply.

Express Air, the fastest and most expensive option, has the lowest total shipping cost and lowest usage across all priority levels, including the most urgent ones. This underutilization suggests that speed is being sacrificed for cost, even when urgency is essential.

b. Overreliance on Regular Air:

Regular Air is used extensively across all priority levels, including Critical and High. While this may be acceptable for medium priorities, its dominance indicates that faster shipping methods like Express Air are not being leveraged where they are most needed.

c. Appropriate Spend for Lower Priorities:

For Low, Medium, and Not Specified priorities, the use of Delivery Truck and Regular Air is more justifiable. These methods align well with cost-saving goals for non-urgent shipments.

#### Recommendation:
KMS should re-evaluate its shipping strategy to ensure high-priority orders are aligned with faster delivery options like Express Air, even at a higher cost, to meet customer expectations and service standards.



### 📌 Overall Strategic Recommendation for KMS Management

Based on the analysis of customer value, shipping efficiency, return behavior, and regional sales, the following strategic actions are recommended to improve profitability, customer retention, and operational efficiency:

#### 🎯 1. Deepen Engagement with High-Value Customers

- Prioritize top customers like **Adam Hart**, **Aaron Bergman**, and **Aaron Hawkins** with:
  - Dedicated account management
  - Personalized product recommendations
  - Loyalty incentives and early access to new offerings
- Monitor their purchase trends to identify upsell and cross-sell opportunities.

#### 🚚 2. Align Shipping Methods with Order Priority

- **Critical and High priority orders** should rely more on **Express Air** and **Regular Air**, minimizing use of **Delivery Truck** due to its slower speed.
- **Medium and Low priority orders** are appropriately using more economical methods like **Delivery Truck**.
- Implement automated shipping logic to enforce alignment between urgency and delivery method.

#### 🔁 3. Reduce High Return Rates

- Investigate high-return customers such as **Michael Dominguez** and **Anne Pryor** to understand root causes.
- Improve product descriptions, quality control, and post-purchase support.
- Set up alerts for accounts with excessive returns to enable proactive engagement.

#### 📦 4. Optimize Shipping Cost Efficiency

- Delivery Truck, while economical per unit, contributes significantly to total shipping costs due to volume.
- Regular Air offers a good balance of cost and speed—consider shifting more volume here for non-urgent orders.
- Monitor average shipping cost per method and adjust logistics strategy accordingly.

#### 🌍 5. Leverage Regional Sales Insights

- **Ontario** is a high-performing region with ₦202,346.84 in total sales.
- Focus marketing and distribution efforts in this region to maintain momentum and explore expansion opportunities.

#### 📊 6. Build a Performance Dashboard

- Create a real-time dashboard to track:
  - Top customers and their product preferences
  - Shipping method usage by priority
  - Return rates by customer and segment
  - Regional sales performance
- Use this dashboard to support data-driven decision-making across departments.




