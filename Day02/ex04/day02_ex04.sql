WITH SearchMenu AS (
    SELECT pizza_name,
           p.name AS pizzeria_name,
           price
    FROM menu JOIN pizzeria p ON menu.pizzeria_id = p.id
)
SELECT * FROM SearchMenu
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name;
