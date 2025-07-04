use Dsa_db
select * from Kms_Data
--Q1 Which product category had the highest sales?--
SELECT TOP 1 
    Product_Category,  
    SUM(Sales) AS Total_Sales  
FROM  
    Kms_Data  
GROUP BY  
    Product_Category  
ORDER BY  
    Total_Sales DESC;


-- Q2 what are the Top 3 region in terms of sales?--

SELECT TOP 
	3 Region, SUM(Sales) AS Total_Sales
FROM  Kms_Data
GROUP BY Region
ORDER BY 
    Total_Sales DESC;

---Q2b what are the Bottom 3 Region---
SELECT top  3 Region, SUM(Sales) AS Total_Sales
FROM Kms_Data
GROUP BY Region
ORDER BY 
    Total_Sales ASC;

-- Q3 What were the total sales of appliances in ontairo?

SELECT Region,
    SUM(Sales) AS Total_Appliance_Sales_Ontario
FROM 
   Kms_Data
WHERE 
    Product_Sub_Category = 'Appliances'
    AND Province = 'Ontario'
Group by Region;

-- Q4 Advise the management of kms what to do to increase the revenue from bottom 10 customers..
-- identify the bottom 10 customer's revenue
SELECT TOP 10
    Product_category,Customer_Name,
    SUM(Sales) AS Total_Sales
FROM 
    Kms_Data
GROUP BY 
    Product_category, Customer_Name
ORDER BY 
    Total_Sales ASC;

-- Q5 the company incurred the most shipping cost using which shipping method---
SELECT Top 1
    [Ship_Mode],
    SUM([Shipping_Cost]) AS Total_Shipping_Cost
FROM 
    Kms_Data
GROUP BY 
    [Ship_Mode]
ORDER BY 
    Total_Shipping_Cost DESC;

-- Q6 Who are the most valuable customers and what product or service do they typically purchase?
	SELECT Top 5
    Customer_Name,
    SUM(Sales) AS Total_customer_sales
FROM 
    Kms_Data
	GROUP BY 
    Customer_Name
ORDER BY 
    Customer_Name, Total_customer_sales DESC;

	-- Typical Purchase for Top Customers--
	SELECT 
    [Customer_Name],
    [Product_Category],
    COUNT(*) AS Purchase_Count,
    SUM(Sales) AS Total_sales_for_customer
FROM 
    Kms_Data
WHERE 
    [Customer_Name] IN ('Aaron Bergman' ,'Aaron Hawkins' ,'Aaron Smayling', 'Adam Bellavance','Adam Hart')
        GROUP BY [Customer_Name], Product_Category
        Order by [Customer_Name], Total_sales_for_customer Desc;
      

-- Q7 which small business customer had the highest sales?
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
    Total_Sales DESC;

---Q8 Which corporate customer placed the most number of orders in 2019-2012?
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

-- Q9 Which consumer customer was the most profitable one?
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

-- Q10 Which customer returend items, and what segment do they belong?
SELECT  * from dbo.Kms_Data
select * from dbo.Order_Status

SELECT D
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

--11 company appropriately spent shipping cost based on the Order Priority?
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
