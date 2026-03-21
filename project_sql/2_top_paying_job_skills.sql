/*
WHAT SKILLS ARE REQUIRED FOR THE TOP-PAYING DATA ANALYST JOBS?
-uses the top 20 highest-paying Data Analyst jobs from the first query
-adds the specific skills needed for these roles
-WHY? To provide a look into top-paying skills, answers the question: which skills should I develop?
*/

WITH top_paying_jobs AS(
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
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
    LIMIT 20
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC

--Analysis Result Image: project_sql\skill_count.png
/*
SQL and Python are both tied for the most requested skill, appearing in roughly 12% of the listings each.
Tableau is more popular than other visualization tools.
*/
