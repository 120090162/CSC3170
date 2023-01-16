DROP TABLE IF EXISTS s_city;
DROP TABLE IF EXISTS s_department;

CREATE TABLE s_city (SELECT LOCATION_ID FROM
    locations
WHERE
    CITY = 'Seattle');

CREATE TABLE s_department (SELECT DEPARTMENT_ID FROM
    departments
        INNER JOIN
    s_city ON departments.LOCATION_ID = s_city.LOCATION_ID);

SELECT DISTINCT
    EMPLOYEE_ID, JOB_ID, employees.DEPARTMENT_ID, FIRST_NAME, LAST_NAME
FROM
    employees
        LEFT JOIN
    s_department ON (employees.DEPARTMENT_ID = s_department.DEPARTMENT_ID)