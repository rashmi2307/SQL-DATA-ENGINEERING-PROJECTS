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



















