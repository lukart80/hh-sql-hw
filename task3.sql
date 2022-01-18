SELECT
    area_id,
    round(avg(salary_from)) AS avg_from,
    round(avg(salary_to)) AS avg_to,
    round(avg((salary_to + salary_from)/2)) AS avg_from_to
FROM vacancy
GROUP BY area_id;