use shop;
SELECT 
    ROUND(SUM(transaction_qty * unit_price), 2) AS total_sales
FROM shp1001_rows;

SELECT 
    COUNT(DISTINCT transaction_id) AS total_orders
FROM shp1001_rows; 

SELECT 
    SUM(transaction_qty) AS total_quantity
FROM shp1001_rows;                                  

SELECT 
    product_detail,
    SUM(transaction_qty * unit_price) AS total_sales
FROM shp1001_rows
GROUP BY product_detail
ORDER BY total_sales DESC;                          

SELECT 
    product_category,
    SUM(transaction_qty * unit_price) AS total_sales
FROM shp1001_rows
GROUP BY product_category;

SELECT 
    store_location,
    SUM(transaction_qty * unit_price) AS total_sales
FROM shp1001_rows
GROUP BY store_location;

SELECT 
    transaction_date,
    SUM(transaction_qty * unit_price) AS daily_sales
FROM shp1001_rows
GROUP BY transaction_date
ORDER BY transaction_date;

SELECT 
    HOUR(transaction_time) AS hour,
    SUM(transaction_qty * unit_price) AS total_sales
FROM shp1001_rows
GROUP BY hour
ORDER BY hour;

SELECT 
    CASE 
        WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    SUM(transaction_qty * unit_price) AS total_sales
FROM shp1001_rows
GROUP BY day_type;

SELECT 
    product_detail,
    SUM(transaction_qty * unit_price) AS total_sales
FROM shp1001_rows
GROUP BY product_detail
ORDER BY total_sales DESC
LIMIT 5;

SELECT 
    ROUND(SUM(transaction_qty * unit_price) / COUNT(DISTINCT transaction_id), 2) 
    AS avg_order_value
FROM shp1001_rows;

SELECT 
    store_location,
    SUM(transaction_qty * unit_price) AS total_sales
FROM shp1001_rows
GROUP BY store_location
ORDER BY total_sales DESC
LIMIT 1;

SELECT 
    product_category,
    SUM(transaction_qty * unit_price) AS total_sales
FROM shp1001_rows
GROUP BY product_category
ORDER BY total_sales DESC
LIMIT 1;

SELECT 
    HOUR(transaction_time) AS hour,
    SUM(transaction_qty * unit_price) AS total_sales
FROM shp1001_rows
GROUP BY hour
ORDER BY total_sales DESC
LIMIT 1;
