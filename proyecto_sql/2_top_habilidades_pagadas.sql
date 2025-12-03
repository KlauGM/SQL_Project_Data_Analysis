WITH top_trabajos_pagados AS (
    SELECT job_id,
        job_title AS NOMBRE_EMPLEO,
        salary_year_avg AS SALARIO,
        job_posted_date AS FECHA,
        name AS nombre_empresa
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_trabajos_pagados.*,
    skills AS HABILIDADES
FROM top_trabajos_pagados
    INNER JOIN skills_job_dim ON top_trabajos_pagados.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY SALARIO DESC