 WITH SupportTable AS
     (SELECT id, name, address FROM person
)
SELECT person.name AS person_name1,
       SupportTable.name AS person_name2,
       person.address as common_address
FROM person
CROSS JOIN SupportTable
WHERE person.id > SupportTable.id AND person.address = SupportTable.address
ORDER BY person.name, SupportTable.name, person.address
