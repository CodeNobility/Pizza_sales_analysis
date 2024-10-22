-- Analyze the cumulative revenue generated over time.

select order_date, sum(reveneu) over (order by order_date) as cum_reveneu
from
(select orders.order_date, 
round(sum(order_details.quantity * pizzas.price),2) as reveneu
from orders join order_details
on orders.order_id = order_details.order_id
join pizzas
on pizzas.pizza_id = order_details.pizza_id
group by orders.order_date) as sales;


