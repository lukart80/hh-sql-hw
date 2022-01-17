SELECT r.vacancy_id, v.job_title
FROM response r
JOIN vacancy v on r.vacancy_id = v.vacancy_id
WHERE r.created_at - v.created_at <= 7
GROUP BY r.vacancy_id, v.job_title
HAVING count(r.vacancy_id) > 5
ORDER BY r.vacancy_id;