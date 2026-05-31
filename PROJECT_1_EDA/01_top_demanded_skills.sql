/*
Question: What are the most in-demand skills for data engineers?
    - Identify the top 10 in-demand skills for data engineers
    - Focus on remote job postings
    - Why?
        - Retrieves the top 10 skills with the highest demand in the remote job market, 
        providing insights into the most valuable skills for data engineers seeking remote work
*/

SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM 
    job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd 
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
GROUP BY 
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;


/*

Key Insights
-SQL (29,221 postings) and Python (28,776 postings) are the most in-demand skills, appearing in over 60% more postings than the next-ranked skill.
-Cloud expertise is a major requirement, with AWS (17,823), Azure (14,143), and GCP (6,446) collectively appearing in thousands of remote Data Engineer job postings.
-Data processing and orchestration technologies are highly valued, with Spark (12,799) and Airflow (9,996) ranking among the most requested technical skills.
-Modern cloud data platforms such as Snowflake (8,639) and Databricks (8,183) are now core components of the data engineering ecosystem.
-The demand distribution shows that employers prioritize a combination of programming (Python, Java), database querying (SQL), cloud platforms, and big data technologies.

Takeaway: Remote Data Engineer roles are heavily concentrated around SQL, Python, cloud technologies, and scalable data platforms, indicating that these skills form the core technical stack most employers are seeking.

┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
*/