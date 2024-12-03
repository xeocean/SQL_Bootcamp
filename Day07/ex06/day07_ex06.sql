SELECT pizzeria.name,
       count(*) AS count_of_orders,
       round(avg(price), 2) AS avarage_price,
       min(price) AS min_price,
       max(price) AS max_price
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY name;
