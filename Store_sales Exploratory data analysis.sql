-- Using a temporary table to store intermediate results instead of querying raw data directly
create table orders
select *
from superstore;

select *
from orders
;

-- Listing out Top 5 selling products in the store

select product_name, sum(sales) as revenue
from orders
group by product_name 
order by revenue desc
limit 5
;

-- list out's which category is having maximum profit with minimum discount in store sales

select category,sum(profit) as Total_PROFIT,Avg(discount) as AVG_DISCOUNT
from orders
group by category
order by Total_PROFIT desc
limit 5
;

-- dropping the unwanted columns

alter table orders
drop column row_id;

-- Aggregating sales data by state and discount to analyze revenue performance.
-- Using DISTINCT to eliminate duplicate rows and grouping by key financial metrics.
-- The query calculates total revenue per state and discount level, including profit, expenditure, and margin percentage.
-- Results are ordered in descending order of revenue to identify top-performing segments.

select distinct state,(discount),sum(sales) as revenue,profit,expenditure,margin_percentage
from orders
group by discount,profit,state,expenditure,margin_percentage
order by revenue desc
;

-- list outs which state has generating more revenue along with profit for the store

select distinct state, sum(profit) as total_profit,sum(sales) as revenue
from orders
group by state
order by total_profit desc
;

-- List out's the which type of chair is performing good and generating maximum revenue

select product_name,category,sub_category,quantity,sales as revenue
from orders
where category = 'Furniture'
and sub_category = 'Chairs'
order by revenue desc
limit 4
;

-- List outs the which customer has having maximum orders in the store which can be used to issue any kind of prize or anything
select customer_id,customer_name,
	COUNT(distinct order_id) as total_orders
from orders
group by customer_id,customer_name
having total_orders > 1
order by total_orders desc;

-- This Shares the data of profit share among the region

select distinct region,sum(profit) as regional_profit
from orders
group by region
order by regional_profit 
;

alter table orders
add column margin_percentage float
;

update orders
set margin_percentage = round((profit/sales)*100,2)
;

-- This data shares the insights of the avg proft margin among the various category's on west which is generating maximum profit compared to other regions
select distinct category,region,sum(profit) as total_profit,sum(sales) as total_sales,avg(margin_percentage) as avg_margin
from orders
where region = 'West'
group by category
order by  avg_margin asc;
