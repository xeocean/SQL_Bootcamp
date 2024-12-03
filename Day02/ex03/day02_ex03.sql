WITH DateSeries AS (
    SELECT GENERATE_SERIES('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS dates
),
    PersonVisits AS (
        SELECT visit_date
        FROM person_visits
        WHERE person_id = 1 OR person_id = 2
)
SELECT ds.dates::date AS missing_date
FROM DateSeries ds
LEFT JOIN PersonVisits pv ON ds.dates = pv.visit_date
WHERE pv.visit_date IS NULL
ORDER BY missing_date;
