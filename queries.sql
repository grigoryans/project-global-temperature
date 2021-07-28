WITH unified AS (
    SELECT city
         , country
         , year
         , avg_temp
    FROM city_data

    UNION

    SELECT 'Global' AS city
         , 'World'  AS country
         , year
         , avg_temp
    FROM global_data
)
SELECT *
     , AVG(avg_temp) OVER (PARTITION BY city ORDER BY year) full_width_moving_avg
     , AVG(avg_temp) OVER ( PARTITION BY city ORDER BY year
    ROWS BETWEEN 10 PRECEDING AND CURRENT ROW )             ten_days_moving_average
FROM unified
;

