SELECT pizza_name FROM menu
INTERSECT
SELECT pizza_name FROM menu
ORDER BY pizza_name DESC;
