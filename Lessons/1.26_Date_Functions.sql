SELECT 
    job_posted_date,
    job_posted_date::DATE AS date,
    CAST(job_posted_date AS TIME) AS time,
    CAST(job_posted_date AS TIMESTAMP) AS timestamp,
    CAST(job_posted_date AS TIMESTAMPTZ) AS timestamptz
FROM job_postings_fact
LIMIT 10;