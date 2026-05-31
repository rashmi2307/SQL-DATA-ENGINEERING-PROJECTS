/*
Question: What are the highest-paying skills for data engineers?
    - Calculate the median salary for each skill required in data engineer positions
    - Focus on remote positions with specified salaries
    - Include skill frequency to identify both salary and demand
    - Why?
        -Help identify which skills command the highest compensation while also showing how common those skills are, providing a more complete picture for skill development priorities.
        -The median is used instead of the average to reduce the impact of outlier salaries.
*/


SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
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
HAVING
    COUNT(jpf.*)>100
ORDER BY 
    median_salary DESC
LIMIT 25;

/*

Key Insights
-Highest median salary: Rust ($210K)
-Strong salary + demand: Terraform ($184K, 3,248 postings), Kubernetes ($150.5K, 4,202 postings), Airflow ($150K, 9,996 postings)
-Highest demand among top-paying skills: Airflow (9,996 postings)
-High-paying niche skills: Neo4j ($170K), GraphQL ($167.5K), FastAPI ($157.5K)
-Cloud/DevOps tools dominate top salaries: Terraform, Kubernetes, Ansible, Redis
-Infrastructure-focused skills consistently earn above $148K median salaries
-Salary premiums are highest for specialized, lower-supply skills (Rust, Neo4j, GraphQL)

Takeaway: Terraform, Kubernetes, and Airflow offer the strongest combination of high pay and high market demand.

┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ golang     │      184000.0 │          912 │
│ terraform  │      184000.0 │         3248 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ django     │      155000.0 │          265 │
│ bitbucket  │      155000.0 │          478 │
│ crystal    │      154224.0 │          129 │
│ atlassian  │      151500.0 │          249 │
│ c          │      151500.0 │          444 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ ruby       │      150000.0 │          736 │
│ css        │      150000.0 │          262 │
│ airflow    │      150000.0 │         9996 │
│ node       │      150000.0 │          179 │
│ redis      │      149000.0 │          605 │
│ ansible    │      148798.0 │          475 │
│ vmware     │      148798.0 │          136 │
│ jupyter    │      147500.0 │          400 │
└────────────┴───────────────┴──────────────┘
*/