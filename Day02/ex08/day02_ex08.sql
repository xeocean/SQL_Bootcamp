SELECT person.name FROM person
JOIN public.person_order po on person.id = po.person_id
JOIN public.menu m on m.id = po.menu_id
WHERE (address = 'Moscow' OR address = 'Samara') AND gender = 'male' AND
      (pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza')
ORDER BY person.name DESC;