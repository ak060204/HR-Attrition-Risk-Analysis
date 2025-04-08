CREATE DATABASE hr_project;
USE hr_project;

select * from hrdata;

#Changing Column name from Ï»¿emp_no to emp_no
alter table hrdata
change column Ï»¿emp_no emp_no varchar(20) not null;

#Employee Count:
select sum(employee_count) as Employee_Count from hrdata;

#Attrition Count:
select count(attrition) from hrdata where attrition='Yes';

#Attrition Rate:
select 
round (((select count(attrition) from hrdata where attrition='Yes')/ 
sum(employee_count)) * 100,2) as Attrition_rate
from hrdata;

#Active Employee:
select sum(employee_count) - (select count(attrition) from hrdata  where attrition='Yes') as Active_Employee from hrdata;

#Average Age:
select round(avg(age),0) as avg_age from hrdata;

#Attrition by Gender
select gender, count(attrition) as attrition_count from hrdata
where attrition='Yes'
group by gender
order by count(attrition) desc;

#Department wise Attrition
SELECT 
    department, 
    COUNT(*) AS total_attritions, 
    ROUND((COUNT(*) * 100.0) / total_attritions.total, 2) AS percentage
FROM 
    hrdata,
    (SELECT COUNT(*) AS total FROM hrdata WHERE attrition = 'Yes') AS total_attritions
WHERE 
    attrition = 'Yes'
GROUP BY 
    department, total_attritions.total
ORDER BY 
    total_attritions DESC;
    
#No of Employee by Age Group
SELECT age,  sum(employee_count) AS employee_count FROM hrdata
GROUP BY age
order by age;

#Education Field wise Attrition:
select education_field, count(attrition) as attrition_count from hrdata
where attrition='Yes'
group by education_field
order by count(attrition) desc;

#Attrition Rate by Gender for different Age Group
SELECT 
    age_band, 
    gender, 
    COUNT(*) AS attrition, 
    ROUND((COUNT(*) * 100.0) / total_attrition.total, 2) AS percentage
FROM 
    hrdata,
    (SELECT COUNT(*) AS total FROM hrdata WHERE attrition = 'Yes') AS total_attrition
WHERE 
    attrition = 'Yes'
GROUP BY 
    age_band, gender, total_attrition.total
ORDER BY 
    age_band, gender DESC;
    
#Job Satisfaction Rating
SELECT 
    job_role,
    SUM(CASE WHEN job_satisfaction = 1 THEN employee_count ELSE 0 END) AS `1`,
    SUM(CASE WHEN job_satisfaction = 2 THEN employee_count ELSE 0 END) AS `2`,
    SUM(CASE WHEN job_satisfaction = 3 THEN employee_count ELSE 0 END) AS `3`,
    SUM(CASE WHEN job_satisfaction = 4 THEN employee_count ELSE 0 END) AS `4`,
    -- Totals column
    SUM(employee_count) AS total
FROM 
    hrdata
GROUP BY 
    job_role
ORDER BY 
    job_role;
    
#Cost of Attrition Calculation    
SELECT 
    department,
    count(attrition) AS attrition_count,
    round((count(attrition) * 10000), 2) AS cost_of_attrition -- Assuming $10K per employee lost
FROM hrdata
WHERE attrition = 'Yes'
GROUP BY department
ORDER BY cost_of_attrition DESC;

## Attrition Risk Scoring
SELECT 
    emp_no,
    job_role,
    department,
    age,
    job_satisfaction,
    CASE 
        WHEN job_satisfaction <= 2 AND age BETWEEN 25 AND 34 THEN 'High Risk'
        WHEN job_satisfaction <= 3 AND department = 'R&D' THEN 'Medium Risk'  -- R&D has highest attrition
        WHEN education_field = 'Life Sciences' AND gender = 'Female' THEN 'Medium Risk'  -- our data shows this group is vulnerable
        ELSE 'Low Risk'
    END AS attrition_risk
FROM hrdata
WHERE attrition = 'No'  -- Focus on active employees
ORDER BY attrition_risk DESC;













