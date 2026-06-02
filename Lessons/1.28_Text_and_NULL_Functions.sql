SELECT LENGTH('SQL');
SELECT CHAR_LENGTH('SQL');

SELECT LOWER('SQL');
SELECT UPPER('sql');

SELECT LEFT('SQL',2);
SELECT RIGHT('SQL',2);
SELECT SUBSTRING('SQL',2,1);  --(string,position we want to start from, how many characters to extract)

SELECT CONCAT('SQL','-','Functions');
SELECT 'SQL'||'-'||'Functions';

SELECT TRIM(' SQL ');  -- 'SQL'
SELECT LTRIM(' SQL ');  --'SQL '
SELECT RTRIM(' SQL ');  --' SQL'

SELECT REPLACE('SQL','Q','_');
SELECT REGEXP_REPLACE('SQL','[A-Z]+','sql');

-- Final Example - Cleanup this using text Functions

WITH title_lower AS(
    SELECT
        job_title,
        LOWER(TRIM(job_title)) AS job_title_clean
    FROM job_postings_fact
)

SELECT
     job_title,
     CASE 
        WHEN job_title_clean LIKE '%data%' AND job_title_clean LIKE '%analyst%' THEN 'Data Analyst'
        WHEN job_title_clean LIKE '%data%' AND job_title_clean LIKE '%engineer%' THEN 'Data Engineer'
        WHEN job_title_clean LIKE '%data%' AND job_title_clean LIKE '%scientist%' THEN 'Data Scientist'
        ELSE 'Other'
    END AS job_title_category
FROM title_lower
ORDER BY RANDOM()
LIMIT 30;


-- NULL Functions

SELECT NULLIF(10,20);
SELECT NULLIF(10,10);
SELECT NULLIF('apple','orange');

SELECT 
    NULLIF(salary_year_avg,0),
    NULLIF(salary_hour_avg,0)
FROM 
    job_postings_fact
WHERE salary_hour_avg IS NOT NULL OR salary_year_avg IS NOT NULL
ORDER BY salary_hour_avg
LIMIT 10;

SELECT COALESCE(NULL,0,1,2);
SELECT COALESCE(NULL,NULL,2);
SELECT COALESCE(0,NULL,2);

SELECT 
    salary_year_avg,
    salary_hour_avg,
    COALESCE(salary_year_avg,salary_hour_avg *2080)
FROM 
    job_postings_fact
WHERE salary_hour_avg IS NOT NULL OR salary_year_avg IS NOT NULL
LIMIT 10;

-- Final Example - Simplicity with COALESCE

SELECT 
    job_title_short,
    salary_year_avg,
    salary_hour_avg,
    COALESCE(salary_year_avg,salary_hour_avg*2080) AS standardized_salary,
    CASE 
        WHEN COALESCE(salary_year_avg,salary_hour_avg*2080) IS NULL THEN 'Mising'
        WHEN COALESCE(salary_year_avg,salary_hour_avg*2080) <75000 THEN 'Low'
        WHEN COALESCE(salary_year_avg,salary_hour_avg*2080) < 150000 THEN 'Medium'
        ELSE 'High'
    END AS salary_bucket
FROM job_postings_fact
ORDER BY standardized_salary DESC
LIMIT 20;













