SELECT *
FROM financialinclusiondataset


---- --------------------------------------------------------------------
-- ------------------Data Exploration------------------------------
-- --------------------------------------------------------------------
--What is the overall distribution of respondents across different countries?

SELECT country, COUNT(*) AS total_respondents
FROM financialinclusiondataset
GROUP BY country
ORDER BY total_respondents DESC;

--How is the surveyed population distributed across various age groups?

SELECT age_of_respondent, COUNT(*) AS total_respondents
FROM financialinclusiondataset
GROUP BY age_of_respondent
ORDER BY age_of_respondent;

--What is the distribution of respondents based on their household size?

SELECT household_size, COUNT(*) AS total_respondents
FROM financialinclusiondataset
GROUP BY household_size
ORDER BY household_size;

--How is the education level distributed among the respondents?

SELECT education_level, COUNT(*) AS total_respondents
FROM financialinclusiondataset
GROUP BY education_level
ORDER BY total_respondents DESC;

-- ---- --------------------------------------------------------------------
-- ------------------Descriptive Statistics------------------------------
-- --------------------------------------------------------------------
--What are the mean, median, and mode of the age of respondents?

SELECT AVG(age_of_respondent) AS mean_age,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY age_of_respondent) AS median_age,
       MODE() WITHIN GROUP (ORDER BY age_of_respondent) AS mode_age
FROM financialinclusiondataset;

--What are the mean, median, and mode of the household size?

SELECT AVG(household_size) AS mean_household_size,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY household_size) AS median_household_size,
       MODE() WITHIN GROUP (ORDER BY household_size) AS mode_household_size
FROM financialinclusiondataset;

--What is the distribution of education levels among the surveyed population?

SELECT education_level, COUNT(*) AS total_respondents
FROM financialinclusiondataset
GROUP BY education_level
ORDER BY total_respondents DESC;

--What is the gender distribution among the respondents?

SELECT gender_of_respondent, COUNT(*) AS total_respondents
FROM financialinclusiondataset
GROUP BY gender_of_respondent;

--What is the marital status distribution among the respondents?

SELECT marital_status, COUNT(*) AS total_respondents
FROM financialinclusiondataset
GROUP BY marital_status;

-- ---- --------------------------------------------------------------------
-- ------------------Financial Inclusion Analysis------------------------------
-- --------------------------------------------------------------------
--What percentage of respondents have a bank account?

SELECT ROUND(100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percentage_with_bank_account
FROM financialinclusiondataset;

--How does bank account ownership vary between rural and urban areas?

SELECT location_type,
       COUNT(*) AS total_respondents,
       SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) AS respondents_with_bank_account,
       ROUND(100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percentage_with_bank_account
FROM financialinclusiondataset
GROUP BY location_type;

--What is the correlation between cellphone access and bank account ownership?

SELECT cellphone_access,
       COUNT(*) AS total_respondents,
       SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) AS respondents_with_bank_account,
       ROUND(100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percentage_with_bank_account
FROM financialinclusiondataset
GROUP BY cellphone_access;

--How does the prevalence of bank accounts differ across different countries?

SELECT country,
       COUNT(*) AS total_respondents,
       SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) AS respondents_with_bank_account,
       ROUND(100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percentage_with_bank_account
FROM  financialinclusiondataset
GROUP BY country
ORDER BY percentage_with_bank_account DESC;

-- -- ---- --------------------------------------------------------------------
-- ------------------Demographic Insights------------------------------
-- --------------------------------------------------------------------
--What is the gender distribution of respondents with and without bank accounts?

SELECT gender_of_respondent,
       SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) AS respondents_with_bank_account,
       SUM(CASE WHEN bank_account = 'No' THEN 1 ELSE 0 END) AS respondents_without_bank_account
FROM financialinclusiondataset
GROUP BY gender_of_respondent;

--How does marital status impact bank account ownership?

SELECT marital_status,
       COUNT(*) AS total_respondents,
       SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) AS respondents_with_bank_account,
       ROUND(100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percentage_with_bank_account
FROM financialinclusiondataset
GROUP BY marital_status
ORDER BY percentage_with_bank_account DESC;

--How does the relationship with the head of the household affect bank account ownership?

SELECT relationship_with_head,
       COUNT(*) AS total_respondents,
       SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) AS respondents_with_bank_account,
       ROUND(100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percentage_with_bank_account
FROM  financialinclusiondataset
GROUP BY relationship_with_head
ORDER BY percentage_with_bank_account DESC;

-- -- ---- --------------------------------------------------------------------
-- ------------------Education and Employment------------------------------
-- --------------------------------------------------------------------
--How does the level of education influence bank account ownership?

SELECT education_level,
       COUNT(*) AS total_respondents,
       SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) AS respondents_with_bank_account,
       ROUND(100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percentage_with_bank_account
FROM financialinclusiondataset
GROUP BY education_level
ORDER BY percentage_with_bank_account DESC;

--What are the most common job types among the respondents?

SELECT job_type, COUNT(*) AS total_respondents
FROM financialinclusiondataset
GROUP BY job_type
ORDER BY total_respondents DESC;

--How does employment type correlate with bank account ownership?

SELECT job_type,
       COUNT(*) AS total_respondents,
       SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) AS respondents_with_bank_account,
       ROUND(100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percentage_with_bank_account
FROM  financialinclusiondataset
GROUP BY job_type
ORDER BY percentage_with_bank_account DESC;

-- -- ---- --------------------------------------------------------------------
-- ------------------Feature Engineering------------------------------
-- --------------------------------------------------------------------
--Can we create age groups to better understand the distribution of financial behaviors?

SELECT CASE
           WHEN age_of_respondent BETWEEN 18 AND 25 THEN '18-25'
           WHEN age_of_respondent BETWEEN 26 AND 35 THEN '26-35'
           WHEN age_of_respondent BETWEEN 36 AND 45 THEN '36-45'
           WHEN age_of_respondent BETWEEN 46 AND 55 THEN '46-55'
           WHEN age_of_respondent > 55 THEN '56+'
       END AS age_group,
       COUNT(*) AS total_respondents,
       SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) AS respondents_with_bank_account,
       ROUND(100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percentage_with_bank_account
FROM financialinclusiondataset
GROUP BY age_group
ORDER BY age_group;

--Can we create binary indicators for specific conditions, such as having a bank account or cellphone access, to enhance analysis?

SELECT *,
       CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END AS has_bank_account,
       CASE WHEN cellphone_access = 'Yes' THEN 1 ELSE 0 END AS has_cellphone_access
FROM financialinclusiondataset;

-- -- -- ---- --------------------------------------------------------------------
-- ------------------Time-based Analysis------------------------------
-- --------------------------------------------------------------------
--How has the percentage of respondents with bank accounts changed over the years?

SELECT year_,
       COUNT(*) AS total_respondents,
       SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) AS respondents_with_bank_account,
       ROUND(100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percentage_with_bank_account
FROM financialinclusiondataset
GROUP BY year_
ORDER BY year_;

--How have the key indicators (age, household size, education level) evolved over time?

-- The subquery fi_inner is used to calculate the most common education level for each year.
-- The alias fi_outer is used for the outer query to avoid any ambiguity.
SELECT year_,
       AVG(age_of_respondent) AS average_age,
       AVG(household_size) AS average_household_size,
       (SELECT education_level 
        FROM financialinclusiondataset fi_inner
        WHERE fi_inner.year_ = fi_outer.year_
        GROUP BY education_level
        ORDER BY COUNT(*) DESC
        LIMIT 1) AS most_common_education_level
FROM financialinclusiondataset fi_outer
GROUP BY year_
ORDER BY year_;

--Are there any noticeable trends in financial inclusion when comparing different years of survey data?

SELECT year_,
       ROUND(100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS percentage_with_bank_account,
       ROUND(100.0 * SUM(CASE WHEN location_type = 'Rural' AND bank_account = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN location_type = 'Rural' THEN 1 ELSE 0 END), 2) AS rural_percentage_with_bank_account,
       ROUND(100.0 * SUM(CASE WHEN location_type = 'Urban' AND bank_account = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN location_type = 'Urban' THEN 1 ELSE 0 END), 2) AS urban_percentage_with_bank_account
FROM financialinclusiondataset
GROUP BY year_
ORDER BY year_;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
































