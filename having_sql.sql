
--HAVING IN SQL

--- qn1:find the cities where there are more than 2 employees

SELECT city,count(`Emp_id`) as 'number of employees' from employees group by city having COUNT(emp_id)>2


--- qn2: find the deparment where the average salary is greater than 700,000

select dept, avg(`Salary`) as 'average salary' from employees group by dept having AVG(`Salary`)>700000

--- qn3: find the cities with total salary greater than 200000

select city,sum(`Salary`) as 'total salary' from employees group by `City` having sum(`Salary`)>200000

--- qn4: find the department with employees more than 2

select dept as department, count(`Emp_id`) as 'no of employee' FROM employees group by dept having count(emp_id)>2


select dept as department, count(*) as 'no of employee' FROM employees group by dept having count(*)>2

-- lets ivolve the use of where in the above having condition by not including products dept

select dept as departments, count(*) as 'number of employee' from employees where dept != 'products' 
group by dept having count(*) > 2

-- qn5: find the number of employees from every deparment with average salary 200000

select dept as departments, count(*) as 'no of employee'
from employees group by dept having avg(salary)>200000


