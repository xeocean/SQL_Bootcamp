create or replace function fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy',
                                pprice integer default 500, pdate date default '2022-01-08')
returns table (pizzeria_name varchar) as $$
    select distinct pizzeria.name from person_visits
    join person on person_visits.person_id = person.id
    join pizzeria on person_visits.pizzeria_id = pizzeria.id
    join menu on menu.pizzeria_id = person_visits.pizzeria_id
    where person.name = pperson and menu.price < pprice and person_visits.visit_date = pdate;
$$ language sql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');