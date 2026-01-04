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
