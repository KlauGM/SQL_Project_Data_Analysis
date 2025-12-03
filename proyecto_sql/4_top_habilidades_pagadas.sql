/*
 Responde: Cuáles son las habilidades top basadas en salario?
 - Identifica el salario promedio asociado a cada una de las habilidades para Data Analyst
 - Concentra en roles con salarios específicos, sin importar la ubicación
 - Por qué? Revela cuán diferente las habilidades impactan el nivel de salario para Data Analyst y ayuda a identificar la mejor compensa económica para mejorar
 */
SELECT skills,
    ROUND(AVG(salary_year_avg), 0) AS SALARIO_PROMEDIO
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL --AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY SALARIO_PROMEDIO DESC
LIMIT 25;