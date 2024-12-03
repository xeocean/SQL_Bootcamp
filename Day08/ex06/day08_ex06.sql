-- Session 1
BEGIN ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session 2
BEGIN ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session 1
SELECT sum(rating) FROM pizzeria;
-- Session 2
INSERT INTO pizzeria VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;
-- Session 1
SELECT sum(rating) FROM pizzeria;
COMMIT;
SELECT sum(rating) FROM pizzeria;
-- Session 2
SELECT sum(rating) FROM pizzeria;
