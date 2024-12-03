SELECT pizzeria.name AS pizzeria_name
FROM person_visits
JOIN person ON person.id = person_visits.person_id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
WHERE person.name = 'Andrey'

EXCEPT

SELECT pizzeria.name AS pizzeria_name
FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Andrey';
