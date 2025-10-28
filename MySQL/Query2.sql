-- 1. view order details. What is the range of the table
select * from order_details;
select min(order_date) min_date, max(order_date) max_date
from order_details;

-- 2. How many orders were made within this range?
select max(order_id) from order_details;
select count(distinct order_id) from order_details;

-- 3. How many items were ordered within this range?
select max(order_details_id) from order_details;

-- 4. which orders had the most number of items?
select order_id, count(item_id) as num_items
from order_details
group by order_id order by num_items desc;

-- 5. how many orders had more than 12 items?
select count(*) from 

(select order_id, count(item_id) as num_items
from order_details
group by order_id 
having num_items > 12) as num_orders;




