CREATE INDEX desired_job_idx ON cv ((lower(desired_position))); -- в бизнес логике скорее всего будут искать резюме по желаемой позиции

CREATE INDEX job_title_idx ON vacancy ((lower(job_title))); -- Вакансии чаще всего ищут по заголовку

CREATE INDEX salary_idx ON vacancy (salary_from, salary_to); -- Индексы на зарплату для аналитики зарплаты

