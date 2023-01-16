SELECT 
    DEPARTMENT_NAME,
    (SELECT 
            COUNT(employees.EMPLOYEE_ID)
        FROM
            employees
        WHERE
            employees.DEPARTMENT_ID = departments.DEPARTMENT_ID) AS Number_Of_Employees
FROM
    departments