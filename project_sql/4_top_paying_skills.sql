/*
WHAT ARE THE TOP SKILLS BASED ON SALARY?
-Avg salary associated with each skill for Data Analyst positions
-Specified salaries, regardless of job_location
-WHY? Shows how different skills impact salaries. Helps to identify the most financially rewarding skills.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY
    avg_salary DESC
LIMIT 20;

/*
Expertise in AI provides a consistent path to high earnings.
Niche skills like svn command the highest salaries due to their rarity.
*/