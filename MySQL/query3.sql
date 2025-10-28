-- 1. Combined menu_items and order details into a single table
create table behavior(
select * 
from menu_items m
right join order_details o 
on m.menu_item_id = o.item_id);

-- 2. What were the least and most ordered items?
select item_name, count(item_id) num_order
from behavior
group by item_name
order by num_order desc;

-- Min And Max of each category
SELECT 
    category, 
    item_name, 
    total_orders,
    order_type
FROM (
    SELECT 
        category,
        item_name,
        COUNT(item_id) AS total_orders,
        CASE 
            WHEN COUNT(item_id) = MAX(COUNT(item_id)) OVER (PARTITION BY category)
                THEN 'Max'
            WHEN COUNT(item_id) = MIN(COUNT(item_id)) OVER (PARTITION BY category)
                THEN 'Min'
        END AS order_type
    FROM behavior
    GROUP BY category, item_name
) AS t
WHERE order_type IS NOT NULL
ORDER BY category, order_type;

-- 4. What were the top 5 orders that spent the most money?
select order_id, sum(price) total_price
from behavior
group by order_id
order by total_price desc
limit 5; 

-- 5. View the details of the highest spend order. What insights can you gather from the results?
select * from behavior
where order_id = 440;

-- 6. View the details of the top 5 highest spend orders. what insights can you gater from the results?
select order_id, category, count(item_id) as num_items
from behavior
where order_id in ( 440, 2075, 1957, 330 , 2675)
group by category, order_id;

--
select sum(price) as revenue, order_date, dayname(order_date) as day_name from behavior
group by order_date, dayname(order_date)
order by order_date asc;
