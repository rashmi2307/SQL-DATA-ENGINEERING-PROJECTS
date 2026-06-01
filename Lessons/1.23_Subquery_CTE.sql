-- Subquery

SELECT *
FROM (
    SELECT *
    FROM data_jobs.job_postings_fact
    WHERE salary_year_avg IS NOT NULL
        OR salary_hour_avg IS NOT NULL
) AS valid_salaries
LIMIT 10;


-- CTE 

WITH valid_salaries AS (
    SELECT *
    FROM data_jobs.job_postings_fact
    WHERE salary_year_avg IS NOT NULL
        OR salary_hour_avg IS NOT NULL
)
SELECT * FROM valid_salaries
LiMIT 10;

-- Scenario 1 - Subquery in "SELECT"
-- Show each job's salary next to the overall market median


SELECT 
    job_title_short,
    salary_year_avg,
    (
        SELECT MEDIAN(salary_year_avg)
        FROM data_jobs.job_postings_fact
    ) AS market_median_salary
FROM data_jobs.job_postings_fact
WHERE salary_year_avg IS NOT NULL
LIMIT 10;

-- Scenario 2 - Subquery in FROM
-- Stage only jobs that are remote before aggregating


SELECT 
    job_title_short,
    MEDIAN(salary_year_avg) AS median_salary,
    (
        SELECT MEDIAN(salary_year_avg)
        FROM data_jobs.job_postings_fact
        WHERE job_work_from_home = TRUE
    ) AS market_remote_median_salary
FROM (
    SELECT
    job_title_short,
    salary_year_avg
    FROM data_jobs.job_postings_fact
    WHERE job_work_from_home = TRUE
) AS clean_jobs
GROUP BY job_title_short
LIMIT 10;


-- Scenario 3 - Subquery in HAVING
-- Keep only job titles whose median salary is above the overall median


SELECT 

    job_title_short,
    MEDIAN(salary_year_avg) AS median_salary,
    (
        SELECT MEDIAN(salary_year_avg)
        FROM data_jobs.job_postings_fact
        WHERE job_work_from_home = TRUE
    ) AS market_remote_median_salary
FROM (
    SELECT
    job_title_short,
    salary_year_avg
    FROM data_jobs.job_postings_fact
    WHERE job_work_from_home = TRUE
) AS clean_jobs
GROUP BY job_title_short
HAVING MEDIAn(salary_year_avg) > (
    SELECT MEDIAN(salary_year_avg)
    FROM data_jobs.job_postings_fact
    WHERE job_work_from_home = TRUE
)
LIMIT 10;

