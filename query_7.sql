-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) as hour, COUNT(order_id) AS count
FROM
    orders
GROUP BY HOUR(orders.order_time);
