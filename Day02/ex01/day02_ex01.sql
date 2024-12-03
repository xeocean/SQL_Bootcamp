SELECT dates::date AS missing_date
FROM GENERATE_SERIES('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) dates
LEFT JOIN (SELECT visit_date FROM person_visits
WHERE person_id = 1 or person_id = 2) AS search
ON dates = search.visit_date
WHERE search.visit_date IS NULL
ORDER BY missing_date;
