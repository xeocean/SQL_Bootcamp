SELECT person.name,
       count(person_visits.pizzeria_id) AS count_of_visits
FROM person_visits
JOIN person ON person_visits.person_id = person.id
GROUP BY person.name
ORDER BY count_of_visits DESC, name
LIMIT 4;
