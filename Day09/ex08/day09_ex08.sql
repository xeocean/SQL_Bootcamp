create or replace function fnc_fibonacci(pstop integer default 10, a numeric default 0, b numeric default 1)
returns table (value numeric) as $$
begin
    if pstop <= 0 then
        return;
    end if;

    return query select a;

    return query
        select * from fnc_fibonacci(pstop - 1, b, a + b);

    --     a — текущее число Фибоначчи
    --     b — следующее число Фибоначчи
    --     pstop — количество оставшихся чисел
end;
$$ language plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();