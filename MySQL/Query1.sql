USE restaurant_db;

-- 1. View the menu_items table.
SELECT * FROM menu_items;

-- 2. Find the number of items on menu.
SELECT COUNT(*) FROM menu_items;

-- 3. What are the least and most expensive items on the menu?
SELECT * FROM menu_items 
ORDER BY price ASC;

-- 4. How many Italian dishes are on the menu?
SELECT COUNT(*) from menu_items
where category = 'Italian';

-- 5. What are the least and most expensive Italian dishes on the menu?
SELECT * FROM menu_items 
where category = 'Italian'
order by price;

-- 6. how many dishes are in each cateogory
select category, count(menu_item_id) AS num_dishes
from menu_items
group by category;

-- 7. what is the average dish price within each category?
select category, avg(price) AS avg_price
from menu_items
group by category;




