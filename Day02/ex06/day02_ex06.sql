SELECT
    m.pizza_name,
    pz.name AS pizzeria_name
FROM person p
JOIN person_order po ON p.id = po.person_id
JOIN menu m ON po.menu_id = m.id
JOIN public.pizzeria pz ON m.pizzeria_id = pz.id
WHERE p.name IN ('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name;
