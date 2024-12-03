SELECT pizza_name, price,
       pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE NOT EXISTS(SELECT menu_id FROM person_order
                WHERE menu_id = menu.id)
ORDER BY pizza_name, price;
