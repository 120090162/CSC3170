SELECT 
    JOB_ID,
    (SELECT 
            COUNT(employees.EMPLOYEE_ID)
        FROM
            employees
        WHERE
            employees.JOB_ID = jobs.JOB_ID) AS Number_Of_Employees
FROM
    jobs