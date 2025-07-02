USE ASSIGNMENT

CREATE TABLE EmployeeDetails (EmpID	int, FullName VARCHAR(max),	ManagerID INT,	DateOfJoining DATE,	City VARCHAR(max))

INSERT INTO EmployeeDetails VALUES(121,	'Jhon Snow',	321,	'01/31/2019',	'Toronto'),
(321,	'Walter White',	986,	'01/30/2020',	'California'),
(421,	'Kuldeep Rana',	876,	'11/27/2021',	'New Delhi')

CREATE TABLE EmployeeSalary (EmpID INT,	Project VARCHAR(max), Salary INT, Variable int)

INSERT INTO EmployeeSalary VALUES(121,	'P1',	8000,	500)
INSERT INTO EmployeeSalary VALUES(321,	'P2',	10000,	1000),(421,	'P1',	12000,	0)

SELECT*FROM EmployeeDetails
SELECT*FROM EmployeeSalary

--Q1)SQL Query to fetch records that are present in one table but not in another table.

SELECT ED.EmpID, ES.EmpID
FROM EmployeeDetails ED
LEFT JOIN EmployeeSalary ES 
ON ED.EmpID = ES.EmpID
WHERE ES.EmpID IS NULL

--Q2)SQL query to fetch all the employees who are not working on any project.

SELECT ED.*
FROM EmployeeDetails ED 
LEFT JOIN EmployeeSalary ES 
ON ED.EmpID = ES.EmpID
WHERE ES.Project IS NULL

--Q3)SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.

SELECT * FROM EmployeeDetails 
WHERE YEAR(DateOfJoining) = 2020


--Q4)Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.

SELECT ED.*
FROM EmployeeDetails ED 
INNER JOIN EmployeeSalary ES 
ON ED.EmpID = ES.EmpID

--Q5)Write an SQL query to fetch a project-wise count of employees.

SELECT Project, COUNT(EmpID) AS EmployeesCount
FROM EmployeeSalary
GROUP BY Project

--Q6)Fetch employee names and salaries even if the salary value is not present for the employee.

SELECT ED.FullName,ES.SALARY
FROM EmployeeDetails ED 
LEFT JOIN EmployeeSalary ES 
ON ED.EmpID = ES.EmpID

--Q7)Write an SQL query to fetch all the Employees who are also managers.

SELECT DISTINCT ED1.EmpID, ED1.FullName
FROM EmployeeDetails ED1
INNER JOIN EmployeeDetails ED2
ON ED1.EmpID = ED2.ManagerID

--Q8)Write an SQL query to fetch duplicate records from EmployeeDetails.

SELECT FullName, COUNT(*)
FROM EmployeeDetails
GROUP BY FullName
HAVING COUNT(*) > 1

--Q9)Write an SQL query to fetch only odd rows from the table.

WITH NumberedRows AS (
    SELECT *, ROW_NUMBER() OVER(ORDER BY EmpID) AS RowNum
    From Employeedetails
)
SELECT*FROM NumberedRows
WHERE RowNum % 2 = 1


--Q10)Write a query to find the 3rd highest salary from a table without top or limit keyword.

WITH RankedSalaries AS (
    SELECT SALARY, 
    DENSE_RANK() OVER  (ORDER BY SALARY ASC) AS SalaryRank
    FROM EmployeeSalary
)
SELECT Salary 
FROM RankedSalaries
WHERE SalaryRank = 3

SELECT*from EmployeeSalary

------------------------------------------------------------------------------------------------------------------------------------------------

--Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – „986‟.

SELECT Empid,FullName
FROM EmployeeDetails 
WHERE ManagerID = 986

--Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.

SELECT DISTINCT PROJECT
FROM EMPLOYEESALARY

--Ques.3. Write an SQL query to fetch the count of employees working in project „P1‟.
 
 SELECT COUNT(*) AS EmployeeCount
 FROM EmployeeSalary
 WHERE Project  = 'P1'

--Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.

SELECT MAX(SALARY) AS MaxSalary,
MIN(SALARY) AS MinimumSalary,
AVG(salary) AS AverageSalary
FROM EmployeeSalary
 

--Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.

SELECT Empid FROM EmployeeSalary
where SALARY BETWEEN 9000 AND 15000

--Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.

SELECT EmpID, FullName
FROM EmployeeDetails
WHERE City = 'Toronto' and ManagerID = 321


--Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.

SELECT Empid, FullName
FROM EmployeeDetails 
WHERE City = 'California' OR ManagerID = 321

--Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.
 
 SELECT EmpID, PROJECT
 FROM EmployeeSalary
 WHERE Project <> 'P1'

--Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.

SELECT *,
(SALARY+Variable) AS TotalSalary
FROM EmployeeSalary

/*Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends 
with any sequence of characters.*/

SELECT EmpID, FullName
FROM EmployeeDetails
WHERE FullName LIKE '_hn%'
 
------------------------------------------------------------------------------------------------------------------------------------------------
 
-- Ques.1 Write an SQL query to fetch all the EmpIds which are present in either of the tables – „EmployeeDetails‟ and „EmployeeSalary‟.
  
SELECT EmpID FROM EmployeeDetails
UNION
SELECT EmpID FROM EmployeeSalary  

-- Ques.2 Write an SQL query to fetch common records between two tables.

SELECT ED.EmpID
FROM EmployeeDetails ED 
INNER JOIN EmployeeSalary ES 
ON ED.EmpID = ES.EmpID 

-- Ques.3. Write an SQL query to fetch records that are present in one table but not in another table.
 
SELECT ED.EmpID 
FROM EmployeeDetails ED 
LEFT JOIN EmployeeSalary ES 
ON ED.EmpID = ES.EmpID 
WHERE ES.EmpID IS NULL

-- Ques.4. Write an SQL query to fetch the EmpIds that are present in both the tables – „EmployeeDetails‟ and „EmployeeSalary.

SELECT EmpID FROM EmployeeDetails 
INTERSECT
SELECT EmpID FROM EmployeeSalary 

-- Ques.5. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.

SELECT ED.EmpID
FROM EmployeeDetails ED 
LEFT JOIN EmployeeSalary ES 
ON ED.EmpID = ES.EmpID 
WHERE ES.EmpID IS NULL

--Ques.6. Write an SQL query to fetch the employee‟s full names and replace the space

SELECT EmpID, FullName,
REPLACE (FullName, ' ', '_') AS ReplacedFullName
FROM EmployeeDetails

-- Ques.7. Write an SQL query to fetch the position of a given character(s) in a field.
 
SELECT EmpID,FullName,
CHARINDEX('S', FullName) AS APosition
FROM EmployeeDetails

-- Ques.8. Write an SQL query to display both the EmpId and ManagerId together.

SELECT EmpID, ManagerID FROM EmployeeDetails

-- Ques.9. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.

SELECT EmpID,FullName,
LEFT(FullName, CHARINDEX( ' ', FullName + ' ')-1) AS FirstName
FROM EmployeeDetails

-- Ques.10. Write an SQL query to uppercase the name of the employee and lowercase the city values.

SELECT EmpID,
UPPER(FullName) As FullName_Uppercase,
LOWER(City) AS City_Lowercase
FROM EmployeeDetails
 
------------------------------------------------------------------------------------------------------------------------------------------------

-- Ques.1. Write an SQL query to find the count of the total occurrences of a particular character – „n‟ in the FullName field.
 
SELECT 
SUM(LEN(FullName) - LEN(REPLACE(LOWER(FullName),'n',''))) AS TotalCount 
FROM EmployeeDetails

-- Ques.2. Write an SQL query to update the employee names by removing leading and trailing spaces.
 
 UPDATE EmployeeDetails
 SET FullName = LTRIM(RTRIM(FullName))

 SELECT EmpID,FullName FROM Employeedetails

 SELECT Empid,FullName from Employeedetails
 WHERE FullName LIKE ' %' OR FullName LIKE '% '

-- Ques.3. Fetch all the employees who are not working on any project.

SELECT ED.EmpID,ED.FullName
FROM EmployeeDetails ED
LEFT JOIN EMPLOYEESALARY ES 
ON ED.EmpID = ES.EmpID
WHERE ES.PROJECT IS NULL

-- Ques.4. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.

SELECT ed.Empid, ed.FullName, es.salary
from Employeedetails ed
inner JOIN EmployeeSalary es 
on ed.Empid = es.Empid
where es.Salary BETWEEN 5000 and 10000

-- Ques.5. Write an SQL query to find the current date-time.

SELECT GETDATE() AS CurrentDate

-- Ques.6. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.
 
 SELECT Empid, FullName FROM Employeedetails
 WHERE YEAR(DateOfJoining) = 2020

-- Ques.7. Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.
 
SELECT ED.*
FROM EmployeeDetails ED 
INNER JOIN EMPLOYEESALARY ES 
ON ED.EmpID = ES.EmpID

-- Ques.8. Write an SQL query to fetch the project-wise count of employees sorted by project‟s count in descending order.

SELECT PROJECT, COUNT(EmpID) AS EmployeeCount
FROM EmployeeSalary
WHERE project is not NULL
GROUP by project
ORDER BY EmployeeCount DESC

-- Ques.9. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.
 
 SELECT ED.Empid,ED.FullName,ES.Salary
 FROM Employeedetails ED
 LEFT JOIN EmployeeSalary ES
 on ED.Empid = ES.Empid

-- Ques.10. Write an SQL query to join 3 tables.

CREATE TABLE Department (DepartmentID int, DepartmentName varchar(MAX))
SELECT*FROM Department
INSERT INTO Department VALUES( 321, 'IT'),(421,'Finance')

SELECT*FROM EmployeeDetails
SELECT*FROM EMPLOYEESALARY
SELECT*FROM DEPARTMENT

SELECT ED.EmpID, ED.FullName, ES.SALARY, ES.PROJECT,D.DEPARTMENTNAME
FROM EmployeeDetails ED 
INNER JOIN EMPLOYEESALARY ES 
ON ED.EmpID = ES.EmpID
INNER JOIN DEPARTMENT D 
ON ED.ManagerID = D.DEPARTMENTID
