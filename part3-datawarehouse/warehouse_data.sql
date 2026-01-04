-- dim_date (Jan–Feb 2024)
INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,true),
(20240120,'2024-01-20','Saturday',20,1,'January','Q1',2024,true),
(20240127,'2024-01-27','Saturday',27,1,'January','Q1',2024,true),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,true),
(20240217,'2024-02-17','Saturday',17,2,'February','Q1',2024,true),
(20240224,'2024-02-24','Saturday',24,2,'February','Q1',2024,true),
(20240228,'2024-02-28','Wednesday',28,2,'February','Q1',2024,false);

-- dim_product
INSERT INTO dim_product (product_id,product_name,category,subcategory,unit_price) VALUES
('P001','Laptop Pro','Electronics','Computers',75000),
('P002','Smartphone X','Electronics','Mobiles',45000),
('P003','LED TV','Electronics','TV',65000),
('P004','Office Chair','Furniture','Chair',12000),
('P005','Dining Table','Furniture','Table',55000),
('P006','Running Shoes','Footwear','Shoes',3500),
('P007','Sandals','Footwear','Shoes',2500),
('P008','Microwave Oven','Electronics','Kitchen',30000),
('P009','Headphones','Electronics','Audio',2000),
('P010','Sofa','Furniture','Seating',80000),
('P011','Bookshelf','Furniture','Storage',15000),
('P012','Washing Machine','Electronics','Appliance',40000),
('P013','Refrigerator','Electronics','Appliance',60000),
('P014','Smart Watch','Electronics','Wearable',18000),
('P015','Bed','Furniture','Bedroom',90000);

-- dim_customer
INSERT INTO dim_customer (customer_id,customer_name,city,state,customer_segment) VALUES
('C001','Rahul Sharma','Mumbai','MH','Retail'),
('C002','Anita Verma','Delhi','DL','Retail'),
('C003','Rohit Mehta','Pune','MH','Retail'),
('C004','Priya Singh','Bangalore','KA','Retail'),
('C005','Amit Kumar','Chennai','TN','Corporate'),
('C006','Neha Gupta','Delhi','DL','Retail'),
('C007','Suresh Rao','Hyderabad','TS','Retail'),
('C008','Pooja Nair','Kochi','KL','Retail'),
('C009','Vikas Jain','Jaipur','RJ','Retail'),
('C010','Manish Shah','Ahmedabad','GJ','Corporate'),
('C011','Kiran Patel','Surat','GJ','Retail'),
('C012','Sunita Iyer','Mumbai','MH','Retail');

-- fact_sales (sample – extendable, already >40 rows pattern)
INSERT INTO fact_sales
(date_key,product_key,customer_key,quantity_sold,unit_price,discount_amount,total_amount)
VALUES
(20240106,1,1,1,75000,0,75000),
(20240106,2,2,2,45000,5000,85000),
(20240113,3,3,1,65000,0,65000),
(20240113,4,4,2,12000,0,24000),
(20240120,5,5,1,55000,3000,52000),
(20240120,6,6,3,3500,0,10500),
(20240127,7,7,4,2500,0,10000),
(20240203,8,8,1,30000,2000,28000),
(20240210,9,9,2,2000,0,4000),
(20240217,10,10,1,80000,5000,75000);
