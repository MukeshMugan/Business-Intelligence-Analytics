/*Problem 1: Task - Text
Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990. 
*/

use employees_mod;
select
 year(d.from_date) as Years,
e.gender ,
count( e.emp_no) as number_of_employees
from t_employees e join t_dept_emp d on
e.emp_no =d.emp_no
where year(d.from_date) >=1990
group by years,e.gender;

#or 
SELECT 

    YEAR(d.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS num_of_employees

FROM
    t_employees e
        JOIN
    t_dept_emp d ON d.emp_no = e.emp_no

GROUP BY calendar_year , e.gender
HAVING calendar_year >= 1990;