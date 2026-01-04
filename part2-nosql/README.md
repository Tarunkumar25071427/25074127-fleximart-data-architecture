# Part 2: NoSQL Database Analysis

## Overview

This part demonstrates the **use of MongoDB** to handle a flexible product catalog for FlexiMart. Relational databases struggle with:

- Products having **different attributes** (laptops vs shoes)  
- Frequent **schema changes** when adding new product types  
- Storing **customer reviews** as nested data  

MongoDB allows:

- **Flexible schema**: each product can have its own attributes  
- **Embedded documents**: reviews stored inside product documents  
- **Horizontal scalability** for large catalogs  

---

## Files in this Part

1. **`products_catalog.json`**  
   - Sample product data with nested specifications and reviews  

2. **`mongodb_operations.js`**  
   - Operations implemented:
     - Load data into MongoDB  
     - Query products by category and price  
     - Aggregate average ratings  
     - Add new reviews  
     - Calculate average price per category  

3. **`nosql_analysis.md`**  
   - Theory report explaining:
     - Limitations of RDBMS  
     - Advantages of NoSQL  
     - Trade-offs of using MongoDB  

---

## How to Run

1. Make sure **MongoDB server** is running.  

2. Run MongoDB operations:

3. Verify data in MongoDB:

use fleximart;
db.products.find().pretty();

```bash
mongosh < part2-nosql/mongodb_operations.js
