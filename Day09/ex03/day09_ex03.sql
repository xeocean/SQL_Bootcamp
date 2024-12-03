drop trigger if exists trg_person_insert_audit on person;
drop trigger if exists trg_person_update_audit on person;
drop trigger if exists trg_person_delete_audit on person;

drop function if exists fnc_trg_person_insert_audit();
drop function if exists fnc_trg_person_update_audit();
drop function if exists fnc_trg_person_delete_audit();

create or replace function fnc_trg_person_audit()
returns trigger as $$
begin
    if (TG_OP = 'INSERT') then
        insert into person_audit
        values (current_timestamp, 'I', new.id, new.name, new.age,
                new.gender, new.address);
    end if;
    if (TG_OP = 'UPDATE') then
        insert into  person_audit
        values (current_timestamp, 'U', old.id, old.name, old.age,
               old.gender, old.address);
    end if;
    if (TG_OP = 'DELETE') then
        insert into  person_audit
        values (current_timestamp, 'D', old.id, old.name, old.age,
               old.gender, old.address);
    end if;
    return null;
end;
$$ language plpgsql;

create or replace trigger trg_person_audit
    after insert or update or delete on person
for each row
    execute function fnc_trg_person_audit();

insert into person(id, name, age, gender, address)
values (10,'Damir', 22, 'male', 'Irkutsk');
update person set name = 'Bulat' where id = 10;
update person set name = 'Damir' where id = 10;
delete from person where id = 10;
