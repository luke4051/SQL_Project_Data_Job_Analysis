
WITH top_paying_jobs as (
SELECT
    job_id,
    job_title,
    salary_year_avg,
    name as company_name
FROM
    job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
job_title_short = 'Data Analyst' AND
job_location = 'Anywhere' AND
salary_year_avg is NOT NULL
order by
    salary_year_avg DESC
limit 10
)
select 
    top_paying_jobs.*,
    skills
from top_paying_jobs
inner join skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
order by
    salary_year_avg DESC
