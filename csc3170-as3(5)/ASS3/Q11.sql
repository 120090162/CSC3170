DROP TABLE IF EXISTS us_city;
DROP TABLE IF EXISTS us_manager;

CREATE TABLE us_city (SELECT LOCATION_ID FROM
    locations
WHERE
    COUNTRY_ID = 'US');

CREATE TABLE us_manager (SELECT DEPARTMENT_ID, MANAGER_ID FROM
    departments
        INNER JOIN
    us_city ON departments.LOCATION_ID = us_city.LOCATION_ID);
    
SELECT DISTINCT
    FIRST_NAME, LAST_NAME
FROM
    employees
        INNER JOIN
    us_manager ON (employees.DEPARTMENT_ID = us_manager.DEPARTMENT_ID)
        OR (employees.MANAGER_ID = us_manager.MANAGER_ID)