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
Product Category with the highest sales
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
 






















