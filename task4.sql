WITH max_cv AS (
    SELECT extract(month from created_at) AS cv_month
    FROM cv
    GROUP BY cv_month
    ORDER BY count(cv_id)
    LIMIT 1
),
max_vacancy AS (
    SELECT extract(month from created_at) AS vacancy_month
    FROM vacancy
    GROUP BY vacancy_month
    ORDER BY count(vacancy_id)
    LIMIT 1
)
SELECT cv_month, vacancy_month
FROM max_cv
CROSS JOIN max_vacancy;