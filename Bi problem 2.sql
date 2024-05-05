/*Problem 2: Task - Text
*Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990.*/
use employees;
SELECT 
    d.dept_name,
    e.gender,
    e.emp_no,
    dm.from_date,
    dm.to_date,
    ee.calender_year,
    CASE
        WHEN
            YEAR(from_date) <= ee.calender_year
                AND YEAR(to_date)>= ee.calender_year
        THEN
            1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calender_year
    FROM
        t_employees
    GROUP BY calender_year) AS ee
        CROSS JOIN
    t_departments d
        JOIN
    t_dept_manager dm ON d.dept_no = dm.dept_no
        JOIN
    t_employees e ON e.emp_no = dm.emp_no
ORDER BY e.emp_no , ee.calender_year;
 

