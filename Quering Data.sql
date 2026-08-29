USE employee;

INSERT INTO Departments (department_id, department_name)
VALUES
(1, 'Finance'),
(2, 'IT'),
(3, 'HR'),
(4, 'Sales'),
(5, 'Marketing');
select * from Departments;

INSERT INTO Location (location_name)
VALUES
('Hyderabad'),
('Bangalore'),
('Chennai'),
('Mumbai'),
('Delhi');
select * from Location;
INSERT INTO Employees
(employee_id, employee_name, gender, age, hire_date,
 department_id, location_id, designation, salary)
VALUES
(101, 'Ramya', 'F', 25, '2018-01-15', 1, 1, 'Financial Analyst', 55000),
(102, 'Raju', 'M', 30, '2015-03-20', 2, 2, 'Software Engineer', 65000),
(103, 'Rakhi', 'F', 27, '2018-02-10', 1, 1, 'Business Analyst', 52000),
(104, 'Revanth', 'M', 35, '2014-06-25', 2, 3, 'Data Engineer', 75000),
(105, 'Rahul', 'M', 28, '2018-03-12', 3, 4, 'HR Executive', 48000),
(106, 'Rani', 'F', 24, '2018-04-18', 4, 2, 'Sales Analyst', 51000),
(107, 'Ravi', 'M', 32, '2016-08-05', 4, 5, 'Sales Manager', 70000),
(108, 'Rekha', 'F', 29, '2018-05-22', 5, 3, 'Marketing Analyst', 58000),
(109, 'Ramesh', 'M', 40, '2013-11-10', 1, 4, 'Finance Manager', 85000),
(110, 'Riya', 'F', 26, '2019-02-14', 3, 1, 'HR Analyst', 50000),
(111, 'Raj', 'M', 31, '2017-07-19', 2, 2, 'System Analyst', 62000),
(112, 'Reshma', 'F', 23, '2018-06-30', 4, 5, NULL, 47000),
(113, 'Rohit', 'M', 36, '2012-04-11', 5, 3, 'Marketing Manager', 80000),
(114, 'Rupa', 'F', 28, '2020-01-20', 3, 4, 'HR Executive', 45000),
(115, 'Rakesh', 'M', 33, '2015-09-15', 2, 1, 'Data Analyst', 68000);

select * from employees;


#1. DISTINCT VALUES

SELECT DISTINCT salary FROM Employees;

#2. Alias (AS)
SELECT age AS Employee_Age,salary AS Employee_Salary FROM Employees;

#3. Where Clause & Operators: 

SELECT * FROM Employees WHERE salary > 50000 AND hire_date < '2016-01-01';

#Find employee whose designation is missing

SELECT * FROM Employees WHERE designation IS NULL;

#Sorting and Grouping Data: 
#1. ORDER BY:

SELECT *FROM Employees ORDER BY department_id ASC,salary DESC;

#5. LIMIT
 #First 5 employees hired in 2018
 SELECT *FROM Employees WHERE YEAR(hire_date) = 2018 ORDER BY hire_date ASC LIMIT 5;
 
 #6. AGGREGATE FUNCTIONS
  #Sum of all salaries in Finance department
  SELECT
    SUM(e.salary) AS Total_Finance_Salary
FROM Employees e
INNER JOIN Departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

#Minimum age among all employees
SELECT MIN(age) AS Minimum_Age FROM Employees;

#7. GROUP BY

#Maximum salary for each location
SELECT
    l.location_name,
    MAX(e.salary) AS Maximum_Salary
FROM Location l
LEFT JOIN Employees e
    ON l.location_id = e.location_id
GROUP BY
    l.location_id,
    l.location_name;
 #Average salary for each designation
# containing the word 'Analyst'

SELECT
    designation,
    AVG(salary) AS Average_Salary
FROM Employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

#8. HAVING
#Departments with less than 3 employees

SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS Employee_Count
FROM Departments d
LEFT JOIN Employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
HAVING COUNT(e.employee_id) < 3;

 #Locations with female employees
#whose average age is below 30

SELECT
    l.location_id,
    l.location_name,
    AVG(e.age) AS Average_Age
FROM Location AS l
INNER JOIN Employees AS e
    ON l.location_id = e.location_id
WHERE e.gender = 'F'
GROUP BY
    l.location_id,
    l.location_name
HAVING AVG(e.age) < 30;

#9. INNER JOIN
#Employee name, designation and department name

SELECT
    e.employee_name,
    e.designation,
    d.department_name
FROM Employees e
INNER JOIN Departments d
    ON e.department_id = d.department_id;
    
#10. LEFT JOIN
#All departments and total employees
#Including departments with no employees

SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS Total_Employees
FROM Departments d
LEFT JOIN Employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name;
    #11. RIGHT JOIN
#All locations and employees
# NULL if no employee is assigned
SELECT
    l.location_id,
    l.location_name,
    e.employee_name
FROM Employees e
RIGHT JOIN Location l
    ON e.location_id = l.location_id;