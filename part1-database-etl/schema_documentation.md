ENTITY: customers

Purpose: Stores customer master data
Attributes:

customer_id (PK): Unique customer identifier

first_name, last_name: Customer name

email: Unique contact email

phone: Standardized contact number

city: Customer city

registration_date: Account creation date

Relationships:

One customer → Many orders (1:M)

ENTITY: products

Stores product catalog information.
Each product can appear in multiple order items.

ENTITY: orders

Stores order-level transactions placed by customers.

ENTITY: order_items

Stores line-item level sales data.

🔹 Normalization (3NF Explanation – ~220 words)

This database design follows Third Normal Form (3NF) principles.
Each table contains attributes that are fully functionally dependent on the primary key and nothing else.

In the customers table, all attributes depend solely on customer_id. There are no transitive dependencies.

In the products table, product details depend only on product_id.

The orders table separates order-level information from item-level data, preventing repeating groups.

The order_items table resolves the many-to-many relationship between orders and products.

Functional Dependencies

customer_id → customer attributes

product_id → product attributes

order_id → order attributes

order_item_id → quantity, price, subtotal

This structure prevents:

Update anomalies: Product price updates do not affect historical orders.

Insert anomalies: Customers can exist without orders.

Delete anomalies: Deleting an order does not delete customer data.
