WITH count_result AS ((SELECT pizzeria.name,
       count(person_visits.pizzeria_id) AS count
FROM person_visits
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY pizzeria.name)
UNION ALL
(SELECT pizzeria.name,
       count(person_order.menu_id) AS count
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name))
SELECT count_result.name,
       sum(count) AS total_count
FROM count_result
GROUP BY count_result.name
ORDER BY total_count DESC, name;
