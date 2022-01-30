CREATE TABLE specialization (
    specialization_id serial primary key,
    specialization_name text not null
);

CREATE TABLE cv (
    cv_id serial primary key,
    first_name text not null,
    last_name text not null,
    phone int not null,
    desired_position text not null,
    years_experience int not null,
    education text,
    work_experience text,
    expected_salary int,
    specialization_id int references specialization(specialization_id) not null,
    created_at date default current_date
);

CREATE TABLE vacancy (
    vacancy_id serial primary key,
    company_name text not null,
    job_title text not null,
    required_experience int not null,
    job_description text not null,
    salary_from int not null,
    salary_to int not null,
    salary_gross bool not null,
    specialization_id int references specialization(specialization_id) not null,
    area_id int not null,
    created_at date default current_date
);

CREATE TABLE response (
    response_id serial primary key,
    vacancy_id int references vacancy(vacancy_id),
    cv_id int references cv(cv_id),
    cover_letter text,
    created_at date default current_date

);