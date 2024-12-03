create or replace function fnc_trg_person_update_audit()
returns trigger as $$
begin
    if (TG_OP = 'UPDATE') then
        insert into  person_audit
        values (current_timestamp, 'U', old.id, old.name, old.age,
               old.gender, old.address);
    end if;
    return null;
end;
$$ language plpgsql;

create or replace trigger trg_person_update_audit
    after update on person
for each row
    execute function fnc_trg_person_update_audit();

update person set name = 'Bulat' where id = 10;
update person set name = 'Damir' where id = 10;