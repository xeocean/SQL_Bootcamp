SELECT address,
       round(max(age::numeric) - (min(age::numeric) / max(age::numeric)), 2) AS formula,
       round(avg(age::numeric), 2) AS average,
       max(age::numeric) - (min(age::numeric) / max(age::numeric)) > avg(age::numeric) AS comparison
FROM person
GROUP BY address
ORDER BY address;
