/*Create an SQL stored procedure that will allow you to obtain the
average male and female salary per department within a certain
salary range. Let this range be defined by two values the user
can insert when calling the procedure.*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `Average_salary`(in min_salary integer, in max_salary integer)
BEGIN
select d.dept_name,e.gender,avg(salary) as avg_salary
from
t_employees e join
t_salaries s on e.emp_no = s.emp_no
join t_dept_emp de  on de.emp_no = e.emp_no
join t_departments d on de.dept_no = d.dept_no
where s.salary between min_salary and max_salary
group by d.dept_no,e.gender;


END