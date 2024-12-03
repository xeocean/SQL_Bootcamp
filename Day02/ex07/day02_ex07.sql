SELECT pizzeria.name FROM person
JOIN person_visits ON person.id = person_visits.person_id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08' AND menu.price < 800
