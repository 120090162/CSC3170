SELECT 
    EMPLOYEE_ID, LAST_NAME
FROM
    employees
        INNER JOIN
    departments ON employees.EMPLOYEE_ID = departments.MANAGER_ID
        AND employees.EMPLOYEE_ID != employees.MANAGER_ID
