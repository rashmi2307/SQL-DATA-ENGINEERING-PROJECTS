-- ARRAY Intro
SELECT [1,2,3];

SELECT ['python','sql','r'] AS skills_array;

WITH skills AS (
    SELECT 'python' AS skill 
    UNION ALL
    SELECT 'sql' 
    UNION ALL
    SELECT 'r'
)
SELECT ARRAY_AGG(skill) AS skills_array
FROM skills;


WITH skills AS (
    SELECT 'python' AS skill 
    UNION ALL
    SELECT 'sql' 
    UNION ALL
    SELECT 'r'
)
SELECT LIST(skill) AS skills_array
FROM skills;


WITH skills AS (
    SELECT 'python' AS skill 
    UNION ALL
    SELECT 'sql' 
    UNION ALL
    SELECT 'r'
), skills_array AS (
    SELECT ARRAY_AGG(skill ORDER BY skill) AS skills
    FROM skills
)
SELECT skills[1] AS first_skill,
    skills[2] AS second_skill,
    skills[3] AS third_skill
FROM skills_array;



-- STRUCT Intro

SELECT {skill: 'python', type: 'programming'} AS skills_struct;


WITH skill_struct AS(
    SELECT 
        STRUCT_PACK(
            skill:= 'python',
            type:= 'programming'
        ) AS s
)
SELECT 
    s.skill,
    s.type
FROM skill_struct;


WITH skill_table AS (
    SELECT 'python' AS skills, 'programming' AS types
    UNION ALL
    SELECT 'sql', 'query_language'
    UNION ALL
    SELECT 'r', 'programming'
)
SELECT
    STRUCT_PACK(
        skill:=skills,
        type:=types
    )
FROM skill_table;


-- Array Of Structs

SELECT [
    {skill:'python', type:'programming'},
    {skill:'sql', type:'query_language'}
] AS skills_array_of_structs;

WITH skill_table AS (
    SELECT 'python' AS skills, 'programming' AS types
    UNION ALL
    SELECT 'sql', 'query_language'
    UNION ALL
    SELECT 'r', 'programming'
), skills_array_struct AS (
    SELECT
        ARRAY_AGG(
            STRUCT_PACK(
            skill:=skills,
            type:=types
            )
        ) array_struct
    FROM skill_table
)
SELECT 
    array_struct[1].skill, 
    array_struct[2].type, 
    array_struct[3]
FROM skills_array_struct;



















































































