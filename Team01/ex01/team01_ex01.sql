-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT DISTINCT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    c.name AS currency_name,
    ROUND(b.money * COALESCE(
        -- Ближайший курс в прошлом
        (
            SELECT rate_to_usd
            FROM currency
            WHERE id = b.currency_id AND updated < b.updated
            ORDER BY updated DESC
            LIMIT 1
        ),
        -- Ближайший курс в будущем
        (
            SELECT rate_to_usd
            FROM currency
            WHERE id = b.currency_id AND updated > b.updated
            ORDER BY updated
            LIMIT 1
        )
    ), 3) AS currency_in_usd
FROM
    balance b
    JOIN currency c ON c.id = b.currency_id
    LEFT JOIN "user" u ON u.id = b.user_id
ORDER BY name DESC, lastname, currency_name;
