/*
WHAT ARE THE MOST IN-DEMAND SKILLS FOR DATA ANALYSIS?
-Identifies the top 5 in-demand skills for data analyst.
-All job postings
-WHY? Retrives the top 5 skills in the whole market.
*/

SELECT 
    skills
    count(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 5