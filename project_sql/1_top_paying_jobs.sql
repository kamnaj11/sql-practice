/*
WHAT ARE THE TOP-PAYING DATA ANALYST JOBS?
-Identify the top 20 highest-paying Data Analyst roles available remotely or based in Poland.
-Focused on jobs postings with specified salaries.
-Why? To highlight the top-paying opportunities.
*/

SELECT 
    job_id,
    job_title,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst' AND
    (job_location = 'Anywhere' OR 
    job_location LIKE '%Poland%') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 20;