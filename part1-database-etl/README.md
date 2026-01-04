# Part 1: Database Design and ETL Pipeline

## Overview

This part of the FlexiMart project focuses on **cleaning, transforming, and loading raw CSV data** into a relational database (MySQL). It includes:

1. **ETL Pipeline** (`etl_pipeline.py`)  
   - Extracts data from `customers_raw.csv`, `products_raw.csv`, and `sales_raw.csv`.  
   - Cleans and transforms data:
     - Removes duplicates
     - Handles missing values
     - Standardizes phone numbers, categories, and date formats
     - Adds surrogate keys
   - Loads the cleaned data into the `fleximart` database.

2. **Database Schema Documentation** (`schema_documentation.md`)  
   - Entity-relationship description for 4 tables: `customers`, `products`, `orders`, `order_items`.  
   - Normalization explanation (3NF)  
   - Sample records

3. **Business Queries** (`business_queries.sql`)  
   - Customer purchase history  
   - Product sales analysis  
   - Monthly sales trend (2024)

4. **Data Quality Report** (`data_quality_report.txt`)  
   - Number of records processed, duplicates removed, missing values handled, records loaded successfully.

---

## How to Run

1. Install dependencies:

```bash
pip install -r requirements.txt
