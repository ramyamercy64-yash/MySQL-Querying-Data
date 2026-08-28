# MySQL  – Querying Data

## 📌 Project Overview

This project demonstrates **SQL querying techniques in MySQL** using the Employee database created in Assignment 1.

The assignment focuses on retrieving, filtering, sorting, grouping, aggregating, and joining employee data.

## 🛠️ Tools Used

* MySQL
* MySQL Workbench
* SQL

## 🗄️ Database

**Database Name:** `employee`

## 📋 Tables Used

The assignment uses the following tables:

* `Employees`
* `Departments`
* `Location`

## 🔍 SQL Concepts Covered

### 1. DISTINCT

Used to retrieve unique salary values.

```sql
SELECT DISTINCT salary
FROM Employees;
```

### 2. ALIAS — AS

Used to give meaningful names to columns.

```sql
SELECT
    age AS Employee_Age,
    salary AS Employee_Salary
FROM Employees;
```

### 3. WHERE Clause

Used to filter employees based on conditions.

```sql
SELECT *
FROM Employees
WHERE salary > 50000
AND hire_date < '2016-01-01';
```

### 4. NULL Values

Used to find employees whose designation is missing.

```sql
SELECT *
FROM Employees
WHERE designation IS NULL;
```

The missing designation can be updated using:

```sql
UPDATE Employees
SET designation = 'Data Scientist'
WHERE designation IS NULL;
```

## 📊 Sorting and Grouping

### ORDER BY

Employees are sorted by department ID in ascending order and salary in descending order.

```sql
SELECT *
FROM Employees
ORDER BY department_id ASC,
         salary DESC;
```

### LIMIT

Displays the first 5 employees hired in 2018.

```sql
SELECT *
FROM Employees
WHERE YEAR(hire_date) = 2018
ORDER BY hire_date ASC
LIMIT 5;
```

## 📈 Aggregate Functions

The assignment uses:

* `SUM()` – Total salary
* `MIN()` – Minimum age
* `MAX()` – Maximum salary
* `AVG()` – Average salary
* `COUNT()` – Number of employees

Example:

```sql
SELECT MIN(age) AS Minimum_Age
FROM Employees;
```

## 📦 GROUP BY

### Maximum Salary by Location

```sql
SELECT
    l.location_name,
    MAX(e.salary) AS Maximum_Salary
FROM Location l
LEFT JOIN Employees e
    ON l.location_id = e.location_id
GROUP BY
    l.location_id,
    l.location_name;
```

### Average Salary of Analysts

```sql
SELECT
    designation,
    AVG(salary) AS Average_Salary
FROM Employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;
```

## 🔎 HAVING

### Departments with Less Than 3 Employees

```sql
SELECT
    department_id,
    COUNT(*) AS Employee_Count
FROM Employees
GROUP BY department_id
HAVING COUNT(*) < 3;
```

### Locations with Female Employees Whose Average Age Is Below 30

```sql
SELECT
    l.location_id,
    l.location_name,
    AVG(e.age) AS Average_Age
FROM Location l
INNER JOIN Employees e
    ON l.location_id = e.location_id
WHERE e.gender = 'F'
GROUP BY
    l.location_id,
    l.location_name
HAVING AVG(e.age) < 30;
```

## 🔗 SQL JOINs

### INNER JOIN

Displays employee names, designations, and department names where employees are assigned to a department.

```sql
SELECT
    e.employee_name,
    e.designation,
    d.department_name
FROM Employees e
INNER JOIN Departments d
    ON e.department_id = d.department_id;
```

### LEFT JOIN

Displays all departments, including departments with no employees.

```sql
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
```

### RIGHT JOIN

Displays all locations and the employees assigned to them. Locations without employees show `NULL`.

```sql
SELECT
    l.location_id,
    l.location_name,
    e.employee_name
FROM Employees e
RIGHT JOIN Location l
    ON e.location_id = l.location_id;
```

## 🎯 Learning Objectives

Through this assignment, I practiced:

* Retrieving data using `SELECT`
* Finding unique values using `DISTINCT`
* Creating column aliases using `AS`
* Filtering data using `WHERE`
* Working with `NULL` values
* Updating missing data using `UPDATE`
* Sorting data using `ORDER BY`
* Limiting results using `LIMIT`
* Using aggregate functions
* Grouping data using `GROUP BY`
* Filtering grouped data using `HAVING`
* Combining tables using `INNER JOIN`
* Using `LEFT JOIN` and `RIGHT JOIN`

## 📁 Project Structure

```text
MySQL-DML
│
├── README.md
└── Employee_Querying.sql
```

## ✅ Assignment Outcome

Successfully practiced **SQL querying, filtering, sorting, aggregation, grouping, and table joins** using the Employee database in MySQL.

## 👩‍💻 Author

**Ramya**

Data Analytics Learner
