--•	Create a new database named "CompanyDB."
create database CompanyDB
 go
  use CompanyDB
  go
--•	Create a schema named "Sales" within the "CompanyDB" database.
Create schema Sales
GO
--•	Create a table named "employees" with columns: employee_id (INT), first_name (VARCHAR), last_name (VARCHAR), and salary (DECIMAL) within the "Sales" schema
Create table Sales.employees
(
 employee_id int,
 fname varchar(20),
 lname varchar(20),
 salary decimal,
)

--SEQUENCE
CREATE SEQUENCE Sales.employee_id_counter
AS INT
START WITH 1
INCREMENT BY 1 ;

go
--employee_id use squence 
ALTER TABLE Sales.employees
ADD CONSTRAINT DF_employee_id
DEFAULT NEXT VALUE FOR Sales.employee_id_counter FOR employee_id;


--•	Alter the "employees" table to add a new column named "hire_date" with the data type DATE.
alter table Sales.employees
add hire_date date

--•	Select all columns from the "employees" table.
select *
from Sales.employees

--•	Retrieve only the "first_name" and "last_name" columns from the "employees" table.

select fname,lname
from Sales.employees

--•	Retrieve “full name” as a one column from "first_name" and "last_name" columns from the "employees" table.
select fname+ ' ' + lname AS [full name]
from Sales.employees



INSERT INTO Sales.employees (employee_id, fname, lname, salary, hire_date)
VALUES 
    (1, 'Alice', 'Smith', 60000, '2023-01-25'),
    (2, 'Bob', 'Johnson', 55000, '2022-05-27'),
    (3, 'Carol', 'Williams', 70000, '2010-02-07'),
    (4, 'David', 'Brown', 65000, '2009-08-27'),
    (5, 'Eva', 'Davis', 72000, '2024-08-27'),
    (6, 'AAlice', 'Smith', 20000, '2014-01-11'), -- Fixed invalid month
    (7, 'BBob', 'Johnson', 15000, '2007-07-07'),
    (8, 'CCarol', 'Williams', 40000, '2003-04-07'),
    (9, 'DDavid', 'Brown', 25000, '2001-05-17'),
    (10, 'EEva', 'Davis', 77200, '2004-02-20');

--•	Show the average salary of all employees.
select AVG (salary) AS average_salary
from sales.employees;


--•	Select employees whose salary is greater than 50000.
select fname,lname
from sales.employees
where salary >50000

-- delete data
----DELETE FROM Sales.employees;
----Delete  Sales.employees;

--•	Retrieve employees hired in the year 2020.
select employee_id,fname
from Sales.employees
where YEAR (hire_date) >= 2020

--•	List employees whose last names start with 'S.'

select employee_id,fname
from Sales.employees
where hire_date >= '2022-01-01'

--•	List employees whose last names start with 'S.'
select employee_id,fname,lname
from Sales.employees
where lname LIKE 's%' --% wildcard


--•	List employees whose Fname names ens with 'b.'
select employee_id,fname,lname
from Sales.employees
where fname LIKE '%b' --% wildcard
ORDER BY
fname;

--•	List employees whose Fname has within 'r.'
select employee_id,fname,lname
from Sales.employees
where fname LIKE '%r%' --% wildcard
ORDER BY
fname;


--•	List employees whose  2nd char in Fname sarts  with 'v.' -- '_' undescore skip one charatar
select employee_id,fname,lname
from Sales.employees
where fname LIKE '_v%' 
ORDER BY
fname;

--square brackets[AB] -returns the customers where the first character in the [specific colmun] is A or B:

select employee_id,fname,lname
from Sales.employees
where fname LIKE '[AB]%' 
ORDER BY
fname;

--[A-C] range
select employee_id,fname,lname
from Sales.employees
where fname LIKE '[A-C]%' 
ORDER BY
fname;

---•	Display the top 10 highest-paid employees.
SELECT TOP 10
    salary, 
    fname
FROM
    Sales.employees
ORDER BY 
    hire_date DESC;
	
--•	Find employees with salaries between 40000 and 60000.
select employee_id,fname,lname,salary
from Sales.employees
where salary BETWEEN   40000 and 60000
ORDER BY
fname;

--•	Show employees with names containing the substring 'row.'
select employee_id,fname,lname
from Sales.employees
where lname LIKE '%row%' 

--•	Display employees with a NULL value in the "hire_date" column.
select employee_id,fname,lname
from Sales.employees
where hire_date = null;

--•	Select employees with a salary in the set (40000, 45000, 50000).
select employee_id,fname,lname,salary
from Sales.employees
where salary in (40000,45000,50000) ;

--•	Retrieve employees hired between '2020-01-01' and '2021-01-01.'
select employee_id,fname,lname,hire_date
from Sales.employees
where hire_date BETWEEN  '2020-01-01' AND '2021-01-01';


--•	List employees with salaries in descending order.
select employee_id,fname,lname,salary
from Sales.employees
order by salary desc;

--•	Display employees with a salary greater than 55000 and hired in 2020.

select employee_id,fname,lname,salary,hire_date
from Sales.employees
where salary > 55000 and year (hire_date) = 2020


-----•	Select employees whose first name is 'Bob' or 'BBob.'

select employee_id,fname,lname,salary,hire_date
from Sales.employees
where fname ='BBob' or fname='Bob'

---•	List employees with a salary less than or equal to 55000 and a hire date after '2022-01-01.'
select employee_id,fname,lname,salary,hire_date
from Sales.employees
where salary <= 55000  And hire_date >'2022-01-01'


--•	Retrieve employees with a salary greater than the average salary.
select employee_id,fname,lname,salary,hire_date
from Sales.employees
where salary >  (select AVG(salary)from Sales.employees)


----•	Display the 3rd to 7th highest-paid employees.
select employee_id,fname,lname,salary,hire_date
from Sales.employees
order by salary desc
OFFSET 2 ROWS 
fetch next 5 rows only;

--•	List employees hired after '2021-01-01' in alphabetical order.
select employee_id,fname,lname,salary,hire_date
from Sales.employees
where hire_date >'2021-01-01'
order by fname 

--•	Retrieve employees with a salary greater than 50000 and last name not starting with 'A.'
select employee_id,fname,lname,salary,hire_date
from Sales.employees
where salary >50000 and lname LIKE '[^A]%'
order by fname 


-----•	Display employees with a salary that is not NULL.
select employee_id,fname,lname,salary,hire_date
from Sales.employees
where salary !=0

--•	Show employees with names containing 'e' or 'i' and a salary greater than 45000.
select employee_id,fname,lname,salary,hire_date
from Sales.employees
where fname LIKE '[ei]%'  and salary > 45000