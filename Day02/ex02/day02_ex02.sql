SELECT COALESCE(person.name, '-') AS person_name,
       query.visit_date AS visit_date,
       COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (person FULL JOIN
    (SELECT person_id, visit_date, pizzeria_id FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') query
ON person.id = query.person_id FULL JOIN pizzeria ON query.pizzeria_id = pizzeria.id)
ORDER BY person_name, visit_date, pizzeria_name;