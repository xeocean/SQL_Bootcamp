CREATE VIEW v_generated_dates AS
    SELECT dates::date AS generated_date
        FROM generate_series('2022-01-01'::date, '2022-01-31'::date, INTERVAL '1 day')
        AS dates
ORDER BY generated_date;
