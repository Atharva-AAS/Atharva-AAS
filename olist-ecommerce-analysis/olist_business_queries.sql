-- =========================================================================
-- OLIST E-COMMERCE ANALYTICS: CORE BUSINESS SQL QUERIES
-- Author: Atharva
-- Description: End-to-end analytical queries answering high-level business 
--              performance, product trends, geography, and payment behavior.
-- =========================================================================

-- 1. Overall Sales Performance & Monthly Trends
SELECT 
    DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    SUM(i.price + i.freight_value) AS total_revenue,
    ROUND(SUM(i.price + i.freight_value) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM orders o
JOIN order_items i ON o.order_id = i.order_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')
GROUP BY 1
ORDER BY order_month ASC;


-- 2. Product Category Revenue Performance
SELECT 
    p.product_category_name AS category_name,
    COUNT(DISTINCT i.order_id) AS total_orders,
    COUNT(i.product_id) AS total_items_sold,
    ROUND(SUM(i.price), 2) AS gross_product_revenue,
    ROUND(SUM(i.price + i.freight_value), 2) AS total_revenue_with_freight
FROM order_items i
JOIN products p ON i.product_id = p.product_id
GROUP BY 1
ORDER BY total_revenue_with_freight DESC
LIMIT 10;


-- 3. Customer State Concentration (Geographical Revenue)
SELECT 
    c.customer_state,
    COUNT(DISTINCT c.customer_unique_id) AS unique_customers,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(i.price + i.freight_value), 2) AS total_state_revenue,
    ROUND(SUM(i.price + i.freight_value) / COUNT(DISTINCT o.order_id), 2) AS aov_per_state
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items i ON o.order_id = i.order_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')
GROUP BY 1
ORDER BY total_state_revenue DESC
LIMIT 10;


-- 4. Payment Method Distribution & Revenue Share (Filtered for Anomalies)
SELECT 
    p.payment_type,
    COUNT(DISTINCT p.order_id) AS total_orders_using_method,
    ROUND(SUM(p.payment_value), 2) AS total_revenue_collected,
    ROUND(100.0 * SUM(p.payment_value) / SUM(SUM(p.payment_value)) OVER(), 2) AS percentage_revenue_share
FROM payments p
WHERE p.payment_type NOT IN ('not_defined')
  AND p.payment_value > 0
GROUP BY 1
ORDER BY total_revenue_collected DESC;

'''olist-e-commerce-analytics/
├── notebooks/
│   └── Olist_Data_Profiling.ipynb
├── sql/
│   └── olist_business_queries.sql
└── README.md'''

# Olist E-Commerce Analytics: End-to-End Business Intelligence

## 📌 Project Overview
An end-to-end Data Analyst portfolio project analyzing ~100,000 real Brazilian e-commerce orders (2016–2018). The project covers data profiling, relational schema mapping, anomaly detection, Python/Pandas feature engineering, and advanced SQL business intelligence querying.

## 🗂️ Relational Architecture & Integrity Checks
- **Core Entities:** Mapped relationships across `orders`, `order_items`, `customers`, `payments`, `reviews`, and `products`.
- **Primary Key Verification:** Tested and confirmed composite and single-column keys to prevent revenue double-counting.
- **Anomaly Detection:** Cleaned edge cases, including filtering out `not_defined` payment types and $0.00 payment transactions.

## 💻 SQL Analysis & Key Insights
Using DuckDB to query the relational data structure, we extracted core business metrics:
1. **Sales Trends & AOV:** Tracked monthly scale, customer acquisition, and stable Average Order Values (~$140–$170).
2. **Top Product Categories:** Identified *Health & Beauty* (`beleza_saude`), *Watches & Gifts* (`relogios_presentes`), and *Bed, Bath & Table* (`cama_mesa_banho`) as top revenue drivers.
3. **Geographical Concentration:** Discovered that São Paulo (**SP**) dominates volume, while states like Bahia (**BA**) command a higher AOV (~$181.49).
4. **Payment Method Share:** Proved that **Credit Cards** drive **78.34%** of total platform revenue, followed by **Boleto** at **17.92%**.

## 🚀 Technologies Used
- Python (Pandas, DuckDB, OS)
- SQL (Relational Joins, Aggregations, Window Functions)
- Jupyter Notebook / Google Colab
- GitHub (Version Control & Portfolio Documentation)
