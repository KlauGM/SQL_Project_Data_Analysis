# Introducción

🤓 ¡Adentrándome en los datos del mercado laboral!
Este proyecto analiza:

Los trabajos mejor pagados de Data Analyst

Las habilidades más demandadas

Las tecnologías asociadas con salarios más altos

El perfil óptimo que combina demanda + salario

💻 Consultas SQL aquí:
[proyecto_sql folder](/proyecto_sql/)

## 🌍 Contexto

Este proyecto nació del interés por comprender qué habilidades impulsan el crecimiento profesional en el análisis de datos.
Para ello, se formularon preguntas clave:

¿Cuáles son los roles mejor pagados?

¿Qué habilidades requieren?

¿Cuáles son las habilidades más demandadas?

¿Qué skills están asociadas a mejores salarios?

¿Qué habilidades son estratégicas para aprender?

# ⚒️ Herramientas Utilizadas
           
| **SQL**                | Consultas y  análisis 
| **PostgreSQL**         | Base de datos        
| **Visual Studio Code** | Ejecución de queries 
| **Git & GitHub**       | Control de versiones 

Para mi análisis profundo del mercado laboral de analista de datos, utilicé varias herramientas fundamentales:

- **SQL:** La base de mi análisis, permitiéndome consultar la base de datos y obtener información crítica.
- **PostgreSQL:** El sistema gestor de bases de datos seleccionado, ideal para gestionar los datos de ofertas laborales.
- **Visual Studio Code**: Mi editor principal para la administración de bases de datos y ejecución de consultas SQL.
- **Git & GitHub**: Esenciales para el control de versiones y compartir mis scripts SQL y análisis, facilitando la colaboración y el seguimiento del proyecto.

# 🔎 El Análisis

1️⃣ Puestos de Analista de Datos Mejor Pagados
```sql
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
LIMIT 10;
```
## 📊 Insights

Salarios entre $184k y $650k USD.

Empresas destacadas: SmartAsset, Meta, AT&T.

Diversidad de roles, desde Data Analyst hasta Director of Analytics.

![Salarios Anuales Promedio](proyecto_sql/assets/Cap1.png)


### 1. Puestos de Analista de Datos con Mayor Remuneración

Para identificar los roles mejor pagados, filtré las posiciones de analista de datos según el salario promedio anual y la ubicación, con enfoque en empleos remotos. Esta consulta destaca las oportunidades de alta remuneración en el sector.

- **Rango Salarial Amplio:** Los 10 roles mejor remunerados de analista de datos oscilan entre $184,000 y $650,000, lo que indica un potencial salarial significativo en este campo.

- **Empleadores Diversos:** Compañías como SmartAsset, Meta y AT&T están entre las que ofrecen salarios altos, demostrando un interés generalizado en distintas industrias.

- **Variedad en Títulos:** Existe una alta diversidad en los títulos de trabajo, desde Analista de Datos hasta Director de Analítica, reflejando roles variados y especializaciones dentro de la analítica de datos.

### 2️⃣ Habilidades Mejor Pagadas

| Skill         | Salario  |
| ------------- | -------- |
| **SVN**       | $400,000 |
| **Solidity**  | $179,000 |
| **Couchbase** | $160,515 |

Promedio del Top 10: $168,000 USD

![Habilidades con Mayor Salario](proyecto_sql/assets/Cap2.png)

```sql
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
```
### 3️⃣ Habilidades Más Solicitadas

| Habilidad    | Menciones |
| ------------ | --------- |
| **SQL**      | 7,291     |
| **Excel**    | 4,611     |
| **Python**   | 4,330     |
| **Tableau**  | 3,745     |
| **Power BI** | 2,609     |

🔎 SQL es la habilidad más dominante del mercado.

![Habilidades mas Solicitadas](proyecto_sql/assets/Cap3.png)

```sql
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
```

### 4️⃣ Habilidades Mejor Pagadas en Promedio
| Skill     | Salario |
| --------- | ------- |
| SVN       | $400k   |
| Solidity  | $179k   |
| Couchbase | $160k   |
| DataRobot | $155k   |
| GoLang    | $155k   |

```sql
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
```

### 5️⃣ Habilidades Óptimas (Demanda + Salario)

| Skill         | Demanda | Salario  | Insight                  |
| ------------- | ------- | -------- | ------------------------ |
| **Snowflake** | 37      | $112,948 | Muy bien pagada          |
| **Azure**     | 34      | $111,225 | Alta demanda             |
| **AWS**       | 32      | $108,317 | Estándar de la industria |

### 🎯 Skills estratégicos

Python → 236 menciones / $101k

R → 148 menciones / $100k

Cloud (AWS, Azure, Snowflake) → salarios premium

➡️ Combinación recomendada:
Python + SQL + Cloud + BI

```sql
SELECT skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS DEMANDA,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY avg_salary DESC,
    DEMANDA DESC
LIMIT 25
```

## 💡Lo que Aprendí

🛠️ Consultas avanzadas: Joins, subqueries, CTEs (WITH).
📊 Agregaciones: COUNT(), AVG(), GROUP BY.

🧠 Pensamiento analítico: Resolver problemas basados en datos reales del mercado laboral.

### 📄 Conclusiones

Este proyecto no solo fortaleció mis habilidades en SQL, sino que también me brindó una visión profunda del mercado laboral de analistas de datos.

Principales aprendizajes:

El mercado es altamente competitivo, pero lleno de oportunidades.

Las habilidades clave combinan demanda + salario.

La actualización constante es esencial en análisis de datos.

✨ Este análisis me permitió priorizar mi aprendizaje y orientar 
mi desarrollo hacia habilidades estratégicas del mercado.

# 💻 Contacto

📧 claugmart@gmail.com

🔗 www.linkedin.com/in/claudia-gm-700360269