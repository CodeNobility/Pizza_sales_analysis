-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pizza_types.pizza_name,
    SUM(order_details.quantity * pizzas.price) AS reveneu
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.pizza_name
ORDER BY reveneu DESC
LIMIT 3;

