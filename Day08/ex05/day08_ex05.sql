-- Session 1
BEGIN ISOLATION LEVEL READ COMMITTED;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session 2
BEGIN ISOLATION LEVEL READ COMMITTED;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session 1
SELECT sum(rating) FROM pizzeria;
-- Session 2
INSERT INTO pizzeria VALUES (10, 'Kazan Pizza', 5);
COMMIT;
-- Session 1
SELECT sum(rating) FROM pizzeria;
COMMIT;
SELECT sum(rating) FROM pizzeria;
-- Session 2
SELECT sum(rating) FROM pizzeria;
