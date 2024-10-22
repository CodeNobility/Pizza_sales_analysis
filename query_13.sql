-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select category, pizza_name, reveneu
from
(select category, pizza_name, reveneu, 
rank() over (partition by category order by reveneu desc)
as ranking
from
(select pizza_types.category, 
pizza_types.pizza_name,
sum(order_details.quantity * pizzas.price) as reveneu
from pizza_types
join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category, pizza_types.pizza_name) as total) as overall
where ranking <= 3;