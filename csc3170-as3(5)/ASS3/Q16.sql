SELECT 
    departments.DEPARTMENT_ID, DEPARTMENT_NAME, FIRST_NAME
FROM
    departments
        LEFT JOIN
    employees ON departments.MANAGER_ID = employees.EMPLOYEE_ID