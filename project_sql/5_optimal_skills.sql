

    select 
    skills_dim.skill_id,
    skills_dim.skills,
    count (skills_job_dim.job_id) as demand_count,
    round (avg(job_postings_fact.salary_year_avg),0) as avg_salary
    from job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg is not null AND
        job_work_from_home = TRUE
    GROUP BY
       skills_dim.skill_id
    HAVING
        count(skills_job_dim.job_id) > 10
order BY
avg_salary DESC,
demand_count DESC
limit 25


