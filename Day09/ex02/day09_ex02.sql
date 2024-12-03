create or replace function fnc_trg_person_delete_audit()
returns trigger as $$
begin
    if (TG_OP = 'DELETE') then
        insert into  person_audit
        values (current_timestamp, 'D', old.id, old.name, old.age,
               old.gender, old.address);
    end if;
    return null;
end;
$$ language plpgsql;

create or replace trigger trg_person_delete_audit
    after delete on person
for each row
    execute function fnc_trg_person_delete_audit();

delete from person where id = 10;
