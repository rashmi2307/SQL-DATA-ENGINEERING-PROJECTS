USE data_jobs;

DROP DATABASE IF EXISTS job_mart;

CREATE DATABASE IF NOT EXISTS job_mart;

SHOW DATABASES;

SELECT *
FROM information_schema.schemata;

USE job_mart;

CREATE SCHEMA IF NOT EXISTS staging;

---DROP SCHEMA IF EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.preffered_roles (
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR
);

SELECT *
FROM information_schema.tables
WHERE table_catalog = 'job_mart';

DROP TABLE IF EXISTS main.preffered_roles;

INSERT INTO staging.preffered_roles (role_id,role_name)
VALUES 
    (1,'Data Engineer'),
    (2,'Senior Data Engineer'),
    (3,'Data Analyst');

SELECT *
FROM staging.preffered_roles;

ALTER TABLE staging.preffered_roles
ADD COLUMN preffered_role BOOLEAN;

-- ALTER TABLE staging.preffered_roles
-- DROP COLUMN preffered_role;

UPDATE staging.preffered_roles
SET preffered_role = TRUE
WHERE role_id = 1 OR role_id = 2;

UPDATE staging.preffered_roles
SET preffered_role = FALSE
WHERE role_id = 3;

ALTER TABLE staging.preffered_roles
RENAME TO priority_roles;

SELECT *
FROM staging.priority_roles;

ALTER TABLE staging.priority_roles
RENAME COLUMN preffered_role TO priority_lvl;

ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INTEGER;

UPDATE staging.priority_roles
SET priority_lvl = 3
WHERE role_id = 3;

