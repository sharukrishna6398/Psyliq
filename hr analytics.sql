use hr_analytics;
select*from hr_tb;
create table hr_tb1(emp_name varchar(200),age int,attrition varchar(200),
Business_travel varchar(200),Department varchar(200),
Distance_from_home int,Education int,Education_field varchar(200),
employee_count int,empoyee_id int,gender varchar (200),job_level int,
job_role varchar(200),marital_status varchar(200),monthly_income int,
no_of_companies_worked int,over_18 varchar(200),percent_salary_hike int,
standard_hours int,stock_option_level int,total_working_years int,
training_times_last_year int,years_at_company int,
years_since_last_promotion int,years_with_current_manager int);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\General Data.csv'
INTO TABLE hr_tb1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
Create table hr_tb2(Employee_ID int,Job_Involvement int,Performance_Rating int,	Environment_Satisfaction int,Job_Satisfaction int,Work_Life_Balance int);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\survey_data.csv'
INTO TABLE hr_tb2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(Empoyee_id) As no_of_Employees FROM hr_tb1;

SELECT DISTINCT(Job_Role) FROM hr_tb1;

SELECT AVG(Age) FROM hr_tb1;

SELECT emp_name, Age
FROM hr_tb1
WHERE Years_At_Company > 5;

SELECT COUNT(empoyee_id),Department FROM hr_tb1 GROUP BY 
Department;

SELECT hr_tb1.Empoyee_iD,Emp_Name,hr_tb2.Job_Satisfaction 
FROM hr_tb1 JOIN hr_tb2 ON hr_tb1.Empoyee_iD = 
hr_tb2.Employee_ID ORDER BY Job_Satisfaction DESC;

SELECT MAX(Monthly_Income) FROM hr_tb1;


SELECT Emp_Name FROM hr_tb1 WHERE Business_Travel IN 
('Travel_Rarely');

SELECT DISTINCT(Marital_Status) FROM hr_tb1;


SELECT Emp_Name FROM hr_tb1 WHERE Total_Working_Years IN(2,4);


SELECT Emp_Name 
FROM hr_tb1 
WHERE Job_Level != Job_Role 
LIMIT 0, 50000;


SELECT Department,AVG(Distance_From_HOME)AS Avg_Distance FROM 
hr_tb1 GROUP BY Department;


SELECT Monthly_Income, Emp_Name 
FROM hr_tb1 
ORDER BY Monthly_Income DESC 
LIMIT 5;


SELECT COUNT(*)*100/(SELECT COUNT(*) FROM hr_tb1) AS 
Promotion_percentage FROM hr_tb1 WHERE Years_Since_Last_Promotion=1;


SELECT Employee_ID,Environment_Satisfaction AS High_Environment_Satisfaction 
FROM hr_tb2 Where Environment_Satisfaction = 4 
UNION ALL
SELECT Employee_ID,Environment_Satisfaction AS Low_Environment_Satisfaction 
FROM hr_tb2 Where Environment_Satisfaction = 1 ;



SELECT a.empoyee_id, a.job_role, b.job_role, a.marital_status, b.marital_status from 
hr_tb1 a join hr_tb1 b on a.Empoyee_ID=b.Empoyee_ID
where a.Job_Role=b.job_role and a. Marital_Status=b.Marital_Status;


SELECT hr_tb1.Empoyee_ID,hr_tb1.Total_Working_Years,
Performance_Rating FROM hr_tb1 JOIN hr_tb2 ON 
hr_tb1.Empoyee_ID =hr_tb2.Employee_ID WHERE 
hr_tb2.Performance_Rating=4
ORDER BY hr_tb1.Total_Working_Years DESC ;


select distinct Business_travel,avg(age)over(partition by Business_travel)as avgage from hr_tb1;


SELECT Education_Field FROM hr_tb1 GROUP BY Education_Field ORDER 
BY Education_Field DESC;

SELECT Empoyee_ID,MAX(Years_At_Company)AS Max_no_of_years FROM 
hr_tb1 WHERE Years_Since_Last_Promotion =0 GROUP BY Empoyee_ID 
ORDER BY Max_no_of_years DESC ;








