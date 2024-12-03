WITH RECURSIVE travel_paths AS (
    -- Начинаем маршрут
    SELECT point1                 AS start,
           point2                 AS current_city,
           cost,
           ARRAY [point1, point2] AS tour,
           2                      AS visited_count
    FROM nodes
    WHERE point1 = 'a'

    UNION ALL

    -- Рекурсивное добавление городов в маршрут
    SELECT tp.start,
           n.point2,
           tp.cost + n.cost,
           tp.tour || n.point2,
           tp.visited_count + 1
    FROM travel_paths tp
             JOIN nodes n ON tp.current_city = n.point1
    WHERE NOT n.point2 = tp.start
      AND NOT n.point2 = ANY (tp.tour)
      AND tp.visited_count < 4
),

travel_finish AS (
    -- Завершаем маршрут
    SELECT tp.cost + n.cost AS total_cost,
           tp.tour || n.point2 AS tour
    FROM travel_paths tp
    JOIN nodes n ON tp.current_city = n.point1
    WHERE tp.visited_count = 4
      AND n.point2 = tp.start
)
SELECT total_cost, tour
FROM travel_finish
WHERE total_cost = (SELECT MIN(total_cost) FROM travel_finish) 
	or total_cost = (SELECT MAX(total_cost) FROM travel_finish)
ORDER BY total_cost, tour;
