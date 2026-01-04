# Part 3: Data Warehouse and Analytics

## Overview

This part focuses on building a **data warehouse** for FlexiMart to support historical sales analysis. It includes:

1. **Star Schema Design** (`star_schema_design.md`)  
   - Fact table: `fact_sales` (one row per product per order line)  
   - Dimension tables: `dim_date`, `dim_product`, `dim_customer`  
   - Surrogate keys and conformed dimensions  

2. **Schema Implementation** (`warehouse_schema.sql`)  
   - Create all tables with primary and foreign keys  
   - Ensure referential integrity  

3. **Data Loading** (`warehouse_data.sql`)  
   - Insert sample data: 30 dates, 15 products, 12 customers, 40 sales transactions  
   - Realistic patterns: varied quantities, prices, weekdays/weekends  

4. **Analytics Queries** (`analytics_queries.sql`)  
   - Monthly sales drill-down (Year → Quarter → Month)  
   - Top 10 products by revenue  
   - Customer segmentation (High, Medium, Low value)

---

## How to Run

1. Create the warehouse database:

```bash
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"
