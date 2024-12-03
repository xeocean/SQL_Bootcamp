SELECT person_visits.person_id,
       count(person_visits.pizzeria_id) AS count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY count_of_visits DESC, person_id;
