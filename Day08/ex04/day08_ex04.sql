-- Session 1
BEGIN ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session 2
BEGIN ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;
-- Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session 2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;
-- Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
