/*
 Pregunta: Cuál es la más habilidad más demandada para Data Analyst?
 - Une job postings a una tabla inner join similar al query 2
 - Identifica el top 5 de habilidades demandadas para Data Analyst
 - Ubica todas los posteos de trabajo
 - Por qué? Devuelve el top 5 de habilidades con la más alta demanda en el mercado, dando retroalimentación acerca de la habiidad más valuable para los buscadores de trabajo.
 */
SELECT skills,
    COUNT(skills_job_dim.job_id) AS DEMANDA
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY DEMANDA DESC
LIMIT 5;