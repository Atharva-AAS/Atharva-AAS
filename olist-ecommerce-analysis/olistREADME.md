# Olist E-Commerce Analytics

## Overview

This project analyzes the Olist Brazilian E-Commerce dataset to develop a practical business analytics workflow using Python, SQL, and Power BI.

The project focuses on understanding e-commerce orders, customers, products, payments, reviews, sellers, and delivery performance.

The goal is to move from raw transactional data to meaningful business insights while maintaining accurate data relationships and avoiding common analytical errors such as revenue double-counting.

## Dataset

The project uses the Brazilian E-Commerce Public Dataset by Olist.

The dataset contains approximately 100,000 orders made between 2016 and 2018 and is distributed across multiple relational tables.

Key tables include:

- Orders
- Order Items
- Customers
- Payments
- Reviews
- Products
- Sellers
- Product Category Translation

## Current Progress

The initial data profiling and validation phase has been completed.

Key findings include:

- 99,441 orders
- 112,650 order items
- 103,886 payment records
- 99,224 review records
- 32,951 products
- 3,095 sellers

Primary-key assumptions were tested rather than assumed.

The analysis identified duplicated `review_id` values in the reviews table and missing values in several order, product, and review fields.

Order timestamps were converted to datetime format and delivery metrics were created, including:

- Delivery days
- Delivery delay days

Extreme delivery cases were also investigated rather than automatically treated as errors.

## Analytical Focus

The project will investigate areas such as:

- Revenue and sales performance
- Customer behavior
- Product categories
- Payment methods
- Seller performance
- Delivery performance
- Customer reviews and satisfaction

A major focus will be maintaining correct relationships between the transactional tables and preventing revenue from being double-counted when combining order items and payment records.

## Tools

- Python
- Pandas
- SQL
- Power BI
- Google Colab

## Project Status

Currently in the data exploration and validation stage.

The next stage will focus on revenue modeling and business analysis, followed by SQL analysis and Power BI dashboard development.

## Project Structure

_**
olist-ecommerce-analysis/
├── README.md
└── Olist_Data_Analysis.ipynb**__
