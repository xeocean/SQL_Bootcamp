SELECT pizzeria.name, pizzeria.rating
FROM pizzeria
LEFT JOIN person_visits pv
ON pizzeria.id = pv.pizzeria_id
WHERE pizzeria_id IS NULL;
