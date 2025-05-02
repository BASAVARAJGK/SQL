# 🛍️ Store Sales Exploratory Data Analysis (SQL Project)

## 📌 Overview
This SQL project performs an exploratory data analysis (EDA) on a store sales dataset. The goal is to derive key business insights such as total revenue, profitability by product and region, discount impact, and margin performance.

## 🧰 Technologies Used
- SQL (Tested on MySQL / PostgreSQL)
- Structured Query Language (DML, Aggregations, Joins)
- Git for version control

## 📊 Key Insights Generated
- Total and average sales by state
- Revenue analysis by discount level and profit margin
- Product category performance
- Profit and expenditure overview
- State-wise top revenue contributors

## 📂 Files
- `Store_sales Exploratory data analysis.sql` – Contains all queries used for the analysis

## 📌 Sample Queries
```sql
-- Total revenue and profit by state
SELECT state, SUM(sales) AS revenue, SUM(profit) AS total_profit
FROM orders
GROUP BY state
ORDER BY revenue DESC;
