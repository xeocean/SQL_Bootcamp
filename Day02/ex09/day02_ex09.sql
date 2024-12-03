WITH Search AS (
    SELECT * FROM person
    JOIN public.person_order po on person.id = po.person_id
    JOIN public.menu m on m.id = po.menu_id
)

SELECT DISTINCT name FROM Search
WHERE gender = 'female' AND
      (pizza_name = 'pepperoni pizza' OR pizza_name = 'cheese pizza')
ORDER BY name;