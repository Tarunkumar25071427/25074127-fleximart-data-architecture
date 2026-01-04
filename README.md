# FlexiMart Data Architecture Project

**Student Name:** Tarunkumar  
**Student ID:** Tarunkumar25071427  
**Email:** rana.tarunkumar@yahoo.com  
**Date:** January 2026  

## Project Overview

This project implements a complete end-to-end data architecture for FlexiMart, covering ETL processing, relational database design, NoSQL analysis, and data warehouse analytics. The solution transforms raw CSV data into clean, structured, and analytics-ready datasets.

## Repository Structure

├── data/  
│   ├── customers_raw.csv  
│   ├── products_raw.csv  
│   └── sales_raw.csv  
│  
├── part1-database-etl/  
│   ├── etl_pipeline.py  
│   ├── schema_documentation.md  
│   ├── business_queries.sql  
│   └── data_quality_report.txt  
│  
├── part2-nosql/  
│   ├── nosql_analysis.md  
│   ├── mongodb_operations.js  
│   └── products_catalog.json  
│  
├── part3-datawarehouse/  
│   ├── star_schema_design.md  
│   ├── warehouse_schema.sql  
│   ├── warehouse_data.sql  
│   └── analytics_queries.sql  
│  
└── README.md  

## Technologies Used

- Python 3.x, pandas, mysql-connector-python  
- MySQL 8.0  
- MongoDB 6.0  

## Setup Instructions

```bash
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

python part1-database-etl/etl_pipeline.py

mysql -u root -p fleximart < part1-database-etl/business_queries.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql

mongosh < part2-nosql/mongodb_operations.js
