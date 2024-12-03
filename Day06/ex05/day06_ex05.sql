COMMENT ON TABLE person_discounts  IS 'Таблица о скидках поситителей в разных пицериях';
COMMENT ON COLUMN person_discounts.id IS 'Первичный ключ';
COMMENT ON COLUMN person_discounts.person_id IS 'Внешний ключ с таблицей person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Внешний ключ с таблицей pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки (в процентах)';