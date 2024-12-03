create or replace function func_minimum(arr anyarray)
returns float as $$
    select min(val::float)
    from unnest(arr) as val;
$$ language sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);