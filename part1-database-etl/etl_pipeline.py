import pandas as pd
import mysql.connector
from datetime import datetime
import re
import logging

# ---------------- CONFIG ----------------
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "password",
    "database": "fleximart"
}

CUSTOMERS_FILE = "data/customers_raw.csv"
PRODUCTS_FILE = "data/products_raw.csv"
SALES_FILE = "data/sales_raw.csv"

REPORT_FILE = "part1-database-etl/data_quality_report.txt"

logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# ---------------- HELPERS ----------------
def standardize_phone(phone):
    if pd.isna(phone):
        return None
    digits = re.sub(r"\D", "", str(phone))
    if len(digits) == 10:
        return f"+91-{digits}"
    return None

def standardize_category(cat):
    if pd.isna(cat):
        return "Unknown"
    return cat.strip().title()

def parse_date(value):
    try:
        return pd.to_datetime(value).date()
    except:
        return None

# ---------------- ETL ----------------
def main():
    report = []

    conn = mysql.connector.connect(**DB_CONFIG)
    cursor = conn.cursor()

    # -------- CUSTOMERS --------
    customers = pd.read_csv(CUSTOMERS_FILE)
    raw_count = len(customers)

    customers.drop_duplicates(inplace=True)
    dup_removed = raw_count - len(customers)

    customers.dropna(subset=["email"], inplace=True)
    customers["phone"] = customers["phone"].apply(standardize_phone)
    customers["registration_date"] = customers["registration_date"].apply(parse_date)

    for _, row in customers.iterrows():
        cursor.execute("""
            INSERT IGNORE INTO customers 
            (first_name, last_name, email, phone, city, registration_date)
            VALUES (%s,%s,%s,%s,%s,%s)
        """, tuple(row))

    conn.commit()
    report.append(f"Customers: Processed={raw_count}, Duplicates Removed={dup_removed}, Loaded={len(customers)}")

    # -------- PRODUCTS --------
    products = pd.read_csv(PRODUCTS_FILE)
    raw_count = len(products)

    products.drop_duplicates(inplace=True)
    dup_removed = raw_count - len(products)

    products["price"].fillna(products["price"].mean(), inplace=True)
    products["stock_quantity"].fillna(0, inplace=True)
    products["category"] = products["category"].apply(standardize_category)

    for _, row in products.iterrows():
        cursor.execute("""
            INSERT INTO products (product_name, category, price, stock_quantity)
            VALUES (%s,%s,%s,%s)
        """, tuple(row))

    conn.commit()
    report.append(f"Products: Processed={raw_count}, Duplicates Removed={dup_removed}, Loaded={len(products)}")

    # -------- SALES --------
    sales = pd.read_csv(SALES_FILE)
    raw_count = len(sales)

    sales.drop_duplicates(inplace=True)
    dup_removed = raw_count - len(sales)

    sales["order_date"] = sales["order_date"].apply(parse_date)
    sales.dropna(subset=["customer_id", "product_id"], inplace=True)

    for _, row in sales.iterrows():
        cursor.execute("""
            INSERT INTO orders (customer_id, order_date, total_amount)
            VALUES (%s,%s,%s)
        """, (row["customer_id"], row["order_date"], row["total_amount"]))
        order_id = cursor.lastrowid

        cursor.execute("""
            INSERT INTO order_items
            (order_id, product_id, quantity, unit_price, subtotal)
            VALUES (%s,%s,%s,%s,%s)
        """, (
            order_id,
            row["product_id"],
            row["quantity"],
            row["unit_price"],
            row["quantity"] * row["unit_price"]
        ))

    conn.commit()
    report.append(f"Sales: Processed={raw_count}, Duplicates Removed={dup_removed}, Loaded={len(sales)}")

    with open(REPORT_FILE, "w") as f:
        for line in report:
            f.write(line + "\n")

    cursor.close()
    conn.close()

if __name__ == "__main__":
    main()
