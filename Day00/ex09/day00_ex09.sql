SELECT (SELECT name FROM person WHERE person_id = id) AS person_name,
       (SELECT name FROM pizzeria WHERE pizzeria_id = id) AS pizzeria_name
FROM (SELECT pizzeria_id, person_id FROM person_visits
    WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv
ORDER BY person_name, pizzeria_name DESC;
