CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYSE
SELECT menu.pizzeria_id, menu.pizza_name FROM menu
WHERE pizzeria_id = 1 AND pizza_name = 'cheese pizza';
