/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
 Database Load Issues (follow if receiving permission denied when running SQL code below)
 
 NOTE: If you are having issues with permissions. And you get error: 
 
 'could not open file "[your file path]\job_postings_fact.csv" for reading: Permission denied.'
 
 1. Open pgAdmin
 2. In Object Explorer (left-hand pane), navigate to `sql_course` database
 3. Right-click `sql_course` and select `PSQL Tool`
 - This opens a terminal window to write the following code
 4. Get the absolute file path of your csv files
 1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
 5. Paste the following into `PSQL Tool`, (with the CORRECT file path)
 
 \copy company_dim FROM '/Users/klaugm/Desktop/KlaÜ/KlauX/SQL_Project_Data_Analysis/all_folders/csv_files/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
 
 \copy skills_dim FROM '/Users/klaugm/Desktop/KlaÜ/KlauX/SQL_Project_Data_Analysis/all_folders/csv_files/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
 
 \copy job_postings_fact FROM '/Users/klaugm/Desktop/KlaÜ/KlauX/SQL_Project_Data_Analysis/all_folders/csv_files/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
 
 \copy skills_job_dim FROM '/Users/klaugm/Desktop/KlaÜ/KlauX/SQL_Project_Data_Analysis/all_folders/csv_files/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
 
 */
-- NOTE: This has been updated from the video to fix issues with encoding
COPY company_dim
FROM '/Users/klaugm/Desktop/KlaÜ/KlauX/SQL_Project_Data_Analysis/all_folders/csv_files/company_dim.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
COPY skills_dim
FROM '/Users/klaugm/Desktop/KlaÜ/KlauX/SQL_Project_Data_Analysis/all_folders/csv_files/skills_dim.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
COPY job_postings_fact
FROM '/Users/klaugm/Desktop/KlaÜ/KlauX/SQL_Project_Data_Analysis/all_folders/csv_files/job_postings_fact.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
COPY skills_job_dim
FROM '/Users/klaugm/Desktop/KlaÜ/KlauX/SQL_Project_Data_Analysis/all_folders/csv_files/skills_job_dim.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
/*
 -- 1. PRIMERO: Tablas sin dependencias (padres)
 COPY public.company_dim(company_id, name, link, link_google, thumbnail)
 FROM '/Users/klaugm/Desktop/KlaÜ/KlauX/SQL_Project_Data_Analysis/all_folders /csv_files/company_dim.csv'
 DELIMITER ',' CSV HEADER;
 
 COPY public.skills_dim(skill_id, skills, type)
 FROM '/Users/klaugm/Desktop/KlaÜ/KlauX/SQL_Project_Data_Analysis/all_folders /csv_files/skills_dim.csv'
 DELIMITER ',' CSV HEADER;
 
 -- 2. SEGUNDO: job_postings_fact (depende de company_dim)
 COPY public.job_postings_fact(job_id, company_id, job_title_short, job_title, job_location, job_via, job_schedule_type, job_work_from_home, search_location, job_posted_date, job_no_degree_mention, job_health_insurance, job_country, salary_rate, salary_year_avg, salary_hour_avg)
 FROM '/Users/klaugm/Desktop/KlaÜ/KlauX/SQL_Project_Data_Analysis/all_folders /csv_files/job_postings_fact.csv'
 DELIMITER ',' CSV HEADER;
 
 -- 3. ÚLTIMO: skills_job_dim (depende de job_postings_fact y skills_dim)
 COPY public.skills_job_dim(job_id, skill_id)
 FROM '/Users/klaugm/Desktop/KlaÜ/KlauX/SQL_Project_Data_Analysis/all_folders /csv_files/skills_job_dim.csv'
 DELIMITER ',' CSV HEADER;
 */