SELECT DISTINCT name, lastname, type, SUM(money) AS volume, 
				currency_name, last_rate_to_usd, (SUM(money) * last_rate_to_usd) AS total_volume_in_usd
FROM (
  SELECT DISTINCT COALESCE(us.name, 'not defined') AS name, COALESCE(us.lastname, 'not defined') AS lastname,
		 bal.type, bal.money, COALESCE(cur.name, 'not defined') AS currency_name,
		 COALESCE(LAST_VALUE(cur.rate_to_usd) OVER (PARTITION BY cur.id), 1) AS last_rate_to_usd
  FROM "user" us
  FULL JOIN balance bal ON bal.user_id = us.id
  FULL JOIN currency cur ON bal.currency_id = cur.id
) 
GROUP BY name, lastname, type, currency_name, last_rate_to_usd
ORDER BY name desc, lastname, type;

