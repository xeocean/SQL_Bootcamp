(SELECT pizzeria.name AS pizzeria_name
FROM menu
  JOIN person_order ON person_order.menu_id = menu.id
  JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
  JOIN person ON person_order.person_id = person.id
WHERE person.gender='male'
EXCEPT
SELECT pizzeria.name AS pizzeria_name
FROM menu
  JOIN person_order ON person_order.menu_id = menu.id
  JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
  JOIN person ON person_order.person_id = person.id
WHERE person.gender='female')

UNION

(SELECT pizzeria.name AS pizzeria_name
FROM menu
  JOIN person_order ON person_order.menu_id = menu.id
  JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
  JOIN person ON person_order.person_id = person.id
WHERE person.gender='female'
EXCEPT
SELECT pizzeria.name AS pizzeria_name
FROM menu
  JOIN person_order ON person_order.menu_id = menu.id
  JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
  JOIN person ON person_order.person_id = person.id
WHERE person.gender='male')
ORDER BY pizzeria_name;