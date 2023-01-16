SELECT 
    EMPLOYEE_ID,
    IFNULL((SELECT DISTINCT
                    SALARY
                FROM
                    employees
                ORDER BY SALARY ASC
                LIMIT 3 , 1),
            NULL) AS FourthLowestSalary
FROM
    employees
WHERE
    employees.SALARY = (SELECT DISTINCT
            SALARY
        FROM
            employees
        ORDER BY SALARY ASC
        LIMIT 3 , 1)