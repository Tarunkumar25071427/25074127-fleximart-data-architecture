-- Query 1: Monthly Sales Drill-Down
-- Business Scenario: Show sales performance from year → quarter → month for 2024

SELECT
    year,
    quarter,
    month_name,
    SUM(total_amount) AS total_sales,
    SUM(quantity_sold) AS total_quantity
FROM fact_sales fs
JOIN dim_date dd ON fs.date_key = dd.date_key
WHERE year = 2024
GROUP BY year, quarter, month_name
ORDER BY year, quarter, month;

-- Query 2: Top 10 Products by Revenue
-- Business Scenario: Identify top-performing products by revenue

WITH product_revenue AS (
    SELECT
        dp.product_name,
        dp.category,
        SUM(fs.quantity_sold) AS units_sold,
        SUM(fs.total_amount) AS revenue
    FROM fact_sales fs
    JOIN dim_product dp ON fs.product_key = dp.product_key
    GROUP BY dp.product_name, dp.category
)
SELECT
    product_name,
    category,
    units_sold,
    revenue,
    ROUND((revenue / SUM(revenue) OVER()) * 100, 2) AS revenue_percentage
FROM product_revenue
ORDER BY revenue DESC
LIMIT 10;

-- Query 3: Customer Segmentation Analysis
-- Business Scenario: Segment customers into High/Medium/Low value

WITH customer_spending AS (
    SELECT
        dc.customer_name,
        SUM(fs.total_amount) AS total_spent
    FROM fact_sales fs
    JOIN dim_customer dc ON fs.customer_key = dc.customer_key
    GROUP BY dc.customer_name
)
SELECT
    CASE
        WHEN total_spent > 50000 THEN 'High Value'
        WHEN total_spent BETWEEN 20000 AND 50000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,
    COUNT(*) AS customer_count,
    SUM(total_spent) AS total_revenue,
    ROUND(AVG(total_spent), 2) AS avg_revenue_per_customer
FROM customer_spending
GROUP BY customer_segment;
