create table if not exists person_audit (
    created timestamp with time zone default current_timestamp not null,
    type_event char(1) default 'I' not null,
    row_id bigint not null,
    name varchar,
    age integer,
    gender varchar,
    address varchar,
    constraint ch_type_event check (type_event in ('I', 'U', 'D'))
);

create or replace function fnc_trg_person_insert_audit()
returns trigger as $$
begin
    if (TG_OP = 'INSERT') then
        insert into person_audit
        values (current_timestamp, 'I', new.id, new.name, new.age,
                new.gender, new.address);
    end if;
    return null;
end;
$$ language plpgsql;

create or replace trigger trg_person_insert_audit
    after insert on person
for each row
    execute function fnc_trg_person_insert_audit();


insert into person(id, name, age, gender, address)
values (10,'Damir', 22, 'male', 'Irkutsk');
