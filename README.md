
# Financial Inclusion in Africa

A brief description of what this project does and who it's for


## Time Period of the Project.
The dataset covers Financial inclusion data from 2016 to 2018.
## About
The Financial Inclusion in Africa project is a comprehensive exploration of the social economic landscape in various African counties in this case Kenya, Rwanda, Tanzania and Uganda, with a focus on understanding the dynamics of financial inclusion among diverse communities. Leveraging SQL queries and data analysis techniques, this project aims to shed light on the factors influencing access to financial services and the impact of such access on individuals and households.The dataset was obtained from https://www.kaggle.com/datasets/dhiebtarak/financial-inclusion-in-africa.




## Objectives 

1. **Data Exploration:** Uncover insights into the financial behaviors and demographics of respondents in the dataset.

2. **Descriptive Statistics:** Provide a detailed overview of key indicators such as age, household size, and education level among the surveyed population.

3. **Financial Inclusion Analysis:** Investigate the prevalence of bank accounts, the influence of location types (rural/urban), and the correlation with cellphone access.

4. **Demographic Insights:** Examine the distribution of gender, marital status, and relationships with the head of the household.

5. **Education and Employment:** Analyze the educational background and job types prevalent among respondents.

6. **Feature Engineering:** Create new features to enhance analysis, such as age groups or binary indicators for specific conditions.

7. **Time-based Analysis:** Explore trends in financial inclusion and related factors over the years.

## Key Findings

The project aims to uncover actionable insights into the challenges and opportunities surrounding financial inclusion in Africa. By combining SQL queries, descriptive statistics, and feature engineering, I hope to contribute valuable information for policymakers, financial institutions, and organizations working towards fostering economic inclusion and development across the continent.

## About the Data 
The dataset was obtained from https://www.kaggle.com/datasets/dhiebtarak/financial-inclusion-in-africa. This dataset contains information about financial inclusion in four african countries Kenya, Rwanda, Tanzania and Uganda. The data contains 13 columns and 23,525 rows:

| Column | Description | Data type |
|----------|----------|----------|
| Country | Name of the Country | VARCHAR(8) |
| Year  | The year in question | INTEGER |
|Uniqueid |The unique identifier |VARCHAR(15)|
|Bank_account | To indicate if they have an account or not | BOOLEAN |
|Location_type | Rural or urban location | VARCHAR(8) |
|Cellphone_access | To show if they have a phone or not | BOOLEAN |
|Household_size | Number of people in the house | INTEGER |
|Age_of_respondent | To show the Age | INTEGER |
|Gender_of_respondent | To indicate the Gender | VARCHAR(6) |
|Relationship_with_head | To show the relationship | VARCHAR(20) |
|Marital_status | Relationship status | VARCHAR(10) |
|Education_level | The level of education | VARCHAR(20) |
|Job_type | To show the type of employment | VARCHAR(30) |

## Questions to answer

### Data Exploration

1. What is the overall distribution of respondents across different countries?
2. How is the surveyed population distributed across various age groups?
3. What is the distribution of respondents based on their household size?
4. How is the education level distributed among the respondents?

### Descriptive Statistics

5. What are the mean, median, and mode of the age of respondents?
6. What are the mean, median, and mode of the household size?
7. What is the distribution of education levels among the surveyed population?
8. What is the gender distribution among the respondents?
9. What is the marital status distribution among the respondents?

### Financial Inclusion Analysis

10. What percentage of respondents have a bank account?
11. How does bank account ownership vary between rural and urban areas?
12. What is the correlation between cellphone access and bank account ownership?
13. How does the prevalence of bank accounts differ across different countries?

### Demographic Insights

14. What is the gender distribution of respondents with and without bank accounts?
15. How does marital status impact bank account ownership?
16. How does the relationship with the head of the household affect bank account ownership?

### Education and Employment

17. How does the level of education influence bank account ownership?
18. What are the most common job types among the respondents?
19. How does employment type correlate with bank account ownership?

### Feature Engineering

20. Can we create age groups to better understand the distribution of financial behaviors?
21. Can we create binary indicators for specific conditions, such as having a bank account or cellphone access, to enhance analysis?

### Time-based Analysis

22. How has the percentage of respondents with bank accounts changed over the years?
23. How have the key indicators (age, household size, education level) evolved over time?
24. Are there any noticeable trends in financial inclusion when comparing different years of survey data?

## Tools Used
- PostgreSQL
- Microsoft Excel
