(SELECT pizzeria.name AS pizzeria_name
FROM person_visits
  JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
  JOIN person ON person_visits.person_id = person.id
WHERE person.gender='male'
EXCEPT ALL
SELECT pizzeria.name AS pizzeria_name
FROM person_visits
  JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
  JOIN person ON person_visits.person_id = person.id
WHERE person.gender='female')

UNION ALL

(SELECT pizzeria.name AS pizzeria_name
FROM person_visits
  JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
  JOIN person ON person_visits.person_id = person.id
WHERE person.gender='female'
EXCEPT ALL
SELECT pizzeria.name AS pizzeria_name
FROM person_visits
  JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
  JOIN person ON person_visits.person_id = person.id
WHERE person.gender='male')
ORDER BY pizzeria_name;