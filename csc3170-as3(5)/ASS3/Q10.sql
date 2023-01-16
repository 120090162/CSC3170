SELECT 
    departments.DEPARTMENT_ID,
    AVG(employees.SALARY) AS Average_Salary,
    COUNT(employees.EMPLOYEE_ID) AS Number_Of_Employees
FROM
    departments
        LEFT OUTER JOIN
    employees ON departments.DEPARTMENT_ID = employees.DEPARTMENT_ID
GROUP BY departments.DEPARTMENT_ID
HAVING COUNT(employees.EMPLOYEE_ID) > 10