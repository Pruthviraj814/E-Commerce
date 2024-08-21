

-- KPI 1
use olist;
SELECT 
    CASE 
        WHEN DAYOFWEEK(o.order_purchase_timestamp) IN (2, 3, 4, 5, 6) THEN 'Weekday'
        WHEN DAYOFWEEK(o.order_purchase_timestamp) IN (1, 7) THEN 'Weekend'
    END AS day_type,
    SUM(p.payment_value) AS total_payment_value
FROM 
    orders o
JOIN 
    payment p ON o.order_id = p.order_id
GROUP BY 
    day_type
LIMIT 0, 1000;




-- KPI 2
SELECT 
    COUNT(*) AS number_of_orders
FROM 
    orders o
JOIN 
    reviews r ON o.order_id = r.order_id
JOIN 
    payment p ON o.order_id = p.order_id
WHERE 
    r.review_score = 5
    AND p.payment_type = 'credit_card';
    

 -- KPI 4
 SELECT 
    DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) AS shipping_days,
    r.review_score
FROM 
    orders o
JOIN 
    reviews r ON o.order_id = r.order_id
WHERE 
    o.order_delivered_customer_date IS NOT NULL
    AND o.order_purchase_timestamp IS NOT NULL
LIMIT 0, 1000;


-- KPI 5
select * from orders;
SELECT DATE_FORMAT(order_delivered_customer_date, '%Y-%m-%d') AS formatted_date FROM orders;
select * from orders;

    
 
 
 