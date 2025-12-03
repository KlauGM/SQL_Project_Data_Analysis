/*
 Pregunta: Cuáles son top-mejores-trabajos-pagados como Data Analyst?
 - Identifica los 10-mejores-pagados como Data Analyst de forma remota
 - Ubica los posteos de trabajos con salarios específicos (remueve nulos)
 - Por qué? Resalta las oportunidades-mejor-pagadas para Data Analyst, y da retroalimentación del empleo.
 */
SELECT job_id,
    job_title AS NOMBRE_EMPLEO,
    job_location AS UBICACION,
    job_schedule_type AS TIPO_EMPLEO,
    salary_year_avg,
    job_posted_date AS FECHA,
    name AS nombre_empresa
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10