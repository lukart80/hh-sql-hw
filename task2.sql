INSERT INTO specialization(specialization_name)
VALUES
    ('IT'),
    ('Бухгалтерия'),
    ('Юриспруденция'),
    ('Маркетинг'),
    ('PR');

INSERT INTO cv (
                first_name,
                last_name,
                phone,
                desired_position,
                years_experience,
                education,
                work_experience,
                expected_salary,
                specialization_id)
SELECT
       md5(random()::text),
       md5(random()::text),
       floor(random()*(10000000-1000000+1)+1000000),
       md5(random()::text),
       floor(random()*(10)),
       md5(random()::text),
       md5(random()::text),
       floor(random()*(100000-30000+1)+30000),
       floor(random()*5+1)
FROM generate_series(1, 100000) s(i);

WITH vacancy_data(
    company_name,
    job_title,
    required_experience,
    job_description,
    salary_from,
    salary_gross,
    specialization_id,
    area_id,
    created_at
    ) AS (
        SELECT
            md5(random()::text) AS company_name,
            md5(random()::text) AS job_title,
            floor(random()*9) AS required_experience,
            md5(random()::text) AS job_description,
            floor(random()*(70000-30000+1)+30000) AS salary_from,
            true,
            floor(random()*5+1) AS specialization_id,
            floor(random()*5+1) AS area_id,
            DATE '2013-01-01' AS created_at
        FROM generate_series(1, 1000) s(i)
)
INSERT INTO vacancy(
    company_name,
    job_title,
    required_experience,
    job_description,
    salary_from,
    salary_to,
    salary_gross,
    specialization_id,
    area_id,
    created_at
)
SELECT
    company_name,
    job_title,
    required_experience,
    job_description,
    salary_from,
    salary_from+10000,
    salary_gross,
    specialization_id,
    area_id,
    created_at
FROM vacancy_data;

INSERT INTO response(
    vacancy_id, cv_id, created_at
)
SELECT
    floor(random()*9+1),
    floor(random()*1000+1),
    DATE '2013-01-01' + floor(random()*20) * INTERVAL '1 day'
FROM generate_series(1, 300);














