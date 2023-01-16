SELECT 
    EMPLOYEE_ID, SALARY
FROM
    employees e1
WHERE
    SALARY > (SELECT 
            AVG(SALARY)
        FROM
            employees e2
        WHERE
            e1.DEPARTMENT_ID = e2.DEPARTMENT_ID)